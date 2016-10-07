(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



(* ---------- Calculate Tadpole Equations ------- *)

(*
 CalcTadpoleEquations[pot_,vevDef_]:=Block[{TadpoleEquations,vevEx={}},


potSave=pot;

Print["Calculate Tadpole Equations"];

TadpoleEquations = {};

For[i=1,i<= Length[vevDef],
If[FreeQ[vevEx,vevDef[[i,2,1]]],
(* TadpoleEquations = Join[TadpoleEquations, {Simplify[makeSumAll[CalcDelta[DPV[pot,vevDef[[i,2,1]],1,1]/.Map[vacHead,vacuum]/.Mom[_]->0 /.zero[a_]->0*a  ]/.sum[gt1,a___]->1]]}]; *)
TadpoleEquations = Join[TadpoleEquations, {Simplify[makeSumAll[CalcDelta[DPTad[pot,vevDef[[i,2,1]],1]/.Map[vacHead,vacuum]/.Mom[_]->0 /.zero[a_]->0*a  ]/.sum[gt1,a___]->1]]}];
vevEx = Join[vevEx,{vevDef[[i,2,1]]}];
];
i++;];

Return[TadpoleEquations] /. subAlways;

]; *) 

CalcTadpoleEquations[pot_,ES_]:=Block[{TadpoleEquations,vevEx={},temp,TadWF={}},
potSave=pot;
potSaveTadpoleEquations=pot;
savetad={};
savetad2={};

Print["Calculate Tadpole Equations"];

TadpoleEquations = {};


For[i=1,i<= Length[SA`ScalarHF[ES]],
temp=Simplify[makeSumAll[CalcDelta[DPTad[pot /. subAlways,SA`ScalarHF[ES][[i]],1]/.Map[vacHead,vacuum]/.Mom[_]->0 /.zero[a_]->0*a  ]/.sum[gt1,a___]->1]];

savetad=Join[savetad,{DPTad[pot/. subAlways,SA`ScalarHF[ES][[i]],1]/.Map[vacHead,vacuum]/.Mom[_]->0 /.zero[a_]->0*a }];
savetad2=Join[savetad2,{temp}];
TadpoleEquations = Join[TadpoleEquations, {temp}];
TadpoleEquation[SA`ScalarHF[ES][[i]]]=temp;
TadWF=Join[TadWF,{{SA`ScalarHF[ES][[i]],temp}}];
i++;];


If[SA`CPViolationHiggsSector===True,
For[i=1,i<= Length[SA`PseudoScalarHF[ES]],
temp=Simplify[makeSumAll[CalcDelta[DPTad[pot/. subAlways,SA`PseudoScalarHF[ES][[i]],1]/.Map[vacHead,vacuum]/.Mom[_]->0 /.zero[a_]->0*a  ]/.sum[gt1,a___]->1]];
TadpoleEquations = Join[TadpoleEquations, {temp}];
TadpoleEquation[SA`PseudoScalarHF[ES][[i]]]=temp;
TadWF=Join[TadWF,{{SA`PseudoScalarHF[ES][[i]],temp}}];
i++;];
];

