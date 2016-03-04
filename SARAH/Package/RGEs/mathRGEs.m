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



DeltaQ[x_]:=If[x===Delta, DeltaQ[x]=False;Return[False];,DeltaQ[x]=True;Return[True];];



 subRGENoDelta={
sumRGE[s_,x_,y_]A_[s_]B_[s_]-> ScalarProd[A,B],
sumRGE[s_,x_,y_]A_[s_,a__]B_[s_,b__]-> MatMul[Tp[A],B][a,b],


sumRGE[s_,x_,y_]A_[s_,a__]B_[s_]-> MatMul[Tp[A],B][a],
sumRGE[s_,x_,y_]A_[a__,s_]B_[s_]-> MatMul[A,B][a],

sumRGE[s_,x_,y_]A_[a__,s_]B_[b__,s_]-> MatMul[A,Tp[B]][a,b],
sumRGE[s_,x_,y_]A_[s_,a__]B_[b__,s_]-> MatMul[B,A][b,a],
sumRGE[s_,x_,y_]A_[s_,a__]^2-> MatMul[Tp[A],A][a,a],
sumRGE[s_,x_,y_]MatMul[a__][s_,s_]-> TRace[a]
}; 


 subRGEDelta={
sumRGE[s_,x_,y_]A_?DeltaQ[s_]B_?DeltaQ[s_]-> ScalarProd[A,B],
sumRGE[s_,x_,y_]A_?DeltaQ[s_,a__]B_?DeltaQ[s_,b__]-> MatMul[Tp[A],B][a,b],

sumRGE[s_,x_,y_]A_?DeltaQ[s_,a__]B_?DeltaQ[s_]-> MatMul[Tp[A],B][a],
sumRGE[s_,x_,y_]A_?DeltaQ[a__,s_]B_?DeltaQ[s_]-> MatMul[A,B][a],

sumRGE[s_,x_,y_]A_?DeltaQ[a__,s_]B_?DeltaQ[b__,s_]-> MatMul[A,Tp[B]][a,b],
sumRGE[s_,x_,y_]A_?DeltaQ[s_,a__]B_?DeltaQ[b__,s_]-> MatMul[B,A][b,a],
sumRGE[s_,x_,y_]A_?DeltaQ[s_,a__]^2-> MatMul[Tp[A],A][a,a],
sumRGE[s_,x_,y_]MatMul[a__][s_,s_]-> TRace[a]
}; 


(* Traces *)

TRace[Adj[a_],b__]:=TRace[b,Adj[a]];
TRace[b__]:=TRace[Tp[b]] /; (FreeQ[{b},Conj,2]==False && FreeQ[{b},Adj,2]==True);
TRace[a_,d___,b__,c___]:=TRace[b,c,a,d] /; ( (FreeQ[{a},A]==False || FreeQ[{a},Adj]==False) && (FreeQ[{b},A] && FreeQ[{b},Adj] && FreeQ[{b},Conj]))
TRace[d__,MatMul[a__],c___] := TRace[d,a,c];
TRace[MatMul[a__],b__]:=If[Length[getDimParameters[Last[{a}]]]==1,Return[TRace[Tp[a],b]];,Return[TRace[a,b]];];
TRace[a___,Tp[b_,c__],d___]:=Apply[TRace,Flatten[{a,Map[Tp,Reverse[{c}]],Tp[b],d}]];



MatMul[a___,Kronecker,b___]:=MatMul[a,b];
TRace[a___,Kronecker,b___]:=TRace[a,b];

MatMul[a___,b_?NumericQ c_,d___][f___]:=b MatMul[a,c,d][f];
ScalarProd[a___,MatMul[b___,-c_,d___],f___]:=-ScalarProd[a,MatMul[b,c,d],f];

MatMul[d___,MatMul[a__],c___]:= MatMul[d,a,c];
MatMul[a_,b_,c_] := MatMul[b,c,a] /; FreeQ[VectorParameters,RE[a]]==False && FreeQ[VectorParameters,RE[b]] ==False;
MatMul[a_,b_,c_] := MatMul[b,c,a] /; FreeQ[VectorParameters,Re[c]]==False && FreeQ[VectorParameters,RE[b]] ==False;
Tp[-a___]:=-Tp[a];
Adj[-a___]:=-Adj[a];
TRace[d___,-a_,c___]:=-TRace[d,a,c];
MatMul[d___,-a_,c___][x_,y_]:=-MatMul[d,a,c][x,y]; 
(* MatMul[MatMul[a__],b__]:=If[Length[getDimParameters[Last[{a}]  /. Conj[x_]\[Rule]x]]\[Equal]1,Return[MatMul[Tp[a],b]];,Return[MatMul[a,b]];];  *)

