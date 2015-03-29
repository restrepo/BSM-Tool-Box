
(* ::Package:: *)

ParticleDefinitions[GaugeESAxB] =
{
  {q12,     {Description -> "qL12",
           LaTeX -> "\\hat{Q}_{12}",
           OutputName -> "q12"}},
  {l12,     {Description -> "lL12",
           LaTeX -> "\\hat{L}_{12}",
           OutputName -> "l12"}},
  {u12,     {Description -> "uR12",
           LaTeX -> "\\hat{u}_{R12}",
           OutputName -> "u12"}},
  {d12,     {Description -> "dR12",
           LaTeX -> "\\hat{d}_{R12}",
           OutputName -> "d12"}},
  {e12,     {Description -> "eR12",
           LaTeX -> "\\hat{e}_{R12}",
           OutputName -> "e12"}},
  {q3,     {Description -> "qL3",
           LaTeX -> "\\hat{Q}_{3}",
           OutputName -> "q3"}},
  {l3,     {Description -> "lL3",
           LaTeX -> "\\hat{L}_{3}",
           OutputName -> "l3"}},
  {u3,     {Description -> "eR3",
           LaTeX -> "\\hat{u}_{R3}",
           OutputName -> "u3"}},
  {d3,     {Description -> "dR3",
           LaTeX -> "\\hat{d}_{R3}",
           OutputName -> "d3"}},
  {e3,     {Description -> "eR3",
           LaTeX -> "\\hat{e}_{R3}",
           OutputName -> "e3"}},
  {Hd,    {Description -> "Hd",
           LaTeX -> "\\hat{H}_d",
           OutputName -> "Hd"}},
  {Hu,    {Description -> "Hu",
           LaTeX -> "\\hat{H}_u",
           OutputName -> "Hu"}},
  {Ld,    {LaTeX -> "\\hat{L}",
           OutputName -> "Ld"}},
  {Ldt,   {LaTeX -> "\\hat{\\tilde{L}}",
           OutputName -> "Ldt"}},
  {Kd,    {LaTeX -> "\\hat{K}",
           OutputName -> "Kd"}},
  {Ad,    {LaTeX -> "\\hat{A}d",
           OutputName -> "Ad"}},

(* Default MSSM stuff from SARAH *)
      {SHd0, { Description -> "Neutral Down-Higgs"}},
      {SHdm, { Description -> "Charged Down-Higgs"}},
      {SHu0, { Description -> "Neutral Up-Higgs"}},
      {SHup, { Description -> "Charged Up-Higgs"}},

      {SdL12,  { Description -> "Left Down-Squarks 12",
              LaTeX -> "S_{d}^{L12}",
              RParity ->-1,
              OutputName -> "SdL12"}},
      {SdR12,  { Description -> "Right Down-Squarks 12",
              LaTeX -> "S_{d}^{R12}",
              RParity ->-1,
              OutputName -> "SdR12"}},
      {SuL12,  { Description -> "Left Up-Squarks 12",
              LaTeX -> "S_{u}^{L12}",
              RParity ->-1,
              OutputName -> "SuL12"}},
      {SuR12,  { Description -> "Right Up-Squarks 12",
              LaTeX -> "S_{u}^{R12}",
              RParity ->-1,
              OutputName -> "SuR12"}},
      {SeL12,  { Description -> "Left Selectron 12",
              LaTeX -> "S_{e}^{L12}",
              RParity ->-1,
              OutputName -> "SeL12"}},
      {SeR12,  { Description -> "Right Selectron 12",
              LaTeX -> "S_{e}^{R12}",
              RParity ->-1,
              OutputName -> "SeR12"}},
      {SvL12,  { Description -> "Left Sneutrino 12",
              LaTeX -> "S_{\\nu}^{L12}",
              RParity ->-1,
              OutputName -> "SvL12"}},

      {SdL3,  {  Description -> "Left Down-Squarks 3",
              LaTeX -> "S_{d}^{L3}",
              RParity ->-1,
              OutputName -> "SdL3"}},
      {SdR3,  { Description -> "Right Down-Squarks 3",
              LaTeX -> "S_{d}^{R3}",
              RParity ->-1,
              OutputName -> "SdR3"}},
      {SuL3,  { Description -> "Left Up-Squarks 3",
              LaTeX -> "S_{u}^{L3}",
              RParity ->-1,
              OutputName -> "SuL3"}},
      {SuR3,  { Description -> "Right Up-Squarks 3",
              LaTeX -> "S_{u}^{R3}",
              RParity ->-1,
              OutputName -> "SuR3"}},
      {SeL3,  { Description -> "Left Selectron 3",
              LaTeX -> "S_{e}^{L3}",
              RParity ->-1,
              OutputName -> "SeL3"}},
      {SeR3,  { Description -> "Right Selectron 3",
              LaTeX -> "S_{e}^{R3}",
              RParity ->-1,
              OutputName -> "SeR3"}},
      {SvL3,  { Description -> "Left Sneutrino 3",
              LaTeX -> "S_{\\nu}^{L3}",
              RParity ->-1,
              OutputName -> "SvL3"}},

(***********************************)
(* Components of gauge superfields *)
(***********************************)

(* Gauge bosons in gauge ES *)
  {VAB,   {Description -> "U(1) A gauge boson",
           LaTeX -> "B_{A}", 
           RParity -> 1,
           OutputName -> "VAB"}},
  {VAW,   {Description -> "SU(2) A gauge boson",          
           LaTeX -> "W_{A}", 
           RParity -> 1,
           OutputName -> "VAW"}},
  {VBB,   {Description -> "U(1) B gauge boson",                                                   
           LaTeX -> "B_{B}", 
           RParity -> 1,
           OutputName -> "VBB"}},
  {VBW,   {Description -> "SU(2) B gauge boson",          
           LaTeX -> "W_{B}", 
           RParity -> 1,
           OutputName -> "VBW"}},
  {VG,    {Description -> "Gluon"}},          

(* Ghosts *)
  {gAB,   {Description -> "U(1) A ghost",
           LaTeX -> "c_{B_{A}}", 
           OutputName -> "gAB"}},
  {gAW,   {Description -> "SU(2) A ghost",
           LaTeX -> "c_{W_{A}}", 
           OutputName -> "gAW"}},
  {gG,    {Description -> "Gluon Ghost" }},          
  {gBB,   {Description -> "U(1) B ghost",
           LaTeX -> "c_{B_{B}}", 
           OutputName -> "gBB"}},
  {gBW,   {Description -> "SU(2) B ghost",
           LaTeX -> "c_{W_{B}}", 
           OutputName -> "gBW"}},

(* Gauginos in gauge ES *)
  {fAB,   {Description -> "U(1) A Bino",
           LaTeX -> "\\tilde{B}_{A}", 
           RParity -> -1}},
  {fAW,   {Description -> "SU(2) A Wino",
           LaTeX -> "\\tilde{W}_{A}", 
           RParity -> -1}},
  {Glu,   {Description -> "Gluino"}},
  {fBB,   {Description -> "U(1) B Bino",
           LaTeX -> "\\tilde{B}_{B}", 
           RParity -> -1}},
  {fBW,   {Description -> "SU(2) B Wino",
           LaTeX -> "\\tilde{W}_{B}", 
           RParity -> -1}},

(* Linking fields components *)
  {Sld1,  {Description -> "Scalar ld1",
           RParity -> 1,
           LaTeX -> "\\varphi_{l1}"}},
  {Sld2,  {Description -> "Scalar ld2",
           RParity -> 1,
           LaTeX -> "\\varphi_{l2}"}},
  {Sld3,  {Description -> "Scalar ld3",
           RParity -> 1,
           LaTeX -> "\\varphi_{l3}"}},
  {Sld4,  {Description -> "Scalar ld4",
           RParity -> 1,
           LaTeX -> "\\varphi_{l4}"}},
  {Fld1,  {Description -> "Fermion ld1", 
           LaTeX -> "\\chi_{l1}", 
           RParity -> -1}},
  {Fld2,  {Description -> "Fermion ld2", 
           LaTeX -> "\\chi_{l2}", 
           RParity -> -1}},
  {Fld3,  {Description -> "Fermion ld3", 
           LaTeX -> "\\chi_{l3}", 
           RParity -> -1}},
  {Fld4,  {Description -> "Fermion ld4", 
           LaTeX -> "\\chi_{l4}", 
           RParity -> -1}},
  {Sldt1, {Description -> "Scalar ldt1",
           RParity -> 1,
           LaTeX -> "\\tilde{\\varphi}_{lt1}"}},
  {Sldt2, {Description -> "Scalar lt2",
           RParity -> 1,
           LaTeX -> "\\tilde{\\varphi}_{lt2}"}},
  {Sldt3, {Description -> "Scalar lt3",
           RParity -> 1,
           LaTeX -> "\\tilde{\\varphi}_{lt3}"}},
  {Sldt4, {Description -> "Scalar lt4",
           RParity -> 1,
           LaTeX -> "\\tilde{\\varphi}_{lt4}"}},
  {Fldt1, {Description -> "Fermion ldt1", 
           LaTeX -> "\\chi_{lt1}", 
           RParity -> -1}},
  {Fldt2, {Description -> "Fermion ldt2", 
           LaTeX -> "\\chi_{lt2}", 
           RParity -> -1}},
  {Fldt3, {Description -> "Fermion ldt3", 
           LaTeX -> "\\chi_{lt3}", 
           RParity -> -1}},
  {Fldt4, {Description -> "Fermion ldt4", 
           LaTeX -> "\\chi_{lt4}", 
           RParity -> -1}},

  {SKd,   {Description -> "Singlet linking field scalar",
           LaTeX -> "K_{s}", 
           RParity -> 1,
           OutputName -> "SKd"}},
  {FKd,   {Description -> "Singlet linking field fermion",
           LaTeX -> "K_{f}", 
           RParity -> -1,
           OutputName -> "FKd"}},

  {Sad1,  {Description -> "Adjoint linking field component 1 scalar",
           LaTeX -> "Ad_{s}^{1}", 
           RParity -> 1,
           OutputName -> "Sad1"}},
  {Fad1,  {Description -> "Adjoint linking field component 1 fermion"
           LaTeX -> "Ad_{f}^{1}", 
           RParity -> -1,
           OutputName -> "Fad1"}}, 
  {Sad2,  {Description -> "Adjoint linking field component 2 scalar",
           LaTeX -> "Ad_{s}^{2}", 
           RParity -> 1,
           OutputName -> "Sad2"}},
  {Fad2,  {Description -> "Adjoint linking field component 2 fermion"
           LaTeX -> "Ad_{f}^{2}", 
           RParity -> -1,
           OutputName -> "Fad2"}}, 
  {Sad3,  {Description -> "Adjoint linking field component 3 scalar",
           LaTeX -> "Ad_{s}^{3}", 
           RParity -> 1,
           OutputName -> "Sad3"}},
  {Fad3,  {Description -> "Adjoint linking field component 3 fermion"
           LaTeX -> "Ad_{f}^{3}", 
           RParity -> -1,
           OutputName -> "Fad3"}}, 

(* Gauge ES Dirac Spinors *)
  {fGD,   {Description -> "A-color Majorana spinor",
           LaTeX -> "\\tilde{G}_{A}^{D}", 
           OutputName -> "fGD"}},

  {FH0D,  {Description -> "Neutral higgsino Majorana spinor",
           LaTeX -> "\\tilde{H}^{0}", 
           OutputName -> "FH0D"}},
  {FHCD,  {Description -> "Charged Higgsino Majorana spinor",
           LaTeX -> "\\tilde{H}^{-}", 
           OutputName -> "FHCD"}},


  {FdL12D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "d_{L12}^{D}",
           OutputName -> "FdL12D"}},
  {FdR12D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "d_{R12}^{D}", 
           OutputName -> "FdR12D"}},
  {FuL12D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "u_{L12}^{D}", 
           OutputName -> "FuL12D"}},
  {FuR12D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "u_{R12}^{D}", 
           OutputName -> "FuR12D"}},
  {FeL12D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "e_{L12}^{D}", 
           OutputName -> "FeL12D"}},
  {FeR12D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "e_{R12}^{D}", 
           OutputName -> "FeR12D"}},
  {FvL12D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "\\nu_{L12}^{D}", 
           OutputName -> "FvL12D"}},

  {FdL3D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "d_{L3}^{D}",
           OutputName -> "FdL3D"}},
  {FdR3D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "d_{R3}^{D}",
           OutputName -> "FdR3D"}},
  {FuL3D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "u_{L3}^{D}",
           OutputName -> "FuL3D"}},
  {FuR3D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "u_{R3}^{D}",
           OutputName -> "FuR3D"}},
  {FeL3D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "e_{L3}^{D}",
           OutputName -> "FeL3D"}},
  {FeR3D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "e_{R3}^{D}",
           OutputName -> "FeR3D"}},
  {FvL3D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "\\nu_{L3}^{D}",
           OutputName -> "FvL3D"}},


  {q12,     {Description -> "qL12",
           LaTeX -> "\\hat{Q}_{12}",
           OutputName -> "q12"}},
  {l12,     {Description -> "lL12",
           LaTeX -> "\\hat{L}_{12}",
           OutputName -> "l12"}},
  {u12,     {Description -> "uR12",
           LaTeX -> "\\hat{u}_{R12}",
           OutputName -> "u12"}},
  {d12,     {Description -> "dR12",
           LaTeX -> "\\hat{d}_{R12}",
           OutputName -> "d12"}},
  {e12,     {Description -> "eR12",
           LaTeX -> "\\hat{e}_{R12}",
           OutputName -> "e12"}},

  {q3,     {Description -> "qL3",
           LaTeX -> "\\hat{Q}_{3}",
           OutputName -> "q3"}},
  {l3,     {Description -> "lL3",
           LaTeX -> "\\hat{L}_{3}",
           OutputName -> "l3"}},
  {u3,     {Description -> "eR3",
           LaTeX -> "\\hat{u}_{R3}",
           OutputName -> "u3"}},
  {d3,     {Description -> "dR3",
           LaTeX -> "\\hat{d}_{R3}",
           OutputName -> "d3"}},
  {e3,     {Description -> "eR3",
           LaTeX -> "\\hat{e}_{R3}",
           OutputName -> "e3"}},
  {Hd,    {Description -> "Hd",
           LaTeX -> "\\hat{H}_d",
           OutputName -> "Hd"}},
  {Hu,    {Description -> "Hu",
           LaTeX -> "\\hat{H}_u",
           OutputName -> "Hu"}},
  {Ld,    {LaTeX -> "\\hat{L}",
           OutputName -> "Ld"}},
  {Ldt,   {LaTeX -> "\\hat{\\tilde{L}}",
           OutputName -> "Ldt"}},
  {Kd,    {LaTeX -> "\\hat{K}",
           OutputName -> "Kd"}},
  {Ad,    {LaTeX -> "\\hat{A}d",
           OutputName -> "Ad"}}

};
      
      
      

