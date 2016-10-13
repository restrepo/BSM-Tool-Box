Off[General::spell]

Model`Name = "radinertRSIII";
Model`NameLaTeX ="Fermion Triplet plus Scalar Doublet";
Model`Authors = "M.L Sanchez-Pelaez";
Model`Date = "2016-18-08";


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)


(* Global Symmetries *)
Global[[1]] = {Z[2], Z2};

(* Gauge Groups *)

Gauge[[1]]={B,   U[1], hypercharge, g1, False, 1};
Gauge[[2]]={WB, SU[2], left,        g2, True,  1};
Gauge[[3]]={G,  SU[3], color,       g3, False, 1};


(* Matter Fields *)

FermionFields[[1]] = {q, 3, {uL, dL},     1/6, 2,  3, 1};  
FermionFields[[2]] = {l, 3, {vL, eL},    -1/2, 2,  1, 1};
FermionFields[[3]] = {d, 3, conj[dR],     1/3, 1, -3, 1};
FermionFields[[4]] = {u, 3, conj[uR],    -2/3, 1, -3, 1};
FermionFields[[5]] = {e, 3, conj[eR],       1, 1,  1, 1};

(* Extra Fermion Field *)
FermionFields[[6]] = {T, 3, { {t0/Sqrt[2], tp},{ tm, -t0/Sqrt[2]} },  0, 3,  1, -1};


ScalarFields[[1]] =  {H, 1, {Hp, H0},     1/2, 2,  1, 1};

(* Extra Scalar Field *)
ScalarFields[[2]] =  {Et, 1, {etp,et0},    1/2, 2,  1, -1};

        
(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][LagrangianInput]= 
{
    {LagFer   ,      {AddHC->True}},
    {LagH     ,      {AddHC->False}},
    {LagEt    ,      {AddHC->False}},
    {LagHEt   ,      {AddHC->False}},
    {LagHEtHC ,      {AddHC->True}},
    {LagTR    ,      {AddHC->True}},
    {LagEtTR  ,      {AddHC->True}}
};


LagFer   = Yd conj[H].d.q + Ye conj[H].e.l + Yu H.u.q;
LagH     = -(+ mH2 conj[H].H     +  lambda1 conj[H].H.conj[H].H );
LagEt    = -(+ mEt2 conj[Et].Et  +  lambda2 conj[Et].Et.conj[Et].Et );
LagHEt   = -(+ lambda3 conj[H].H.conj[Et].Et + lambda4 conj[H].Et.conj[Et].H );
LagHEtHC = -(+ 1/2 lambda5 conj[H].Et.conj[H].Et );
LagTR    = - MTF/2 T.T;
LagEtTR  = Yn Et.T.l;


(*
LagNoHC =  mu2 conj[H].H - 1/2 \[Lambda] conj[H].H.conj[H].H ;  
LagHC   =  - (Yd conj[H].d.q + Ye conj[H].e.l + Yu H.u.q);
LagTR   =  - MTF/2 T.T;
*)
			  		  

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};     
        
                  	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{
    {H0, {v, 1/Sqrt[2]}, {Ah, \[ImaginaryI]/Sqrt[2]},{hh, 1/Sqrt[2]}},
    {et0, {0, 0}, {etI, \[ImaginaryI]/Sqrt[2]}, {etR, 1/Sqrt[2]}}
    
};
 

DEFINITION[EWSB][MatterSector]=   
{
    {{vL}, {VL, Vv}},
    {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
    {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
    {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}}
};  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]=
{
 Fd  -> {  DL, conj[DR]},
 Fe  -> {  EL, conj[ER]},
 Fu  -> {  UL, conj[UR]},
 Fv  -> {  VL, conj[VL]},
 Ft0 -> {  t0, conj[t0]},
 Ftc -> {  tm, conj[tp]}
};
 

DEFINITION[EWSB][GaugeES]=
{
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}
};