Adj[MatMul[a__,b_]] := Apply[MatMul,Map[Adj,Reverse[{a,b}]]];

MatMul[a__][gen3,gen1]:= Apply[MatMul,Map[Tp,Reverse[{a}]]][gen1,gen3];
MatMul[a__][gen2,gen1]:= Apply[MatMul,Map[Tp,Reverse[{a}]]][gen1,gen2];
MatMul[a__][gen3,gen2]:= Apply[MatMul,Map[Tp,Reverse[{a}]]][gen2,gen3];

MatMul[a__][i3,i1]:= Apply[MatMul,Map[Tp,Reverse[{a}]]][i1,i3];
MatMul[a__][i2,i1]:= Apply[MatMul,Map[Tp,Reverse[{a}]]][i1,i2];
MatMul[a__][i3,i2]:= Apply[MatMul,Map[Tp,Reverse[{a}]]][i2,i3];

MatMul[a___,Tp[b_,c__],d___]:= Apply[MatMul,Flatten[{a,Map[Tp,Reverse[{c}]],Tp[b],d}]];

Tp[x_Adj]:=Conj[First[x]];
Adj[x_Tp]:=Conj[First[x]];
Adj[x_Conj]:=Tp[First[x]];
Tp[Conj[x_]]:=Adj[x];
Tp[conj[x_]]:=Adj[x];
Tp[Adj[x_]]:=Conj[x];
Conj[Tp[x_]]:=Adj[x];
Conj[Adj[x_]]:=Tp[x];
Conj[RM]:=RM;
Conj[InvMat]:=InvMat;
Tp[x_Tp]:=First[x];
Tp[Kronecker]:=Kronecker;
Tp[Delta]:=Delta;
Conj[Complex][a__]:=Conjugate[Complex[a]];

Tp[MatMul[x__]]:=Apply[MatMul,Map[Tp,Reverse[{x}]]];

(*
Conj[B_[b__]]:=Conj[B][b] /;(B=!=A &&B=!=DGi && B=!=Yijk && B=!=Aijk && B=!=Bij && B=!=m2ij && B=!=Muij && B=!=Li && B=!=LSi && B=!=Times && B=!=Delta && B=!=Pattern && B=!=Plus && B=!=Power && B=!=Rational && B=!=Conj&& B=!=Tp && B=!=Adj && B=!=YcY && B=!=YcYY && B=!= YcYYcY && B=!=Y6abcd ); 
*)

Conj[B_[b__]]:=Conj[B][b] /;FreeQ[{A,DGi,Yijk,Aijk,Bij,m2ij,Muij,Li,LSi,Times,Delta,Pattern,Plus,Power,Rational,Conj,Tp,Adj,YcY,YcYY,YcYYcY,Y6abcd,Y4abcd,YcYYcY4,YcY2S},B];

(*
Conj[B_[b__]]:=Conj[B][b] /;(B=!=A &&B=!=DGi && B=!=Yijk && B=!=Aijk && B=!=Bij && B=!=m2ij && B=!=Muij && B=!=Times && B=!=Delta && B=!=Pattern && B=!=Plus && B=!=Power && B=!=Rational && B=!=Conj&& B=!=Tp && B=!=Adj &&  B=!=Y2F && B=!= Y2S);
*)

Adj[x_Adj]:=First[x];


EMatrix[1]=1;
EMatrix[x_]=Kronecker[i1,i2];


IndexQ[x_]:=If[FreeQ[{gi1,gi2,gi3,gi4,gi5,gi6,gi7,gi8,gi9,gi10,gi11},x],Return[False];,Return[True];];
CanonicalOrder[term_Plus]:=CanonicalOrder/@term;
ginf[x_]:=ToExpression["gi"<>ToString[x]];

CanonicalOrder[term_]:=Block[{i,list,temp},
list=DeleteDup[Cases[term/.sumRGE[a___]->1,x_?IndexQ,3]];
temp=term;
For[i=1,i<=Length[list],
temp=temp/.list[[i]]->kf[i];
i++;];
temp=temp/.{kf[a_]->Hold[ginf[a]]};
Return[ReleaseHold[temp]];
];

DeleteDup[list_]:=Block[{i,temp},
temp={};
For[i=1,i<=Length[list],
If[FreeQ[temp,list[[i]]],temp=Join[temp,{list[[i]]}];];
i++;];
Return[temp];
];