SA`TadpoleEquationsWithField[ES]=TadWF;
Return[TadpoleEquations /. subAlways];

];

DPTad[term_,particle_,t_]:=Block[{part,i},
part=getFull[particle];
If[(Length[getIndizesOld[particle]]==0 && (OnesChecked==True)) || Depth[particle[{gen1}]]==1,
Return[D[term,part]];,
Return[Plus@@Table[D[term,part /. subGC[i]] /. subIndFinal[i,t],{i,1,genMax}]];
]; 
];


SolveTadpoleEquations[Eigenstates_,parameters_]:=Block[{i,j,k,off,i1,i2,temp={},vevs={},basis={},vevWithGen={},TEqu={},subReal = {},subPhases={},
subSPhenoForm={},subSPhenoFormBack={},subGenParameters={},vcount=1},

Print["Solve Tadpole equations for given parameters"];

resLoop={}; resTree={}; EquLoop={}; EquTree={};
SquaredParametersTadpoles={};


For[k=1,k<=Length[NameOfStates],
If[Head[TadpoleEquations[NameOfStates[[k]]]]===List,temp=Join[temp,TadpoleEquations[NameOfStates[[k]]]];];
If[Head[DEFINITION[NameOfStates[[k]]][MatterSector]]===List,basis=Join[basis,DEFINITION[NameOfStates[[k]]][MatterSector]];];
If[Head[DEFINITION[NameOfStates[[k]]][VEVs]]===List,vevs=Join[vevs,DEFINITION[NameOfStates[[k]]][VEVs]];];
k++;];


For[i=1,i<=Length[temp],
For[j=1,j<=getGenALL[vevs[[i,1]]],
TEqu = Join[TEqu, {ReleaseHold[temp[[i]] /. {gt1->j}/. sum[a_,b_,c_,d_]->Hold[Sum[d,{a,b,c}]]]}];
If[getGenALL[vevs[[i,1]]]===1,
vevWithGen=Join[vevWithGen,{vevs[[i,2,1]]}];,
vevWithGen = Join[vevWithGen,{vevs[[i,2,1]][j]}];
];
j++;];
i++;];

(* to match calculated correction to the right vev *)
vevTemp=Map[Sort[#,(Position[basis,vevs[[Position[vevs,#][[1,1]]]][[4,1]]][[1,3]]<Position[basis,vevs[[Position[vevs,#2][[1,1]]]][[4,1]]][[1,3]])&]&,listVEVseparated];
subTadpoleNumber={};
For[i=1,i<=Length[ScalarsForTadpoles],
For[j=1,j<=Length[listVEVseparated[[i]]],
If[getGenALL[vevTemp[[i,j]]]===1,
subTadpoleNumber = Join[subTadpoleNumber,{vevTemp[[i,j]]->vcount}];
vcount++;,
For[k=1,k<=getGenALL[vevTemp[[i,j]]],
subTadpoleNumber = Join[subTadpoleNumber,{vevTemp[[i,j]][k]->vcount}];
vcount++;
k++;];
];
j++;];
i++;];

For[i=1,i<=Length[TEqu],
EquLoop = Join[EquLoop,{TEqu[[i]]-Tad1Loop[vevWithGen[[i]]  /. subTadpoleNumber]==0}];
EquTree = Join[EquTree,{TEqu[[i]]==0}];
i++;];


ParToSolve={};

Print[EquTree];

For[i=1,i<=Length[parameters],
temp = parameters[[i]] /. a_[b_Integer]->a  /. a_[b_Integer,c_Integer]->a;
subSPhenoForm=Join[subSPhenoForm,{temp-> ToExpression[getOutputNameParameter[temp]]}];
subSPhenoFormBack=Join[subSPhenoFormBack,{ToExpression[getOutputNameParameter[temp]]->temp}];

If[FreeQ[EquTree,conj[parameters[[i]]]]===False,
If[getDimParameter[parameters[[i]]]=!={1} && getDimParameter[parameters[[i]]]=!={},
subGenParameters = Join[subGenParameters,{parameters[[i]]-> Table[parameters[[i]][k],{k,1,getDimParameter[parameters[[i]]][[1]]}]}];
For[k=1,k<= getDimSPheno[parameters[[i]]][[1]],
ph=ToExpression["Signum"<>ToString[getOutputNameParameter[parameters[[i]]]]];
subPhases = Join[subPhases,{parameters[[i]][k] -> parameters[[i]][k]*Exp[I ph[k]]}];
subReal = Join[subReal,{conj[parameters[[i]][k]]->parameters[[i]][k], conj[ph[k]]->ph[k]}];
ParToSolve = Join[ParToSolve,{parameters[[i]][k],ph[k]}];
k++;];,
Print["ph",ph];
ph=ToExpression["Signum"<>ToString[getOutputNameParameter[parameters[[i]]]]];
subPhases = Join[subPhases,{parameters[[i]] -> parameters[[i]]*Exp[I ph]}];
subReal = Join[subReal,{conj[parameters[[i]]]->parameters[[i]],conj[ph]->ph}];
ParToSolve = Join[ParToSolve,{parameters[[i]],ph}];
];,
If[getDimParameter[parameters[[i]]]=!={1} && getDimParameter[parameters[[i]]]=!={},
subGenParameters = Join[subGenParameters,{parameters[[i]]-> Table[parameters[[i]][k],{k,1,getDimParameter[parameters[[i]]][[1]]}]}];
ParToSolve = Join[ParToSolve,Table[parameters[[i]][k],{k,1,getDimParameter[parameters[[i]]][[1]]}]];,
ParToSolve = Join[ParToSolve,{parameters[[i]]}];
];
];
i++;];


EquLoop = EquLoop /. subPhases/. subReal /. subSPhenoForm;
EquTree = EquTree /. subPhases/. subReal /. subSPhenoForm;

Print[subReal,subSPhenoForm];

ParToSolve=Flatten[(ParToSolve /. subSPhenoForm /. subGenParameters)];

freeP=Select[ParToSolve,(FreeQ[EquTree,#]&)];
ParToSolve=DeleteCases[ParToSolve,x_?(FreeQ[EquTree,#]&)];

Print[ParToSolve];

resLoop=Solve[EquLoop,Flatten[(parameters /. subSPhenoForm /. subGenParameters)]] /. subSPhenoFormBack;
resTree=Solve[EquTree,Flatten[(parameters /. subSPhenoForm /. subGenParameters)]]/. subSPhenoFormBack;


(*
NewParametersFromTadpoles={};
SignumsTadpoles={};

If[Length[resLoop]>1,
SubSolutionsTadpolesLoop={};
SubSolutionsTadpolesTree={};
For[i=1,i<=Length[resLoop[[1]]],
If[FreeQ[EquLoop,(resLoop[[1,i,1]]^2 /. subSPhenoForm)],
SubSolutionsTadpolesLoop=Join[SubSolutionsTadpolesLoop,{resLoop[[1,i]]}];
SubSolutionsTadpolesTree=Join[SubSolutionsTadpolesTree,{resTree[[1,i]]}];,
absName = ToExpression["Abs2"<>SPhenoForm[resLoop[[1,i,1]]]];
phaseName=ToExpression["Signum"<>SPhenoForm[resLoop[[1,i,1]]]];
SignumsTadpoles = Join[SignumsTadpoles,{{resLoop[[1,i,1]], phaseName}}];
SquaredParametersTadpoles=Join[SquaredParametersTadpoles,{{absName,resLoop[[1,i,1]],phaseName}}];
NewParametersFromTadpoles=Join[NewParametersFromTadpoles,{absName}];
SPhenoParameters = Join[SPhenoParameters,{{absName,{},{}}}];
realVar=Join[realVar,{absName}];
SubSolutionsTadpolesLoop=Join[SubSolutionsTadpolesLoop,{absName->resLoop[[1,i,2]]^2,resLoop[[1,i,1]]->phaseName*Sqrt[absName]}];
SubSolutionsTadpolesTree=Join[SubSolutionsTadpolesTree,{absName->resTree[[1,i,2]]^2,resTree[[1,i,1]]->phaseName*Sqrt[absName]}];
];
i++;];,
SubSolutionsTadpolesLoop=Flatten[resLoop] ;
SubSolutionsTadpolesTree=Flatten[resTree]; 
];

If[SubSolutionsTadpolesLoop=={},
Message[SPheno::Tadpoles];
];

Print["   Simplify solutions"];

SubSolutionsTadpolesLoop=Simplify[Map[Expand,SubSolutionsTadpolesLoop,3] //. Power[a__, Rational[-1,2]]-> 1/sqrt[a] //. Sqrt[a_]->sqrt[a] //.  sqrt[a_] sqrt[b_]->sqrt[a b] //. sqrt[a_] / sqrt[b_] -> sqrt[a/b] //. sqrt ->Sqrt];
SubSolutionsTadpolesTree=Simplify[Map[Expand,SubSolutionsTadpolesTree,3]//. Power[a__, Rational[-1,2]]-> 1/sqrt[a] //. Sqrt[a_]->sqrt[a] //.  sqrt[a_] sqrt[b_]->sqrt[a b] //. sqrt[a_] / sqrt[b_] -> sqrt[a/b] //. sqrt ->Sqrt]; 
*)

];

