      PROGRAM MAIN

*  Program to compute the NMSSM Higgs masses, couplings and
*  Branching ratios, with experimental and theoretical constraints
*
*  Input data corresponds to GMSB model. In addition:
*
*      tan(beta) at the scale MZ, lambda at the scale Q2
*
*  On output:
*
*      PAR(1) = lambda
*      PAR(2) = kappa
*      PAR(3) = tan(beta)
*      PAR(4) = mu (effective mu term = lambda*s)
*      PAR(5) = Alambda
*      PAR(6) = Akappa
*      PAR(7) = mQ3**2
*      PAR(8) = mU3**2
*      PAR(9) = mD3**2
*      PAR(10) = mL3**2
*      PAR(11) = mE3**2
*      PAR(12) = AU3
*      PAR(13) = AD3
*      PAR(14) = AE3
*      PAR(15) = mQ2**2
*      PAR(16) = mU2**2
*      PAR(17) = mD2**2
*      PAR(18) = mL2**2
*      PAR(19) = mE2**2
*      PAR(20) = M1
*      PAR(21) = M2
*      PAR(22) = M3
*      PAR(23) = MA (diagonal doublet CP-odd mass matrix element)
*      PAR(24) = MP (diagonal singlet CP-odd mass matrix element)
*      PAR(25) = AE2
*
*      All these parameters are assumed to be defined in DRbar at the scale
*      Q2 which is either user defined or computed as (2*mQ2+mU2+mD2)/4
*
*      SMASS(1-3): CP-even masses (ordered)
*
*      SCOMP(1-3,1-3): Mixing angles: if HB(I) are the bare states,
*        HB(I) = Re(H1), Re(H2), Re(S), and HM(I) are the mass eigenstates,
*        the convention is HB(I) = SUM_(J=1,3) SCOMP(J,I)*HM(J)
*        which is equivalent to HM(I) = SUM_(J=1,3) SCOMP(I,J)*HB(J)
*
*      PMASS(1-2): CP-odd masses (ordered)
*
*      PCOMP(1-2,1-2): Mixing angles: if AB(I) are the bare states,
*        AB(I) = Im(H1), Im(H2), Im(S), and AM(I) are the mass eigenstates,
*        the convention is
*        AM(I) = PCOMP(I,1)*(COSBETA*AB(1)+SINBETA*AB(2))
*              + PCOMP(I,2)*AB(3)
*
*      CMASS: Charged Higgs mass
*
*      CU,CD,CV,CJ,CG(i) Reduced couplings of h1,h2,h3 (i=1,2,3) or
*                        a1,a2 (i=4,5) to up type fermions, down type
*                        fermions, gauge bosons, gluons and photons
*                        Note: CV(4)=CV(5)=0
*      CB(I)             Reduced couplings of h1,h2,h3 (i=1,2,3) or
*                        a1,a2 (i=4,5) to b-quarks including DELMB corrections
*
*      WIDTH(i) Total decay width of h1,h2,h3,a1,a2 (i=1..5)
*               with the following branching ratios:
*      BRJJ(i) h1,h2,h3,a1,a2 -> gluon gluon
*      BRMM(i)        "       -> mu mu
*      BRLL(i)        "       -> tau tau
*      BRSS(i)        "       -> ss
*      BRCC(i)        "       -> cc
*      BRBB(i)        "       -> bb
*      BRTT(i)        "       -> tt
*      BRWW(i)        "       -> WW (BRWW(4)=BRWW(5)=0)
*      BRZZ(i)        "       -> ZZ (BRZZ(4)=BRZZ(5)=0)
*      BRGG(i)        "       -> gamma gamma
*      BRZG(i)        "       -> Z gamma
*      BRHIGGS(i)   (i=1..5)  -> other Higgses, including:
*        BRHAA(i,j)   hi      -> a1a1, a1a2, a2a2 (i=1..3, j=1..3)
*        BRHCHC(i)    hi      -> h+h- (i=1..3)
*        BRHAZ(i,j)   hi      -> Zaj  (i=1..3)
*        BRHCW(i)  h1,h2,h3   -> h+W- (i=1..3), a1,a2 -> h+W- (i=4,5)
*        BRHHH(i)     h2      -> h1h1, h3-> h1h1, h1h2, h2h2 (i=1..4)
*        BRAHA(i)     a2      -> a1hi (i=1..3)
*        BRAHZ(i,j)   ai      -> Zhj  (i=1,2, j=1..3)
*      BRSUSY(i)    (i=1..5)  -> susy particles, including:
*        BRNEU(i,j,k)         -> neutralinos j,k (i=1..5, j,k=1..5)
*        BRCHA(i,j)           -> charginos 11, 12, 22 (i=1..5, j=1..3)
*        BRHSQ(i,j)   hi      -> uLuL, uRuR, dLdL, dRdR, t1t1, t2t2,
*                                t1t2, b1b1, b2b2, b1b2 (i=1..3, j=1..10)
*        BRASQ(i,j)   ai      -> t1t2, b1b2 (i=1,2, j=1,2)
*        BRHSL(i,j)   hi      -> lLlL, lRlR, nLnL, l1l1, l2l2, l1l2,
*                                ntnt (i=1..3, j=1..7)
*        BRASL(i)     ai      -> l1l2 (i=1,2)
*
*      HCWIDTH  Total decay width of the charged Higgs
*               with the following branching ratios:
*      HCBRM         h+ -> mu nu_mu
*      HCBRL         "  -> tau nu_tau
*      HCBRSU        "  -> s u
*      HCBRBU        "  -> b u
*      HCBRSC        "  -> s c
*      HCBRBC        "  -> b c
*      HCBRBT        "  -> b t
*      HCBRWHT       "  -> neutral Higgs W+, including:
*        HCBRWH(i)   "  -> H1W+, H2W+, h3W+, a1W+, a2W+ (i=1..5)
*      HCBRSUSY      "  -> susy particles,including
*        HCBRNC(i,j) "  -> neutralino i chargino j (i=1..5, j=1,2)
*        HCBRSQ(i)   "  -> uLdL, t1b1, t1b2, t2b1, t2b2 (i=1..5)
*        HCBRSL(i)   "  -> lLnL, t1nt, t2nt (i=1..3)
*
*      MNEU(i)   Mass of neutralino chi_i (i=1,5, ordered in mass)
*      NEU(i,j)  chi_i components of bino, wino, higgsino u&d, singlino
*                (i,j=1..5)
*
*      MCHA(i)       Chargino masses
*      U(i,j),V(i,j) Chargino mixing matrices
*
*  ERRORS: IFAIL = 0..22
*
*  IFAIL = 0         OK
*          1,3,5,7   m_h1^2 < 0
*          2,3,6,7   m_a1^2 < 0
*          4,5,6,7   m_h+^2 < 0
*          8         m_sfermion^2 < 0
*          9         l, tan(beta) or mu = 0
*          10        Violation of phenomenological constraint(s)
*          11-15     Problem in integration of RGEs
*          16-19     Convergence problem
*          20        No electroweak symmetry breaking
*          21        MSMES=/=MSREF (GMSB scenario above MMESS)
*          22        IFAIL = 10 & 21
*
*  Phenomenological constraints:
*
*      PROB(I)  = 0, I = 1..53: OK
*
*      PROB(1) =/= 0   chargino  excluded by LEP
*      PROB(2) =/= 0   excluded by Z -> neutralinos
*      PROB(3) =/= 0   charged Higgs  excluded by LEP
*      PROB(4) =/= 0   excluded by ee -> hZ
*      PROB(5) =/= 0   excluded by ee -> hZ, h -> bb
*      PROB(6) =/= 0   excluded by ee -> hZ, h -> tautau
*      PROB(7) =/= 0   excluded by ee -> hZ, h -> invisible
*      PROB(8) =/= 0   excluded by ee -> hZ, h -> 2jets
*      PROB(9) =/= 0   excluded by ee -> hZ, h -> 2photons
*      PROB(10) =/= 0  excluded by ee -> hZ, h -> AA -> 4bs
*      PROB(11) =/= 0  excluded by ee -> hZ, h -> AA -> 4taus
*      PROB(12) =/= 0  excluded by ee -> hZ, h -> AA -> 2bs 2taus
*      PROB(13) =/= 0  excluded by Z -> hA (Z width)
*      PROB(14) =/= 0  excluded by ee -> hA -> 4bs
*      PROB(15) =/= 0  excluded by ee -> hA -> 4taus
*      PROB(16) =/= 0  excluded by ee -> hA -> 2bs 2taus
*      PROB(17) =/= 0  excluded by ee -> hA -> AAA -> 6bs
*      PROB(18) =/= 0  excluded by ee -> hA -> AAA -> 6taus
*      PROB(19) =/= 0  excluded by ee -> Zh -> ZAA -> Z + light pairs
*      PROB(20) =/= 0  excluded by stop -> b l sneutrino
*      PROB(21) =/= 0  excluded by stop -> neutralino c
*      PROB(22) =/= 0  excluded by sbottom -> neutralino b
*      PROB(23) =/= 0  squark/gluino too light
*      PROB(24) =/= 0  selectron/smuon too light
*      PROB(25) =/= 0  stau too light
*      PROB(27) =/= 0  Landau Pole in l, k, ht, hb below MGUT
*      PROB(28) =/= 0  unphysical global minimum
*      PROB(29) =/= 0  Higgs soft masses >> Msusy
*      PROB(32) =/= 0  b->s gamma more than 2 sigma away
*      PROB(33) =/= 0  Delta M_s more than 2 sigma away
*      PROB(34) =/= 0  Delta M_d more than 2 sigma away
*      PROB(35) =/= 0  B_s->mu+mu- more than 2 sigma away
*      PROB(36) =/= 0  B+-> tau+nu_tau more than 2 sigma away
*      PROB(37) =/= 0  (g-2)_muon more than 2 sigma away
*      PROB(38) =/= 0  excluded by Upsilon(1S) -> A gamma
*      PROB(39) =/= 0  excluded by eta_b(1S) mass measurement
*      PROB(40) =/= 0  BR(B-->X_s mu+ mu-) more than 2 sigma away
*      PROB(41) =/= 0  excluded by ee -> hZ, h -> AA -> 4taus (ALEPH analysis)
*      PROB(42) =/= 0  excluded by top -> b H+, H+ -> c s (CDF, D0)
*      PROB(43) =/= 0  excluded by top -> b H+, H+ -> tau nu_tau (D0)
*      PROB(44) =/= 0  excluded by top -> b H+, H+ -> W+ A1, A1 -> 2taus (CDF)
*      PROB(45) =/= 0  excluded by t -> bH+ (LHC)
*      PROB(46) =/= 0  No Higgs in the MHmin-MHmax GeV range
*      PROB(47) =/= 0  chi2gam > chi2max
*      PROB(48) =/= 0  chi2bb > chi2max
*      PROB(49) =/= 0  chi2zz > chi2max
*      PROB(50) =/= 0  excluded by sparticle searches at the LHC (not called by default)
*      PROB(51) =/= 0: excluded by H/A->tautau
*      PROB(52) =/= 0: Excluded H_125->AA->4mu (CMS)
*      PROB(53) =/= 0: excluded by ggF->H/A->gamgam (65GeV < M < 122GeV, ATLAS)
*
************************************************************************

      IMPLICIT NONE

      INTEGER NPROB,NPAR
      PARAMETER (NPROB=53,NPAR=25)
      INTEGER IFAIL,I,ITER,ITERMU,Q2FIX,LOOP,JM,JL
      INTEGER OMGFLAG,MAFLAG,MOFLAG,GMFLAG,NMSFLAG,ITRY

      DOUBLE PRECISION PAR(NPAR),PROB(NPROB),CHECK,MESTEST,GUTEST
      DOUBLE PRECISION DELMB,SIGMU,Q2,Q2MIN,MSUSYEFF,MMESS,N5
      DOUBLE PRECISION XIFMES,XISMES,MSMES,MUPMES,MSPMES,M3HMES
      DOUBLE PRECISION G1MES,G2MES,G3MES,LMES,KMES,HTMES,HBMES,HLMES
      DOUBLE PRECISION MSREF,D,DMIN,DETM,MUFAIL,M32,CGR,MPL
      DOUBLE PRECISION LPPMES,LTTMES,LUMES,LDMES,LTMES,LBMES,LLMES,XIU
      DOUBLE PRECISION MSM,MST,LM,LT,KM,KT,HTM,HTT,LPPM,LPPT,LTTM,LTTT
      DOUBLE PRECISION ALINP,XIFINP,XISINP,MSINP,MUPINP,MSPINP
      DOUBLE PRECISION ALSMZ,ALEMMZ,GF,g1,g2,S2TW,PI,ALP1,ALP2

      COMMON/NMSFLAG/NMSFLAG
      COMMON/FLAGS/OMGFLAG,MAFLAG,MOFLAG
      COMMON/GMSCEN/MSREF,D,DMIN,GMFLAG
      COMMON/SIGMU/SIGMU
      COMMON/RENSCALE/Q2
      COMMON/Q2FIX/Q2MIN,Q2FIX
      COMMON/DETM/DETM
      COMMON/MUFAIL/MUFAIL
      COMMON/DELMB/DELMB
      COMMON/MESCAL/MSUSYEFF,MMESS,N5
      COMMON/MESCOUP/G1MES,G2MES,G3MES,LMES,KMES,HTMES,HBMES,HLMES
      COMMON/MESEXT/XIFMES,XISMES,MSMES,MUPMES,MSPMES,M3HMES
      COMMON/MESGUT/LPPMES,LTTMES,LUMES,LDMES,LTMES,LBMES,LLMES,XIU
      COMMON/INPPAR/ALINP,XIFINP,XISINP,MSINP,MUPINP,MSPINP
      COMMON/GAUGE/ALSMZ,ALEMMZ,GF,g1,g2,S2TW
      COMMON/GMSAVE/MSM,MST,LM,LT,KM,KT,HTM,HTT,
     . LPPM,LPPT,LTTM,LTTT,JM,JL
      COMMON/M32/M32,CGR,MPL

      PI=4d0*DATAN(1d0)

*   I/O files

      OPEN(15,FILE='inp', STATUS= 'UNKNOWN')
      OPEN(17,FILE='spectr', STATUS= 'UNKNOWN')
      OPEN(18,FILE='decay', STATUS= 'UNKNOWN')

*   Initialization

      CALL INITIALIZE()

*   Reading of the input parameters

      CALL INPUT(PAR,NPAR)

      IFAIL=-1

!      WRITE(0,*)"MAFLAG=",MAFLAG
!      WRITE(0,*)"GMFLAG=",GMFLAG
!      WRITE(0,*)"MSUSYEFF =",MSUSYEFF
!      WRITE(0,*)"MMESS =",MMESS
!      WRITE(0,*)"TANB =",PAR(3)
!      WRITE(0,*)"LAMBDA =",PAR(1)
!      IF(GMFLAG.EQ.0)THEN
!       WRITE(0,*)"ALAMBDA=",ALINP
!       IF(MAFLAG.EQ.-3 .OR. MAFLAG.EQ.-4)WRITE(0,*)"KAPPA =",PAR(2)
!       IF(MAFLAG.EQ.-1 .OR. MAFLAG.EQ.-2)WRITE(0,*)"XIF =",XIFINP
!       IF(MAFLAG.EQ.-1 .OR. MAFLAG.EQ.-3)WRITE(0,*)"XIS =",XISINP
!       IF(MAFLAG.EQ.-2 .OR. MAFLAG.EQ.-4)WRITE(0,*)"MS =",MSINP
!       IF(MUPINP.NE.0d0)WRITE(0,*)"MUP =",MUPINP
!       IF(MSPINP.NE.0d0)WRITE(0,*)"MSP =",MSPINP
!      ENDIF
!      IF(GMFLAG.EQ.1)THEN
!       WRITE(0,*)"XiU =",XIU
!      ENDIF
!      IF(GMFLAG.EQ.2)THEN
!       WRITE(0,*)"LPP =",LPPMES
!       WRITE(0,*)"LTT =",LTTMES
!      ENDIF
!      IF(GMFLAG.NE.0)THEN
!       WRITE(0,*)"LU =",LUMES
!       WRITE(0,*)"LD =",LDMES
!       WRITE(0,*)"LT =",LTMES
!       WRITE(0,*)"LB =",LBMES
!       WRITE(0,*)"LL =",LLMES
!      ENDIF
!      WRITE(0,*)""
!      WRITE(0,*)""

*   Initialization of PROB

      DO I=1,NPROB
       PROB(I)=0d0
      ENDDO

*   Initialization of algorithm parameters

      JL=0
      LPPT=0d0
      LTTT=0d0
      LOOP=0
 2    LOOP=LOOP+1
!      IF(GMFLAG.EQ.1)THEN
!       WRITE(0,*)"LOOP =",LOOP
!       WRITE(0,*)""
!       WRITE(0,*)""
!      ENDIF
      IF(IFAIL.NE.0)THEN
       PAR(4)=SIGMU*N5*MSUSYEFF/(4d0*PI)**2
      ENDIF
      MUFAIL=1d0
      ITRY=0
 1    ITRY=ITRY+1
!      WRITE(0,*)"ITRY=",ITRY
!      WRITE(0,*)""
!      WRITE(0,*)""
      MST=0d0
      LT=0d0
      KT=0d0
      HTT=0d0
      JM=0

*   Guess parameters at Q2/MMESS

      IF(IFAIL.NE.0)THEN
!       WRITE(0,*)"Guesses"
       IF(Q2FIX.EQ.0)THEN
        Q2=MAX(N5*MSUSYEFF**2/(4d0*PI)**4,Q2MIN)
       ENDIF
       IF(MAFLAG.EQ.-1 .OR. MAFLAG.EQ.-2)THEN
        PAR(2)=PAR(1)/5d0
       ELSE
        XIFMES=MSUSYEFF**2/(4d0*PI)**4
       ENDIF
       IF(MAFLAG.EQ.-1 .OR. MAFLAG.EQ.-3)THEN
        MSM=MSUSYEFF**2/(4d0*PI)**4
       ELSE
        XISMES=MSUSYEFF**3/(4d0*PI)**6
       ENDIF
       IF(GMFLAG.EQ.0)THEN
        PAR(5)=ALINP
       ELSE
        PAR(5)=-MSUSYEFF/(4d0*PI)**2
       ENDIF
       IF(PAR(2).NE.0d0)THEN
        PAR(6)=3d0*PAR(5)
       ELSE
        PAR(6)=0d0
       ENDIF
       DO I=7,11
        PAR(I)=N5*MSUSYEFF**2/(4d0*PI)**4
       ENDDO
       DO I=12,14
        PAR(I)=0d0
       ENDDO
       DO I=15,19
        PAR(I)=N5*MSUSYEFF**2/(4d0*PI)**4
       ENDDO
        DO I=20,22
        PAR(I)=N5*MSUSYEFF/(4d0*PI)**2
       ENDDO
       PAR(23)=MSUSYEFF/(4d0*PI)**2
       PAR(24)=MSUSYEFF/(4d0*PI)**2
       PAR(25)=0d0
       DELMB=.1d0
       IF(GMFLAG.EQ.1)THEN
        LPPM=XIU
        LTTM=XIU
       ENDIF
!      ELSE
!       WRITE(0,*)"Current"
      ENDIF
      IFAIL=0

!      WRITE(0,*)""
!      WRITE(0,*)"M1 =",PAR(20)
!      WRITE(0,*)"M2 =",PAR(21)
!      WRITE(0,*)"M3 =",PAR(22)
!      WRITE(0,*)"AL =",PAR(5)
!      WRITE(0,*)"AK =",PAR(6)
!      WRITE(0,*)"ATOP =",PAR(12)
!      WRITE(0,*)"ABOT =",PAR(13)
!      WRITE(0,*)"ATAU =",PAR(14)
!      WRITE(0,*)"AMUON =",PAR(25)
!      WRITE(0,*)"MQ3 =",PAR(7)
!      WRITE(0,*)"MU3 =",PAR(8)
!      WRITE(0,*)"MD3 =",PAR(9)
!      WRITE(0,*)"MQ =",PAR(15)
!      WRITE(0,*)"MU =",PAR(16)
!      WRITE(0,*)"MD =",PAR(17)
!      WRITE(0,*)"ML3 =",PAR(10)
!      WRITE(0,*)"ME3 =",PAR(11)
!      WRITE(0,*)"ML =",PAR(18)
!      WRITE(0,*)"ME =",PAR(19)
!      IF(MAFLAG.EQ.-1 .OR. MAFLAG.EQ.-2)THEN
!       WRITE(0,*)"K =",PAR(2)
!      ELSE
!      WRITE(0,*)"XIF =",XIFMES
!       ENDIF
!      IF(MAFLAG.EQ.-1 .OR. MAFLAG.EQ.-3)THEN
!       WRITE(0,*)"MS =",MSM
!      ELSE
!       WRITE(0,*)"XIS =",XISMES
!      ENDIF
!      WRITE(0,*)"MU =",PAR(4)
!      IF(GMFLAG.EQ.1)THEN
!       WRITE(0,*)"LPP =",LPPM
!       WRITE(0,*)"LTT =",LTTM
!      ENDIF
!      WRITE(0,*)""

*   Check for singular parameters l, tan(beta)

      IF(PAR(1)*PAR(3).EQ.0d0)THEN
       IFAIL=9
       GOTO 11
      ENDIF

*   Guess for couplings at MMESS

      CALL RGESGM(PAR,IFAIL)
      IF(IFAIL.NE.0)THEN
!       WRITE(0,*)"RGE integration problem 1"
!       WRITE(0,*)"Exit (IFAIL=11)"
!       WRITE(0,*)""
!       WRITE(0,*)""
       IFAIL=11
       GOTO 11
      ENDIF

*   External loop to compute the soft parameters at Q2

      ITER=0
 21   ITER=ITER+1
!      WRITE(0,*)"ITER =",ITER
!      WRITE(0,*)""
!      WRITE(0,*)""

      CALL RGESINVGM(PAR,IFAIL)
      IF(IFAIL.NE.0)THEN
!       WRITE(0,*)"RGE integration problem 2"
!       WRITE(0,*)"Exit (IFAIL=13)"
!       WRITE(0,*)""
!       WRITE(0,*)""
       IFAIL=13
       GOTO 11
      ENDIF

*   Internal loop to compute ((k or XiF) and (mS or XiS) and mu)

      ITERMU=0
 22   ITERMU=ITERMU+1
!      WRITE(0,*)"ITERMU =",ITERMU
!      WRITE(0,*)""
!      WRITE(0,*)""

      CALL RUNPAR(PAR)

      CALL MSFERM(PAR,IFAIL,1)
      IF(IFAIL.NE.0)THEN
!       WRITE(0,*)"Negative sfermion mass squared"
!       WRITE(0,*)"Exit (IFAIL=8)"
!       WRITE(0,*)""
!       WRITE(0,*)""
       IFAIL=8
       GOTO 11
      ENDIF

      CALL MINIMIZE(PAR,CHECK)