CalcRGEValue[x_]:=CalcRGEValue[x,False];

CalcRGEValue[x_,Finish_]:=Block[{temp,i,j},
temp  = Expand[x] /. {VEVi[a__]->0,Yijk[a__]->0, Aijk[a__]->0,Bij[a__]->0,Muij[a__]->0,m2ij[a__]->0, TA[a__]->0, DGi[a__]->0, Li[a__]->0, LSi[a__]->0,Mi[a__]->0} ;

If[Head[temp]===Plus,Return[CalcRGEValue /@temp];];

If[ MakeMatrixMul==True,
temp = temp //. sum[a_,b_,c_] d_ :>Sum[d,{a,b,c}] //.subRGE; 
If[FreeQ[temp,sumRGE]==False,
sRGE=Cases[temp,y_sumRGE,2];
For[i=1,i<=Length[sRGE],
del=Cases[temp,y:(Delta[sRGE[[i,1]],b_]),3];
For[j=1,j<=Length[del],
temp = temp /. del[[j,2]]->del[[j,1]]  ;
j++;];
i++;];
If[SupersymmetricModel=!=False,
 temp = temp /. sumRGE[a__]->1; , 
  temp = temp /. sumRGE[a__]^b_->sumRGE[a] //.subRGE/. sumRGE[a__]->1;   (* CHANGED \[Rule] check for susy models! *) 
];
];
temp = makeSumAllRGE[CalcDeltaRGE[temp]]; 
While[FreeQ[temp,sum]==False,
temp = ReleaseHold[temp  /. sum[a_,b_,c_,d_]-> Hold[Sum[d,{a,b,c}]]];
];,

temp = temp //. sum[a_,b_,c_] d_ :>Sum[d,{a,b,c}];
temp = makeSumAllRGE[CalcDelta[temp]];
While[FreeQ[temp,sum]==False,temp = ReleaseHold[temp  /. sum[a_,b_,c_,d_]-> Hold[Sum[d,{a,b,c}]]];];

temp = CanonicalOrder[temp] /. sumRGE ->sum;
temp=makeSumAllRGE[temp] /. ThetaStep[a__]->1;

];

 temp  = temp /. Delta[a__]->1 /. MatMul[a__][b_,b_]->TRace[a]; 

If[Finish==True,
temp = DeleteCases[DeleteCases[DeleteCases[temp,gen1,5],gen2,5],gen3,5] /. A_[] ->A;,
temp = temp   (*/. {A_[gen3,gen1]\[Rule]A[gen1,gen3],A_[gen3,gen2]\[Rule]A[gen2,gen3],A_[gen2,gen1]\[Rule]A[gen1,gen2],A_[gen3,gen2,gen1]\[Rule]A[gen1,gen2,gen3],A_[gen2,gen3,gen1]\[Rule]A[gen1,gen2,gen3],A_[gen1,gen3,gen2]\[Rule]A[gen1,gen2,gen3],A_[gen2,gen1,gen3]\[Rule]A[gen1,gen2,gen3],A_[gen3,gen1,gen2]\[Rule]A[gen1,gen2,gen3]}*);    (* TO CHECK *)
];

temp = temp /. A_[]->A /. Conj->conj;

If[FreeQ[temp,TRace]==False,
If[Head[temp]===TRace,
temp = OrderTraces[temp];,
temp=OrderTraces /@ temp;
];
];

If[FreeQ[temp,TRace]==False,Print["Problem in simplifying the RGEs. Please contact the author. Error in: ", temp];Interrupt[];SAVE2=temp;];
(* CalcRGEValue[x,Finish]=temp; *)
Return[temp];
];

OrderTraces[x_]:=Block[{i,tr,coeff, first, pos, second,list,pow},
If[FreeQ[x,TRace], Return[x]];
If[Head[x]===TRace,
tr=x;
coeff=1;
pow=1;,
If[Head[x]===Power,
tr=Cases[x,y_TRace][[1]];
pow=x /. Power[tr,a_]->a;
coeff=x/tr^pow;,
tr=Cases[x,y_TRace][[1]];
coeff=x/tr;
pow=1;
];
];

 If[Length[tr]==1,
Return[x /. TRace ->trace];
]; 
list = tr /. TRace->List;
first=Sort[list][[1]];
second=Sort[list][[2]];

pos = Cases[Position[list,first],{z_}][[1,1]];
If[pos>1,
ordered = Join[Take[list,{pos,Length[list]}],Take[list,{1,pos-1}]];
Return[((ordered /. List->trace)^pow)*coeff];,
Return[(x /. TRace->trace)];
];
];