ParticleDefinitions[AxBSB] = 
{

  {q12,     {Description -> "qL12",
           LaTeX -> "\\hat{Q}_{12}",
           OutputName -> "q12"}},
  {l12,     {Description -> "lL12",
           LaTeX -> "\\hat{L}_{12}",
           OutputName -> "l12"}},
  {u12,     {Description -> "uR12",
           LaTeX -> "\\hat{u}_{R12}",
           OutputName -> "u12"}},
  {d12,     {Description -> "dR12",
           LaTeX -> "\\hat{d}_{R12}",
           OutputName -> "d12"}},
  {e12,     {Description -> "eR12",
           LaTeX -> "\\hat{e}_{R12}",
           OutputName -> "e12"}},

  {q3,     {Description -> "qL3",
           LaTeX -> "\\hat{Q}_{3}",
           OutputName -> "q3"}},
  {l3,     {Description -> "lL3",
           LaTeX -> "\\hat{L}_{3}",
           OutputName -> "l3"}},
  {u3,     {Description -> "eR3",
           LaTeX -> "\\hat{u}_{R3}",
           OutputName -> "u3"}},
  {d3,     {Description -> "dR3",
           LaTeX -> "\\hat{d}_{R3}",
           OutputName -> "d3"}},
  {e3,     {Description -> "eR3",
           LaTeX -> "\\hat{e}_{R3}",
           OutputName -> "e3"}},
  {Hd,    {Description -> "Hd",
           LaTeX -> "\\hat{H}_d",
           OutputName -> "Hd"}},
  {Hu,    {Description -> "Hu",
           LaTeX -> "\\hat{H}_u",
           OutputName -> "Hu"}},
  {Ld,    {LaTeX -> "\\hat{L}",
           OutputName -> "Ld"}},
  {Ldt,   {LaTeX -> "\\hat{\\tilde{L}}",
           OutputName -> "Ldt"}},
  {Kd,    {LaTeX -> "\\hat{K}",
           OutputName -> "Kd"}},
  {Ad,    {LaTeX -> "\\hat{A}d",
           OutputName -> "Ad"}},

(* Default MSSM stuff from SARAH *)
      {SHd0, { Description -> "Neutral Down-Higgs"}},
      {SHdm, { Description -> "Charged Down-Higgs"}},
      {SHu0, { Description -> "Neutral Up-Higgs"}},
      {SHup, { Description -> "Charged Up-Higgs"}},
      {Glu,  { Description -> "Gluino"}},
      {H0,   { Description -> "Neutral Higgsinos"}},
      {HC,   { Description -> "Charged Higgsinos"}},

      {SdL12,  {  Description -> "Left Down-Squarks 12",
              LaTeX -> "S_{d}^{L12}",
              RParity ->-1,
              OutputName -> "SdL12"}},
      {SdR12,  { Description -> "Right Down-Squarks 12",
              LaTeX -> "S_{d}^{R12}",
              RParity ->-1,
              OutputName -> "SdR12"}},
      {SuL12,  { Description -> "Left Up-Squarks 12",
              LaTeX -> "S_{u}^{L12}",
              RParity ->-1,
              OutputName -> "SuL12"}},
      {SuR12,  { Description -> "Right Up-Squarks 12",
              LaTeX -> "S_{u}^{R12}",
              RParity ->-1,
              OutputName -> "SuR12"}},
      {SeL12,  { Description -> "Left Selectron 12",
              LaTeX -> "S_{e}^{L12}",
              RParity ->-1,
              OutputName -> "SeL12"}},
      {SeR12,  { Description -> "Right Selectron 12",
              LaTeX -> "S_{e}^{R12}",
              RParity ->-1,
              OutputName -> "SeR12"}},
      {SvL12,  { Description -> "Left Sneutrino 12",
              LaTeX -> "S_{\\nu}^{L12}",
              RParity ->-1,
              OutputName -> "SvL12"}},

      {SdL3,  {  Description -> "Left Down-Squarks 3",
              LaTeX -> "S_{d}^{L3}",
              RParity ->-1,
              OutputName -> "SdL3"}},
      {SdR3,  { Description -> "Right Down-Squarks 3",
              LaTeX -> "S_{d}^{R3}",
              RParity ->-1,
              OutputName -> "SdR3"}},
      {SuL3,  { Description -> "Left Up-Squarks 3",
              LaTeX -> "S_{u}^{L3}",
              RParity ->-1,
              OutputName -> "SuL3"}},
      {SuR3,  { Description -> "Right Up-Squarks 3",
              LaTeX -> "S_{u}^{R3}",
              RParity ->-1,
              OutputName -> "SuR3"}},
      {SeL3,  { Description -> "Left Selectron 3",
              LaTeX -> "S_{e}^{L3}",
              RParity ->-1,
              OutputName -> "SeL3"}},
      {SeR3,  { Description -> "Right Selectron 3",
              LaTeX -> "S_{e}^{R3}",
              RParity ->-1,
              OutputName -> "SeR3"}},
      {SvL3,  { Description -> "Left Sneutrino 3",
              LaTeX -> "S_{\\nu}^{L3}",
              RParity ->-1,
              OutputName -> "SvL3"}},


(* Gauge bosons *)
  {VBL,   {Description -> "Light B gauge boson",
           LaTeX -> "B_{L}", 
           RParity -> 1,
           OutputName -> "VBL"}},
  {VBM,   {Description -> "Heavy B gauge boson",
           LaTeX -> "B_{H}", 
           Goldstone -> sigmaf[{1}],
           RParity -> 1,
           OutputName -> "VBM"}},
  {VW1L,  {Description -> "Light W1 gauge boson",
           LaTeX -> "W_{L}^{1}", 
           RParity -> 1,
           OutputName -> "VW1L"}},
  {VW1M,  {Description -> "Heavy W1 gauge boson",
           LaTeX -> "W_{H}^{1}", 
           Goldstone -> sigmaf[{2}],
           RParity -> 1,
           OutputName -> "VW1M"}},
  {VW2L,  {Description -> "Light W2 gauge boson",
           LaTeX -> "W_{L}^{2}", 
           RParity -> 1,
           OutputName -> "VW2L"}},
  {VW2M,  {Description -> "Heavy W2 gauge boson",
           LaTeX -> "W_{H}^{2}", 
           Goldstone -> sigmaf[{3}],
           RParity -> 1,
           OutputName -> "VW2M"}},
  {VW3L,  {Description -> "Light W3 gauge boson",
           LaTeX -> "W_{L}^{3}", 
           RParity -> 1,
           OutputName -> "VW3L"}},
  {VW3M,  {Description -> "Heavy W3 gauge boson",
           LaTeX -> "W_{H}^{3}", 
           Goldstone -> sigmaf[{4}],
           RParity -> 1,
           OutputName -> "VW3M"}},
  {VG,    {Description -> "Gluon"}},          

(* Ghosts *)
  {gBL,   {Description -> "Light B gauge boson",
           LaTeX -> "\\eta{B_{L}}", 
           OutputName -> "gBL"}},
  {gBM,   {Description -> "Heavy B gauge boson",
           LaTeX -> "\\eta{B_{H}}", 
	   OutputName -> "gBM"}},
  {gW1L,  {Description -> "Light W1 gauge boson",
           LaTeX -> "\\eta{W_{L}^{1}}", 
           OutputName -> "gW1L"}},
  {gW1M,  {Description -> "Heavy W1 gauge boson",
           LaTeX -> "\\eta{W_{H}^{1}}", 
           OutputName -> "gW1M"}},
  {gW2L,  {Description -> "Light W2 gauge boson",
           LaTeX -> "\\eta{W_{L}^{2}}", 
           OutputName -> "gW2L"}},
  {gW2M,  {Description -> "Heavy W2 gauge boson",
           LaTeX -> "\\eta{W_{H}^{2}}", 
           OutputName -> "gW2M"}},
  {gW3L,  {Description -> "Light W3 gauge boson",
           LaTeX -> "\\eta{W_{L}^{3}}", 
           OutputName -> "gW3L"}},
  {gW3M,  {Description -> "Heavy W3 gauge boson",
           LaTeX -> "\\eta{W_{H}^{3}}", 
           OutputName -> "gW3M"}},
  {gG,    {Description -> "Gluon Ghost" }},          


(* Gauginos - Dirac spinors *)
  {fBLD,  {Description -> "Light hypercharge-ino Dirac",
            LaTeX -> "\\tilde{B}_L^{D}", 
            RParity -> -1,
            OutputName -> "fBLD"}},
  {fBMD,  {Description -> "Heavy hypercharge-ino Dirac",
           LaTeX -> "\\tilde{B}_H^{D}", 
           RParity -> -1,
           OutputName -> "fBMD"}},
  {fW1LD, {Description -> "Light W1-ino Dirac",
           LaTeX -> "\\tilde{W}^{1D}_L", 
           RParity -> -1,
           OutputName -> "fW1LD"}},
  {fW1MD, {Description -> "Heavy W1-ino Dirac",
           LaTeX -> "\\tilde{W}^{1D}_H", 
           RParity -> -1,
           OutputName -> "fW1MD"}},
  {fW2LD, {Description -> "Light W2-ino Dirac",
           LaTeX -> "\\tilde{W}^{2D}_L", 
           RParity -> -1,
           OutputName -> "fW2LD"}},
  {fW2MD, {Description -> "Heavy W2-ino Dirac",
           LaTeX -> "\\tilde{W}^{2D}_H", 
           RParity -> -1,
           OutputName -> "fW2MD"}},
  {fW3LD, {Description -> "Light W3-ino Dirac",
           LaTeX -> "\\tilde{W}^{3D}_L", 
           RParity -> -1,
           OutputName -> "fW3LD"}},
  {fW3MD, {Description -> "Heavy W3-ino Dirac",
           LaTeX -> "\\tilde{W}^{3D}_H", 
           RParity -> -1,
           OutputName -> "fW3MD"}},
  {fGD,   {Description -> "SU(3) A gluino Dirac",
           LaTeX -> "\\tilde{G}_{AD}", 
           RParity -> -1,
           OutputName -> "fGD"}},



(* Fermion mass eigenstates after AxB breaking in generic collective form *)
  {Pof,   {Description -> "Linking/Ad/K neutral fermion mass eigenstates after AxB breaking \n ",
           LaTeX -> "f_{Po}^{0}", 
           RParity -> -1,
           OutputName -> "Pof"}}, 
  {Gof,   {Description -> "Linking/Ad charged fermion mass eigenstates after AxB breaking \n ",
           LaTeX -> "f_{Go}^{-}", 
           RParity -> -1,
           OutputName -> "Gof"}}, 

(* Scalar mass eigenstates after AxB breaking in generic collective form *)
  {phif,  {Description -> "Linking fields real scalars \n ",
           LaTeX -> "\\phi_{L}^{0}", 
           RParity -> 1,
           OutputName -> "phif"}}, 
  {sigmaf,{Description -> "Linking fields imaginary scalars \n ",
           LaTeX -> "\\sigma_{L}^{0}", 
           RParity -> 1,
           OutputName -> "sigmaf"}}, 
  {omegaf,{Description -> "Linking fields charged scalars  ",
           LaTeX -> "\\sigma_{L}^{\\pm}", 
           RParity -> 1,
           OutputName -> "omegaf"}},
  {SaF,   {Description -> "Final heavy scalars 2  \n",
           LaTeX -> "\\phi_{S}^{s}",
           RParity -> 1,
           OutputName -> "SaF"}},
  {BaF,   {Description -> "Final heavy scalars 2  \n",
           LaTeX -> "\\phi_{B}^{s}",
           RParity -> 1,
           OutputName -> "BaF"}},
  {Sad1,  {Description -> "Adjoint linking field component 1 scalar",
           LaTeX -> "Ad_{s}^{1}",
           RParity -> 1,
           OutputName -> "Sad1"}},
(* Gauge ES Dirac Spinors *)
  {FH0D,  {Description -> "Neutral higgsino Majorana spinor",
           LaTeX -> "\\tilde{H}^{0}", 
           OutputName -> "FH0D"}},
  {FHCD,  {Description -> "Charged Higgsino Majorana spinor",
           LaTeX -> "\\tilde{H}^{-}", 
           OutputName -> "FHCD"}},

  {FdL12D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "d_{L12}^{D}",
           OutputName -> "FdL12D"}},
  {FdR12D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "d_{R12}^{D}",
           OutputName -> "FdR12D"}},
  {FuL12D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "u_{L12}^{D}",
           OutputName -> "FuL12D"}},
  {FuR12D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "u_{R12}^{D}",
           OutputName -> "FuR12D"}},
  {FeL12D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "e_{L12}^{D}",
           OutputName -> "FeL12D"}},
  {FeR12D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "e_{R12}^{D}",
           OutputName -> "FeR12D"}},
  {FvL12D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "\\nu_{L12}^{D}",
           OutputName -> "FvL12D"}},


  {FdL3D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "d_{L3}^{D}",
           OutputName -> "FdL3D"}},
  {FdR3D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "d_{R3}^{D}",
           OutputName -> "FdR3D"}},
  {FuL3D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "u_{L3}^{D}",
           OutputName -> "FuL3D"}},
  {FuR3D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "u_{R3}^{D}",
           OutputName -> "FuR3D"}},
  {FeL3D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "e_{L3}^{D}",
           OutputName -> "FeL3D"}},
  {FeR3D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "e_{R3}^{D}",
           OutputName -> "FeR3D"}},
  {FvL3D,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "\\nu_{L3}^{D}",
           OutputName -> "FvL3D"}}



};    
        

        
WeylFermionAndIndermediate = 
{

(* Gauge Superfields *)
  {AB,    {LaTeX -> "\\hat{B}_{A}", 
           OutputName -> "AB"}},                   
  {AW,    {LaTeX -> "\\hat{W}_{A}", 
           OutputName -> "AW"}},                   
  {G,     {LaTeX -> "\\hat{G}_{A}", 
           OutputName -> "G"}},                   
  {BB,    {LaTeX -> "\\hat{B}_{B}", 
           OutputName -> "BB"}},                   
  {BW,    {LaTeX -> "\\hat{W}_{B}", 
           OutputName -> "BW"}},      

(* Chiral superfields *)

 {q12,     {Description -> "qL12",
           LaTeX -> "\\hat{Q}_{12}",
           OutputName -> "q12"}},
  {l12,     {Description -> "lL12",
           LaTeX -> "\\hat{L}_{12}",
           OutputName -> "l12"}},
  {u12,     {Description -> "uR12",
           LaTeX -> "\\hat{u}_{R12}",
           OutputName -> "u12"}},
  {d12,     {Description -> "dR12",
           LaTeX -> "\\hat{d}_{R12}",
           OutputName -> "d12"}},
  {e12,     {Description -> "eR12",
           LaTeX -> "\\hat{e}_{R12}",
           OutputName -> "e12"}},

  {q3,     {Description -> "qL3",
           LaTeX -> "\\hat{Q}_{3}",
           OutputName -> "q3"}},
  {l3,     {Description -> "lL3",
           LaTeX -> "\\hat{L}_{3}",
           OutputName -> "l3"}},
  {u3,     {Description -> "eR3",
           LaTeX -> "\\hat{u}_{R3}",
           OutputName -> "u3"}},
  {d3,     {Description -> "dR3",
           LaTeX -> "\\hat{d}_{R3}",
           OutputName -> "d3"}},
  {e3,     {Description -> "eR3",
           LaTeX -> "\\hat{e}_{R3}",
           OutputName -> "e3"}},
  {Hd,    {Description -> "Hd",
           LaTeX -> "\\hat{H}_d",
           OutputName -> "Hd"}},
  {Hu,    {Description -> "Hu",
           LaTeX -> "\\hat{H}_u",
           OutputName -> "Hu"}},
  {Ld,    {LaTeX -> "\\hat{L}",
           OutputName -> "Ld"}},
  {Ldt,   {LaTeX -> "\\hat{\\tilde{L}}",
           OutputName -> "Ldt"}},
  {Ad,    {LaTeX -> "\\hat{A}d",
           OutputName -> "Ad"}},
  {Ld,    {LaTeX -> "\\hat{L}", 
           OutputName -> "Ld"}}, 
  {Ldt,   {LaTeX -> "\\hat{\\tilde{L}}", 
           OutputName -> "Ldt"}}, 
  {Kd,    {LaTeX -> "\\hat{K}", 
           OutputName -> "Kd"}}, 
  {Ad,    {LaTeX -> "\\hat{A}d", 
           OutputName -> "Ad"}}, 
                  
(* Higgsinos *)
  {FHd0,  {Description -> "Neutral Down-Higgsino",
           LaTeX -> "\\tilde{H}_{d}^{0}", 
           RParity -> -1,
           OutputName -> "FHd0"}},
  {FHdm,  {Description -> "Charged Down-Higgsino",
           LaTeX -> "\\tilde{H}_{d}^{-}", 
           RParity -> -1,
           OutputName -> "FHdm"}},
  {FHu0,  {Description -> "Neutral Up-Higgsino",
           LaTeX -> "\\tilde{H}_{u}^{0}", 
           RParity -> -1,
           OutputName -> "FHu0"}},
  {FHup,  {Description -> "Charged Up-Higgsino",
           LaTeX -> "\\tilde{H}_{u}^{+}", 
           RParity -> -1,
           OutputName -> "FHup"}},

(* Gauginos *)
  {fBL,   {Description -> "Light bino",                         
           LaTeX -> "\\tilde{B}_{L}", 
           RParity -> -1,
           OutputName -> "fBL"}},
  {fBM,   {Description -> "Heavy bino",                         
           LaTeX -> "\\tilde{B}_{H}", 
           RParity -> -1,
           OutputName -> "fBM"}},
  {fW1L,  {Description -> "Light wino 1",                         
           LaTeX -> "\\tilde{B}_{L}", 
           RParity -> -1,
           OutputName -> "fW1L"}},
  {fW1M,   {Description -> "Heavy Wino 1",                         
            LaTeX -> "\\tilde{B}_{L}", 
            RParity -> -1,
            OutputName -> "fW1M"}},
  {fW2L,   {Description -> "Light Wino 2",                         
            LaTeX -> "\\tilde{B}_{L}", 
            RParity -> -1,
            OutputName -> "fW2L"}},
  {fW2M,   {Description -> "Heavy Wino 2",                         
            LaTeX -> "\\tilde{B}_{L}", 
            RParity -> -1,
            OutputName -> "fW2M"}},
  {fW3L,   {Description -> "Light Wino 3",                         
            LaTeX -> "\\tilde{B}_{L}", 
            RParity -> -1,
            OutputName -> "fW3L"}},
  {fW3M,   {Description -> "Heavy Wino 3",                         
            LaTeX -> "\\tilde{B}_{L}", 
            RParity -> -1,
            OutputName -> "fW3M"}},
  {fG,     {Description -> "SU(3) A gluino",
            LaTeX -> "\\tilde{G}_{A}", 
            RParity -> -1,
            OutputName -> "fG"}},


(* Chiral superfield components *)

  {SHd,   {LaTeX -> "\\tilde{H}_d",
           RParity -> 1,
           OutputName -> "SHd"}},
  {SHu,   {LaTeX -> "\\tilde{H}_u",
           RParity -> 1,
           OutputName -> "SHu"}},
  {SLd,   {LaTeX -> "L_{s}",
           RParity -> 1,
           OutputName -> "SLd"}}, 
  {SLdt,  {LaTeX -> "\\tilde{L}_{s}",
           RParity -> 1,
           OutputName -> "SLdt"}}, 

  {SKd,   {LaTeX -> "\\tilde{K}_d",
           RParity -> 1,
           OutputName -> "SKd"}}, 
  {SAd,   {LaTeX -> "Ad_s", 
           RParity -> 1,
           OutputName -> "SAd"}}, 

  {FHd,   {LaTeX -> "H_d",
           RParity -> -1,
           OutputName -> "FHd"}},
  {FHu,   {LaTeX -> "H_u",
           RParity -> -1,
           OutputName -> "FHu"}},
  {FLd,   {LaTeX -> "L_{f}", 
           RParity -> -1,
           OutputName -> "FLd"}}, 
  {FLdt,  {LaTeX -> "\\tilde{L}_{f}", 
           RParity -> -1,
           OutputName -> "FLdt"}}, 
  {FKd,   {LaTeX -> "K_d", 
           RParity -> -1,
           OutputName -> "FKd"}}, 
  {FAd,   {LaTeX -> "Ad_f", 
           RParity -> -1,
           OutputName -> "FAd"}},

(* Linking field scalar components after VEV acquisition*)
  {phild1,    {Description -> "phi ld1",
               RParity -> 1,
               LaTeX -> "\\phi_{L1}"}},
  {sigmald1,  {Description -> "sigma ld1",
               RParity -> 1,
               LaTeX -> "\\sigma_{L1}"}},
  {phild4,    {Description -> "phi ld4",
               RParity -> 1,
               LaTeX -> "\\phi_{L4}"}},
  {sigmald4,  {Description -> "sigma ld4",
               RParity -> 1,
               LaTeX -> "\\sigma_{L4}"}},
  {phildt1,   {Description -> "phi ldt1",
               RParity -> 1,
               LaTeX -> "\\phi_{Lt1}"}},
  {sigmaldt1, {Description -> "sigma ldt1",
               RParity -> 1,
               LaTeX -> "\\sigma_{Lt1}"}},
  {phildt4,   {Description -> "phi ldt4" ,
               RParity -> 1,
               LaTeX -> "\\phi_{Lt4}"}},
  {sigmaldt4, {Description -> "sigma ldt4",
               RParity -> 1,
               LaTeX -> "\\sigma_{Lt4}"}},
  {sigmald,   {Description -> "sigma Ld"  ,
               RParity -> 1,
               LaTeX -> "\\sigma_{L}"}},
  {sigmaldt,  {Description -> "sigma Ldt"  ,
               RParity -> 1,
               LaTeX -> "\\sigma_{\\tilde{L}}"}},
  {phild,     {Description -> "phi L" ,
               RParity -> 1,
               LaTeX -> "\\phi_{L}"}},
  {phildt,    {Description -> "phi Ltilde",
               RParity -> 1,
               LaTeX -> "\\phi_{\\tilde{L}}"}},
 
(* Fermion mass eigenstates after AxB breaking in generic collective form *)
  {Po,    {Description -> "Linking/Ad/K neutral fermion mass eigenstates after AxB breaking \n ",
           LaTeX -> "f_{Po}^{0}", 
           RParity -> -1,
           OutputName -> "Po"}}, 
  {Go,    {Description -> "Linking/Ad charged fermion mass eigenstates after AxB breaking \n ",
           LaTeX -> "f_{Go}^{+}", 
           RParity -> -1,
           OutputName -> "Go"}}, 

(* Usual fermions - still massless *)

 {FdL12,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "d_{L12}^{}",
           OutputName -> "FdL12"}},
  {FdR12,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "d_{R12}^{}",
           OutputName -> "FdR12"}},
  {FuL12,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "u_{L12}^{}",
           OutputName -> "FuL12"}},
  {FuR12,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "u_{R12}^{}",
           OutputName -> "FuR12"}},
  {FeL12,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "e_{L12}^{}",
           OutputName -> "FeL12"}},
  {FeR12,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "e_{R12}^{}",
           OutputName -> "FeR12"}},
  {FvL12,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "\\nu_{L12}^{}",
           OutputName -> "FvL12"}},

  {FdL3,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "d_{L3}^{}",
           OutputName -> "FdL3"}},
  {FdR3,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "d_{R3}^{}",
           OutputName -> "FdR3"}},
  {FuL3,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "u_{L3}^{}",
           OutputName -> "FuL3"}},
  {FuR3,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "u_{R3}^{}",
           OutputName -> "FuR3"}},
  {FeL3,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "e_{L3}^{}",
           OutputName -> "FeL3"}},
  {FeR3,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "e_{R3}^{}",
           OutputName -> "FeR3"}},
  {FvL3,  {Description -> "A-hypercharge Majorana spinor",
           LaTeX -> "\\nu_{L3}^{}",
           OutputName -> "FvL3"}}
}