*   End of the internal loop

      IF((CHECK.GT.1d-12.AND.ITERMU.LT.10).OR.
     .   (CHECK.GT.1d-8.AND.ITERMU.LT.50).OR.
     .   (CHECK.GT.1d-6.AND.ITERMU.LT.100))GOTO 22
      IF(CHECK.GT.1d-4)THEN
!       WRITE(0,*)"No convergence 1"
!       WRITE(0,*)"Exit (IFAIL=16)"
!       WRITE(0,*)""
!       WRITE(0,*)""
       IFAIL=16
       GOTO 11
      ENDIF

      CALL GETSUSYCOUP(PAR,IFAIL)

      CALL RGESUNIGM(PAR,IFAIL,MESTEST)
      IF(IFAIL.NE.0)THEN
!       WRITE(0,*)"RGE integration problem 3"
!       WRITE(0,*)"Exit (IFAIL=12)"
!       WRITE(0,*)""
!       WRITE(0,*)""
       IFAIL=12
       GOTO 11
      ENDIF

*   End of the external loop

      IF((MESTEST.GT.1d-12.AND.ITER.LT.10).OR.
     .   (MESTEST.GT.1d-8.AND.ITER.LT.50).OR.
     .   (MESTEST.GT.1d-6.AND.ITER.LT.100))GOTO 21
      IF(MESTEST.GT.1d-4)THEN
!       WRITE(0,*)"No convergence 2"
       IF(ITRY.LT.10)THEN
        ITRY=ITRY+1
!        WRITE(0,*)"ITRY=",ITRY
!        WRITE(0,*)""
!        WRITE(0,*)""
	ITER=0
        MST=0d0
        LT=0d0
        KT=0d0
        HTT=0d0
        JM=0
        GOTO 21
       ELSE
!        WRITE(0,*)"Exit (IFAIL=17)"
!        WRITE(0,*)""
!        WRITE(0,*)""
        IFAIL=17
        GOTO 11
       ENDIF
      ENDIF

*   Check if correct EWSB

      IF(DETM.LE.0d0 )THEN
!       WRITE(0,*)"Convergence in a false minimum"
       IF(ITRY.LT.10)THEN
        GOTO 1
       ELSE
!        WRITE(0,*)"Exit (IFAIL=20)"
!        WRITE(0,*)""
!        WRITE(0,*)""
        IFAIL=20
        GOTO 11
       ENDIF
      ENDIF

*  GUT scale

      CALL RGESGMGUT(PROB,IFAIL,GUTEST)
      IF(IFAIL.GT.0 .AND. GMFLAG.NE.0)THEN
!       WRITE(0,*)"RGE integration problem 4"
!       WRITE(0,*)"Exit (IFAIL=14)"
!       WRITE(0,*)""
!       WRITE(0,*)""
       IFAIL=14
       GOTO 11
      ELSE
       IFAIL=0
      ENDIF
      IF(GMFLAG.EQ.1)THEN
!       WRITE(0,*)"GUTEST =",GUTEST
!       WRITE(0,*)""
!       WRITE(0,*)""
       IF((GUTEST.GT.1d-12.AND.LOOP.LT.10).OR.
     .    (GUTEST.GT.1d-8.AND.LOOP.LT.50).OR.
     .    (GUTEST.GT.1d-6.AND.LOOP.LT.100))THEN
        CALL LPTSOLVE(IFAIL)
        IF(IFAIL.NE.0)THEN
!         WRITE(0,*)"RGE integration problem 5"
!         WRITE(0,*)"Exit (IFAIL=15)"
!         WRITE(0,*)""
!         WRITE(0,*)""
         IFAIL=15
         GOTO 11
        ENDIF
        GOTO 2
       ELSEIF(GUTEST.GT.1d-4)THEN
!        WRITE(0,*)"No convergence 3"
!        WRITE(0,*)"Exit (IFAIL=18)"
!        WRITE(0,*)""
!        WRITE(0,*)""
        IFAIL=18
        GOTO 11
       ENDIF
      ENDIF

*   Computation of sfermion masses

      CALL MSFERM(PAR,IFAIL,1)
      IF(IFAIL.NE.0)GOTO 11

*   Computation of Higgs masses

      CALL MHIGGS(PAR,IFAIL)
      IF(IFAIL.EQ.-1)IFAIL=19
      IF(IFAIL.NE.0)GOTO 11

*   Computation of gluino mass

      CALL GLUINO(PAR)

*   Computation of chargino masses

      CALL CHARGINO(PAR)

*   Computation of neutralino masses

      CALL NEUTRALINO(PAR)

*   Computation of Higgs + top branching ratios

      CALL DECAY(PAR)
      CALL TDECAY(PAR)

*   Exp. constraints on sparticles/Higgses

      CALL SUBEXP(PAR,PROB)
      CALL LHCHIG(PAR,PROB)
      CALL Higgs_CHI2(PAR,PROB)
      CALL CMS_TAUTAU(PAR,PROB)
      CALL CMS_AA_4MU(PAR,PROB)
      CALL ATLAS_H_GAMGAM(PROB)

*   b -> s gamma + B physics

      CALL BSG(PAR,PROB)

*   Anom. magn. moment of the Muon

      CALL MAGNMU(PAR,PROB)

*   Global minimum?

      CALL CHECKMIN(PROB)

*   Computation of the fine-tuning

      CALL FTPAR(PAR,2)

*   Check for problems

      DO I=1,NPROB
       IF(PROB(I).NE.0d0)IFAIL=10
      ENDDO

*   Sparticle decays

      M32=CGR*MSUSYEFF*MMESS/DSQRT(3d0)/MPL
      IF(NMSFLAG.NE.0)CALL NMSDECAY(PAR)

*   Check MSMES=MSREF if GMFLAG>0

      IF(GMFLAG.NE.0)THEN
       MSREF=MSUSYEFF**2/(4d0*PI)**4*(
     .      - 2d0*G1MES*LDMES**2 - 6d0*G2MES*LDMES**2
     .      + 6d0*HBMES*LDMES**2 + 2d0*HLMES*LDMES**2
     .      - 8d0*KMES**2*LDMES**2 + 8d0*LDMES**4 + 4d0*LDMES**2*LMES
     .      + 12d0*DSQRT(HBMES)*LBMES*LDMES*LPPMES
     .      + 4d0*DSQRT(HLMES)*LDMES*LLMES*LPPMES
     .      - 2d0*G1MES*LPPMES**2 - 6d0*G2MES*LPPMES**2
     .      - 8d0*KMES**2*LPPMES**2 + 6d0*LBMES**2*LPPMES**2
     .      + 16d0*LDMES**2*LPPMES**2 + 2d0*LLMES**2*LPPMES**2
     .      + 8d0*LPPMES**4 + 12d0*DSQRT(HTMES*LMES)*LDMES*LTMES
     .      + 6d0*LDMES**2*LTMES**2 + 6d0*LPPMES**2*LTMES**2
     .      - 4d0/3d0*G1MES*LTTMES**2 - 16d0*G3MES*LTTMES**2
     .      - 12d0*KMES**2*LTTMES**2 + 12d0*LDMES**2*LTTMES**2
     .      + 12d0*LPPMES**2*LTTMES**2 + 15d0*LTTMES**4
     .      + 12d0*DSQRT(HBMES*LMES)*LBMES*LUMES
     .      + 4d0*DSQRT(HLMES*LMES)*LLMES*LUMES
     .      + 16d0*LDMES*DSQRT(LMES)*LPPMES*LUMES
     .      + 12d0*DSQRT(HTMES)*LPPMES*LTMES*LUMES
     .      - 2d0*G1MES*LUMES**2 - 6d0*G2MES*LUMES**2
     .      + 6d0*HTMES*LUMES**2 - 8d0*KMES**2*LUMES**2
     .      + 6d0*LBMES**2*LUMES**2 + 8d0*LDMES**2*LUMES**2
     .      + 2d0*LLMES**2*LUMES**2 + 4d0*LMES*LUMES**2
     .      + 16d0*LPPMES**2*LUMES**2 + 12d0*LTTMES**2*LUMES**2
     .      + 8d0*LUMES**4)
     .      -MSUSYEFF**4/(48d0*PI**2*MMESS**2)
     .       *(2d0*LPPMES**2+3d0*LTTMES**2+LUMES**2+LDMES**2)
       D=(MSMES-MSREF)/(1d0+DABS(MSMES)+DABS(MSREF))
       IF(DABS(D).GT.DMIN)THEN
        IF(IFAIL.EQ.0)IFAIL=21
        IF(IFAIL.EQ.10)IFAIL=22
       ENDIF
!       WRITE(0,*)"MSREF =",MSREF
!       WRITE(0,*)"MSMES =",MSMES
!       WRITE(0,*)"D =",D
!       WRITE(0,*)""
!       WRITE(0,*)""
      ENDIF

*   Recording of the results

11    CALL OUTPUT(PAR,PROB,IFAIL)

      END


      SUBROUTINE INPUT(PAR,NPAR)

*******************************************************************
*   This subroutine reads SM and NMSSM parameters from input file   .
*******************************************************************

      IMPLICIT NONE

      CHARACTER CHINL*120,CHBLCK*60,CHDUM*120

      INTEGER I,NLINE,INL,ICH,IX,IVAL,Q2FIX,GMFLAG,GMUFLAG,HFLAG
      INTEGER OMGFLAG,MAFLAG,MOFLAG,PFLAG,ERR,VFLAG,NMSFLAG,Z3FLAG
      INTEGER N0,NLOOP,NBER,NPAR,OUTFLAG

      DOUBLE PRECISION PAR(*),VAL
      DOUBLE PRECISION ACC,XITLA,XLAMBDA,MC0,MB0,MT0
      DOUBLE PRECISION ALSMZ,ALEMMZ,GF,g1,g2,S2TW,M32,CGR,MPL
      DOUBLE PRECISION MSB,MS,MC,MB,MBP,MT,MTAU,MMUON,MZ,MW
      DOUBLE PRECISION VUS,VCB,VUB,Q2,Q2MIN,SIGMU
      DOUBLE PRECISION MSUSYEFF,MMESS,N5,MSREF,D,DMIN
      DOUBLE PRECISION ALINP,XIFINP,XISINP,MSINP,MUPINP,MSPINP
      DOUBLE PRECISION LPPMES,LTTMES,LUMES,LDMES,LTMES,LBMES,LLMES,XIU

      COMMON/GAUGE/ALSMZ,ALEMMZ,GF,g1,g2,S2TW
      COMMON/SMSPEC/MS,MC,MB,MBP,MT,MTAU,MMUON,MZ,MW
      COMMON/CKM/VUS,VCB,VUB
      COMMON/ALS/XLAMBDA,MC0,MB0,MT0,N0
      COMMON/RENSCALE/Q2
      COMMON/SIGMU/SIGMU
      COMMON/MESCAL/MSUSYEFF,MMESS,N5
      COMMON/INPPAR/ALINP,XIFINP,XISINP,MSINP,MUPINP,MSPINP
      COMMON/MESGUT/LPPMES,LTTMES,LUMES,LDMES,LTMES,LBMES,LLMES,XIU
      COMMON/Q2FIX/Q2MIN,Q2FIX
      COMMON/FLAGS/OMGFLAG,MAFLAG,MOFLAG
      COMMON/PFLAG/PFLAG
      COMMON/GMSCEN/MSREF,D,DMIN,GMFLAG
      COMMON/GMUFLAG/GMUFLAG,HFLAG
      COMMON/VFLAG/VFLAG
      COMMON/NMSFLAG/NMSFLAG
      COMMON/M32/M32,CGR,MPL
      COMMON/OUTFLAG/OUTFLAG

*   INITIALIZATION OF THE SUSY PARAMETERS
      DO I=1,NPAR
       PAR(I)=0d0
      ENDDO
      MSUSYEFF=1d99
      MMESS=1d99
      PAR(3)=1d99
      N5=1d99
      SIGMU=1d99
      PAR(1)=1d99
      PAR(2)=1d99
      ALINP=1d99
      XIFINP=1d99
      XISINP=1d99
      MUPINP=0d0
      MSPINP=0d0
      MSINP=1d99
      XIU=0d0
      LPPMES=0d0
      LTTMES=0d0
      LUMES=0d0
      LDMES=0d0
      LTMES=0d0
      LBMES=0d0
      LLMES=0d0
      DMIN=1d99
      CGR=1d0
      MPL=2.4d18

*   DEFAULT VALUES FOR FLAGS
      OMGFLAG=0
      PFLAG=0
      HFLAG=0
      GMFLAG=0
      VFLAG=0
      NMSFLAG=0
      MOFLAG=0
      Z3FLAG=2
      OUTFLAG=0

*   DEFAULT VALUE FOR THE RENSCALE Q2
      Q2=0d0

*   INITIALIZE READ LOOP
      NLINE=0
      CHBLCK=' '

*   START TO READ NEW LINE INTO CHINL
 21   CHINL=' '

*   LINE NUMBER
      NLINE=NLINE+1

      READ(15,'(A120)',END=29,ERR=999) CHINL

*   CHECK FOR EMPTY OR COMMENT LINES
      IF(CHINL.EQ.' '.OR.CHINL(1:1).EQ.'#'
     .  .OR.CHINL(1:1).EQ.'*') GOTO 21

*   FORCE UPPER CASE LETTERS IN CHINL (AS REQUIRED BELOW)
      INL=0
 22   INL=INL+1
      IF(CHINL(INL:INL).NE.'#')THEN
       DO ICH=97,122
        IF(CHINL(INL:INL).EQ.CHAR(ICH)) CHINL(INL:INL)=CHAR(ICH-32)
       ENDDO
       IF(INL.LT.120) GOTO 22
      ENDIF

*   CHECK FOR BLOCK STATEMENT
      IF(CHINL(1:1).EQ.'B')THEN
       READ(CHINL,'(A6,A)',ERR=999) CHDUM,CHBLCK
       GOTO 21
      ENDIF

*   CHECK FOR NMSSM MODEL IN MODSEL
*   IF THE RELIC DENSITY SHOULD BE COMPUTED
*   THE BLOCK MODSEL MUST CONTAIN THE LINE "  9     1    "
      IF(CHBLCK(1:6).EQ.'MODSEL')THEN
       READ(CHINL,*,ERR=999) IX,IVAL
       IF(IX.EQ.1) Z3FLAG=IVAL
       IF(IX.EQ.8) PFLAG=IVAL
       IF(IX.EQ.12) GMFLAG=IVAL
       IF(IX.EQ.13) NMSFLAG=IVAL
       IF(IX.EQ.14) VFLAG=IVAL
       IF(IX.EQ.16) OUTFLAG=IVAL

*   READ SMINPUTS
      ELSEIF(CHBLCK(1:8).EQ.'SMINPUTS')THEN
       READ(CHINL,*,ERR=999) IX,VAL
       IF(IX.EQ.2) GF=VAL
       IF(IX.EQ.3) ALSMZ=VAL
       IF(IX.EQ.4) MZ=VAL
       IF(IX.EQ.5) MB=VAL
       IF(IX.EQ.6) MT=VAL
       IF(IX.EQ.7) MTAU=VAL

*   READ MESSENGER PARAMETERS, SIGMU, Q2 AND TANBETA
      ELSEIF(CHBLCK(1:6).EQ.'MINPAR')THEN
       READ(CHINL,*,ERR=999) IX,VAL
       IF(IX.EQ.0.AND.Q2.EQ.0D0) Q2=VAL**2
       IF(IX.EQ.1) MSUSYEFF=VAL
       IF(IX.EQ.2) MMESS=VAL
       IF(IX.EQ.3) PAR(3)=VAL
       IF(IX.EQ.4) SIGMU=VAL
       IF(IX.EQ.5) N5=VAL
       IF(IX.EQ.6) CGR=VAL

*   READ EXTPAR
      ELSEIF(CHBLCK(1:6).EQ.'EXTPAR')THEN
       READ(CHINL,*,ERR=999) IX,VAL
       IF(IX.EQ.0) Q2=VAL**2
       IF(IX.EQ.-2) DMIN=VAL
       IF(IX.EQ.61) PAR(1)=VAL
       IF(IX.EQ.62) PAR(2)=VAL
       IF(IX.EQ.63) ALINP=VAL
       IF(IX.EQ.66) XIFINP=VAL
       IF(IX.EQ.67) XISINP=VAL
       IF(IX.EQ.68) MUPINP=VAL
       IF(IX.EQ.69) MSPINP=VAL
       IF(IX.EQ.70) MSINP=VAL
       IF(IX.EQ.73) XIU=VAL
       IF(IX.EQ.74) LPPMES=VAL
       IF(IX.EQ.75) LTTMES=VAL
       IF(IX.EQ.76) LUMES=VAL
       IF(IX.EQ.77) LDMES=VAL
       IF(IX.EQ.78) LTMES=VAL
       IF(IX.EQ.79) LBMES=VAL
       IF(IX.EQ.80) LLMES=VAL

      ENDIF

      GOTO 21

*   END OF READING FROM INPUT FILE

*   Check for errors

 29   ERR=0
      IF(GMFLAG.LT.0 .OR. GMFLAG.GT.2)THEN
       WRITE(0,1)"GMFLAG CAN BE 0, 1 OR 2"
       ERR=1
      ENDIF
      IF(MSUSYEFF.EQ.1d99)THEN
       WRITE(0,1)"MSUSYEFF MUST BE GIVEN IN BLOCK MINPAR"
       ERR=1
      ENDIF
      IF(MMESS.EQ.1d99)THEN
       WRITE(0,1)"MMESS MUST BE GIVEN IN BLOCK MINPAR"
       ERR=1
      ENDIF
      IF(PAR(3).EQ.1d99)THEN
       WRITE(0,1)"TANB MUST BE GIVEN IN BLOCK MINPAR"
       ERR=1
      ENDIF
      IF(DABS(SIGMU).NE.1d0)THEN
       WRITE(0,1)"SIGMU IS EITHER 1 OR -1 IN BLOCK MINPAR"
       ERR=1
      ENDIF
      IF(N5.EQ.1d99)THEN
       WRITE(0,1)"N5 MUST BE GIVEN IN BLOCK MINPAR"
       ERR=1
      ENDIF
      IF(N5.LE.0d0 .OR. ANINT(N5).NE.N5)THEN
       WRITE(0,1)"N5 MUST BE A POSITIVE INTEGER IN BLOCK MINPAR"
       ERR=1
      ENDIF
      IF(CGR.LE.0d0)THEN
       WRITE(0,1)"CGR MUST BE POSITIVE IN BLOCK MINPAR"
       ERR=1
      ENDIF
      IF(PAR(1).EQ.1d99)THEN
       WRITE(0,1)"LAMBDA MUST BE GIVEN IN BLOCK EXTPAR"
       ERR=1
      ENDIF
      IF(XIFINP.NE.1d99 .AND. PAR(2).NE.1d99)THEN
       WRITE(0,1)"BOTH XIF AND KAPPA CANNOT BE GIVEN IN BLOCK EXTPAR"
       ERR=1
      ENDIF
      IF(XISINP.NE.1d99 .AND. MSINP.NE.1d99)THEN
       WRITE(0,1)"BOTH XIS AND MS^2 CANNOT BE GIVEN IN BLOCK EXTPAR"
       ERR=1
      ENDIF
      IF(GMFLAG.NE.0 .AND. PAR(2).NE.1d99)THEN
       WRITE(0,1)"GMFLAG=/=0 => KINP CANNOT BE GIVEN IN BLOCK EXTPAR"
       ERR=1
      ENDIF
      IF(GMFLAG.NE.0 .AND. ALINP.NE.1d99)THEN
       WRITE(0,1)"GMFLAG=/=0 => ALINP CANNOT BE GIVEN IN BLOCK EXTPAR"
       ERR=1
      ENDIF
      IF(GMFLAG.NE.0 .AND. MSINP.NE.1d99)THEN
       WRITE(0,1)"GMFLAG=/=0 => MSINP CANNOT BE GIVEN IN BLOCK EXTPAR"
       ERR=1
      ENDIF
      IF(GMFLAG.NE.0 .AND. XIFINP.NE.1d99)THEN
       WRITE(0,1)"GMFLAG=/=0 => XIFINP CANNOT BE GIVEN IN BLOCK EXTPAR"
       ERR=1
      ENDIF
      IF(GMFLAG.NE.0 .AND. XISINP.NE.1d99)THEN
       WRITE(0,1)"GMFLAG=/=0 => XISINP CANNOT BE GIVEN IN BLOCK EXTPAR"
       ERR=1
      ENDIF
      IF(GMFLAG.EQ.0 .AND. DMIN.NE.1d99)THEN
       WRITE(0,1)"GMFLAG=0 => DMIN CANNOT BE GIVEN IN BLOCK EXTPAR"
       ERR=1
      ENDIF
      IF(GMFLAG.NE.0 .AND. DMIN.EQ.1d99)THEN
       WRITE(0,1)"GMFLAG=/=0 => DMIN MUST BE GIVEN IN BLOCK EXTPAR"
       ERR=1
      ENDIF
      IF(GMFLAG.NE.1 .AND. XIU.NE.0d0)THEN
       WRITE(0,1)"GMFLAG=/=1 => XIU CANNOT BE GIVEN IN BLOCK EXTPAR"
       ERR=1
      ENDIF
      IF(GMFLAG.NE.2 .AND. LPPMES.NE.0d0)THEN
       WRITE(0,1)"GMFLAG=/=2 => LPPMES CANNOT BE GIVEN IN BLOCK EXTPAR"
       ERR=1
      ENDIF
      IF(GMFLAG.NE.2 .AND. LTTMES.NE.0d0)THEN
       WRITE(0,1)"GMFLAG=/=2 => LTTMES CANNOT BE GIVEN IN BLOCK EXTPAR"
       ERR=1
      ENDIF
      IF(GMFLAG.NE.1 .AND. GMFLAG.NE.2 .AND. LUMES.NE.0d0)THEN
       WRITE(0,1)"GMFLAG=/=1,2 => LUMES CANNOT BE GIVEN IN BLOCK EXTPAR"
       ERR=1
      ENDIF
      IF(GMFLAG.NE.1 .AND. GMFLAG.NE.2 .AND. LDMES.NE.0d0)THEN
       WRITE(0,1)"GMFLAG=/=1,2 => LDMES CANNOT BE GIVEN IN BLOCK EXTPAR"
       ERR=1
      ENDIF
      IF(GMFLAG.NE.1 .AND. GMFLAG.NE.2 .AND. LTMES.NE.0d0)THEN
       WRITE(0,1)"GMFLAG=/=1,2 => LTMES CANNOT BE GIVEN IN BLOCK EXTPAR"
       ERR=1
      ENDIF
      IF(GMFLAG.NE.1 .AND. GMFLAG.NE.2 .AND. LBMES.NE.0d0)THEN
       WRITE(0,1)"GMFLAG=/=1,2 => LBMES CANNOT BE GIVEN IN BLOCK EXTPAR"
       ERR=1
      ENDIF
      IF(GMFLAG.NE.1 .AND. GMFLAG.NE.2 .AND. LLMES.NE.0d0)THEN
       WRITE(0,1)"GMFLAG=/=1,2 => LLMES CANNOT BE GIVEN IN BLOCK EXTPAR"
       ERR=1
      ENDIF