FreeThreeQ[x_]:=Block[{i,temp},
If[threeIndexParameter=={}, Return[True];];
temp=True;
For[i=1,i<=Length[threeIndexParameter],
If[FreeQ[x,threeIndexParameter[[i]]]==False,
temp=False;
];
i++;];
Return[temp];
];


Conj[x_Plus] := Conj/@ x;
Conj[x_Power] := Conj/@ x;
Conj[x_Times] := Conj/@ x;
Conj[x_List] := Conj/@ x;
Conj[x_Delta] := x;
Conj[x_epsTensor] := x;
Conj[epsTensor] := epsTensor;
Conj[x_?NumberQ] := x;

Delta[a_,a_,rge]=1;


(*
SA`Casimir[a_,b_]:=SA`Casimir[getBlankSF[a],b] /; (FreeQ[a,List]\[Equal]False && FreeQ[a,Symbol]\[Equal]False)
SA`Dynkin[a_,b_]:=SA`Dynkin[getBlankSF[a],b] /; (FreeQ[a,List]\[Equal]False && FreeQ[a,Symbol]\[Equal]False)
*)

SA`Casimir2[a_,b_]:=SA`Casimir2[getBlankSF[a],b] /; FreeQ[a,List]==False

YBar[a_,b_]:=YBar[getBlankSF[a],b] /; FreeQ[a,List]==False
MulFactor[a_,b_]:=MulFactor[getBlankSF[a],b] /; FreeQ[a,List]==False


SA`NumberGen[a_]:=SA`NumberGen[getBlankSF[a]] /; FreeQ[a,List]==False
SA`CasimirBar[a_]:=SA`CasimirBar[getBlankSF[a]] /; FreeQ[a,List]==False
SA`CasimirMBar[a_]:=SA`CasimirMBar[getBlankSF[a]] /; FreeQ[a,List]==False
SA`CasimirMCBar[a_]:=SA`CasimirMCBar[getBlankSF[a]] /; FreeQ[a,List]==False
SA`CasimirMMBar[a_]:=SA`CasimirMMBar[getBlankSF[a]] /; FreeQ[a,List]==False






sumRGE[a_,1,1]:=1;


partRGETensor[particle_,nr_]:=Block[{res,sub,i,temp,ind,sumStates,weight},
temp=getBlankSF[RE[particle]];
sumStates=1;
pos=Position[SFields,temp][[1,1]];
ind=Join[ListFields[[pos,2,1]],ListFields[[pos,3,1]]];

For[i=1,i<=Length[ind],
If[ind[[i]]=!=generation&&ind[[i]]=!=lorentz,
sumStates=sumStates*sum[ind[[i]] /. subGC[nr],1,NumberStates[ind[[i]],particle]];
];
i++;];
res=sumStates*sumRGE[genf[nr],1,Fields[[pos,2]]] /. subIndFinalX[nr,nr,"i"] /. Delta[1,x_]->1;
partRGETensor[particle,nr]=res;
 Return[res]; 
] /; MemberQ[LPName,getBlankSF[particle]];

partRGE[particle_,nr_]:=Block[{res,sub,i,temp,ind,sumStates,weight},
temp=getBlankSF[RE[particle]];
pos=Position[SFields,temp][[1,1]];
res=SFieldsNoTensor[[pos,2]]*sumRGE[genf[nr],1,Fields[[pos,2]]] /. subGC[nr] /. subIndFinalX[nr,nr,"i"] /. Delta[1,x_]->1;
partRGE[particle,nr]=res;
 Return[res]; 
] /; MemberQ[LPName,getBlankSF[particle]];

partRGENS[particle_,nr_]:=Block[{res,sub,i,temp,ind,sumStates,weight},
temp=getBlankSF[RE[particle]];
If[FreeQ[subComplexScalarsList,temp]==False,temp=subComplexScalarsList[[Position[subComplexScalarsList,temp][[1,1]],1]];];
If[FreeQ[FFields,temp]==False,
pos=Position[FFields,temp][[1,1]];,
If[FreeQ[SFields,temp]==False,
pos=Position[SFields,temp][[1,1]];,
temp=temp[[0]][[0]];
pos=Position[SFields,temp][[1,1]];
];
];
 res=SFieldsNoTensor[[pos,2]]*sumRGE[genf[nr],1,Fields[[pos,2]]] /. subGC[nr] /. subIndFinalX[nr,nr,"i"] /. Delta[1,x_]->1; 
(* res=SFieldsTensor[[pos,2]]*sumRGE[genf[nr],1,Fields[[pos,2]]] /. subGC[nr] /. subIndFinalX[nr,nr,"i"] /. Delta[1,x_]\[Rule]1; *)
partRGENS[particle,nr]=res;
Return[res]; 
] /; MemberQ[LPName,getBlankSF[particle]];

getFullNS[particle_]:=Block[{i,j,temp,pos},
temp=getBlankSF[RE[particle]];
(* If[FreeQ[subComplexScalarsList,temp]\[Equal]False,temp=subComplexScalarsList[[Position[subComplexScalarsList,temp][[1,1]],1]];]; *)
If[FreeQ[FFields,temp]==False,
pos=Position[FFields,temp][[1,1]];
Return[FFields[[pos]] /. conj[x_]->x];,
pos=Position[SFieldsSplitted,temp][[1,1]];
getFullNS[particle]=SFieldsSplitted[[pos]];
Return[SFieldsSplitted[[pos]]];
];
];

getIndRGENS[particle_,nr_]:=Block[{res,temp,inds},
temp=getBlankSF[RE[particle]];
If[FreeQ[subComplexScalarsList,temp]==False,temp=subComplexScalarsList[[Position[subComplexScalarsList,temp][[1,1]],1]];];
If[FreeQ[FFields,temp]==False,
pos=Position[FFields,temp][[1,1]];,
If[FreeQ[SFields,temp]==False,
pos=Position[SFields,temp][[1,1]];,
temp=temp[[0]][[0]];
pos=Position[SFields,temp][[1,1]];
];
];
 res=SFieldsNoTensor[[pos,2]]*sumRGE[genf[nr],1,Fields[[pos,2]]] /. subGC[nr]  /. Delta[1,x_]->1; 
(* res=SFieldsTensor[[pos,2]]*sumRGE[genf[nr],1,Fields[[pos,2]]] /. subGC[nr]  /. Delta[1,x_]\[Rule]1; *)


(*  temp=List@@(partRGENS[particle,nr] /. sumRGE[__]\[Rule]1) /. sum\[Rule]List; *)
inds=List@@(res/. sumRGE[__]->1) /. sum->List;
Switch[Depth[inds],
1,Return[{}];,
2,Return[{inds}];,
_,Return[inds];
];
];


(*
partRGENS[particle_,nr_]:=Block[{res,sub,i,temp,ind,sumStates,weight},
temp=getBlank[RE[particle]];
ind=DeleteCases[getIndizes[particle],generation];
res=1;
For[i=1,i\[LessEqual]Length[ind],res=res*sum[ind[[i]],1,getNumberStates[ind[[i]]]];i++;];
res=res*sumRGE[genf[nr],1,getGen[particle]] /. subGC[nr] /. subIndFinalX[nr,nr,"i"] /. Delta[1,x_]\[Rule]1;
 Return[res]; 
] /; MemberQ[LPName,getBlank[particle]];
*)







makeListInvolved2[l1_,l2_,l3_]:=Block[{i,li1,li2,li3,list1,list2},

li1=Map[getFullSF,Map[getBlankSF,l1]] /. conj[x_]->x;
li2=Map[getFullSF,Map[getBlankSF,l2]] /. conj[x_]->x;
li3=Map[getFullSF,Map[getBlankSF,l3],{2}] /. conj[x_]->x;


If[Flatten[li3]=={},list3=LP;,list3=listTri[[Position[LP,li3[[1,1]]][[1,1]]]];];

If[li2=={},
list2=LP;,
list2=listBi[[Position[LP,li2[[1]]][[1,1]]   ]];
];


If[li1=={},
list1=LP;,
list1=listOne[[Position[LP,li1[[1]]][[1,1]]   ]];
];

list1=LP;


listTemp=Intersection[list1,list2,list3];

For[i=2,i<=Length[li1],
pos=Position[LP,li1[[i]]];
listTemp=Intersection[listTemp,listOne[[pos[[1,1]]]]];
i++;];


For[i=2,i<=Length[li2],
pos=Position[LP,li2[[i]]];
listTemp=Intersection[listTemp,listBi[[pos[[1,1]]]]];
i++;];

listTemp = Map[getBlank,listTemp];

For[i=1,i<=Length[l3],
If[Length[l3[[i]]]==1,
pos=Position[LP,li3[[i,1]]];
listTemp=Intersection[listTemp,Map[getBlankSF,listTri[[pos[[1,1]]]]]];,
pos=Position[listTri2,C[l3[[i,1]],l3[[i,2]]]];
If[pos=!={},
listTemp=Intersection[listTemp,listTri2[[pos[[1,1]],2]]];,
listTemp={};
];
];
i++;];

listTemp = Map[getFullSF,listTemp] /. conj[x_]->x;

 makeListInvolved2[l1,l2,l3]=listTemp; 
Return[listTemp];
];