*   Set default values

      IF(PAR(2).EQ.1d99 .AND. XIFINP.EQ.1d99)XIFINP=0d0
      IF(MSINP.EQ.1d99 .AND. XISINP.EQ.1d99)XISINP=0d0
      IF(ALINP.EQ.1d99)ALINP=0d0

*   Set MAFLAG

      IF(PAR(2).EQ.1d99 .AND. MSINP.EQ.1d99)MAFLAG=-1
      IF(PAR(2).EQ.1d99 .AND. XISINP.EQ.1d99)MAFLAG=-2
      IF(XIFINP.EQ.1d99 .AND. MSINP.EQ.1d99)MAFLAG=-3
      IF(XIFINP.EQ.1d99 .AND. XISINP.EQ.1d99)MAFLAG=-4
      NMSFLAG=2*NMSFLAG

*   Check for Z3 breaking terms

      IF(MAFLAG.EQ.-2 .OR. MAFLAG.EQ.-3 .OR. MAFLAG.EQ.-4 .OR. 
     . MUPINP.NE.0d0 .OR. MSPINP.NE.0d0 .OR. XIFINP.NE.0d0 .OR. 
     . XISINP.NE.0d0)THEN
       IF(PFLAG.NE.0)THEN
        WRITE(0,1)"HIGGS MASS PRECISION = 1 OR 2 ONLY FOR Z3-NMSSM"
        ERR=1
       ENDIF
       IF(Z3FLAG.GT.2)THEN
        WRITE(0,1)"PRESENCE OF Z3 BREAKING TERMS"
        ERR=1
       ENDIF
      ENDIF

*   Stop if error

      IF(ERR.EQ.1)THEN
       WRITE(0,1)"ERROR IN INPUT FILE"
       STOP 1
      ENDIF

*   Set Q2MIN, Q2FIX:
      Q2MIN=100d0**2
      Q2FIX=1
      IF(Q2.LE.Q2MIN)THEN
       Q2FIX=0
      ENDIF

*   Initialization for ALPHAS and RUNM (as in hdecay)
*   The bottom quark pole mass MBP is set in INIT and can be changed
*   only there (changing its running mass MB above has no effect
*   on MBP, since one would have to compute alpha_s(MB) first)

      MSB=MS
      MC0=MC
      MB0=MBP
      MT0=MT
      N0=5
      NLOOP=2
      NBER=18
      ACC=1d-8
      XLAMBDA=XITLA(NLOOP,ALSMZ,ACC)
      CALL ALSINI(ACC)
      CALL BERNINI(NBER)

*   g1,g2  and sin(theta)^2 in the on-shell scheme in terms of
*   GF, MZ(pole) and MW(pole)

      g2=4d0*DSQRT(2d0)*GF*MW**2
      g1=4d0*DSQRT(2d0)*GF*(MZ**2-MW**2)
      S2TW=1d0-(MW/MZ)**2

      RETURN

 999  WRITE(0,1)"READ ERROR ON LINE:", NLINE
      WRITE(0,*)CHINL(1:80)
      STOP 1

 1    FORMAT(A)

      END


      SUBROUTINE OUTPUT(PAR,PROB,IFAIL)

*********************************************************************
*   Subroutine writing all the results in the the output files.
*********************************************************************

      IMPLICIT NONE

      INTEGER OMGFLAG,MAFLAG,MOFLAG,PFLAG,GMFLAG,Q2FIX,VFLAG,NMSFLAG
      INTEGER I,IFAIL,NSUSY,NGUT,NMES,OUTFLAG
      PARAMETER (NSUSY=14,NGUT=21,NMES=20)

      DOUBLE PRECISION PAR(*),PROB(*),SIG(3,10)
      DOUBLE PRECISION SMASS(3),PMASS(2),CMASS,SCOMP(3,3),PCOMP(2,2)
      DOUBLE PRECISION MGL,MCHA(2),U(2,2),V(2,2),MNEU(5),NEU(5,5)
      DOUBLE PRECISION BRJJ(5),BREE(5),BRMM(5),BRLL(5),BRSS(5)
      DOUBLE PRECISION BRCC(5),BRBB(5),BRTT(5),BRWW(3),BRZZ(3)
      DOUBLE PRECISION BRGG(5),BRZG(5),BRHHH(4),BRHAA(3,3)
      DOUBLE PRECISION BRHCHC(3),BRHAZ(3,2),BRAHA(3),BRAHZ(2,3)
      DOUBLE PRECISION BRHCW(5),BRHIGGS(5),BRNEU(5,5,5),BRCHA(5,3)
      DOUBLE PRECISION BRHSQ(3,10),BRHSL(3,7),BRASQ(2,2),BRASL(2)
      DOUBLE PRECISION BRSUSY(5),WIDTH(5)
      DOUBLE PRECISION HCBRM,HCBRL,HCBRSU,HCBRBU,HCBRSC,HCBRBC
      DOUBLE PRECISION HCBRBT,HCBRWH(5),HCBRWHT,HCBRNC(5,2)
      DOUBLE PRECISION HCBRSQ(5),HCBRSL(3),HCBRSUSY,HCWIDTH
      DOUBLE PRECISION CU(5),CD(5),CV(3),CJ(5),CG(5),CB(5)
      DOUBLE PRECISION ALSMZ,ALEMMZ,GF,g1,g2,S2TW
      DOUBLE PRECISION MS,MC,MB,MBP,MT,MTAU,MMUON,MZ,MW
      DOUBLE PRECISION VUS,VCB,VUB,TANB,SINB,COSB
      DOUBLE PRECISION MUR,MUL,MDR,MDL,MLR,MLL,MNL
      DOUBLE PRECISION MST1,MST2,MSB1,MSB2,MSL1,MSL2,MSNT
      DOUBLE PRECISION CST,CSB,CSL,MSMU1,MSMU2,MSNM,CSMU
      DOUBLE PRECISION SST,SSB,SSL,Q2,Q2MIN
      DOUBLE PRECISION g1s,g2s,g3s,HTOPS,HBOTS,HTAUS
      DOUBLE PRECISION MHUS,MHDS,MSS,M32,CGR,MPL
      DOUBLE PRECISION G1MES,G2MES,G3MES,LMES,KMES,HTMES,HBMES,HLMES
      DOUBLE PRECISION SIGMU,PI,MSREF,D,DMIN,MGUT
      DOUBLE PRECISION MHUQ,MHDQ,MSQ,LQ,KQ,ALQ,AKQ,MUQ,NUQ
      DOUBLE PRECISION ZHU,ZHD,ZS,H1Q,H2Q,TANBQ,QSTSB
      DOUBLE PRECISION BRSG,BRSGmax,BRSGmin,DMd,DMdmin,DMdmax,DMs,
     . DMsmax,DMsmin,BRBMUMU,BRBMUMUmax,BRBMUMUmin,BRBtaunu,
     . BRBtaunumax,BRBtaunumin
      DOUBLE PRECISION delmagmu,damumin,damumax,amuthmax,amuthmin
      DOUBLE PRECISION MSUSYEFF,MMESS,N5
      DOUBLE PRECISION M1MES,M2MES,M3MES,ALMES,AKMES,ATMES,ABMES,
     . ATAUMES,AMUMES,MHUMES,MHDMES,MQ3MES,MU3MES,MD3MES,
     . MQMES,MUMES,MDMES,ML3MES,ME3MES,MLMES,MEMES
      DOUBLE PRECISION XIFMES,XISMES,MSMES,MUPMES,MSPMES,M3HMES
      DOUBLE PRECISION XIFSUSY,XISSUSY,MUPSUSY,MSPSUSY,M3HSUSY
      DOUBLE PRECISION ALINP,XIFINP,XISINP,MSINP,MUPINP,MSPINP
      DOUBLE PRECISION G1GUT,G2GUT,G3GUT,LGUT,KGUT,HTGUT,HBGUT,HLGUT
      DOUBLE PRECISION brtopbw,brtopbh,brtopneutrstop(5,2),toptot
      DOUBLE PRECISION FTSUSY(NSUSY+2),FTGUT(NGUT+2),FTMES(NMES+2)
      DOUBLE PRECISION DELMB,PX,PA(6),PB(2),PL(7),PK(8),MH(3),MMH(3)
      DOUBLE PRECISION DMH(3),MA(2),MMA(2),DMA(2),MHC,MMHC,DMHC
      DOUBLE PRECISION MHmin,MHmax,chi2max,chi2gam,chi2bb,chi2zz
      DOUBLE PRECISION LPPMES,LTTMES,LUMES,LDMES,LTMES,LBMES,LLMES,XIU
      DOUBLE PRECISION LPPGUT,LTTGUT,LUGUT,LDGUT,LTGUT,LBGUT,LLGUT

      COMMON/NMSFLAG/NMSFLAG
      COMMON/PFLAG/PFLAG
      COMMON/FLAGS/OMGFLAG,MAFLAG,MOFLAG
      COMMON/INPPAR/ALINP,XIFINP,XISINP,MSINP,MUPINP,MSPINP
      COMMON/MESCAL/MSUSYEFF,MMESS,N5
      COMMON/MESEXT/XIFMES,XISMES,MSMES,MUPMES,MSPMES,M3HMES
      COMMON/SUSYEXT/XIFSUSY,XISSUSY,MUPSUSY,MSPSUSY,M3HSUSY
      COMMON/SOFTMES/M1MES,M2MES,M3MES,ALMES,AKMES,ATMES,ABMES,
     . ATAUMES,AMUMES,MHUMES,MHDMES,MQ3MES,MU3MES,MD3MES,
     . MQMES,MUMES,MDMES,ML3MES,ME3MES,MLMES,MEMES
      COMMON/SIGMU/SIGMU
      COMMON/BRN/BRJJ,BREE,BRMM,BRLL,BRSS,BRCC,BRBB,BRTT,BRWW,
     . BRZZ,BRGG,BRZG,BRHHH,BRHAA,BRHCHC,BRHAZ,BRAHA,BRAHZ,
     . BRHCW,BRHIGGS,BRNEU,BRCHA,BRHSQ,BRHSL,BRASQ,BRASL,
     . BRSUSY,WIDTH
      COMMON/BRC/HCBRM,HCBRL,HCBRSU,HCBRBU,HCBRSC,HCBRBC,
     . HCBRBT,HCBRWH,HCBRWHT,HCBRNC,HCBRSQ,HCBRSL,
     . HCBRSUSY,HCWIDTH
      COMMON/BRSG/BRSG,BRSGmax,BRSGmin,DMd,DMdmin,DMdmax,DMs,
     . DMsmax,DMsmin,BRBMUMU,BRBMUMUmax,BRBMUMUmin,BRBtaunu,
     . BRBtaunumax,BRBtaunumin
      COMMON/MAGMU/delmagmu,damumin,damumax,amuthmax,amuthmin
      COMMON/BR_top2body/brtopbw,brtopbh,brtopneutrstop
      COMMON/topwidth/toptot
      COMMON/REDCOUP/CU,CD,CV,CJ,CG
      COMMON/CB/CB
      COMMON/HIGGSPEC/SMASS,SCOMP,PMASS,PCOMP,CMASS
      COMMON/SUSYSPEC/MGL,MCHA,U,V,MNEU,NEU
      COMMON/GAUGE/ALSMZ,ALEMMZ,GF,g1,g2,S2TW
      COMMON/SMSPEC/MS,MC,MB,MBP,MT,MTAU,MMUON,MZ,MW
      COMMON/CKM/VUS,VCB,VUB
      COMMON/SFSPEC/MUR,MUL,MDR,MDL,MLR,MLL,MNL,
     .  MST1,MST2,MSB1,MSB2,MSL1,MSL2,MSNT,
     .  CST,CSB,CSL,MSMU1,MSMU2,MSNM,CSMU
      COMMON/Q2FIX/Q2MIN,Q2FIX
      COMMON/RENSCALE/Q2
      COMMON/STSBSCALE/QSTSB
      COMMON/SUSYCOUP/g1s,g2s,g3s,HTOPS,HBOTS,HTAUS
      COMMON/SUSYMH/MHUS,MHDS,MSS
      COMMON/QMHIGGS/MHUQ,MHDQ,MSQ
      COMMON/QHIGGS/ZHU,ZHD,ZS,H1Q,H2Q,TANBQ
      COMMON/QPAR/LQ,KQ,ALQ,AKQ,MUQ,NUQ
      COMMON/MESCOUP/G1MES,G2MES,G3MES,LMES,KMES,HTMES,HBMES,HLMES
      COMMON/MESGUT/LPPMES,LTTMES,LUMES,LDMES,LTMES,LBMES,LLMES,XIU
      COMMON/GUTCOUP/G1GUT,G2GUT,G3GUT,LGUT,KGUT,HTGUT,HBGUT,HLGUT
      COMMON/GUTMES/LPPGUT,LTTGUT,LUGUT,LDGUT,LTGUT,LBGUT,LLGUT
      COMMON/MGUT/MGUT
      COMMON/FINETUN/FTSUSY,FTGUT,FTMES
      COMMON/EFFHIGM/MH,MMH,DMH,MA,MMA,DMA,MHC,MMHC,DMHC
      COMMON/EFFCOUP/PX,PA,PB,PL,PK
      COMMON/DELMB/DELMB
      COMMON/LHCSIG/SIG
      COMMON/HIGGSFIT/MHmin,MHmax,chi2max,chi2gam,chi2bb,chi2zz
      COMMON/GMSCEN/MSREF,D,DMIN,GMFLAG
      COMMON/VFLAG/VFLAG
      COMMON/M32/M32,CGR,MPL
      COMMON/OUTFLAG/OUTFLAG

      PI=4d0*DATAN(1d0)
      TANB=PAR(3)
      COSB=1d0/DSQRT(1d0+TANB**2)
      SINB=TANB*COSB

      WRITE(17,899) "# NMSSMTools OUTPUT IN SLHA FORMAT"
      WRITE(17,899) "# Info about spectrum calculator"
      WRITE(17,899) "BLOCK SPINFO   # Program information"
      WRITE(17,900) 1,"NMSSMTools # Spectrum calculator"
      WRITE(17,900) 2,"4.7.1      # Version number"

      IF(PROB(1).NE.0d0)
     . WRITE(17,900) 3,"# Chargino excluded by LEP"
      IF(PROB(2).NE.0d0)
     . WRITE(17,900) 3,"# Neutralinos excluded by LEP"
      IF(PROB(3).NE.0d0)
     . WRITE(17,900) 3,"# Charged Higgs excluded by LEP"
      IF(PROB(4).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by ee -> hZ, ind. of h decay"
      IF(PROB(5).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by ee -> hZ, h -> bb"
      IF(PROB(6).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by ee -> hZ, h -> tautau"
      IF(PROB(7).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by ee -> hZ, h -> invisible"
      IF(PROB(8).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by ee -> hZ, h -> 2jets"
      IF(PROB(9).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by ee -> hZ, h -> 2photons"
      IF(PROB(10).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by ee -> hZ, h -> AA -> 4bs"
      IF(PROB(11).NE.0d0 .OR. PROB(41).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by ee -> hZ, h -> AA -> 4taus"
      IF(PROB(12).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by ee -> hZ, h -> AA -> 2bs 2taus"
      IF(PROB(19).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by ee -> hZ, h -> AA,A -> light pair"
      IF(PROB(13).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by ee -> Z -> hA (Z width)"
      IF(PROB(14).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by ee -> hA -> 4bs"
      IF(PROB(15).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by ee -> hA -> 4taus"
      IF(PROB(16).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by ee -> hA -> 2bs 2taus"
      IF(PROB(17).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by ee -> hA -> AAA -> 6bs"
      IF(PROB(18).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by ee -> hA -> AAA -> 6taus"
      IF(PROB(20).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by stop -> b l sneutrino"
      IF(PROB(21).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by stop -> neutralino c"
      IF(PROB(22).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by sbottom -> neutralino b"
      IF(PROB(23).NE.0d0)
     . WRITE(17,900) 3,"# Squark/gluino too light"
      IF(PROB(24).NE.0d0)
     . WRITE(17,900) 3,"# Selectron/smuon too light"
      IF(PROB(25).NE.0d0)
     . WRITE(17,900) 3,"# Stau too light"
      IF(PROB(27).NE.0d0)
     . WRITE(17,900) 3,"# Landau Pole below MGUT"
      IF(PROB(28).NE.0d0)
     . WRITE(17,900) 3,"# Unphysical global minimum"
      IF(PROB(29).NE.0d0)
     . WRITE(17,900) 3,"# Higgs soft masses >> Msusy"
      IF(PROB(32).NE.0d0)
     . WRITE(17,900) 3,"# b -> s gamma more than 2 sigma away"
      IF(PROB(33).NE.0d0)
     . WRITE(17,900) 3,"# Delta M_s more than 2 sigma away"
      IF(PROB(34).NE.0d0)
     . WRITE(17,900) 3,"# Delta M_d more than 2 sigma away"
      IF(PROB(35).NE.0d0)
     . WRITE(17,900) 3,"# B_s -> mu+ mu- more than 2 sigma away"
      IF(PROB(36).NE.0d0)
     . WRITE(17,900) 3,"# B+ -> tau nu_tau more than 2 sigma away"
      IF(PROB(37).NE.0d0)
     . WRITE(17,900) 3,"# Muon magn. mom. more than 2 sigma away"
      IF(PROB(38).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by Upsilon(1S) -> A gamma (CLEO)"
      IF(PROB(38).LT.0d0)
     . WRITE(17,900) 3,"# (but A width> 10 MeV)"
      IF(PROB(39).NE.0d0)
     . WRITE(17,900) 3,
     . "# Excluded etab(1S) mass difference (BABAR - theory)"
       IF(PROB(40).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by BR(B -> X_s mu +mu-)"
       IF(PROB(42).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by top -> b H+, H+ -> c s"
       IF(PROB(43).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by top -> b H+, H+ -> tau nu_tau"
       IF(PROB(44).NE.0d0)
     . WRITE(17,900) 3,
     . "# Excluded by top -> b H+, H+ -> W+ A1, A1 -> 2taus"
       IF(PROB(45).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by t -> bH+ (LHC)"
       IF(PROB(46).NE.0d0)
     . WRITE(17,918) 3,"# No Higgs in the",MHMIN,MHMAX," GeV mass range"
       IF(PROB(47).NE.0d0)
     . WRITE(17,919) 3,"# chi2(H->gg) > ",chi2MAX
       IF(PROB(48).NE.0d0)
     . WRITE(17,919) 3,"# chi2(H->bb) > ",chi2MAX
       IF(PROB(49).NE.0d0)
     . WRITE(17,919) 3,"# chi2(H->ZZ) > ",chi2MAX
       IF(PROB(50).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by sparticle searches at the LHC"
       IF(PROB(51).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by ggF/bb->H/A->tautau at the LHC"
       IF(PROB(52).NE.0d0)
     . WRITE(17,900) 3,"# Excluded H_125->AA->4mu (CMS)"
       IF(PROB(53).NE.0d0)
     . WRITE(17,900) 3,"# Excluded by ggF->H/A->gamgam (ATLAS)"

      IF((IFAIL.EQ.0 .OR. IFAIL.EQ.10 .OR. IFAIL.GE.21)
     . .AND. (SMASS(1).LT.1d0 .OR. PMASS(1).LT.1d0))
     . WRITE(17,900) 3,"# Branching ratios of Higgs states < 1 GeV not r
     .eliable"

      IF(IFAIL.EQ.1.OR.IFAIL.EQ.3.OR.IFAIL.EQ.5.OR.IFAIL.EQ.7)
     . WRITE(17,900) 4,"# M_H1^2<1"
      IF(IFAIL.EQ.2.OR.IFAIL.EQ.3.OR.IFAIL.EQ.6.OR.IFAIL.EQ.7)
     . WRITE(17,900) 4,"# M_A1^2<1"
      IF(IFAIL.EQ.4.OR.IFAIL.EQ.5.OR.IFAIL.EQ.6.OR.IFAIL.EQ.7)
     . WRITE(17,900) 4,"# M_HC^2<1"
      IF (IFAIL.EQ.8)
     . WRITE(17,900) 4,"# Negative sfermion mass squared"
      IF (IFAIL.EQ.9)
     . WRITE(17,900) 4,"# Disallowed parameters: lambda or tan(beta)=0"
      IF (IFAIL.EQ.11)
     . WRITE(17,900) 4,"# Integration problem in RGESGM"
      IF (IFAIL.EQ.12)
     . WRITE(17,900) 4,"# Integration problem in RGESUNIGM"
      IF (IFAIL.EQ.13)
     . WRITE(17,900) 4,"# Integration problem in RGESINVGM"
      IF (IFAIL.EQ.14)
     . WRITE(17,900) 4,"# Integration problem in RGESGMGUT"
      IF (IFAIL.EQ.15)
     . WRITE(17,900) 4,"# Integration problem in LPTSOLVE"
      IF (IFAIL.EQ.16.OR.IFAIL.EQ.17.OR.IFAIL.EQ.18.OR.IFAIL.EQ.19)
     . WRITE(17,900) 4,"# Convergence Problem"
      IF (IFAIL.EQ.20)
     . WRITE(17,900) 4,"# No electroweak symmetry breaking"
      IF (IFAIL.EQ.21.OR.IFAIL.EQ.22)
     . WRITE(17,900) 4,"# MSMES=/=MSREF"

      WRITE(17,899) "# Input parameters"
      WRITE(17,899) "BLOCK MODSEL"
      WRITE(17,921) 3,1,"NMSSM particle content"
      WRITE(17,921) 1,2,"IMOD"
      WRITE(17,921) 10,0,"ISCAN"
      WRITE(17,921) 8,PFLAG,"Precision for Higgs masses"
      WRITE(17,921) 12,GMFLAG,"GMSB scenario at MMESS"
      WRITE(17,921) 14,VFLAG,"H-> VV,VV*,(V*V*)"
      WRITE(17,921) 16,OUTFLAG,"Extra BLOCK's yes/no"

      WRITE(17,899) "BLOCK SMINPUTS"
      WRITE(17,901) 1,1./ALEMMZ,"ALPHA_EM^-1(MZ)"
      WRITE(17,901) 2,GF,"GF"
      WRITE(17,901) 3,ALSMZ,"ALPHA_S(MZ)"
      WRITE(17,901) 4,MZ,"MZ"
      WRITE(17,901) 5,MB,"MB(MB)"
      WRITE(17,901) 6,MT,"MTOP (POLE MASS)"
      WRITE(17,901) 7,MTAU,"MTAU"
      WRITE(17,899) "# SMINPUTS Beyond SLHA:"
      WRITE(17,906) "MW:",MW
      WRITE(17,906) "MS:",MS
      WRITE(17,906) "MC:",MC
      WRITE(17,906) "VUS:",VUS
      WRITE(17,906) "VCB:",VCB
      WRITE(17,906) "VUB:",VUB

      WRITE(17,899) "BLOCK MINPAR"
      IF(Q2FIX.EQ.1)WRITE(17,901) 0,DSQRT(Q2),"REN. SCALE"
      WRITE(17,901) 1,MSUSYEFF,"MSUSYEFF"
      WRITE(17,901) 2,MMESS,"MMESS"
      WRITE(17,901) 3,TANB,"TANBETA(MZ)"
      WRITE(17,901) 4,SIGMU,"SIGMU"
      IF(N5.NE.1d0)WRITE(17,901) 5,N5,"N5"

      WRITE(17,899) "BLOCK EXTPAR"
      WRITE(17,901) 61,PAR(1),"LAMBDA AT THE SUSY SCALE"
      IF(MAFLAG.EQ.-3 .OR. MAFLAG.EQ.-4)THEN
       WRITE(17,901) 62,PAR(2),"KAPPA AT THE SUSY SCALE"
      ELSE
       WRITE(17,920) 62,PAR(2),"KAPPA AT THE SUSY SCALE"
      ENDIF
      IF(GMFLAG.EQ.0)THEN
       WRITE(17,901) 63,ALINP,"ALAMBDA AT THE MES SCALE"
      ELSE
       WRITE(17,920) 63,ALINP,"ALAMBDA AT THE MES SCALE"
      ENDIF
      WRITE(17,920) 65,PAR(4),"MUEFF AT THE SUSY SCALE"
      IF(MAFLAG.EQ.-1 .OR. MAFLAG.EQ.-2)THEN
       IF(XIFINP.NE.0d0)
     .  WRITE(17,901) 66,XIFINP,"XIF AT THE MES SCALE"
      ELSE
       WRITE(17,920) 66,XIFMES,"XIF AT THE MES SCALE"
      ENDIF
      IF(MAFLAG.EQ.-1 .OR. MAFLAG.EQ.-3)THEN
       IF(XISINP.NE.0d0)
     .  WRITE(17,901) 67,XISINP,"XIS AT THE MES SCALE"
      ELSE
       WRITE(17,920) 67,XISMES,"XIS AT THE MES SCALE"
      ENDIF
      IF(MUPINP.NE.0d0)
     .  WRITE(17,901) 68,MUPINP,"MU' AT THE MES SCALE "
      IF(MSPINP.NE.0d0)
     .  WRITE(17,901) 69,MSPINP,"MS'^2 AT THE MES SCALE "
      IF(MAFLAG.EQ.-2 .OR. MAFLAG.EQ.-4)THEN
       WRITE(17,901) 70,MSINP,"MS^2 AT THE MES SCALE"
      ELSE
       WRITE(17,920) 70,MSMES,"MS^2 AT THE MES SCALE"
      ENDIF
      IF(GMFLAG.NE.0)
     . WRITE(17,920) 71,MSREF,"MS^2_REF"
      IF(GMFLAG.NE.0)
     . WRITE(17,920) 72,D,"DELTA"
      IF(GMFLAG.EQ.1)
     .  WRITE(17,901) 73,XIU,"XiU AT THE GUT SCALE"
      IF(GMFLAG.EQ.2)
     .  WRITE(17,901) 74,LPPMES,"LPP AT THE MES SCALE"
      IF(GMFLAG.EQ.2)
     .  WRITE(17,901) 75,LTTMES,"LTT AT THE MES SCALE"
      IF(GMFLAG.NE.0)
     .  WRITE(17,901) 76,LUMES,"LU AT THE MES SCALE"
      IF(GMFLAG.NE.0)
     .  WRITE(17,901) 77,LDMES,"LD AT THE MES SCALE"
      IF(GMFLAG.NE.0)
     .  WRITE(17,901) 78,LTMES,"LT AT THE MES SCALE"
      IF(GMFLAG.NE.0)
     .  WRITE(17,901) 79,LBMES,"LB AT THE MES SCALE"
      IF(GMFLAG.NE.0)
     .  WRITE(17,901) 80,LLMES,"LL AT THE MES SCALE"

      IF(IFAIL.NE.0.AND.IFAIL.NE.10.AND.IFAIL.NE.21.AND.IFAIL.NE.22)
     .  RETURN

      WRITE(17,899) "# "
      WRITE(17,899) "BLOCK MASS   # Mass spectrum "
      WRITE(17,899) "#  PDG Code     mass             particle "
      WRITE(17,902) 5,MB,"MB(MB)"
      WRITE(17,902) 6,MT,"MTOP (POLE MASS)"
      WRITE(17,902) 15,MTAU,"MTAU"
      WRITE(17,902) 23,MZ,"MZ"
      WRITE(17,902) 24,MW,"MW"
      WRITE(17,902) 25,SMASS(1),"lightest neutral scalar"
      WRITE(17,902) 35,SMASS(2),"second neutral scalar"
      WRITE(17,902) 45,SMASS(3),"third neutral scalar"
      WRITE(17,902) 36,PMASS(1),"lightest pseudoscalar"
      WRITE(17,902) 46,PMASS(2),"second pseudoscalar"
      WRITE(17,902) 37,CMASS,"charged Higgs"
      WRITE(17,902) 1000001,MDL," ~d_L"
      WRITE(17,902) 2000001,MDR," ~d_R"
      WRITE(17,902) 1000002,MUL," ~u_L"
      WRITE(17,902) 2000002,MUR," ~u_R"
      WRITE(17,902) 1000003,MDL," ~s_L"
      WRITE(17,902) 2000003,MDR," ~s_R"
      WRITE(17,902) 1000004,MUL," ~c_L"
      WRITE(17,902) 2000004,MUR," ~c_R"
      WRITE(17,902) 1000005,MSB1," ~b_1"
      WRITE(17,902) 2000005,MSB2," ~b_2"
      WRITE(17,902) 1000006,MST1," ~t_1"
      WRITE(17,902) 2000006,MST2," ~t_2"
      WRITE(17,902) 1000011,MLL," ~e_L"
      WRITE(17,902) 2000011,MLR," ~e_R"
      WRITE(17,902) 1000012,MNL," ~nue_L"
      WRITE(17,902) 1000013,MLL," ~mu_L"
      WRITE(17,902) 2000013,MLR," ~mu_R"
      WRITE(17,902) 1000014,MNL," ~numu_L"
      WRITE(17,902) 1000015,MSL1," ~tau_1"
      WRITE(17,902) 2000015,MSL2," ~tau_2"
      WRITE(17,902) 1000016,MSNT," ~nutau_L"
      WRITE(17,902) 1000021,MGL," ~g"
      WRITE(17,902) 1000022,MNEU(1),"neutralino(1)"
      WRITE(17,902) 1000023,MNEU(2),"neutralino(2)"
      WRITE(17,902) 1000025,MNEU(3),"neutralino(3)"
      WRITE(17,902) 1000035,MNEU(4),"neutralino(4)"
      WRITE(17,902) 1000045,MNEU(5),"neutralino(5)"
      WRITE(17,902) 1000024,MCHA(1),"chargino(1)"
      WRITE(17,902) 1000037,MCHA(2),"chargino(2)"
      WRITE(17,902) 1000039,M32,"gravitino"
      WRITE(17,899) "# " 

       IF(OUTFLAG.NE.1) THEN
      WRITE(17,899) "# Low energy observables"
      WRITE(17,899) "BLOCK LOWEN"
      WRITE(17,899)
     .   "# Exp. 2 Sigma: 2.99E-4 < BR(b -> s gamma) < 3.87E-4:"
      WRITE(17,901) 1,BRSG,"BR(b -> s gamma)"
      WRITE(17,901) 11,BRSGMAX,"(BR(b -> s gamma)+Theor.Err.)"
      WRITE(17,901) 12,BRSGMIN,"(BR(b -> s gamma)-Theor.Err.)"
      WRITE(17,899) "# Exp. 2 Sigma: 5.04E-1 < Delta M_d < 5.16E-1:"
      WRITE(17,901) 2,DMD,"Delta M_d in ps^-1"
      WRITE(17,901) 21,DMdmax,"Delta M_d +Theor.Err."
      WRITE(17,901) 22,DMdmin,"Delta M_d -Theor.Err."
      WRITE(17,899) 
     .   "# Exp. 2 Sigma: 1.7717E+1 < Delta Ms < 1.7805E+1:"
      WRITE(17,901) 3,DMS,"Delta M_s in ps^-1"
      WRITE(17,901) 31,DMsmax,"Delta M_s +Theor.Err."
      WRITE(17,901) 32,DMsmin,"Delta M_s -Theor.Err."
      WRITE(17,899) "# Exp. 2 Sigma: 1.2E-9 < BR(Bs->mu+mu-) < 5.2E-9:"
      WRITE(17,901) 4,BRBMUMU,"BR(Bs -> mu+mu-)"
      WRITE(17,901) 41,BRBMUMUmax,"BR(Bs -> mu+mu-)+Theor.Err."
      WRITE(17,901) 42,BRBMUMUmin,"BR(Bs -> mu+mu-)-Theor.Err."
      WRITE(17,899) 
     .   "# Exp. 2 Sigma: 0.70E-4 < BR(B+ > tau+ + nu_tau) < 1.58E-4:"
      WRITE(17,901) 5,BRBtaunu,"BR(B+ -> tau+ + nu_tau)"
      WRITE(17,901) 51,BRBtaunumax,
     .   "BR(B+ -> tau+ + nu_tau) + Theor.Err."
      WRITE(17,901) 52,BRBtaunumin,
     .   "BR(B+ -> tau+ + nu_tau) - Theor.Err."
      WRITE(17,899) "# " 
      WRITE(17,899) "# BSM contr. to the muon anomalous magn. moment:"
      WRITE(17,901) 6,delmagmu,"Del_a_mu"
      WRITE(17,901) 61,amuthmax,"Del_a_mu + Theor.Err."
      WRITE(17,901) 62,amuthmin,"Del_a_mu - Theor.Err."
      WRITE(17,907) "# Minimal Exp.-SM (2 sigma):",damumin
      WRITE(17,907) "# Maximal Exp.-SM (2 sigma):",damumax
      WRITE(17,899) "# "
*  From IF(OUTFLAG.NE.1)
       ENDIF

      WRITE(17,907) "BLOCK HMIX Q=",DSQRT(QSTSB),
     .    " # (STOP/SBOTTOM MASSES)"
      WRITE(17,901) 1,MUQ,"MUEFF"
      WRITE(17,901) 2,TANBQ,"TAN(BETA)"
      WRITE(17,901) 3,DSQRT(2d0*(H1Q**2+H2Q**2)),"V(Q)"
      WRITE(17,901) 4,PAR(23)**2,"MA^2"
      WRITE(17,901) 5,PAR(24)**2,"MP^2"

      WRITE(17,899) "# "
      WRITE(17,899) "# 3*3 Higgs mixing"
      WRITE(17,899) "BLOCK NMHMIX"
      WRITE(17,903) 1,1,SCOMP(1,2),"S_(1,1)"
      WRITE(17,903) 1,2,SCOMP(1,1),"S_(1,2)"
      WRITE(17,903) 1,3,SCOMP(1,3),"S_(1,3)"
      WRITE(17,903) 2,1,SCOMP(2,2),"S_(2,1)"
      WRITE(17,903) 2,2,SCOMP(2,1),"S_(2,2)"
      WRITE(17,903) 2,3,SCOMP(2,3),"S_(2,3)"
      WRITE(17,903) 3,1,SCOMP(3,2),"S_(3,1)"
      WRITE(17,903) 3,2,SCOMP(3,1),"S_(3,2)"
      WRITE(17,903) 3,3,SCOMP(3,3),"S_(3,3)"
      WRITE(17,899) "# "

      WRITE(17,899) "# 3*3 Pseudoscalar Higgs mixing"
      WRITE(17,899) "BLOCK NMAMIX"
      WRITE(17,903) 1,1,SINB*PCOMP(1,1),"P_(1,1)"
      WRITE(17,903) 1,2,COSB*PCOMP(1,1),"P_(1,2)"
      WRITE(17,903) 1,3,PCOMP(1,2),"P_(1,3)"
      WRITE(17,903) 2,1,SINB*PCOMP(2,1),"P_(2,1)"
      WRITE(17,903) 2,2,COSB*PCOMP(2,1),"P_(2,2)"
      WRITE(17,903) 2,3,PCOMP(2,2),"P_(2,3)"

      SST=DSQRT(1-CST**2)
      SSB=DSQRT(1-CSB**2)
      SSL=DSQRT(1-CSL**2)

      WRITE(17,899) "# "
      WRITE(17,899) "# 3rd generation sfermion mixing"
      WRITE(17,899) "BLOCK STOPMIX  # Stop mixing matrix"
      WRITE(17,903) 1,1,CST,"Rst_(1,1)"
      WRITE(17,903) 1,2,SST,"Rst_(1,2)"
      WRITE(17,903) 2,1,-SST,"Rst_(2,1)"
      WRITE(17,903) 2,2,CST,"Rst_(2,2)"
      WRITE(17,899) "BLOCK SBOTMIX  # Sbottom mixing matrix"
      WRITE(17,903) 1,1,CSB,"Rsb_(1,1)"
      WRITE(17,903) 1,2,SSB,"Rsb_(1,2)"
      WRITE(17,903) 2,1,-SSB,"Rsb_(2,1)"
      WRITE(17,903) 2,2,CSB,"Rsb_(2,2)"
      WRITE(17,899) "BLOCK STAUMIX  # Stau mixing matrix"
      WRITE(17,903) 1,1,CSL,"Rsl_(1,1)"
      WRITE(17,903) 1,2,SSL,"Rsl_(1,2)"
      WRITE(17,903) 2,1,-SSL,"Rsl_(2,1)"
      WRITE(17,903) 2,2,CSL,"Rsl_(2,2)"

      WRITE(17,899) "# "
      WRITE(17,899) "# Gaugino-Higgsino mixing"
      WRITE(17,899) "BLOCK NMNMIX  # 5*5 Neutralino Mixing Matrix"
      WRITE(17,903) 1,1,NEU(1,1),"N_(1,1)"
      WRITE(17,903) 1,2,NEU(1,2),"N_(1,2)"
      WRITE(17,903) 1,3,NEU(1,4),"N_(1,3)"
      WRITE(17,903) 1,4,NEU(1,3),"N_(1,4)"
      WRITE(17,903) 1,5,NEU(1,5),"N_(1,5)"
      WRITE(17,903) 2,1,NEU(2,1),"N_(2,1)"
      WRITE(17,903) 2,2,NEU(2,2),"N_(2,2)"
      WRITE(17,903) 2,3,NEU(2,4),"N_(2,3)"
      WRITE(17,903) 2,4,NEU(2,3),"N_(2,4)"
      WRITE(17,903) 2,5,NEU(2,5),"N_(2,5)"
      WRITE(17,903) 3,1,NEU(3,1),"N_(3,1)"
      WRITE(17,903) 3,2,NEU(3,2),"N_(3,2)"
      WRITE(17,903) 3,3,NEU(3,4),"N_(3,3)"
      WRITE(17,903) 3,4,NEU(3,3),"N_(3,4)"
      WRITE(17,903) 3,5,NEU(3,5),"N_(3,5)"
      WRITE(17,903) 4,1,NEU(4,1),"N_(4,1)"
      WRITE(17,903) 4,2,NEU(4,2),"N_(4,2)"
      WRITE(17,903) 4,3,NEU(4,4),"N_(4,3)"
      WRITE(17,903) 4,4,NEU(4,3),"N_(4,4)"
      WRITE(17,903) 4,5,NEU(4,5),"N_(4,5)"
      WRITE(17,903) 5,1,NEU(5,1),"N_(5,1)"
      WRITE(17,903) 5,2,NEU(5,2),"N_(5,2)"
      WRITE(17,903) 5,3,NEU(5,4),"N_(5,3)"
      WRITE(17,903) 5,4,NEU(5,3),"N_(5,4)"
      WRITE(17,903) 5,5,NEU(5,5),"N_(5,5)"
      WRITE(17,899) "# "

      WRITE(17,899) "BLOCK UMIX  # Chargino U Mixing Matrix"
      WRITE(17,903) 1,1,U(1,1),"U_(1,1)"
      WRITE(17,903) 1,2,U(1,2),"U_(1,2)"
      WRITE(17,903) 2,1,U(2,1),"U_(2,1)"
      WRITE(17,903) 2,2,U(2,2),"U_(2,2)"
      WRITE(17,899) "# "

      WRITE(17,899) "BLOCK VMIX  # Chargino V Mixing Matrix"
      WRITE(17,903) 1,1,V(1,1),"V_(1,1)"
      WRITE(17,903) 1,2,V(1,2),"V_(1,2)"
      WRITE(17,903) 2,1,V(2,1),"V_(2,1)"
      WRITE(17,903) 2,2,V(2,2),"V_(2,2)"
      WRITE(17,899) "# "

       IF(OUTFLAG.NE.1) THEN
      WRITE(17,899) "# Higgs reduced couplings"
      WRITE(17,899) "# (as compared to a SM Higgs with same mass)"
      WRITE(17,899) "BLOCK REDCOUP"
      WRITE(17,899) "# H1"
      WRITE(17,903) 1,1,CU(1),"U-type fermions"
      WRITE(17,903) 1,2,CD(1),"D-type fermions"
      WRITE(17,903) 1,3,CB(1),"b-quarks"
      WRITE(17,903) 1,4,CV(1),"W,Z bosons"
      WRITE(17,903) 1,5,CJ(1),"Gluons"
      WRITE(17,903) 1,6,CG(1),"Photons"
      WRITE(17,899) "# H2"
      WRITE(17,903) 2,1,CU(2),"U-type fermions"
      WRITE(17,903) 2,2,CD(2),"D-type fermions"
      WRITE(17,903) 2,3,CB(2),"b-quarks"
      WRITE(17,903) 2,4,CV(2),"W,Z bosons"
      WRITE(17,903) 2,5,CJ(2),"Gluons"
      WRITE(17,903) 2,6,CG(2),"Photons"
      WRITE(17,899) "# H3"
      WRITE(17,903) 3,1,CU(3),"U-type fermions"
      WRITE(17,903) 3,2,CD(3),"D-type fermions"
      WRITE(17,903) 3,3,CB(3),"b-quarks"
      WRITE(17,903) 3,4,CV(3),"W,Z bosons"
      WRITE(17,903) 3,5,CJ(3),"Gluons"
      WRITE(17,903) 3,6,CG(3),"Photons"
      WRITE(17,899) "# A1"
      WRITE(17,903) 4,1,CU(4),"U-type fermions"
      WRITE(17,903) 4,2,CD(4),"D-type fermions"
      WRITE(17,903) 4,3,CB(4),"b-quarks"
      WRITE(17,903) 4,4,0.,"W,Z bosons"
      WRITE(17,903) 4,5,CJ(4),"Gluons"
      WRITE(17,903) 4,6,CG(4),"Photons"
      WRITE(17,899) "# A2"
      WRITE(17,903) 5,1,CU(5),"U-type fermions"
      WRITE(17,903) 5,2,CD(5),"D-type fermions"
      WRITE(17,903) 5,3,CB(5),"b-quarks"
      WRITE(17,903) 5,4,0.,"W,Z bosons"
      WRITE(17,903) 5,5,CJ(5),"Gluons"
      WRITE(17,903) 5,6,CG(5),"Photons"

      write(17,'(a)')'#'
      write(17,'(a)')'Block HiggsBoundsInputHiggsCouplingsBosons'
      write(17,'(G16.6,4I6,a)')CV(1)**2,        3,25,24,24,
     .     ' # Higgs(1)-W-W reduced coupling^2'
      write(17,'(G16.6,4I6,a)')CV(2)**2,        3,35,24,24,
     .     ' # Higgs(2)-W-W reduced coupling^2'
      write(17,'(G16.6,4I6,a)')CV(3)**2,        3,45,24,24,
     .     ' # Higgs(3)-W-W reduced coupling^2'
      write(17,'(G16.6,4I6,a)')0d0,        3,36,24,24,
     .     ' # CP-odd Higgs(1)-W-W reduced coupling^2'
      write(17,'(G16.6,4I6,a)')0d0,        3,46,24,24,
     .     ' # CP-odd Higgs(2)-W-W reduced coupling^2'
      write(17,'(G16.6,4I6,a)')CV(1)**2,        3,25,23,23,
     .     ' # Higgs(1)-Z-Z reduced coupling^2'
      write(17,'(G16.6,4I6,a)')CV(2)**2,        3,35,23,23,
     .     ' # Higgs(2)-Z-Z reduced coupling^2'
      write(17,'(G16.6,4I6,a)')CV(3)**2,        3,45,23,23,
     .     ' # Higgs(3)-Z-Z reduced coupling^2'
      write(17,'(G16.6,4I6,a)')0d0,        3,36,23,23,
     .     ' # CP-odd Higgs(1)-Z-Z reduced coupling^2'
      write(17,'(G16.6,4I6,a)')0d0,        3,46,23,23,
     .     ' # CP-odd Higgs(2)-Z-Z reduced coupling^2'
      write(17,'(G16.6,4I6,a)')CJ(1)**2,        3,25,21,21,
     .  ' # Higgs(1)-gluon-gluon reduced coupling^2'
      write(17,'(G16.6,4I6,a)')CJ(2)**2,        3,35,21,21,
     .  ' # Higgs(2)-gluon-gluon reduced coupling^2'
      write(17,'(G16.6,4I6,a)')CJ(3)**2,        3,45,21,21,
     .  ' # Higgs(3)-gluon-gluon reduced coupling^2'
      write(17,'(G16.6,4I6,a)')CJ(4)**2,        3,36,21,21,
     .  ' # CP-odd Higgs(1)-gluon-gluon reduced coupling^2'
      write(17,'(G16.6,4I6,a)')CJ(5)**2,        3,46,21,21,
     .  ' # CP-odd Higgs(2)-gluon-gluon reduced coupling^2'
      write(17,'(G16.6,4I6,a)')CG(1)**2,        3,25,22,22,
     .  ' # Higgs(1)-gamma-gamma reduced coupling^2'
      write(17,'(G16.6,4I6,a)')CG(2)**2,        3,35,22,22,
     .  ' # Higgs(2)-gamma-gamma reduced coupling^2'
      write(17,'(G16.6,4I6,a)')CG(3)**2,        3,45,22,22,
     .  ' # Higgs(3)-gamma-gamma reduced coupling^2'
      write(17,'(G16.6,4I6,a)')CG(4)**2,        3,36,22,22,
     .  ' # CP-odd Higgs(1)-gamma-gamma reduced coupling^2'
      write(17,'(G16.6,4I6,a)')CG(5)**2,        3,46,22,22,
     .  ' # CP-odd Higgs(2)-gamma-gamma reduced coupling^2'
      write(17,'(a)')'#'
      write(17,'(a)')'Block HiggsBoundsInputHiggsCouplingsFermions'
      write(17,'(a)')'#     Scalar       Pseudoscalar'
      write(17,'(G16.6,G16.6,4I6,a)')CB(1)**2,0d0, 3,25,5,5,
     .   ' # Higgs(1)-b-b red. coupling^2'
      write(17,'(G16.6,G16.6,4I6,a)')CB(2)**2,0d0, 3,35,5,5,
     .   ' # Higgs(2)-b-b red. coupling^2'
      write(17,'(G16.6,G16.6,4I6,a)')CB(3)**2,0d0, 3,45,5,5,
     .   ' # Higgs(3)-b-b red. coupling^2'
      write(17,'(G16.6,G16.6,4I6,a)')0d0, CB(4)**2, 3,36,5,5,
     .   ' # CP-odd Higgs(1)-b-b red. coupling^2'
      write(17,'(G16.6,G16.6,4I6,a)')0d0, CB(5)**2,3,46,5,5,
     .   ' # CP-odd Higgs(2)-b-b red. coupling^2'
      write(17,'(G16.6,G16.6,4I6,a)')CU(1)**2,0d0,3,25,6,6,
     .   ' # Higgs(1)-top-top red. coupling^2'
      write(17,'(G16.6,G16.6,4I6,a)')CU(2)**2,0d0, 3,35,6,6,
     .   ' # Higgs(2)-top-top red. coupling^2'
      write(17,'(G16.6,G16.6,4I6,a)')CU(3)**2,0d0, 3,45,6,6,
     .   ' # Higgs(3)-top-top red. coupling^2'
      write(17,'(G16.6,G16.6,4I6,a)')0d0, CU(4)**2, 3,36,6,6,
     .   ' # CP-odd Higgs(1)-top-top red. coupling^2'
      write(17,'(G16.6,G16.6,4I6,a)')0d0, CU(5)**2, 3,46,6,6,
     .   ' # CP-odd Higgs(2)-top-top red. coupling^2'
      write(17,'(G16.6,G16.6,4I6,a)')CD(1)**2,0d0, 3,25,15,15,
     .   ' # Higgs(1)-tau-tau red. coupling^2'
      write(17,'(G16.6,G16.6,4I6,a)')CD(2)**2,0d0, 3,35,15,15,
     .   ' # Higgs(2)-tau-tau red. coupling^2'
      write(17,'(G16.6,G16.6,4I6,a)')CD(3)**2,0d0, 3,45,15,15,
     .   ' # Higgs(3)-tau-tau red. coupling^2'
      write(17,'(G16.6,G16.6,4I6,a)')0d0, CD(4)**2, 3,36,15,15,
     .   ' # CP-odd Higgs(1)-tau-tau red. coupling^2'
      write(17,'(G16.6,G16.6,4I6,a)')0d0, CD(5)**2, 3,46,15,15,
     .   ' # CP-odd Higgs(2)-tau-tau red. coupling^2'
      WRITE(17,899) "# "
*  From IF(OUTFLAG.NE.1)
       ENDIF

      WRITE(17,899) "# GAUGE AND YUKAWA COUPLINGS AT THE SUSY SCALE"
      WRITE(17,907) "BLOCK GAUGE Q=",DSQRT(Q2)," # (SUSY SCALE)"
      WRITE(17,901) 1,DSQRT(G1S),"g1(Q,DR_bar)"
      WRITE(17,901) 2,DSQRT(G2S),"g2(Q,DR_bar)"
      WRITE(17,901) 3,DSQRT(G3S),"g3(Q,DR_bar)"

      WRITE(17,907) "BLOCK YU Q=",DSQRT(Q2)," # (SUSY SCALE)"
      WRITE(17,903) 3,3,HTOPS,"HTOP(Q,DR_bar)"
      WRITE(17,907) "BLOCK YD Q=",DSQRT(Q2)," # (SUSY SCALE)"
      WRITE(17,903) 3,3,HBOTS,"HBOT(Q,DR_bar)"
      WRITE(17,907) "BLOCK YE Q=",DSQRT(Q2)," # (SUSY SCALE)"
      WRITE(17,903) 3,3,HTAUS,"HTAU(Q,DR_bar)"

      WRITE(17,899) "# "
      WRITE(17,899) "# SOFT TRILINEAR COUPLINGS AT THE SUSY SCALE"
      WRITE(17,899) "# (BOTH SLHA1 AND SLHA2 FORMAT)"
      WRITE(17,907) "BLOCK AU Q=",DSQRT(Q2)," # (SUSY SCALE)"
      WRITE(17,903) 3,3,PAR(12),"ATOP"
      WRITE(17,907) "BLOCK TU Q=",DSQRT(Q2)," # (SUSY SCALE)"
      WRITE(17,903) 3,3,PAR(12),"ATOP"
      WRITE(17,907) "BLOCK AD Q=",DSQRT(Q2)," # (SUSY SCALE)"
      WRITE(17,903) 3,3,PAR(13),"ABOT"
      WRITE(17,907) "BLOCK TD Q=",DSQRT(Q2)," # (SUSY SCALE)"
      WRITE(17,903) 3,3,PAR(13),"ABOT"
      WRITE(17,907) "BLOCK AE Q=",DSQRT(Q2)," # (SUSY SCALE)"
      WRITE(17,903) 2,2,PAR(25),"AMUON"
      WRITE(17,903) 3,3,PAR(14),"ATAU"
      WRITE(17,907) "BLOCK TE Q=",DSQRT(Q2)," # (SUSY SCALE)"
      WRITE(17,903) 2,2,PAR(25),"AMUON"
      WRITE(17,903) 3,3,PAR(14),"ATAU"

      WRITE(17,899) "# "
      WRITE(17,899) "# SOFT MASSES AT THE SUSY SCALE"
      WRITE(17,907) "BLOCK MSOFT Q=",DSQRT(Q2)," # (SUSY SCALE)"
      WRITE(17,901) 1,PAR(20),"M1"
      WRITE(17,901) 2,PAR(21),"M2"
      WRITE(17,901) 3,PAR(22),"M3"
      WRITE(17,901) 21,MHDS,"M_HD^2"
      WRITE(17,901) 22,MHUS,"M_HU^2"
      WRITE(17,901) 31,PAR(18)/DSQRT(DABS(PAR(18))),"M_eL"
      WRITE(17,901) 32,PAR(18)/DSQRT(DABS(PAR(18))),"M_muL"
      WRITE(17,901) 33,PAR(10)/DSQRT(DABS(PAR(10))),"M_tauL"
      WRITE(17,901) 34,PAR(19)/DSQRT(DABS(PAR(19))),"M_eR"
      WRITE(17,901) 35,PAR(19)/DSQRT(DABS(PAR(19))),"M_muR"
      WRITE(17,901) 36,PAR(11)/DSQRT(DABS(PAR(11))),"M_tauR"
      WRITE(17,901) 41,PAR(15)/DSQRT(DABS(PAR(15))),"M_q1L"
      WRITE(17,901) 42,PAR(15)/DSQRT(DABS(PAR(15))),"M_q2L"
      WRITE(17,901) 43,PAR(7)/DSQRT(DABS(PAR(7))),"M_q3L"
      WRITE(17,901) 44,PAR(16)/DSQRT(DABS(PAR(16))),"M_uR"
      WRITE(17,901) 45,PAR(16)/DSQRT(DABS(PAR(16))),"M_cR"
      WRITE(17,901) 46,PAR(8)/DSQRT(DABS(PAR(8))),"M_tR"
      WRITE(17,901) 47,PAR(17)/DSQRT(DABS(PAR(17))),"M_dR"
      WRITE(17,901) 48,PAR(17)/DSQRT(DABS(PAR(17))),"M_sR"
      WRITE(17,901) 49,PAR(9)/DSQRT(DABS(PAR(9))),"M_bR"

      WRITE(17,899) "# "
      WRITE(17,899) "# NMSSM SPECIFIC PARAMETERS AT THE SUSY SCALE"
      WRITE(17,907) "BLOCK NMSSMRUN Q=",DSQRT(Q2)," # (SUSY SCALE)"
      WRITE(17,901) 1,PAR(1),"LAMBDA(Q,DR_bar)"
      WRITE(17,901) 2,PAR(2),"KAPPA(Q,DR_bar)"
      WRITE(17,901) 3,PAR(5),"ALAMBDA"
      WRITE(17,901) 4,PAR(6),"AKAPPA"
      WRITE(17,901) 5,PAR(4),"MUEFF"
      WRITE(17,901) 6,XIFSUSY,"XIF"
      WRITE(17,901) 7,XISSUSY,"XIS"
      WRITE(17,901) 8,MUPSUSY,"MU'"
      WRITE(17,901) 9,MSPSUSY,"MS'^2"
      WRITE(17,901) 10,MSS,"MS^2"
      WRITE(17,920) 12,M3HSUSY,"M3H^2"
      WRITE(17,899) "# "
      WRITE(17,899) "BLOCK MSQ2  # Soft l.h. squark masses squared"
      WRITE(17,903) 1,1,PAR(15),"M_q1L^2"
      WRITE(17,903) 2,2,PAR(15),"M_q2L^2"
      WRITE(17,903) 3,3,PAR(7),"M_q3L^2"
      WRITE(17,899) "# "
      WRITE(17,899) "BLOCK MSU2  # Soft r.h. up-squark masses squared"
      WRITE(17,903) 1,1,PAR(16),"M_uR^2"
      WRITE(17,903) 2,2,PAR(16),"M_cR^2"
      WRITE(17,903) 3,3,PAR(8),"M_tR^2"
      WRITE(17,899) "# "
      WRITE(17,899) "BLOCK MSD2  # Soft r.h. down-squark masses squared"
      WRITE(17,903) 1,1,PAR(17),"M_dR^2"
      WRITE(17,903) 2,2,PAR(17),"M_sR^2"
      WRITE(17,903) 3,3,PAR(9),"M_bR^2"
      WRITE(17,899) "# "
      WRITE(17,899) "BLOCK MSL2  # Soft l.h. slepton masses squared"
      WRITE(17,903) 1,1,PAR(18),"M_eL^2"
      WRITE(17,903) 2,2,PAR(18),"M_muL^2"
      WRITE(17,903) 3,3,PAR(10),"M_tauL^2"
      WRITE(17,899) "# "
      WRITE(17,899) "BLOCK MSE2  # Soft r.h. slepton masses squared"
      WRITE(17,903) 1,1,PAR(19),"M_eR^2"
      WRITE(17,903) 2,2,PAR(19),"M_muR^2"
      WRITE(17,903) 3,3,PAR(11),"M_tauR^2"
      WRITE(17,899) "# "
      WRITE(17,899) "BLOCK USQMIX  # Elements of 6x6 up-squark matrix"
      WRITE(17,903) 1,1,1.d0,"R_u_11"
      WRITE(17,903) 2,2,1.d0,"R_u_22"
      WRITE(17,903) 3,3,CST,"R_u_33"
      WRITE(17,903) 3,6,SST,"R_u_36"
      WRITE(17,903) 4,4,1.d0,"R_u_44"
      WRITE(17,903) 5,5,1.d0,"R_u_55"
      WRITE(17,903) 6,6,CST,"R_u_66"
      WRITE(17,903) 6,3,-SST,"R_u_63"
      WRITE(17,899) "# "
      WRITE(17,899) "BLOCK DSQMIX  # Elements of 6x6 down-squark matrix"
      WRITE(17,903) 1,1,1.d0,"R_d_11"
      WRITE(17,903) 2,2,1.d0,"R_d_22"
      WRITE(17,903) 3,3,CSB,"R_d_33"
      WRITE(17,903) 3,6,SSB,"R_u_36"
      WRITE(17,903) 4,4,1.d0,"R_d_44"
      WRITE(17,903) 5,5,1.d0,"R_d_55"
      WRITE(17,903) 6,6,CSB,"R_d_66"
      WRITE(17,903) 6,3,-SSB,"R_u36"
      WRITE(17,899) "# "
      WRITE(17,899) "BLOCK SELMIX  # Elements of 6x6 ch. slepton matrix"
      WRITE(17,903) 1,1,1.d0,"R_e_11"
      WRITE(17,903) 2,2,1.d0,"R_e_22"
      WRITE(17,903) 3,3,CSL,"R_e_33"
      WRITE(17,903) 3,6,SSL,"R_e_36"
      WRITE(17,903) 4,4,1.d0,"R_e_44"
      WRITE(17,903) 5,5,1.d0,"R_e_55"
      WRITE(17,903) 6,6,CSL,"R_e_66"
      WRITE(17,903) 6,3,-SSL,"R_e_63"
      WRITE(17,899) "# "

       IF(OUTFLAG.NE.1) THEN
      WRITE(17,899) "# GAUGE AND YUKAWA COUPLINGS AT THE MES SCALE"
      WRITE(17,907) "BLOCK MESGAUGE Q=",MMESS," # (MES SCALE)"
      WRITE(17,901) 1,DSQRT(G1MES),"g1(MMES,DR_bar)"
      WRITE(17,901) 2,DSQRT(G2MES),"g2(MMES,DR_bar)"
      WRITE(17,901) 3,DSQRT(G3MES),"g3(MMES,DR_bar)"

      WRITE(17,907) "BLOCK MESYU Q=",MMESS," # (MES SCALE)"
      WRITE(17,903) 3,3,HTMES/DSQRT(DABS(HTMES)),
     .            "HTOP(MMES,DR_bar)"
      WRITE(17,907) "BLOCK MESYD Q=",MMESS," # (MES SCALE)"
      WRITE(17,903) 3,3,HBMES/DSQRT(DABS(HBMES)),
     .            "HBOT(MMES,DR_bar)"
      WRITE(17,907) "BLOCK MESYE Q=",MMESS," # (MES SCALE)"
      WRITE(17,903) 3,3,HLMES/DSQRT(DABS(HLMES)),
     .        "HTAU(MMES,DR_bar)"

      WRITE(17,899) "# "
      WRITE(17,899) "# SOFT TRILINEAR COUPLINGS AT THE MES SCALE"
      WRITE(17,907) "BLOCK MESAU Q=",MMESS," # (MES SCALE)"
      WRITE(17,903) 3,3,ATMES,"ATOP"
      WRITE(17,907) "BLOCK MESAD Q=",MMESS," # (MES SCALE)"
      WRITE(17,903) 3,3,ABMES,"ABOT"
      WRITE(17,907) "BLOCKMES AE Q=",MMESS," # (MES SCALE)"
      WRITE(17,903) 2,2,AMUMES,"AMUON"
      WRITE(17,903) 3,3,ATAUMES,"ATAU"

      WRITE(17,899) "# "
      WRITE(17,899) "# SOFT MASSES SQUARED AT THE MES SCALE"
      WRITE(17,907) "BLOCK MESMSOFT Q=",MMESS," # (MES SCALE)"
      WRITE(17,901) 1,M1MES,"M1"
      WRITE(17,901) 2,M2MES,"M2"
      WRITE(17,901) 3,M3MES,"M3"
      WRITE(17,901) 21,MHDMES,"M_HD^2"
      WRITE(17,901) 22,MHUMES,"M_HU^2"
      WRITE(17,901) 31,MLMES/DSQRT(DABS(MLMES)),"M_eL"
      WRITE(17,901) 32,MLMES/DSQRT(DABS(MLMES)),"M_muL"
      WRITE(17,901) 33,ML3MES/DSQRT(DABS(ML3MES)),"M_tauL"
      WRITE(17,901) 34,MEMES/DSQRT(DABS(MEMES)),"M_eR"
      WRITE(17,901) 35,MEMES/DSQRT(DABS(MEMES)),"M_muR"
      WRITE(17,901) 36,ME3MES/DSQRT(DABS(ME3MES)),"M_tauR"
      WRITE(17,901) 41,MQMES/DSQRT(DABS(MQMES)),"M_q1L"
      WRITE(17,901) 42,MQMES/DSQRT(DABS(MQMES)),"M_q2L"
      WRITE(17,901) 43,MQ3MES/DSQRT(DABS(MQ3MES)),"M_q3L"
      WRITE(17,901) 44,MUMES/DSQRT(DABS(MUMES)),"M_uR"
      WRITE(17,901) 45,MUMES/DSQRT(DABS(MUMES)),"M_cR"
      WRITE(17,901) 46,MU3MES/DSQRT(DABS(MU3MES)),"M_tR"
      WRITE(17,901) 47,MDMES/DSQRT(DABS(MDMES)),"M_dR"
      WRITE(17,901) 48,MDMES/DSQRT(DABS(MDMES)),"M_sR"
      WRITE(17,901) 49,MD3MES/DSQRT(DABS(MD3MES)),"M_bR"

      WRITE(17,899) "# "
      WRITE(17,899) "# NMSSM SPECIFIC PARAMETERS AT THE MES SCALE"
      WRITE(17,907) "BLOCK MESNMSSMRUN Q=",MMESS," # (MES SCALE)"
      WRITE(17,901) 1,LMES/DSQRT(DABS(LMES)),"LAMBDA(MMES,DR_bar)"
      WRITE(17,901) 2,KMES,"KAPPA(MMES,DR_bar)"
      WRITE(17,901) 3,ALMES,"ALAMBDA"
      WRITE(17,901) 4,AKMES,"AKAPPA"
      WRITE(17,901) 6,XIFMES,"XIF"
      WRITE(17,901) 7,XISMES,"XIS"
      WRITE(17,901) 8,MUPMES,"MU'"
      WRITE(17,901) 9,MSPMES,"MS'^2"
      WRITE(17,901) 10,MSMES,"MS^2"
      WRITE(17,901) 11,M3HMES,"M3H^2"
      WRITE(17,901) 12,LPPMES,"LPP"
      WRITE(17,901) 13,LTTMES,"LTT"
      WRITE(17,901) 14,LUMES,"LU"
      WRITE(17,901) 15,LDMES,"LD"
      WRITE(17,901) 16,LTMES,"LT"
      WRITE(17,901) 17,LBMES,"LB"
      WRITE(17,901) 18,LLMES,"LL"
      WRITE(17,899) "# "

      IF(PROB(27).EQ.0.)THEN
       WRITE(17,899)
     .     "# GAUGE AND YUKAWA COUPLINGS AT THE GUT SCALE"
       WRITE(17,907) "BLOCK GUTGAUGE Q=",MGUT," # (GUT SCALE)"
       WRITE(17,901) 1,DSQRT(5d0/3d0*G1GUT),
     .        "g1(MGUT), GUT normalization"
       WRITE(17,901) 2,DSQRT(G2GUT),"g2(MGUT)"
       WRITE(17,901) 3,DSQRT(G3GUT),"g3(MGUT)"

       WRITE(17,907) "BLOCK GUTYU Q=",MGUT," # (GUT SCALE)"
       WRITE(17,903) 3,3,HTGUT,"HTOP(MGUT)"
       WRITE(17,907) "BLOCK GUTYD Q=",MGUT," # (GUT SCALE)"
       WRITE(17,903) 3,3,HBGUT,"HBOT(MGUT)"
       WRITE(17,907) "BLOCK GUTYE Q=",MGUT," # (GUT SCALE)"
       WRITE(17,903) 3,3,HLGUT,"HTAU(MGUT)"

       WRITE(17,899) "# "
       WRITE(17,899) "# NMSSM SPECIFIC COUPLINGS AT THE GUT SCALE"
       WRITE(17,907) "BLOCK GUTNMSSMRUN Q=",MGUT," # (GUT SCALE)"
       WRITE(17,901) 1,LGUT,"LAMBDA(MGUT)"
       WRITE(17,901) 2,KGUT,"KAPPA(MGUT)"
       WRITE(17,901) 13,LPPGUT,"LPP(MGUT)"
       WRITE(17,901) 14,LTTGUT,"LTT(MGUT)"
       WRITE(17,901) 15,LUGUT,"LU(MGUT)"
       WRITE(17,901) 16,LDGUT,"LD(MGUT)"
       WRITE(17,901) 17,LTGUT,"LT(MGUT)"
       WRITE(17,901) 18,LBGUT,"LB(MGUT)"
       WRITE(17,901) 19,LLGUT,"LL(MGUT)"

      ELSE

       WRITE(17,899)
     .     "# GAUGE AND YUKAWA COUPLINGS AT THE LANDAU SINGULARITY"
       WRITE(17,907) "BLOCK LANGAUGE MLANDAU=",MGUT," # (LANDAU SCALE)"
       WRITE(17,901) 1,DSQRT(5d0/3d0*G1GUT),
     .        "g1(MLANDAU), (GUT normalization)"
       WRITE(17,901) 2,DSQRT(G2GUT),"g2(MLANDAU)"
       WRITE(17,901) 3,DSQRT(G3GUT),"g3(MLANDAU)"

       WRITE(17,907) "BLOCK LANYU MLANDAU=",MGUT," # (MLANDAU)"
       WRITE(17,903) 3,3,HTGUT,"HTOP(MLANDAU)"
       WRITE(17,907) "BLOCK LANYD MLANDAU=",MGUT," # (MLANDAU)"
       WRITE(17,903) 3,3,HBGUT,"HBOT(MLANDAU)"
       WRITE(17,907) "BLOCK LANYE MLANDAU=",MGUT," # (MLANDAU)"
       WRITE(17,903) 3,3,HLGUT,"HTAU(MLANDAU)"

       WRITE(17,899) "# "
       WRITE(17,899) "# NMSSM SPECIFIC PARAMETERS AT THE LANDAU SCALE"
       WRITE(17,907) "BLOCK LANNMSSMRUN MLANDAU=",MGUT," # (MLANDAU)"
       WRITE(17,901) 61,LGUT,"LAMBDA(MLANDAU)"
       WRITE(17,901) 62,KGUT,"KAPPA(MLANDAU)"
       WRITE(17,901) 13,LPPGUT,"LPP(MLANDAU)"
       WRITE(17,901) 14,LTTGUT,"LTT(MLANDAU)"
       WRITE(17,901) 15,LUGUT,"LU(MLANDAU)"
       WRITE(17,901) 16,LDGUT,"LD(MLANDAU)"
       WRITE(17,901) 17,LTGUT,"LT(MLANDAU)"
       WRITE(17,901) 18,LBGUT,"LB(MLANDAU)"
       WRITE(17,901) 19,LLGUT,"LL(MLANDAU)"
      ENDIF

      WRITE(17,899) "# "
      WRITE(17,899) "# FINE-TUNING parameter d(ln Mz^2)/d(ln PG^2)"
      WRITE(17,899) "# BLOCK FINETUNING"
      WRITE(17,901) 1,FTMES(1),"PM=MSUSYEFF"
      WRITE(17,901) 2,FTMES(2),"PM=MS"
      WRITE(17,901) 3,FTMES(3),"PM=ALAMBDA"
      WRITE(17,901) 4,FTMES(4),"PM=XIF"
      WRITE(17,901) 5,FTMES(5),"PM=XIS"
      WRITE(17,901) 6,FTMES(6),"PM=MUP"
      WRITE(17,901) 7,FTMES(7),"PM=MSP"
      WRITE(17,901) 8,FTMES(8),"PM=LAMBDA"
      WRITE(17,901) 9,FTMES(9),"PM=KAPPA"
      WRITE(17,901) 10,FTMES(10),"PM=HTOP"
      WRITE(17,901) 11,FTMES(11),"PM=G1"
      WRITE(17,901) 12,FTMES(12),"PM=G2"
      WRITE(17,901) 13,FTMES(13),"PM=MMES"
      WRITE(17,901) 14,FTMES(14),"PM=LPP"
      WRITE(17,901) 15,FTMES(15),"PM=LTT"
      WRITE(17,901) 16,FTMES(16),"PM=LU"
      WRITE(17,901) 17,FTMES(17),"PM=LD"
      WRITE(17,901) 18,FTMES(18),"PM=LT"
      WRITE(17,901) 19,FTMES(19),"PM=LB"
      WRITE(17,901) 20,FTMES(20),"PM=LL"
      WRITE(17,901) 21,FTMES(21),"MAX"
      WRITE(17,914) 22,INT(FTMES(22)),"IMAX"

      WRITE(17,899) "# "
      WRITE(17,899) "# REDUCED CROSS SECTIONS AT LHC"
      WRITE(17,899) "BLOCK LHCCROSSSECTIONS"
      WRITE(17,901) 11,SIG(1,1),"VBF/VH -> H1 -> tautau"
      WRITE(17,901) 12,SIG(1,2),"ggF -> H1 -> tautau"
      WRITE(17,901) 13,SIG(1,3),"VBF/VH -> H1 -> bb"
      WRITE(17,901) 14,SIG(1,4),"ttH -> H1 -> bb"
      WRITE(17,901) 15,SIG(1,5),"VBF/VH -> H1 -> ZZ/WW"
      WRITE(17,901) 16,SIG(1,6),"ggF -> H1 -> ZZ/WW"
      WRITE(17,901) 17,SIG(1,7),"VBF/VH -> H1 -> gammagamma"
      WRITE(17,901) 18,SIG(1,8),"ggF -> H1 -> gammagamma"
      WRITE(17,901) 19,SIG(1,9),"ggF -> H1 -> invisible"
      WRITE(17,901) 110,SIG(1,10),"VBF/VH -> H1 -> invisible"
      WRITE(17,901) 21,SIG(2,1),"VBF/VH -> H2 -> tautau"
      WRITE(17,901) 22,SIG(2,2),"ggF -> H2 -> tautau"
      WRITE(17,901) 23,SIG(2,3),"VBF/VH -> H2 -> bb"
      WRITE(17,901) 24,SIG(2,4),"ttH -> H2 -> bb"
      WRITE(17,901) 25,SIG(2,5),"VBF/VH -> H2 -> ZZ/WW"
      WRITE(17,901) 26,SIG(2,6),"ggF -> H2 -> ZZ/WW"
      WRITE(17,901) 27,SIG(2,7),"VBF/VH -> H2 -> gammagamma"
      WRITE(17,901) 28,SIG(2,8),"ggF -> H2 -> gammagamma"
      WRITE(17,901) 29,SIG(2,9),"ggF -> H2 -> invisible"
      WRITE(17,901) 210,SIG(2,10),"VBF/VH -> H2 -> invisible"
      WRITE(17,901) 31,SIG(3,1),"VBF/VH -> H3 -> tautau"
      WRITE(17,901) 32,SIG(3,2),"ggF -> H3 -> tautau"
      WRITE(17,901) 33,SIG(3,3),"VBF/VH -> H3 -> bb"
      WRITE(17,901) 34,SIG(3,4),"ttH -> H3 -> bb"
      WRITE(17,901) 35,SIG(3,5),"VBF/VH -> H3 -> ZZ/WW"
      WRITE(17,901) 36,SIG(3,6),"ggF -> H3 -> ZZ/WW"
      WRITE(17,901) 37,SIG(3,7),"VBF/VH -> H3 -> gammagamma"
      WRITE(17,901) 38,SIG(3,8),"ggF -> H3 -> gammagamma"
      WRITE(17,901) 39,SIG(3,9),"VBF/VH -> H3 -> invisible"
      WRITE(17,901) 310,SIG(3,10),"ggF -> H3 -> invisible"

      WRITE(17,899) "# "
      WRITE(17,899) "# CHI^2 FOR HIGGS COUPLINGS"
      WRITE(17,899) "BLOCK LHCFIT"
      WRITE(17,901) 1,chi2gam,"Hgammagamma"
      WRITE(17,901) 2,chi2bb,"Hff"
      WRITE(17,901) 3,chi2zz,"HVV"

      WRITE(17,899) "# "
      WRITE(17,899)
     . "# PARAMETERS OF THE EFFECTIVE LAGRANGIAN IN THE HIGGS SECTOR"
      WRITE(17,899) "BLOCK  EFFECTIVE_COUPLINGS"
      WRITE(17,917)," X",PX
      DO I=1,6
      WRITE(17,916)," A",I,PA(I)
      ENDDO
      DO I=1,2
       WRITE(17,916)," B",I,PB(I)
      ENDDO
      DO I=1,7
       WRITE(17,916)," L",I,PL(I)
      ENDDO
      DO I=1,8
       WRITE(17,916)," K",I,PK(I)
      ENDDO
      WRITE(17,917)," DELMB",DELMB
      WRITE(17,917)," XVEV", MUQ/LQ*DSQRT(ZS)
      WRITE(17,899) "# "
*  From IF(OUTFLAG.NE.1)
       ENDIF

      WRITE(17,899) "# "
      WRITE(18,899) "# HIGGS + TOP BRANCHING RATIOS IN SLHA FORMAT"
      WRITE(18,899) "# Info about decay package"
      WRITE(18,899) "BLOCK DCINFO   # Program information"
      WRITE(18,900) 1,"NMSSMTools # Decay package"
      WRITE(18,900) 2,"4.7.1      # Version number"

      WRITE(18,899) "#           PDG          Width"
      WRITE(18,904) 25,WIDTH(1),"Lightest neutral Higgs scalar"
      IF(BRJJ(1).GT.0d0)
     .  WRITE(18,905) BRJJ(1),2,21,21,"BR(H_1 -> gluon gluon)"
      IF(BREE(1).GT.0d0)
     .  WRITE(18,905) BREE(1),2,11,-11,"BR(H_1 -> e- e+)"
      IF(BRMM(1).GT.0d0)
     .  WRITE(18,905) BRMM(1),2,13,-13,"BR(H_1 -> muon muon)"
      IF(BRLL(1).GT.0d0)
     .  WRITE(18,905) BRLL(1),2,15,-15,"BR(H_1 -> tau tau)"
      IF(BRSS(1).GT.0d0)
     .  WRITE(18,905) BRSS(1),2,3,-3,"BR(H_1 -> s sbar)"
      IF(BRCC(1).GT.0d0)
     .  WRITE(18,905) BRCC(1),2,4,-4,"BR(H_1 -> c cbar)"
      IF(BRBB(1).GT.0d0)
     .  WRITE(18,905) BRBB(1),2,5,-5,"BR(H_1 -> b bbar)"
      IF(BRTT(1).GT.0d0)
     .  WRITE(18,905) BRTT(1),2,6,-6,"BR(H_1 -> t tbar)"
      IF(BRWW(1).GT.0d0)
     .  WRITE(18,905) BRWW(1),2,24,-24,"BR(H_1 -> W+ W-)"
      IF(BRZZ(1).GT.0d0)
     .  WRITE(18,905) BRZZ(1),2,23,23,"BR(H_1 -> Z Z)"
      IF(BRGG(1).GT.0d0)
     .  WRITE(18,905) BRGG(1),2,22,22,"BR(H_1 -> gamma gamma)"
      IF(BRZG(1).GT.0d0)
     .  WRITE(18,905) BRZG(1),2,23,22,"BR(H_1 -> Z gamma)"
      IF(BRHAA(1,1).GT.0d0)
     .  WRITE(18,905) BRHAA(1,1),2,36,36,"BR(H_1 -> A_1 A_1)"
      IF(BRHAA(1,2).GT.0d0)
     .  WRITE(18,905) BRHAA(1,2),2,36,46,"BR(H_1 -> A_1 A_2)"
      IF(BRHAA(1,3).GT.0d0)
     .  WRITE(18,905) BRHAA(1,3),2,46,46,"BR(H_1 -> A_2 A_2)"
      IF(BRHAZ(1,1).GT.0d0)
     .  WRITE(18,905) BRHAZ(1,1),2,23,36,"BR(H_1 -> A_1 Z)"
      IF(BRNEU(1,1,1).GT.0d0)
     .  WRITE(18,905) BRNEU(1,1,1),2,1000022,1000022,
     .    "BR(H_1 -> neu_1 neu_1)"
      IF(BRNEU(1,1,2).GT.0d0)
     .  WRITE(18,905) BRNEU(1,1,2),2,1000022,1000023,
     .    "BR(H_1 -> neu_1 neu_2)"
      IF(BRNEU(1,1,3).GT.0d0)
     .  WRITE(18,905) BRNEU(1,1,3),2,1000022,1000025,
     .    "BR(H_1 -> neu_1 neu_3)"
      IF(BRNEU(1,1,4).GT.0d0)
     .  WRITE(18,905) BRNEU(1,1,4),2,1000022,1000035,
     .    "BR(H_1 -> neu_1 neu_4)"
      IF(BRNEU(1,1,5).GT.0d0)
     .  WRITE(18,905) BRNEU(1,1,5),2,1000022,1000045,
     .    "BR(H_1 -> neu_1 neu_5)"
      IF(BRNEU(1,2,2).GT.0d0)
     .  WRITE(18,905) BRNEU(1,2,2),2,1000023,1000023,
     .    "BR(H_1 -> neu_2 neu_2)"
      IF(BRNEU(1,2,3).GT.0d0)
     .  WRITE(18,905) BRNEU(1,2,3),2,1000023,1000025,
     .    "BR(H_1 -> neu_2 neu_3)"
      IF(BRNEU(1,2,4).GT.0d0)
     .  WRITE(18,905) BRNEU(1,2,4),2,1000023,1000035,
     .    "BR(H_1 -> neu_2 neu_4)"
      IF(BRNEU(1,2,5).GT.0d0)
     .  WRITE(18,905) BRNEU(1,2,5),2,1000023,1000045,
     .    "BR(H_1 -> neu_2 neu_5)"
      IF(BRNEU(1,3,3).GT.0d0)
     .  WRITE(18,905) BRNEU(1,3,3),2,1000025,1000025,
     .    "BR(H_1 -> neu_3 neu_3)"
      IF(BRNEU(1,3,4).GT.0d0)
     .  WRITE(18,905) BRNEU(1,3,4),2,1000025,1000035,
     .    "BR(H_1 -> neu_3 neu_4)"
      IF(BRNEU(1,3,5).GT.0d0)
     .  WRITE(18,905) BRNEU(1,3,5),2,1000025,1000045,
     .    "BR(H_1 -> neu_3 neu_5)"
      IF(BRNEU(1,4,4).GT.0d0)
     .  WRITE(18,905) BRNEU(1,4,4),2,1000035,1000035,
     .    "BR(H_1 -> neu_4 neu_4)"
      IF(BRNEU(1,4,5).GT.0d0)
     .  WRITE(18,905) BRNEU(1,4,5),2,1000035,1000045,
     .    "BR(H_1 -> neu_4 neu_5)"
      IF(BRNEU(1,5,5).GT.0d0)
     .  WRITE(18,905) BRNEU(1,5,5),2,1000045,1000045,
     .    "BR(H_1 -> neu_5 neu_5)"
      IF(BRCHA(1,1).GT.0d0)
     .  WRITE(18,905) BRCHA(1,1),2,1000024,-1000024,
     .    "BR(H_1 -> cha_1 cha_1bar)"
      IF(BRCHA(1,2).GT.0d0)
     .  WRITE(18,905) BRCHA(1,2),2,1000024,-1000037,
     .    "BR(H_1 -> cha_1 cha_2bar)"
      IF(BRCHA(1,2).GT.0d0)
     .  WRITE(18,905) BRCHA(1,2),2,1000037,-1000024,
     .    "BR(H_1 -> cha_2 cha_1bar)"
      IF(BRCHA(1,3).GT.0d0)
     .  WRITE(18,905) BRCHA(1,3),2,1000037,-1000037,
     .    "BR(H_1 -> cha_2 cha_2bar)"
      IF(BRHSQ(1,1).GT.0d0)
     .  WRITE(18,905) BRHSQ(1,1),2,1000002,-1000002,
     .    "BR(H_1 -> ~u_L ~ubar_L)"
      IF(BRHSQ(1,1).GT.0d0)
     .  WRITE(18,905) BRHSQ(1,1),2,1000004,-1000004,
     .    "BR(H_1 -> ~c_L ~cbar_L)"
      IF(BRHSQ(1,2).GT.0d0)
     .  WRITE(18,905) BRHSQ(1,2),2,2000002,-2000002,
     .    "BR(H_1 -> ~u_R ~ubar_R)"
      IF(BRHSQ(1,2).GT.0d0)
     .  WRITE(18,905) BRHSQ(1,2),2,2000004,-2000004,
     .    "BR(H_1 -> ~c_R ~cbar_R)"
      IF(BRHSQ(1,3).GT.0d0)
     .  WRITE(18,905) BRHSQ(1,3),2,1000001,-1000001,
     .    "BR(H_1 -> ~d_L ~dbar_L)"
      IF(BRHSQ(1,3).GT.0d0)
     .  WRITE(18,905) BRHSQ(1,3),2,1000003,-1000003,
     .    "BR(H_1 -> ~s_L ~sbar_L)"
      IF(BRHSQ(1,4).GT.0d0)
     .  WRITE(18,905) BRHSQ(1,4),2,2000001,-2000001,
     .    "BR(H_1 -> ~d_R ~dbar_R)"
      IF(BRHSQ(1,4).GT.0d0)
     .  WRITE(18,905) BRHSQ(1,4),2,2000003,-2000003,
     .    "BR(H_1 -> ~s_R ~sbar_R)"
      IF(BRHSQ(1,5).GT.0d0)
     .  WRITE(18,905) BRHSQ(1,5),2,1000006,-1000006,
     .    "BR(H_1 -> ~t_1 ~tbar_1)"
      IF(BRHSQ(1,6).GT.0d0)
     .  WRITE(18,905) BRHSQ(1,6),2,2000006,-2000006,
     .    "BR(H_1 -> ~t_2 ~tbar_2)"
      IF(BRHSQ(1,7).GT.0d0)
     .  WRITE(18,905) BRHSQ(1,7),2,1000006,-2000006,
     .    "BR(H_1 -> ~t_1 ~tbar_2)"
      IF(BRHSQ(1,7).GT.0d0)
     .  WRITE(18,905) BRHSQ(1,7),2,2000006,-1000006,
     .    "BR(H_1 -> ~t_2 ~tbar_1)"
      IF(BRHSQ(1,8).GT.0d0)
     .  WRITE(18,905) BRHSQ(1,8),2,1000005,-1000005,
     .    "BR(H_1 -> ~b_1 ~bbar_1)"
      IF(BRHSQ(1,9).GT.0d0)
     .  WRITE(18,905) BRHSQ(1,9),2,2000005,-2000005,
     .    "BR(H_1 -> ~b_2 ~bbar_2)"
      IF(BRHSQ(1,10).GT.0d0)
     .  WRITE(18,905) BRHSQ(1,10),2,1000005,-2000005,
     .    "BR(H_1 -> ~b_1 ~bbar_2)"
      IF(BRHSQ(1,10).GT.0d0)
     .  WRITE(18,905) BRHSQ(1,10),2,2000005,-1000005,
     .    "BR(H_1 -> ~b_2 ~bbar_1)"
      IF(BRHSL(1,1).GT.0d0)
     .  WRITE(18,905) BRHSL(1,1),2,1000011,-1000011,
     .    "BR(H_1 -> ~e_L ~ebar_L)"
      IF(BRHSL(1,1).GT.0d0)
     .  WRITE(18,905) BRHSL(1,1),2,1000013,-1000013,
     .    "BR(H_1 -> ~mu_L ~mubar_L)"
      IF(BRHSL(1,2).GT.0d0)
     .  WRITE(18,905) BRHSL(1,2),2,2000011,-2000011,
     .    "BR(H_1 -> ~e_R ~ebar_R)"
      IF(BRHSL(1,2).GT.0d0)
     .  WRITE(18,905) BRHSL(1,2),2,2000013,-2000013,
     .    "BR(H_1 -> ~mu_R ~mubarRL)"
      IF(BRHSL(1,3).GT.0d0)
     .  WRITE(18,905) BRHSL(1,3),2,1000012,-1000012,
     .    "BR(H_1 -> ~nu_e_L ~nu_ebar_L)"
      IF(BRHSL(1,3).GT.0d0)
     .  WRITE(18,905) BRHSL(1,3),2,1000014,-1000014,
     .    "BR(H_1 -> ~nu_mu_L ~nu_mubar_L)"
      IF(BRHSL(1,4).GT.0d0)
     .  WRITE(18,905) BRHSL(1,4),2,1000015,-1000015,
     .    "BR(H_1 -> ~tau_1 ~taubar_1)"
      IF(BRHSL(1,5).GT.0d0)
     .  WRITE(18,905) BRHSL(1,5),2,2000015,-2000015,
     .    "BR(H_1 -> ~tau_2 ~taubar_2)"
      IF(BRHSL(1,6).GT.0d0)
     .  WRITE(18,905) BRHSL(1,6),2,1000015,-2000015,
     .    "BR(H_1 -> ~tau_1 ~taubar_2)"
      IF(BRHSL(1,6).GT.0d0)
     .  WRITE(18,905) BRHSL(1,6),2,2000015,-1000015,
     .    "BR(H_1 -> ~tau_2 ~taubar_1)"
      IF(BRHSL(1,7).GT.0d0)
     .  WRITE(18,905) BRHSL(1,7),2,1000016,-1000016,
     .    "BR(H_1 -> ~nu_tau_L ~nu_taubar_L)"

      WRITE(18,904) 35,WIDTH(2),"2nd neutral Higgs scalar"
      IF(BRJJ(2).GT.0d0)
     .  WRITE(18,905) BRJJ(2),2,21,21,"BR(H_2 -> gluon gluon)"
      IF(BREE(2).GT.0d0)
     .  WRITE(18,905) BREE(2),2,11,-11,"BR(H_2 -> e- e+)"
      IF(BRMM(2).GT.0d0)
     .  WRITE(18,905) BRMM(2),2,13,-13,"BR(H_2 -> muon muon)"
      IF(BRLL(2).GT.0d0)
     .  WRITE(18,905) BRLL(2),2,15,-15,"BR(H_2 -> tau tau)"
      IF(BRSS(2).GT.0d0)
     .  WRITE(18,905) BRSS(2),2,3,-3,"BR(H_2 -> s sbar)"
      IF(BRCC(2).GT.0d0)
     .  WRITE(18,905) BRCC(2),2,4,-4,"BR(H_2 -> c cbar)"
      IF(BRBB(2).GT.0d0)
     .  WRITE(18,905) BRBB(2),2,5,-5,"BR(H_2 -> b bbar)"
      IF(BRTT(2).GT.0d0)
     .  WRITE(18,905) BRTT(2),2,6,-6,"BR(H_2 -> t tbar)"
      IF(BRWW(2).GT.0d0)
     .  WRITE(18,905) BRWW(2),2,24,-24,"BR(H_2 -> W+ W-)"
      IF(BRZZ(2).GT.0d0)
     .  WRITE(18,905) BRZZ(2),2,23,23,"BR(H_2 -> Z Z)"
      IF(BRGG(2).GT.0d0)
     .  WRITE(18,905) BRGG(2),2,22,22,"BR(H_2 -> gamma gamma)"
      IF(BRZG(2).GT.0d0)
     .  WRITE(18,905) BRZG(2),2,23,22,"BR(H_2 -> Z gamma)"
      IF(BRHHH(1).GT.0d0)
     .  WRITE(18,905) BRHHH(1),2,25,25,"BR(H_2 -> H_1 H_1)"
      IF(BRHAA(2,1).GT.0d0)
     .  WRITE(18,905) BRHAA(2,1),2,36,36,"BR(H_2 -> A_1 A_1)"
      IF(BRHAA(2,2).GT.0d0)
     .  WRITE(18,905) BRHAA(2,2),2,36,46,"BR(H_2 -> A_1 A_2)"
      IF(BRHAA(2,3).GT.0d0)
     .  WRITE(18,905) BRHAA(2,3),2,46,46,"BR(H_2 -> A_2 A_2)"
      IF(BRHAZ(2,1).GT.0d0)
     .  WRITE(18,905) BRHAZ(2,1),2,23,36,"BR(H_2 -> A_1 Z)"
      IF(BRNEU(2,1,1).GT.0d0)
     .  WRITE(18,905) BRNEU(2,1,1),2,1000022,1000022,
     .    "BR(H_2 -> neu_1 neu_1)"
      IF(BRNEU(2,1,2).GT.0d0)
     .  WRITE(18,905) BRNEU(2,1,2),2,1000022,1000023,
     .    "BR(H_2 -> neu_1 neu_2)"
      IF(BRNEU(2,1,3).GT.0d0)
     .  WRITE(18,905) BRNEU(2,1,3),2,1000022,1000025,
     .    "BR(H_2 -> neu_1 neu_3)"
      IF(BRNEU(2,1,4).GT.0d0)
     .  WRITE(18,905) BRNEU(2,1,4),2,1000022,1000035,
     .    "BR(H_2 -> neu_1 neu_4)"
      IF(BRNEU(2,1,5).GT.0d0)
     .  WRITE(18,905) BRNEU(2,1,5),2,1000022,1000045,
     .    "BR(H_2 -> neu_1 neu_5)"
      IF(BRNEU(2,2,2).GT.0d0)
     .  WRITE(18,905) BRNEU(2,2,2),2,1000023,1000023,
     .    "BR(H_2 -> neu_2 neu_2)"
      IF(BRNEU(2,2,3).GT.0d0)
     .  WRITE(18,905) BRNEU(2,2,3),2,1000023,1000025,
     .    "BR(H_2 -> neu_2 neu_3)"
      IF(BRNEU(2,2,4).GT.0d0)
     .  WRITE(18,905) BRNEU(2,2,4),2,1000023,1000035,
     .    "BR(H_2 -> neu_2 neu_4)"
      IF(BRNEU(2,2,5).GT.0d0)
     .  WRITE(18,905) BRNEU(2,2,5),2,1000023,1000045,
     .    "BR(H_2 -> neu_2 neu_5)"
      IF(BRNEU(2,3,3).GT.0d0)
     .  WRITE(18,905) BRNEU(2,3,3),2,1000025,1000025,
     .    "BR(H_2 -> neu_3 neu_3)"
      IF(BRNEU(2,3,4).GT.0d0)
     .  WRITE(18,905) BRNEU(2,3,4),2,1000025,1000035,
     .    "BR(H_2 -> neu_3 neu_4)"
      IF(BRNEU(2,3,5).GT.0d0)
     .  WRITE(18,905) BRNEU(2,3,5),2,1000025,1000045,
     .    "BR(H_2 -> neu_3 neu_5)"
      IF(BRNEU(2,4,4).GT.0d0)
     .  WRITE(18,905) BRNEU(2,4,4),2,1000035,1000035,
     .    "BR(H_2 -> neu_4 neu_4)"
      IF(BRNEU(2,4,5).GT.0d0)
     .  WRITE(18,905) BRNEU(2,4,5),2,1000035,1000045,
     .    "BR(H_2 -> neu_4 neu_5)"
      IF(BRNEU(2,5,5).GT.0d0)
     .  WRITE(18,905) BRNEU(2,5,5),2,1000045,1000045,
     .    "BR(H_2 -> neu_5 neu_5)"
      IF(BRCHA(2,1).GT.0d0)
     .  WRITE(18,905) BRCHA(2,1),2,1000024,-1000024,
     .    "BR(H_2 -> cha_1 cha_1bar)"
      IF(BRCHA(2,2).GT.0d0)
     .  WRITE(18,905) BRCHA(2,2),2,1000024,-1000037,
     .    "BR(H_2 -> cha_1 cha_2bar)"
      IF(BRCHA(2,2).GT.0d0)
     .  WRITE(18,905) BRCHA(2,2),2,1000037,-1000024,
     .    "BR(H_2 -> cha_2 cha_1bar)"
      IF(BRCHA(2,3).GT.0d0)
     .  WRITE(18,905) BRCHA(2,3),2,1000037,-1000037,
     .    "BR(H_2 -> cha_2 cha_2bar)"
      IF(BRHSQ(2,1).GT.0d0)
     .  WRITE(18,905) BRHSQ(2,1),2,1000002,-1000002,
     .    "BR(H_2 -> ~u_L ~ubar_L)"
      IF(BRHSQ(2,1).GT.0d0)
     .  WRITE(18,905) BRHSQ(2,1),2,1000004,-1000004,
     .    "BR(H_2 -> ~c_L ~cbar_L)"
      IF(BRHSQ(2,2).GT.0d0)
     .  WRITE(18,905) BRHSQ(2,2),2,2000002,-2000002,
     .    "BR(H_2 -> ~u_R ~ubar_R)"
      IF(BRHSQ(2,2).GT.0d0)
     .  WRITE(18,905) BRHSQ(2,2),2,2000004,-2000004,
     .    "BR(H_2 -> ~c_R ~cbar_R)"
      IF(BRHSQ(2,3).GT.0d0)
     .  WRITE(18,905) BRHSQ(2,3),2,1000001,-1000001,
     .    "BR(H_2 -> ~d_L ~dbar_L)"
      IF(BRHSQ(2,3).GT.0d0)
     .  WRITE(18,905) BRHSQ(2,3),2,1000003,-1000003,
     .    "BR(H_2 -> ~s_L ~sbar_L)"
      IF(BRHSQ(2,4).GT.0d0)
     .  WRITE(18,905) BRHSQ(2,4),2,2000001,-2000001,
     .    "BR(H_2 -> ~d_R ~dbar_R)"
      IF(BRHSQ(2,4).GT.0d0)
     .  WRITE(18,905) BRHSQ(2,4),2,2000003,-2000003,
     .    "BR(H_2 -> ~s_R ~sbar_R)"
      IF(BRHSQ(2,5).GT.0d0)
     .  WRITE(18,905) BRHSQ(2,5),2,1000006,-1000006,
     .    "BR(H_2 -> ~t_1 ~tbar_1)"
      IF(BRHSQ(2,6).GT.0d0)
     .  WRITE(18,905) BRHSQ(2,6),2,2000006,-2000006,
     .    "BR(H_2 -> ~t_2 ~tbar_2)"
      IF(BRHSQ(2,7).GT.0d0)
     .  WRITE(18,905) BRHSQ(2,7),2,1000006,-2000006,
     .    "BR(H_2 -> ~t_1 ~tbar_2)"
      IF(BRHSQ(2,7).GT.0d0)
     .  WRITE(18,905) BRHSQ(2,7),2,2000006,-1000006,
     .    "BR(H_2 -> ~t_2 ~tbar_1)"
      IF(BRHSQ(2,8).GT.0d0)
     .  WRITE(18,905) BRHSQ(2,8),2,1000005,-1000005,
     .    "BR(H_2 -> ~b_1 ~bbar_1)"
      IF(BRHSQ(2,9).GT.0d0)
     .  WRITE(18,905) BRHSQ(2,9),2,2000005,-2000005,
     .    "BR(H_2 -> ~b_2 ~bbar_2)"
      IF(BRHSQ(2,10).GT.0d0)
     .  WRITE(18,905) BRHSQ(2,10),2,1000005,-2000005,
     .    "BR(H_2 -> ~b_1 ~bbar_2)"
      IF(BRHSQ(2,10).GT.0d0)
     .  WRITE(18,905) BRHSQ(2,10),2,2000005,-1000005,
     .    "BR(H_2 -> ~b_2 ~bbar_1)"
      IF(BRHSL(2,1).GT.0d0)
     .  WRITE(18,905) BRHSL(2,1),2,1000011,-1000011,
     .    "BR(H_2 -> ~e_L ~ebar_L)"
      IF(BRHSL(2,1).GT.0d0)
     .  WRITE(18,905) BRHSL(2,1),2,1000013,-1000013,
     .    "BR(H_2 -> ~mu_L ~mubar_L)"
      IF(BRHSL(2,2).GT.0d0)
     .  WRITE(18,905) BRHSL(2,2),2,2000011,-2000011,
     .    "BR(H_2 -> ~e_R ~ebar_R)"
      IF(BRHSL(2,2).GT.0d0)
     .  WRITE(18,905) BRHSL(2,2),2,2000013,-2000013,
     .    "BR(H_2 -> ~mu_R ~mubarRL)"
      IF(BRHSL(2,3).GT.0d0)
     .  WRITE(18,905) BRHSL(2,3),2,1000012,-1000012,
     .    "BR(H_2 -> ~nu_e_L ~nu_ebar_L)"
      IF(BRHSL(2,3).GT.0d0)
     .  WRITE(18,905) BRHSL(2,3),2,1000014,-1000014,
     .    "BR(H_2 -> ~nu_mu_L ~nu_mubar_L)"
      IF(BRHSL(2,4).GT.0d0)
     .  WRITE(18,905) BRHSL(2,4),2,1000015,-1000015,
     .    "BR(H_2 -> ~tau_1 ~taubar_1)"
      IF(BRHSL(2,5).GT.0d0)
     .  WRITE(18,905) BRHSL(2,5),2,2000015,-2000015,
     .    "BR(H_2 -> ~tau_2 ~taubar_2)"
      IF(BRHSL(2,6).GT.0d0)
     .  WRITE(18,905) BRHSL(2,6),2,1000015,-2000015,
     .    "BR(H_2 -> ~tau_1 ~taubar_2)"
      IF(BRHSL(2,6).GT.0d0)
     .  WRITE(18,905) BRHSL(2,6),2,2000015,-1000015,
     .    "BR(H_2 -> ~tau_2 ~taubar_1)"
      IF(BRHSL(2,7).GT.0d0)
     .  WRITE(18,905) BRHSL(2,7),2,1000016,-1000016,
     .    "BR(H_2 -> ~nu_tau_L ~nu_taubar_L)"

      WRITE(18,904) 45,WIDTH(3),"3rd neutral Higgs scalar"
      IF(BRJJ(3).GT.0d0)
     .  WRITE(18,905) BRJJ(3),2,21,21,"BR(H_3 -> gluon gluon)"
      IF(BREE(3).GT.0d0)
     .  WRITE(18,905) BREE(3),2,11,-11,"BR(H_3 -> e- e+)"
      IF(BRMM(3).GT.0d0)
     .  WRITE(18,905) BRMM(3),2,13,-13,"BR(H_3 -> muon muon)"
      IF(BRLL(3).GT.0d0)
     .  WRITE(18,905) BRLL(3),2,15,-15,"BR(H_3 -> tau tau)"
      IF(BRSS(3).GT.0d0)
     .  WRITE(18,905) BRSS(3),2,3,-3,"BR(H_3 -> s sbar)"
      IF(BRCC(3).GT.0d0)
     .  WRITE(18,905) BRCC(3),2,4,-4,"BR(H_3 -> c cbar)"
      IF(BRBB(3).GT.0d0)
     .  WRITE(18,905) BRBB(3),2,5,-5,"BR(H_3 -> b bbar)"
      IF(BRTT(3).GT.0d0)
     .  WRITE(18,905) BRTT(3),2,6,-6,"BR(H_3 -> t tbar)"
      IF(BRWW(3).GT.0d0)
     .  WRITE(18,905) BRWW(3),2,24,-24,"BR(H_3 -> W+ W-)"
      IF(BRZZ(3).GT.0d0)
     .  WRITE(18,905) BRZZ(3),2,23,23,"BR(H_3 -> Z Z)"
      IF(BRGG(3).GT.0d0)
     .  WRITE(18,905) BRGG(3),2,22,22,"BR(H_3 -> gamma gamma)"
      IF(BRZG(3).GT.0d0)
     .  WRITE(18,905) BRZG(3),2,23,22,"BR(H_3 -> Z gamma)"
      IF(BRHHH(2).GT.0d0)
     .  WRITE(18,905) BRHHH(2),2,25,25,"BR(H_3 -> H_1 H_1)"
      IF(BRHHH(3).GT.0d0)
     .  WRITE(18,905) BRHHH(3),2,25,35,"BR(H_3 -> H_1 H_2)"
      IF(BRHHH(4).GT.0d0)
     .  WRITE(18,905) BRHHH(4),2,35,35,"BR(H_3 -> H_2 H_2)"
      IF(BRHAA(3,1).GT.0d0)
     .  WRITE(18,905) BRHAA(3,1),2,36,36,"BR(H_3 -> A_1 A_1)"
      IF(BRHAA(3,2).GT.0d0)
     .  WRITE(18,905) BRHAA(3,2),2,36,46,"BR(H_3 -> A_1 A_2)"
      IF(BRHAA(3,3).GT.0d0)
     .  WRITE(18,905) BRHAA(3,3),2,46,46,"BR(H_3 -> A_2 A_2)"
      IF(BRHAZ(3,1).GT.0d0)
     .  WRITE(18,905) BRHAZ(3,1),2,23,36,"BR(H_3 -> A_1 Z)"
      IF(BRHAZ(3,2).GT.0d0)
     .  WRITE(18,905) BRHAZ(3,2),2,23,46,"BR(H_3 -> A_2 Z)"
      IF(BRHCHC(3).GT.0d0)
     .  WRITE(18,905) BRHCHC(3),2,37,-37,"BR(H_3 -> H+ H-)"
      IF(BRHCW(3).GT.0d0)
     .  WRITE(18,905) BRHCW(3),2,24,-37,"BR(H_3 -> W+ H-)"
      IF(BRNEU(3,1,1).GT.0d0)
     .  WRITE(18,905) BRNEU(3,1,1),2,1000022,1000022,
     .    "BR(H_3 -> neu_1 neu_1)"
      IF(BRNEU(3,1,2).GT.0d0)
     .  WRITE(18,905) BRNEU(3,1,2),2,1000022,1000023,
     .    "BR(H_3 -> neu_1 neu_2)"
      IF(BRNEU(3,1,3).GT.0d0)
     .  WRITE(18,905) BRNEU(3,1,3),2,1000022,1000025,
     .    "BR(H_3 -> neu_1 neu_3)"
      IF(BRNEU(3,1,4).GT.0d0)
     .  WRITE(18,905) BRNEU(3,1,4),2,1000022,1000035,
     .    "BR(H_3 -> neu_1 neu_4)"
      IF(BRNEU(3,1,5).GT.0d0)
     .  WRITE(18,905) BRNEU(3,1,5),2,1000022,1000045,
     .    "BR(H_3 -> neu_1 neu_5)"
      IF(BRNEU(3,2,2).GT.0d0)
     .  WRITE(18,905) BRNEU(3,2,2),2,1000023,1000023,
     .    "BR(H_3 -> neu_2 neu_2)"
      IF(BRNEU(3,2,3).GT.0d0)
     .  WRITE(18,905) BRNEU(3,2,3),2,1000023,1000025,
     .    "BR(H_3 -> neu_2 neu_3)"
      IF(BRNEU(3,2,4).GT.0d0)
     .  WRITE(18,905) BRNEU(3,2,4),2,1000023,1000035,
     .    "BR(H_3 -> neu_2 neu_4)"
      IF(BRNEU(3,2,5).GT.0d0)
     .  WRITE(18,905) BRNEU(3,2,5),2,1000023,1000045,
     .    "BR(H_3 -> neu_2 neu_5)"
      IF(BRNEU(3,3,3).GT.0d0)
     .  WRITE(18,905) BRNEU(3,3,3),2,1000025,1000025,
     .    "BR(H_3 -> neu_3 neu_3)"
      IF(BRNEU(3,3,4).GT.0d0)
     .  WRITE(18,905) BRNEU(3,3,4),2,1000025,1000035,
     .    "BR(H_3 -> neu_3 neu_4)"
      IF(BRNEU(3,3,5).GT.0d0)
     .  WRITE(18,905) BRNEU(3,3,5),2,1000025,1000045,
     .    "BR(H_3 -> neu_3 neu_5)"
      IF(BRNEU(3,4,4).GT.0d0)
     .  WRITE(18,905) BRNEU(3,4,4),2,1000035,1000035,
     .    "BR(H_3 -> neu_4 neu_4)"
      IF(BRNEU(3,4,5).GT.0d0)
     .  WRITE(18,905) BRNEU(3,4,5),2,1000035,1000045,
     .    "BR(H_3 -> neu_4 neu_5)"
      IF(BRNEU(3,5,5).GT.0d0)
     .  WRITE(18,905) BRNEU(3,5,5),2,1000045,1000045,
     .    "BR(H_3 -> neu_5 neu_5)"
      IF(BRCHA(3,1).GT.0d0)
     .  WRITE(18,905) BRCHA(3,1),2,1000024,-1000024,
     .    "BR(H_3 -> cha_1 cha_1bar)"
      IF(BRCHA(3,2).GT.0d0)
     .  WRITE(18,905) BRCHA(3,2),2,1000024,-1000037,
     .    "BR(H_3 -> cha_1 cha_2bar)"
      IF(BRCHA(3,2).GT.0d0)
     .  WRITE(18,905) BRCHA(3,2),2,1000037,-1000024,
     .    "BR(H_3 -> cha_2 cha_1bar)"
      IF(BRCHA(3,3).GT.0d0)
     .  WRITE(18,905) BRCHA(3,3),2,1000037,-1000037,
     .    "BR(H_3 -> cha_2 cha_2bar)"
      IF(BRHSQ(3,1).GT.0d0)
     .  WRITE(18,905) BRHSQ(3,1),2,1000002,-1000002,
     .    "BR(H_3 -> ~u_L ~ubar_L)"
      IF(BRHSQ(3,1).GT.0d0)
     .  WRITE(18,905) BRHSQ(3,1),2,1000004,-1000004,
     .    "BR(H_3 -> ~c_L ~cbar_L)"
      IF(BRHSQ(3,2).GT.0d0)
     .  WRITE(18,905) BRHSQ(3,2),2,2000002,-2000002,
     .    "BR(H_3 -> ~u_R ~ubar_R)"
      IF(BRHSQ(3,2).GT.0d0)
     .  WRITE(18,905) BRHSQ(3,2),2,2000004,-2000004,
     .    "BR(H_3 -> ~c_R ~cbar_R)"
      IF(BRHSQ(3,3).GT.0d0)
     .  WRITE(18,905) BRHSQ(3,3),2,1000001,-1000001,
     .    "BR(H_3 -> ~d_L ~dbar_L)"
      IF(BRHSQ(3,3).GT.0d0)
     .  WRITE(18,905) BRHSQ(3,3),2,1000003,-1000003,
     .    "BR(H_3 -> ~s_L ~sbar_L)"
      IF(BRHSQ(3,4).GT.0d0)
     .  WRITE(18,905) BRHSQ(3,4),2,2000001,-2000001,
     .    "BR(H_3 -> ~d_R ~dbar_R)"
      IF(BRHSQ(3,4).GT.0d0)
     .  WRITE(18,905) BRHSQ(3,4),2,2000003,-2000003,
     .    "BR(H_3 -> ~s_R ~sbar_R)"
      IF(BRHSQ(3,5).GT.0d0)
     .  WRITE(18,905) BRHSQ(3,5),2,1000006,-1000006,
     .    "BR(H_3 -> ~t_1 ~tbar_1)"
      IF(BRHSQ(3,6).GT.0d0)
     .  WRITE(18,905) BRHSQ(3,6),2,2000006,-2000006,
     .    "BR(H_3 -> ~t_2 ~tbar_2)"
      IF(BRHSQ(3,7).GT.0d0)
     .  WRITE(18,905) BRHSQ(3,7),2,1000006,-2000006,
     .    "BR(H_3 -> ~t_1 ~tbar_2)"
      IF(BRHSQ(3,7).GT.0d0)
     .  WRITE(18,905) BRHSQ(3,7),2,2000006,-1000006,
     .    "BR(H_3 -> ~t_2 ~tbar_1)"
      IF(BRHSQ(3,8).GT.0d0)
     .  WRITE(18,905) BRHSQ(3,8),2,1000005,-1000005,
     .    "BR(H_3 -> ~b_1 ~bbar_1)"
      IF(BRHSQ(3,9).GT.0d0)
     .  WRITE(18,905) BRHSQ(3,9),2,2000005,-2000005,
     .    "BR(H_3 -> ~b_2 ~bbar_2)"
      IF(BRHSQ(3,10).GT.0d0)
     .  WRITE(18,905) BRHSQ(3,10),2,1000005,-2000005,
     .    "BR(H_3 -> ~b_1 ~bbar_2)"
      IF(BRHSQ(3,10).GT.0d0)
     .  WRITE(18,905) BRHSQ(3,10),2,2000005,-1000005,
     .    "BR(H_3 -> ~b_2 ~bbar_1)"
      IF(BRHSL(3,1).GT.0d0)
     .  WRITE(18,905) BRHSL(3,1),2,1000011,-1000011,
     .    "BR(H_3 -> ~e_L ~ebar_L)"
      IF(BRHSL(3,1).GT.0d0)
     .  WRITE(18,905) BRHSL(3,1),2,1000013,-1000013,
     .    "BR(H_3 -> ~mu_L ~mubar_L)"
      IF(BRHSL(3,2).GT.0d0)
     .  WRITE(18,905) BRHSL(3,2),2,2000011,-2000011,
     .    "BR(H_3 -> ~e_R ~ebar_R)"
      IF(BRHSL(3,2).GT.0d0)
     .  WRITE(18,905) BRHSL(3,2),2,2000013,-2000013,
     .    "BR(H_3 -> ~mu_R ~mubarRL)"
      IF(BRHSL(3,3).GT.0d0)
     .  WRITE(18,905) BRHSL(3,3),2,1000012,-1000012,
     .    "BR(H_3 -> ~nu_e_L ~nu_ebar_L)"
      IF(BRHSL(3,3).GT.0d0)
     .  WRITE(18,905) BRHSL(3,3),2,1000014,-1000014,
     .    "BR(H_3 -> ~nu_mu_L ~nu_mubar_L)"
      IF(BRHSL(3,4).GT.0d0)
     .  WRITE(18,905) BRHSL(3,4),2,1000015,-1000015,
     .    "BR(H_3 -> ~tau_1 ~taubar_1)"
      IF(BRHSL(3,5).GT.0d0)
     .  WRITE(18,905) BRHSL(3,5),2,2000015,-2000015,
     .    "BR(H_3 -> ~tau_2 ~taubar_2)"
      IF(BRHSL(3,6).GT.0d0)
     .  WRITE(18,905) BRHSL(3,6),2,1000015,-2000015,
     .    "BR(H_3 -> ~tau_1 ~taubar_2)"
      IF(BRHSL(3,6).GT.0d0)
     .  WRITE(18,905) BRHSL(3,6),2,2000015,-1000015,
     .    "BR(H_3 -> ~tau_2 ~taubar_1)"
      IF(BRHSL(3,7).GT.0d0)
     .  WRITE(18,905) BRHSL(3,7),2,1000016,-1000016,
     .    "BR(H_3 -> ~nu_tau_L ~nu_taubar_L)"

      WRITE(18,904) 36,WIDTH(4),"Lightest pseudoscalar"
      IF(BRJJ(4).GT.0d0)
     .  WRITE(18,905) BRJJ(4),2,21,21,"BR(A_1 -> gluon gluon)"
      IF(BREE(4).GT.0d0)
     .  WRITE(18,905) BREE(4),2,11,-11,"BR(A_1 -> e- e+)"
      IF(BRMM(4).GT.0d0)
     .  WRITE(18,905) BRMM(4),2,13,-13,"BR(A_1 -> muon muon)"
      IF(BRLL(4).GT.0d0)
     .  WRITE(18,905) BRLL(4),2,15,-15,"BR(A_1 -> tau tau)"
      IF(BRSS(4).GT.0d0)
     .  WRITE(18,905) BRSS(4),2,3,-3,"BR(A_1 -> s sbar)"
      IF(BRCC(4).GT.0d0)
     .  WRITE(18,905) BRCC(4),2,4,-4,"BR(A_1 -> c cbar)"
      IF(BRBB(4).GT.0d0)
     .  WRITE(18,905) BRBB(4),2,5,-5,"BR(A_1 -> b bbar)"
      IF(BRTT(4).GT.0d0)
     .  WRITE(18,905) BRTT(4),2,6,-6,"BR(A_1 -> t tbar)"
      IF(BRGG(4).GT.0d0)
     .  WRITE(18,905) BRGG(4),2,22,22,"BR(A_1 -> gamma gamma)"
      IF(BRZG(4).GT.0d0)
     .  WRITE(18,905) BRZG(4),2,23,22,"BR(A_1 -> Z gamma)"
      IF(BRAHZ(1,1).GT.0d0)
     .  WRITE(18,905) BRAHZ(1,1),2,23,25,"BR(A_1 -> Z H_1)"
      IF(BRAHZ(1,2).GT.0d0)
     .  WRITE(18,905) BRAHZ(1,2),2,23,35,"BR(A_1 -> Z H_2)"
      IF(BRNEU(4,1,1).GT.0d0)
     .  WRITE(18,905) BRNEU(4,1,1),2,1000022,1000022,
     .    "BR(A_1 -> neu_1 neu_1)"
      IF(BRNEU(4,1,2).GT.0d0)
     .  WRITE(18,905) BRNEU(4,1,2),2,1000022,1000023,
     .    "BR(A_1 -> neu_1 neu_2)"
      IF(BRNEU(4,1,3).GT.0d0)
     .  WRITE(18,905) BRNEU(4,1,3),2,1000022,1000025,
     .    "BR(A_1 -> neu_1 neu_3)"
      IF(BRNEU(4,1,4).GT.0d0)
     .  WRITE(18,905) BRNEU(4,1,4),2,1000022,1000035,
     .    "BR(A_1 -> neu_1 neu_4)"
      IF(BRNEU(4,1,5).GT.0d0)
     .  WRITE(18,905) BRNEU(4,1,5),2,1000022,1000045,
     .    "BR(A_1 -> neu_1 neu_5)"
      IF(BRNEU(4,2,2).GT.0d0)
     .  WRITE(18,905) BRNEU(4,2,2),2,1000023,1000023,
     .    "BR(A_1 -> neu_2 neu_2)"
      IF(BRNEU(4,2,3).GT.0d0)
     .  WRITE(18,905) BRNEU(4,2,3),2,1000023,1000025,
     .    "BR(A_1 -> neu_2 neu_3)"
      IF(BRNEU(4,2,4).GT.0d0)
     .  WRITE(18,905) BRNEU(4,2,4),2,1000023,1000035,
     .    "BR(A_1 -> neu_2 neu_4)"
      IF(BRNEU(4,2,5).GT.0d0)
     .  WRITE(18,905) BRNEU(4,2,5),2,1000023,1000045,
     .    "BR(A_1 -> neu_2 neu_5)"
      IF(BRNEU(4,3,3).GT.0d0)
     .  WRITE(18,905) BRNEU(4,3,3),2,1000025,1000025,
     .    "BR(A_1 -> neu_3 neu_3)"
      IF(BRNEU(4,3,4).GT.0d0)
     .  WRITE(18,905) BRNEU(4,3,4),2,1000025,1000035,
     .    "BR(A_1 -> neu_3 neu_4)"
      IF(BRNEU(4,3,5).GT.0d0)
     .  WRITE(18,905) BRNEU(4,3,5),2,1000025,1000045,
     .    "BR(A_1 -> neu_3 neu_5)"
      IF(BRNEU(4,4,4).GT.0d0)
     .  WRITE(18,905) BRNEU(4,4,4),2,1000035,1000035,
     .    "BR(A_1 -> neu_4 neu_4)"
      IF(BRNEU(4,4,5).GT.0d0)
     .  WRITE(18,905) BRNEU(4,4,5),2,1000035,1000045,
     .    "BR(A_1 -> neu_4 neu_5)"
      IF(BRNEU(4,5,5).GT.0d0)
     .  WRITE(18,905) BRNEU(4,5,5),2,1000045,1000045,
     .    "BR(A_1 -> neu_5 neu_5)"
      IF(BRCHA(4,1).GT.0d0)
     .  WRITE(18,905) BRCHA(4,1),2,1000024,-1000024,
     .    "BR(A_1 -> cha_1 cha_1bar)"
      IF(BRCHA(4,2).GT.0d0)
     .  WRITE(18,905) BRCHA(4,2),2,1000024,-1000037,
     .    "BR(A_1 -> cha_1 cha_2bar)"
      IF(BRCHA(4,2).GT.0d0)
     .  WRITE(18,905) BRCHA(4,2),2,1000037,-1000024,
     .    "BR(A_1 -> cha_2 cha_1bar)"
      IF(BRCHA(4,3).GT.0d0)
     .  WRITE(18,905) BRCHA(4,3),2,1000037,-1000037,
     .    "BR(A_1 -> cha_2 cha_2bar)"
      IF(BRASQ(1,1).GT.0d0)
     .  WRITE(18,905) BRASQ(1,1),2,1000006,-2000006,
     .    "BR(A_1 -> ~t_1 ~tbar_2)"
      IF(BRASQ(1,1).GT.0d0)
     .  WRITE(18,905) BRASQ(1,1),2,2000006,-1000006,
     .    "BR(A_1 -> ~t_2 ~tbar_1)"
      IF(BRASQ(1,2).GT.0d0)
     .  WRITE(18,905) BRASQ(1,2),2,1000005,-2000005,
     .    "BR(A_1 -> ~b_1 ~bbar_2)"
      IF(BRASQ(1,2).GT.0d0)
     .  WRITE(18,905) BRASQ(1,2),2,2000005,-1000005,
     .    "BR(A_1 -> ~b_2 ~bbar_1)"
      IF(BRASL(1).GT.0d0)
     .  WRITE(18,905) BRASL(1),2,1000015,-2000015,
     .    "BR(A_1 -> ~tau_1 ~taubar_2)"
      IF(BRASL(1).GT.0d0)
     .  WRITE(18,905) BRASL(1),2,2000015,-1000015,
     .    "BR(A_1 -> ~tau_2 ~taubar_1)"

      WRITE(18,904) 46,WIDTH(5),"2nd pseudoscalar"
      IF(BRJJ(5).GT.0d0)
     .  WRITE(18,905) BRJJ(5),2,21,21,"BR(A_2 -> gluon gluon)"
      IF(BREE(5).GT.0d0)
     .  WRITE(18,905) BREE(5),2,11,-11,"BR(A_2 -> e- e+)"
      IF(BRMM(5).GT.0d0)
     .  WRITE(18,905) BRMM(5),2,13,-13,"BR(A_2 -> muon muon)"
      IF(BRLL(5).GT.0d0)
     .  WRITE(18,905) BRLL(5),2,15,-15,"BR(A_2 -> tau tau)"
      IF(BRSS(5).GT.0d0)
     .  WRITE(18,905) BRSS(5),2,3,-3,"BR(A_2 -> s sbar)"
      IF(BRCC(5).GT.0d0)
     .  WRITE(18,905) BRCC(5),2,4,-4,"BR(A_2 -> c cbar)"
      IF(BRBB(5).GT.0d0)
     .  WRITE(18,905) BRBB(5),2,5,-5,"BR(A_2 -> b bbar)"
      IF(BRTT(5).GT.0d0)
     .  WRITE(18,905) BRTT(5),2,6,-6,"BR(A_2 -> t tbar)"
      IF(BRGG(5).GT.0d0)
     .  WRITE(18,905) BRGG(5),2,22,22,"BR(A_2 -> gamma gamma)"
      IF(BRZG(5).GT.0d0)
     .  WRITE(18,905) BRZG(5),2,23,22,"BR(A_2 -> Z gamma)"
      IF(BRAHA(1).GT.0d0)
     .  WRITE(18,905) BRAHA(1),2,36,25,"BR(A_2 -> A_1 H_1)"
      IF(BRAHA(2).GT.0d0)
     .  WRITE(18,905) BRAHA(2),2,36,35,"BR(A_2 -> A_1 H_2)"
      IF(BRAHA(3).GT.0d0)
     .  WRITE(18,905) BRAHA(3),2,36,45,"BR(A_2 -> A_1 H_3)"
      IF(BRAHZ(2,1).GT.0d0)
     .  WRITE(18,905) BRAHZ(2,1),2,23,25,"BR(A_2 -> Z H_1)"
      IF(BRAHZ(2,2).GT.0d0)
     .  WRITE(18,905) BRAHZ(2,2),2,23,35,"BR(A_2 -> Z H_2)"
      IF(BRHCW(5).GT.0d0)
     .  WRITE(18,905) BRHCW(5),2,24,-37,"BR(A_2 -> W+ H-)"
      IF(BRNEU(5,1,1).GT.0d0)
     .  WRITE(18,905) BRNEU(5,1,1),2,1000022,1000022,
     .    "BR(A_2 -> neu_1 neu_1)"
      IF(BRNEU(5,1,2).GT.0d0)
     .  WRITE(18,905) BRNEU(5,1,2),2,1000022,1000023,
     .    "BR(A_2 -> neu_1 neu_2)"
      IF(BRNEU(5,1,3).GT.0d0)
     .  WRITE(18,905) BRNEU(5,1,3),2,1000022,1000025,
     .    "BR(A_2 -> neu_1 neu_3)"
      IF(BRNEU(5,1,4).GT.0d0)
     .  WRITE(18,905) BRNEU(5,1,4),2,1000022,1000035,
     .    "BR(A_2 -> neu_1 neu_4)"
      IF(BRNEU(5,1,5).GT.0d0)
     .  WRITE(18,905) BRNEU(5,1,5),2,1000022,1000045,
     .    "BR(A_2 -> neu_1 neu_5)"
      IF(BRNEU(5,2,2).GT.0d0)
     .  WRITE(18,905) BRNEU(5,2,2),2,1000023,1000023,
     .    "BR(A_2 -> neu_2 neu_2)"
      IF(BRNEU(5,2,3).GT.0d0)
     .  WRITE(18,905) BRNEU(5,2,3),2,1000023,1000025,
     .    "BR(A_2 -> neu_2 neu_3)"
      IF(BRNEU(5,2,4).GT.0d0)
     .  WRITE(18,905) BRNEU(5,2,4),2,1000023,1000035,
     .    "BR(A_2 -> neu_2 neu_4)"
      IF(BRNEU(5,2,5).GT.0d0)
     .  WRITE(18,905) BRNEU(5,2,5),2,1000023,1000045,
     .    "BR(A_2 -> neu_2 neu_5)"
      IF(BRNEU(5,3,3).GT.0d0)
     .  WRITE(18,905) BRNEU(5,3,3),2,1000025,1000025,
     .    "BR(A_2 -> neu_3 neu_3)"
      IF(BRNEU(5,3,4).GT.0d0)
     .  WRITE(18,905) BRNEU(5,3,4),2,1000025,1000035,
     .    "BR(A_2 -> neu_3 neu_4)"
      IF(BRNEU(5,3,5).GT.0d0)
     .  WRITE(18,905) BRNEU(5,3,5),2,1000025,1000045,
     .    "BR(A_2 -> neu_3 neu_5)"
      IF(BRNEU(5,4,4).GT.0d0)
     .  WRITE(18,905) BRNEU(5,4,4),2,1000035,1000035,
     .    "BR(A_2 -> neu_4 neu_4)"
      IF(BRNEU(5,4,5).GT.0d0)
     .  WRITE(18,905) BRNEU(5,4,5),2,1000035,1000045,
     .    "BR(A_2 -> neu_4 neu_5)"
      IF(BRNEU(5,5,5).GT.0d0)
     .  WRITE(18,905) BRNEU(5,5,5),2,1000045,1000045,
     .    "BR(A_2 -> neu_5 neu_5)"
      IF(BRCHA(5,1).GT.0d0)
     .  WRITE(18,905) BRCHA(5,1),2,1000024,-1000024,
     .    "BR(A_2 -> cha_1 cha_1bar)"
      IF(BRCHA(5,2).GT.0d0)
     .  WRITE(18,905) BRCHA(5,2),2,1000024,-1000037,
     .    "BR(A_2 -> cha_1 cha_2bar)"
      IF(BRCHA(5,2).GT.0d0)
     .  WRITE(18,905) BRCHA(5,2),2,1000037,-1000024,
     .    "BR(A_2 -> cha_2 cha_1bar)"
      IF(BRCHA(5,3).GT.0d0)
     .  WRITE(18,905) BRCHA(5,3),2,1000037,-1000037,
     .    "BR(A_2 -> cha_2 cha_2bar)"
      IF(BRASQ(2,1).GT.0d0)
     .  WRITE(18,905) BRASQ(2,1),2,1000006,-2000006,
     .    "BR(A_2 -> ~t_1 ~tbar_2)"
      IF(BRASQ(2,1).GT.0d0)
     .  WRITE(18,905) BRASQ(2,1),2,2000006,-1000006,
     .    "BR(A_2 -> ~t_2 ~tbar_1)"
      IF(BRASQ(2,2).GT.0d0)
     .  WRITE(18,905) BRASQ(2,2),2,1000005,-2000005,
     .    "BR(A_2 -> ~b_1 ~bbar_2)"
      IF(BRASQ(2,2).GT.0d0)
     .  WRITE(18,905) BRASQ(2,2),2,2000005,-1000005,
     .    "BR(A_2 -> ~b_2 ~bbar_1)"
      IF(BRASL(2).GT.0d0)
     .  WRITE(18,905) BRASL(2),2,1000015,-2000015,
     .    "BR(A_2 -> ~tau_1 ~taubar_2)"
      IF(BRASL(2).GT.0d0)
     .  WRITE(18,905) BRASL(2),2,2000015,-1000015,
     .    "BR(A_2 -> ~tau_2 ~taubar_1)"

      WRITE(18,904) 37,HCWIDTH,"Charged Higgs"
      IF(HCBRM.GT.0d0)
     .  WRITE(18,905) HCBRM,2,-13,14,"BR(H+ -> muon nu_muon)"
      IF(HCBRL.GT.0d0)
     .  WRITE(18,905) HCBRL,2,-15,16,"BR(H+ -> tau nu_tau)"
      IF(HCBRSU.GT.0d0)
     .  WRITE(18,905) HCBRSU,2,2,-3,"BR(H+ -> u sbar)"
      IF(HCBRSC.GT.0d0)
     .  WRITE(18,905) HCBRSC,2,4,-3,"BR(H+ -> c sbar)"
      IF(HCBRBU.GT.0d0)
     .  WRITE(18,905) HCBRBU,2,2,-5,"BR(H+ -> u bbar)"
      IF(HCBRBC.GT.0d0)
     .  WRITE(18,905) HCBRBC,2,4,-5,"BR(H+ -> c bbar)"
      IF(HCBRBT.GT.0d0)
     .  WRITE(18,905) HCBRBT,2,6,-5,"BR(H+ -> t bbar)"
      IF(HCBRWH(1).GT.0d0)
     .  WRITE(18,905) HCBRWH(1),2,24,25,"BR(H+ -> W+ H_1)"
      IF(HCBRWH(2).GT.0d0)
     .  WRITE(18,905) HCBRWH(2),2,24,35,"BR(H+ -> W+ H_2)"
      IF(HCBRWH(4).GT.0d0)
     .  WRITE(18,905) HCBRWH(4),2,24,36,"BR(H+ -> W+ A_1)"
      IF(HCBRNC(1,1).GT.0d0)
     .  WRITE(18,905) HCBRNC(1,1),2,1000024,1000022,
     .    "BR(H+ -> cha_1 neu_1)"
      IF(HCBRNC(2,1).GT.0d0)
     .  WRITE(18,905) HCBRNC(2,1),2,1000024,1000023,
     .    "BR(H+ -> cha_1 neu_2)"
      IF(HCBRNC(3,1).GT.0d0)
     .  WRITE(18,905) HCBRNC(3,1),2,1000024,1000025,
     .    "BR(H+ -> cha_1 neu_3)"
      IF(HCBRNC(4,1).GT.0d0)
     .  WRITE(18,905) HCBRNC(4,1),2,1000024,1000035,
     .    "BR(H+ -> cha_1 neu_4)"
      IF(HCBRNC(5,1).GT.0d0)
     .  WRITE(18,905) HCBRNC(5,1),2,1000024,1000045,
     .    "BR(H+ -> cha_1 neu_5)"
      IF(HCBRNC(1,2).GT.0d0)
     .  WRITE(18,905) HCBRNC(1,2),2,1000037,1000022,
     .    "BR(H+ -> cha_2 neu_1)"
      IF(HCBRNC(2,2).GT.0d0)
     .  WRITE(18,905) HCBRNC(2,2),2,1000037,1000023,
     .    "BR(H+ -> cha_2 neu_2)"
      IF(HCBRNC(3,2).GT.0d0)
     .  WRITE(18,905) HCBRNC(3,2),2,1000037,1000025,
     .    "BR(H+ -> cha_2 neu_3)"
      IF(HCBRNC(4,2).GT.0d0)
     .  WRITE(18,905) HCBRNC(4,2),2,1000037,1000035,
     .    "BR(H+ -> cha_2 neu_4)"
      IF(HCBRNC(5,2).GT.0d0)
     .  WRITE(18,905) HCBRNC(5,2),2,1000037,1000045,
     .    "BR(H+ -> cha_2 neu_5)"
      IF(HCBRSQ(1).GT.0d0)
     .  WRITE(18,905) HCBRSQ(1),2,1000002,-1000001,
     .    "BR(H+ -> ~u_L ~dbar_L)"
      IF(HCBRSQ(1).GT.0d0)
     .  WRITE(18,905) HCBRSQ(1),2,1000004,-1000003,
     .    "BR(H+ -> ~c_L ~sbar_L)"
      IF(HCBRSQ(2).GT.0d0)
     .  WRITE(18,905) HCBRSQ(2),2,1000006,-1000005,
     .    "BR(H+ -> ~t_1 ~bbar_1)"
      IF(HCBRSQ(3).GT.0d0)
     .  WRITE(18,905) HCBRSQ(3),2,1000006,-2000005,
     .    "BR(H+ -> ~t_1 ~bbar_2)"
      IF(HCBRSQ(4).GT.0d0)
     .  WRITE(18,905) HCBRSQ(4),2,2000006,-1000005,
     .    "BR(H+ -> ~t_2 ~bbar_1)"
      IF(HCBRSQ(5).GT.0d0)
     .  WRITE(18,905) HCBRSQ(5),2,2000006,-2000005,
     .    "BR(H+ -> ~t_2 ~bbar_2)"
      IF(HCBRSL(1).GT.0d0)
     .  WRITE(18,905) HCBRSL(1),2,1000012,-1000011,
     .    "BR(H+ -> ~nu_e_L ~ebar_L)"
      IF(HCBRSL(1).GT.0d0)
     .  WRITE(18,905) HCBRSL(1),2,1000014,-1000013,
     .    "BR(H+ -> ~nu_mu_L ~mubar_L)"
      IF(HCBRSL(2).GT.0d0)
     .  WRITE(18,905) HCBRSL(2),2,1000016,-1000015,
     .    "BR(H+ -> ~nu_tau_L ~taubar_1)"
      IF(HCBRSL(3).GT.0d0)
     .  WRITE(18,905) HCBRSL(3),2,1000016,-2000015,
     .    "BR(H+ -> ~nu_tau_L ~taubar_2)"

      WRITE(18,904) 6,toptot,'Top Quark'
      IF(brtopbw.ne.0.D0)
     .  WRITE(18,905) brtopbw,2,5,24,'BR(t ->  b    W+)'
      IF(brtopbh.ne.0.D0)
     .  WRITE(18,905) brtopbh,2,5,37,'BR(t ->  b    H+)'
      IF(brtopneutrstop(1,1).ne.0.D0)
     .  WRITE(18,905) brtopneutrstop(1,1),2,1000006,1000022,
     . 'BR(t -> ~t_1 ~chi_10)'
      IF(brtopneutrstop(2,1).ne.0.D0)
     .  WRITE(18,905) brtopneutrstop(2,1),2,1000006,1000023,
     . 'BR(t -> ~t_1 ~chi_20)'
      IF(brtopneutrstop(3,1).ne.0.D0)
     .  WRITE(18,905) brtopneutrstop(3,1),2,1000006,1000025,
     . 'BR(t -> ~t_1 ~chi_30)'
      IF(brtopneutrstop(4,1).ne.0.D0)
     .  WRITE(18,905) brtopneutrstop(4,1),2,1000006,1000025,
     . 'BR(t -> ~t_1 ~chi_40)'
      IF(brtopneutrstop(5,1).ne.0.D0)
     .  WRITE(18,905) brtopneutrstop(5,1),2,1000006,1000025,
     . 'BR(t -> ~t_1 ~chi_50)'
      IF(brtopneutrstop(1,2).ne.0.D0)
     .  WRITE(18,905) brtopneutrstop(1,2),2,2000006,1000022,
     . 'BR(t -> ~t_2 ~chi_10)'
      IF(brtopneutrstop(2,2).ne.0.D0)
     .  WRITE(18,905) brtopneutrstop(2,2),2,2000006,1000023,
     . 'BR(t -> ~t_2 ~chi_20)'
      IF(brtopneutrstop(3,2).ne.0.D0)
     .  WRITE(18,905) brtopneutrstop(3,2),2,2000006,1000025,
     .'BR(t -> ~t_2 ~chi_30)'
      IF(brtopneutrstop(4,2).ne.0.D0)
     .  WRITE(18,905) brtopneutrstop(4,2),2,2000006,1000025,
     . 'BR(t -> ~t_2 ~chi_40)'
      IF(brtopneutrstop(5,2).ne.0.D0)
     .  WRITE(18,905) brtopneutrstop(5,2),2,2000006,1000025,
     . 'BR(t -> ~t_2 ~chi_50)'

      IF(NMSFLAG.NE.0)CALL NS_OUTPUT

 899  FORMAT(A)
 900  FORMAT(1X,I5,3X,A)
 901  FORMAT(1X,I5,3X,1P,E16.8,0P,3X,'#',1X,A)
 902  FORMAT(1X,I9,3X,1P,E16.8,0P,3X,'#',1X,A)
 903  FORMAT(1X,I2,1X,I2,3X,1P,E16.8,0P,3X,'#',1X,A)
 904  FORMAT('DECAY',1X,I9,3X,1P,E16.8,0P,3X,'#',1X,A)
 905  FORMAT(3X,1P,E16.8,0P,3X,I2,3X,I9,1X,I9,1X,2X,'#',1X,A)
 906  FORMAT('#',1X,A,3X,E16.8)
 907  FORMAT(A,1P,E16.8,A)
 913  FORMAT(2X,I4,I4,10X,A)
 914  FORMAT(1X,I5,3X,1P,I16,0P,3X,'#',1X,A)
 916  FORMAT(A,I1,4E16.8)
 917  FORMAT(A,4E16.8)
 918  FORMAT(1X,I5,3X,A,F6.1,'-',F5.1,A)
 919  FORMAT(1X,I5,3X,A,F6.2)
 920  FORMAT('#',0P,I5,3X,1P,E16.8,0P,3X,'#',1X,A)
 921  FORMAT(1X,I2,1X,I2,3X,'#',1X,A)

      END