CalcDeltaRGE[x_]:=x;

(*
CalcEpsRGE[x_]:=Block[{temp,i,j},
temp = Expand[x] //. sum[b_,x1_,x2_]  epsTensor[a1___,b_,c1___] epsTensor[a2___,b_,c2___]\[RuleDelayed] Det[Table[ Delta[{c1,a1}[[i]],{c2,a2}[[j]]],{i,1,Length[ {a1,c1} ]},{j,1,Length[{a2,c2}]}]] //.  sum[b_,x1_,x2_]  epsTensor[a1___,b_,c1___]^2 \[RuleDelayed] Det[Table[ Delta[{c1,a1}[[i]],{c2,a2}[[j]]],{i,1,Length[{a1,c1} ]},{j,1,Length[{a1,c1}]}]] 
//. sum[b_,x1_,x2_]  Delta[a1___,b_] epsTensor[a2___,b_,c2___]\[RuleDelayed] Det[Table[Delta[{a1,c2,a2}[[i]],j],{i,1,Length[ {a2,c2,b}]},{j,1,Length[ {a2,c2,b}]}]]
//. sum[b_,x1_,x2_]  Delta[b_,a1___] epsTensor[a2___,b_,c2___]\[RuleDelayed] Det[Table[Delta[{a1,c2,a2}[[i]],j],{i,1,Length[ {a2,c2,b}]},{j,1,Length[ {a2,c2,b}]}]] //. epsTensor[a__]\[RuleDelayed]Det[Table[ Delta[{a}[[i]],j],{i,1,Length[ {a} ]},{j,1,Length[{a}]}]] ;

Return[temp];

]; *)

CalcEpsRGE[x_]:=x;



makeSumAllRGE[expr_]:=Block[{i,erg,expand,summand,sums},
expand=Expand[expr];
If[Head[expand]===Plus,
erg=List@@expand;
erg=makeSumAllRGE/@erg;
Return[Plus@@erg];
];

sums=Cases[expr, x_?sumQRGE,3];
summand = DeleteCases[expr, x_?sumQRGE,3];

For[i=1,i<=Length[sums],
summand=Append[sums[[i]],summand] /. {sums[[i,1]] -> jnf[i]} ;
i++;];
Return[summand];

];

sumQRGE[x_]:=If[Head[x]===sum,Return[True];,Return[False];];


Split3IndexParameter[x_]:= Block[{i,j,temp},
temp=x ;
While[FreeQ[temp,sum]==False,temp = temp /. sum[a_,b_,c_,d_]->sumRGE[a,b,c] d;]; 
temp = temp //. subThreeIndices //. conj->Conj; 
Return[CalcRGEValue[temp] /. StillCalcSum->1]; 
];

DeltaKronecker[a_,b_]:=If[FreeQ[{i1,i2,i3},b],
Return[Delta[a,b]];,
Return[Kronecker[a,b]];
] /;FreeQ[{s1,s2,s3},b];


flist[x_]:=Apply[List,x];


ExpandTerm[x_]:=Block[{i,j,k,temp,inv,temp2, newInsertion,temp3,temp21,temp22,temp23,nrName,NR},
If[Head[Expand[x]]===Plus,
Return[ExpandTerm/@Expand[x]];
];
partAbbr={pL,pN,pM,pO,pP,pQ,pR,pW,pX,pY,pZ};
UsedHeaders={Yijk,Aijk,Bij,Muij,Li,LSi,m2ij, Conj};
temp=x;
inv=Intersection[Cases[temp,y_/;MemberQ[partAbbr,y],99]];

If[inv=!={},
i=Position[partAbbr,inv[[1]]][[1,1]];

temp2=Cases[temp,y_/; (FreeQ[y,inv[[1]],3]==False && FreeQ[UsedHeaders,Head[y]]==False),4] /. Conj[y_]->y;
temp21=Intersection[DeleteCases[getBlankSF/@Flatten[Map[flist,Cases[temp2,y_/;Length[y]==1]]],y_/;MemberQ[partAbbr,y,2]]];
temp22=Intersection[DeleteCases[getBlankSF/@Flatten[Map[flist,Cases[temp2,y_/;Length[y]==2]]],y_/;MemberQ[partAbbr,y,2]]];

temp23 = DeleteCases[Intersection[DeleteCases[getBlankSF/@Map[flist,Cases[temp2,y_/;Length[y]==3]],y_/;MemberQ[partAbbr,y,2],4]],{},3];
newInsertion=makeListInvolved2[temp21,temp22,temp23];
If[newInsertion==={},ExpandTerm[x]=0; Return[0];];
nrName = ToExpression["n"<>ToString[5+i]];
NR = 5+i;

temp3=Hold[Sum[partRGE[getBlank[newInsertion[[nrName]]],NR] (temp /. inv[[1]]-> (newInsertion[[nrName]] /.  subGC[NR] /.  subIndFinalX[NR,NR,"i"])),{nrName,1,Length[newInsertion]}] ] /. nr ->i  /. NR->5+i;
temp=ReleaseHold[temp3];
If[Length[inv]>1,
temp = Expand[temp];
If[Head[temp]===Plus,
Return[ExpandTerm/@temp];,
Return[ExpandTerm[temp]];
];,
ExpandTerm[x]=temp /. {Yijk[a__]->0,Aijk[a__]->0,m2ij[a__]->0, Muij[a__]->0, Bij[a__]->0, LSi->0, Li->0,Mi[a__]->0};
Return[temp /. {Yijk[a__]->0,Aijk[a__]->0,m2ij[a__]->0, Muij[a__]->0, Bij[a__]->0, LSi->0, Li->0,Mi[a__]->0}];
];,
ExpandTerm[x]=temp /. {Yijk[a__]->0,Aijk[a__]->0,m2ij[a__]->0, Muij[a__]->0, Bij[a__]->0, LSi->0, Li->0,Mi[a__]->0};
Return[temp /. {Yijk[a__]->0,Aijk[a__]->0,m2ij[a__]->0, Muij[a__]->0, Bij[a__]->0, LSi->0, Li->0,Mi[a__]->0}];
];
];

ExpandTermNS[x_]:=Block[{i,j,k,temp,inv,temp2, newInsertion,temp3,temp21,temp22,temp23,temp24,nrName,NR},
If[Head[Expand[x]]===Plus,
Return[ExpandTermNS/@Expand[x]];
];
partAbbr={pA,pB,pC,pD,pE,pF,pG,pH,pI,pK,pL,pM,pN,pO,pP,pQ,pR,pS,pT,pW,pX,pY,pZ,pA1,pA2,pA3};
(* UsedHeaders={Yijk,Aijk,Bij,Muij, Conj, Mij,Lijkl}; *)
UsedHeaders={Yijk,Aijk,Bij,Muij, Conj, Lijkl};
temp=x;
inv=Intersection[Cases[temp,y_/;MemberQ[partAbbr,y],99]];
If[inv=!={},
i=Position[partAbbr,inv[[1]]][[1,1]];

temp2=Cases[temp,y_/; (FreeQ[y,inv[[1]],3]==False && FreeQ[UsedHeaders,Head[y]]==False),4] /. Conj[y_]->y;
temp21=Intersection[DeleteCases[getBlankSF/@Flatten[Map[flist,Cases[temp2,y_/;Length[y]==1]]],y_/;MemberQ[partAbbr,y,2]]];
temp22=Intersection[DeleteCases[getBlankSF/@Flatten[Map[flist,Cases[temp2,y_/;Length[y]==2]]],y_/;MemberQ[partAbbr,y,2]]];
temp23 = DeleteCases[Intersection[DeleteCases[getBlankSF/@Map[flist,Cases[temp2,y_/;Length[y]==3]],y_/;MemberQ[partAbbr,y,2],4]],{},3];
temp24 = DeleteCases[Intersection[DeleteCases[getBlankSF/@Map[flist,Cases[temp2,y_/;Length[y]==4]],y_/;MemberQ[partAbbr,y,2],4]],{},4];

newInsertion=makeListInvolvedNS[temp21,temp22,temp23,temp24];

If[newInsertion==={},ExpandTermNS[x]=0;\:ffff Return[0];];
nrName = ToExpression["n"<>ToString[5+i]];
NR = 5+i;
temp3=Hold[Sum[partRGENS[getBlank[newInsertion[[nrName]]],NR] (temp /. inv[[1]]-> (newInsertion[[nrName]] /.  subGC[NR] /.  subIndFinalX[NR,NR,"i"])),{nrName,1,Length[newInsertion]}] ] /. nr ->i  /. NR->5+i;
saveTemp3=temp3;
temp=ReleaseHold[temp3];
If[Length[inv]>1,
temp = Expand[temp];
If[Head[temp]===Plus,
Return[ExpandTermNS/@temp];,
Return[ExpandTermNS[temp]];
];,
ExpandTermNS[x]=temp /. {Yijk[a__]->0,Aijk[a__]->0, Muij[a__]->0, Bij[a__]->0, LSi->0, Li->0, Lijkl[a__]->0};  
Return[temp   /. {Yijk[a__]->0,Aijk[a__]->0, Muij[a__]->0, Bij[a__]->0, LSi->0, Li->0, Lijkl[a__]->0}];
];,
ExpandTermNS[x]=temp /. {Yijk[a__]->0,Aijk[a__]->0, Muij[a__]->0, Bij[a__]->0, LSi->0, Li->0, Lijkl[a__]->0};
Return[temp /. {Yijk[a__]->0,Aijk[a__]->0, Muij[a__]->0, Bij[a__]->0, LSi->0, Li->0, Lijkl[a__]->0}];
];
];




makeListInvolvedNS[l1_,l2_,l3_,l4_]:=Block[{i,li1,li2,li3,li4,list1,list2,list3,list4},
(*
li1=Map[getFullNS,Map[getBlankSF,l1]] /. conj[x_]\[Rule]x;
li2=Map[getFullNS,Map[getBlankSF,l2]] /. conj[x_]\[Rule]x;
li3=Map[getFullNS,Map[getBlankSF,l3],{2}] /. conj[x_]\[Rule]x;
li4=Map[getFullNS,Map[getBlankSF,l4],{2}] /. conj[x_]\[Rule]x;
*)

li1=Map[getBlankSF,l1];
li2=Map[getBlankSF,l2];
li3=Map[getBlankSF,l3];
li4=Map[getBlankSF,l4];


If[Flatten[li3]=={},list3=LP;,list3=listTri[[Position[LP,li3[[1,1]]][[1,1]]]];];

If[Flatten[li4]=={},list4=LP;,list4=listQuad[[Position[LP,li4[[1,1]]][[1,1]]]];];

If[li2=={},
list2=LP;,
list2=listBi[[Position[LP,li2[[1]]][[1,1]]   ]];
];


If[li1=={},
list1=LP;,
list1=listOne[[Position[LP,li1[[1]]][[1,1]]   ]];
];

list1=LP;


listTemp=Intersection[list1,list2,list3,list4];

For[i=2,i<=Length[li1],
pos=Position[LP,li1[[i]]];
listTemp=Intersection[listTemp,listOne[[pos[[1,1]]]]];
i++;];



For[i=2,i<=Length[li2],
pos=Position[LP,li2[[i]]];
listTemp=Intersection[listTemp,listBi[[pos[[1,1]]]]];
i++;];

listTemp = Map[getBlank,listTemp];

For[i=1,i<=Length[l3],
If[Length[l3[[i]]]==1,
pos=Position[LP,li3[[i,1]]];
listTemp=Intersection[listTemp,Map[getBlank,listTri[[pos[[1,1]]]]]];,
pos=Position[listTri2,C[l3[[i,1]],l3[[i,2]]]];
If[pos=!={},
listTemp=Intersection[listTemp,listTri2[[pos[[1,1]],2]]];,
listTemp={};
];
];
i++;];


For[i=1,i<=Length[l4],
Switch[Length[l4[[i]]],
1,
pos=Position[LP,li4[[i,1]]];
listTemp=Intersection[listTemp,Map[getBlank,listQuad[[pos[[1,1]]]]]];,
2,
pos=Position[listQuad2,C[l4[[i,1]],l4[[i,2]]]];
If[pos=!={},listTemp=Intersection[listTemp,listQuad2[[pos[[1,1]],2]]];,listTemp={};];,
3,
pos=Position[listQuad3,C[l4[[i,1]],l4[[i,2]],l4[[i,3]]]];
If[pos=!={},listTemp=Intersection[listTemp,listQuad3[[pos[[1,1]],2]]];,listTemp={};];
];
i++;];

listTemp = Map[getFullNS,listTemp] /. conj[x_]->x;

makeListInvolvedNS[l1,l2,l3,l4]=listTemp; 
Return[listTemp];
];
