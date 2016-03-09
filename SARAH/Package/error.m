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




ModelFile::undefinedSF="Superfield `` in Superpotential not defined.";

TeXOutput::NoRGEs ="\n RGEs not calculated so far. Skipping this parts.\n
Use CalcRGEs[] to calculated RGEs and start MakeTeX again to include them in the output.";

TeXOutput::NoLoops ="\n Loop corrections not calculated so far. Skipping this parts.\n
Use CalcLoopCorrections[States] to calculated RGEs and start MakeTeX again to include them in the output.";

ModelFile::NoVertices="\n No Vertices calculated so far!\n
Use first ModelOutput[Eigenstates] or MakeVertexList[Eigenstates] to calculate vertices.\n
No output produced.";

ModelFile::badvectorboson="Name for Vector-Boson `` must start with V.";

ModelFile::ParticleNameExists="Name `` is already used for another particle in this model";
ModelFile::ParameterNameExists="Name `` is already used for another parameter in this model";

ModelFile::MissingDefParticle="No particle properties defined for eigenstates ``.";

ModelFile::UnknownKeywordParameter ="Unknown keyword `` in parameter file.";
ModelFile::UnknownKeywordParticle ="Unknown keyword `` in particle file.";

ModelFile::NoGoldstone ="No Goldstone boson for (possibly) massive gauge boson `` defined.";

FeynArts::NumberDefinedTwiceF ="Particle number `` defined twice for Fermions";
FeynArts::NumberDefinedTwiceS ="Particle number `` defined twice for Scalars";
FeynArts::NumberDefinedTwiceG ="Particle number `` defined twice for Ghosts";
FeynArts::NumberDefinedTwiceV ="Particle number `` defined twice for Vectors";

MassMatrix::OnlyZero = "The mass matrix for `` contains only zero elements";

Lagrange::ChargeViolation ="Warning! `` not conserved in ``";
Lagrange::MaybeChargeViolation ="Conservation of  `` depends on choice of ``";
Lagrange::ViolationGlobal ="Warning! Global symmetry `` not conserved";

Superpotential::ViolationGlobal ="Warning! Global symmetry `` not conserved in ``";
Superpotential::ChargeViolation ="Warning! `` not conserved in ``";
Superpotential::MaybeChargeViolation ="Conservation of  `` in `` depends on choice of ``";

CHName::VariableTooLong="Name of variable `` is too long. The maximal allowed length is `` ";

PDG::DoubleCheck="PDG number `` is used twice!";

ModelFile::MissingModel="Model File does not exist!";
ModelFile::MissingParticle="Particle File does not exist!";
ModelFile::MissingParameter="Parameter File does not exist!";
ModelFile::Aborted="Evaluation aborted";

ModelFile::BadModelName = "A name for the model has to be defined (as string) in the model file using the variable ModelName";

ModelFile::UnknownParticleRotations="Unknown particle `` in definitions of field rotations.";

Parameter::FalseDimension="Dimension of `` does not fit to defined dependence";
Parameter::NoLesHouches="No Les Houches name defined for ``";

WHIZARD::MassDetermination="mass of particle `` could not be detemined, assuming 0....";

SARAH::UnknownGaugeGroup="Gauge group `` is not known by SARAH. You can load Susyno to extend the supported gauge groups.";
SARAH::DimensionNotUnique="Dimension `` of `` is not unique. Please provide the Dynkin labels.";


CalcRGEs::NonOrthogonalU1="The model contains U(1) gauge groups which are not diagonal. The calculation might not be not valid in this case! See arXiv:hep-ph/9311340 section III for more information.";

SPheno::Tadpoles = "No solution found for tadpole equations. Given parameters: ``";
SPheno::noPDG="No PDG defined for `` .";

SPheno::UndefinedParticle="Particle `` is not defined. This might cause problems in the generation of the source code.";
SPheno::UndefinedParameter="Parameter `` is not defined. This might cause problems in the generation of the source code.";

SPheno::NoConditionForParameter="No boundary condition defined for ``. This might cause numerical problems.";

SPheno::NoGUTconditionRegimes="No condition defined for GUT scale. Note, it is necessary to define a  condition for each regime using the variable ConditionGUTscale in SPheno.m of the highest regime";

SPheno::NoGUTcondition="No condition defined for GUT scale. Using ``. To use another condition or to switch off this message, please provide a definition for the GUT scale using the variable ConditionGUTscale in SPheno.m";



(* SPheno::NoBoundaryGUT="Boundary condition at GUT scale needed for ``. This might cause numerical problems. Note, this parameter is not evaluated from the SUSY to the GUT scale. Hence, a possible solution from the tadpoles might be unknown at the GUT scale. "; *)

SPheno::NoBoundaryGUT="No boundary condition at GUT scale for ``. This might cause numerical problems. ";



Vertices::UnknownParticle="Particle `` does not exit in model.";


ModelFile::badlengthSF ="Definition for `` does not have the needed Length";

Particle::unknown ="Unknown particle ``";

CHep::NoName="No output Name defined for ``. Automatic produced name is used.";
CHep::NoNumber="No PDG defined for ``. Automatic produced number is used.";
CHep::NoLatex="No LaTeX name defined for ``. Automatic produced number is used.";

CHep::ParticleNameLength="Output name of particle `` is too long for CalcHep. Just using a part of the name. That might cause problem: please check it!";
FeynArts::NoNumber="No FeynArts number defined for ``. Automatic produced number is used.";


Vertex::undefinedParticle=
"Particle `` not defined";

ModelFile::NoGaugeFixingParameter=
"Missing Gauge Fixing Parameter in ``";

PossibleTerms::IncludeRParity="The following terms are not present in the superpotential but allowed by gauge invariance and R-parity conservation: ``. Note, additional (discrete) symmetries are not yet considered.";
PossibleTerms::NoRParity="The following terms are not present in the superpotential but allowed by gauge invariance: ``. Note, additional (discrete) symmetries are not yet considered.";
PossibleTerms::IncludeGlobal="The following terms are not present in the superpotential but allowed by gauge invariance and global symmetries: ``.";

PossibleTerms::NonSUSY="The following terms are not present in the potential but allowed by gauge invariance: ``.";



Start::usage="Start[\"ModelName\"] starts the calculation for a given Model.";

Vertex::usage="Vertex[{Particles},Options] calculates the vertex for the given list of particles. Use Options[Vertex] to get a list with all possibel options. See also \"Vertex::notes\" for more information";
MassMatrices::usage="MassMatrices[Eigenstates] returns a list of all calculated mass matrices for given eigenstates"; 
MassMatricesFull::usage="MassMatricesFull[Eigenstates] returns list of all calculated mass matrices for given eigenstates with inserted generations indices"; 
TadpoleEquations::usage="TadpoleEquations[Eigenstates] returns a list with all tadpole equations for the given eigenstates"; 
MassMatrix::usage="MassMatrix[Particle] returns the mass matrix for the given particle";
TadpoleEquation::usage="TadpoleEquation[vev] returns the tadpole equation for the given vacuum expectation values";
CalcRGEs::usage = "CalcRGEs[Options] calculates the Renormalization Group Equations for the considered model. Use Options[CalcRGEs] to get a list with all possible options. See also \"CalcRGEs::notes\" for more information";
CalcLoopCorrections::usage = "CalcLoopCorrections[Eigenstates,Options] calculates the one-loop corrections to self-energis and tadpoles for the given Eigenstates. Use Options[CalcLoopCorrections] for a list for all options. See also \"CalcLoopCorrections::notes\ for more information.";

SA`CommandsOutput={MakeAll::usage,MakeSPheno::usage,MakeCHep::usage,MakeFeynArts::usage,MakeUFO::usage,MakeTeX::usage,MakeWHIZARD::usage};
SA`CommandsCalculation={MassMatrix::usage,MassMatrices::usage, TadpoleEquation::usage,TadpoleEquations::usage,Vertex::usage,MakeVertexList::usage,  CalcRGEs::usage,CalcLoopCorrections::usage,Tadpoles1LoopList::usage,Tadpoles1LoopSum::usage,SelfEnergy1LoopList::usage, SelfEnergy1LoopSum::usage,CheckIrrepSUN::usage};
SA`CommandsChecks={CheckModel::usage,ShowSuperpotentialContractions::usage};
SA`CommandsModel={Particles::usage,SARAHparameters::usage,getGen::usage,getFla::usage,getType::usage,getIndizes::usage,getRParity::usage,getDescriptionParameter::usage,getDescriptionField::usage};

CheckIrrepSUN::usage="CheckIrrepSUN[Group,Dim] returns the Dynkin index, Casimir index, Dynkin labels and co- and contra-variant indices for a irreducible representation with dimension Dim with respect to a gauge group Group, e.g. CheckIrrepSUN[SU[3],8]";

getGen::usage="getGen[Particle,Eigenstates] returns the number of generation for given particle.";
getFla::usage="getFla[Particle,Eigenstates] returns the number of flavors for given particle.";
getRParity::usage="getRParity[Particle,Eigenstates] returns the R-parity of the given particle.";
getType::usage="getType[Particle] returns the generic type of a particle (F:fermion, S:scalar, V:vector, G:ghost, A:auxiliary).";
getIndizes::usage="getIndizes[Particle] returns the indices for a given particle.";
getDescriptionParameter::usage="getDescriptionParameter[Parameter] returns the description of a parameter.";
getDescriptionField::usage="getDescriptionParticle[Particle] returns the description of a particle.";
Particles::usage="Particles[Eigenstates] returns a list for all existing particles for given Eigenstates.";
SARAHparameters::usage="SARAHparameters returns a list with all existing parameters in the model.";
SARAHparameters:=parameters;

Vevacious::UnknonwVEVs="For no VEV has the position in a LesHouches spectrum file be defined!";

MakeVertexList::usage = "MakeVertexList[Eigenstates,Options] creates a list with all appearing vertices for the given eigenstates. Use Options[MakeVertexList] to get a list with all possible options. See also \"MakeVertexList::notes\" for more information. ";
MakeAll::usage = "MakeAll[Options] creates the output for SPheno, CalcHep, FeynArts, WHIZARD and LaTeX. Use Options[MakeAll] to get a list with all possible options. See also \"MakeAll::notes\" for more information.";
ModelOutput::usage="ModelOutput[Eigenstates,Options] produces for the given Eigenstates the specified Output. This can be a LaTeX, FeynArts or CalcHep file. Use Options[ModelOutput] to get a list with all possible options. See also \"MakeAll::notes\" for more information";
MakeFeynArts::usage="MakeFeynArts[Options] writes a FeynArts Model file. Use Options[MakeFeynArts] to get a list with all possible options.  See also \"MakeFeynArts::notes\" for more information";
MakeTeX::usage="MakeTeX[Options] writes a LaTeX file. Use Options[MakeTeX] to get a list with all possible options. See also \"MakeTeX::notes\" for more information";
MakeUFO::usage="MakeUFO[Options] writes a model file in UFO format. Use Options[MakeUFO] to get a list with all possible options. See also \"MakeUFO::notes\" for more information";
MakeCHep::usage="MakeCHep[Options] writes a CalcHep Model file. Use Options[MakeCHep] to get a list with all possible options. See also \"MakeCHep::notes\" for more information";
MakeWHIZARD::usage ="MakeWHIZARD[Options] writes model files for WHIZARD and Omega. Use Options[MakeWHIZARD] to get a list with all possible options. See also \"MakeWHIZARD::notes\" for more information"; 
MakeSPheno::usage="MakeSPheno[Options] creates source code to implement the current model in SPheno. Use Options[MakeSPheno] to get a list with all possible options. See also \"MakeSPheno::notes\" for more information";

MakeAll::notes ="The options of MakeAll are the following:\n
(i) \"ReadLists\", Values: \"True\" or \"False\", Default: \"False\" \n
\t Uses the results of a former calculation \n
(ii) \"IncludeSPheno\", Values: \"True\" or \"False\", Default: \"True\" \n
\t If \"True\", the output for SPheno is created. \n
(iii) \"IncludeFeynArts\", Values: \"True\" or \"False\", Default: \"True\" \n
\t If \"True\", the output for FeynArts and FormCalc is created. \n
(iv) \"IncludeCalcHep\", Values: \"True\" or \"False\", Default: \"True\" \n
\t If \"True\", the output for CalcHep and MicrOmegas is created. \n
(v) \"IncludeWHIZARD\", Values: \"True\" or \"False\", Default: \"True\" \n
\t If \"True\", the output for WHIZARD and Omega is created. \n
(vi) \"IncludeTeX\", Values: \"True\" or \"False\", Default: \"True\" \n
\t If \"True\", the output for LaTeX is created. \n \n
Note, MakeAll[] uses always the default options of MakeSPheno,\n
MakeWHIZARD, MakeFeynArts, MakeCHep and MakeTeX. \n
If you want to change some options, use \n
\n
\t \"SetOptions[Function,Option->Value]\" \n
\n before running MakeAll.";

CalcLoopCorrections::notes= "Options of CalcLoopCorrections: \n
\t As options can a list with fields be given (\"OnlyWith\[Rule]{Particle1,Particle2,...}\"). \n
\t Only corrections involving these fields as internal particles are returned.\n \n
The results are saved in \n
(i) Tadpoles1LoopSums[Eigenstates]: \n
\t The complete results as sums of the different contributions are saved \n
\t in this two dimensional array. The first column gives the name of the  \n
\t corresponding VEV, the second entry the one-loop correction. \n
(ii) Tadpoles1LoopList[Eigensates]: \n
\t A list of the different contributions, including symmetry and charge factors. \n
(iii) SelfEnergy1LoopSum[Eigenstates]: \n
\t It`s a two-dimensional array. The first column gives the name of the particle, \n
\t the entry in the second column depends on the type of the field: \n
\t \t - Scalars: one-loop self energy Pi(p^2) \n
\t \t - Fermions: one-loop self energies for the different polarizations Sigma^L(p^2), Sigma^R(p^2), Sigma^S(p^2)\n
\t \t - Vector bosons: one-loop,transversal self energy Pi^T(p^2) \n
(iv) SelfEnergy1LoopList[Eigenstates]: \n
\t A list with the different contributions including charge and symmetry factors.";


MakeSPheno::notes="The options of MakeSPheno are the following: \n
(i) \"Eigenstates->Name of Eigenstates \": If not given, by default the last entry of \"NameOfStates\" is used. \n
(ii) \"ReadLists->True\" can be used if all vertices and RGEs have already been calculated for the model and the former results should be used to save time. \n
(iii) \"InputFile -> Filename\". The name of the SPheno input file. If not defined, SPheno.m is used. \n
(iv) \"StandardCompiler \[Rule] Compiler\". The compiler which should be set as standard in the created Makefile. Default is gfortran";

MakeWHIZARD::notes="The options of MakeWHIZARD are the following: \n
(i) \"Exclude\", Values: list of generic vertex types, Default: {SSSS} \n
\t Prevents vertices matching the generic types from being generated in order to speed up the program and reduce the complexity of the generated model. \n
(ii) \"WOModelName\", Values: string, Default: predefined model name \n
\t Gives the possibility to change the model name. If output for WHIZARD 1.x is generated, \n
\t the name should start with \"fr_\" in order for the model to be picked up
automatically by the WHIZARD build system. \n
(iii) \"MaximalCouplingsPerFile\", Values: Number, Default:500\n
\t Defines the maximal number of couplings written to one file. Adjusting this eases the workload on the compiler when compiling the model. \n
(iv) \"Version\", Values: String, Default: latest version \n
\t Defines the version of WHIZARD for which the model file is generated. \n
(v) \"ReadLists\", Values: \"True\" or\"False\", Default: \"False\" \n
\t This setting controls whether the cached results from a previous calculation should be used.";

MakeUFO::notes= "The options of MakeUFO are the following: \n
(i) \"Exclude\", Values: list of generic type, Default: \"{SSSS,GGS,GGV}\" \n
\t Defines, which generic diagrams are excluded when writing the model file.";

MakeCHep::notes = "The options of MakeCHep are the following: \n
(i) \"FeynmanGauge\", Values: \"True\" or \"False\", Default: \"True\" \n
\t By setting to \"True\", the interactions of the Goldstone bosons are written in the interaction file. \n
(ii) \"CPViolation\", Values \"True\" or \"False\",Default: \"False\" \n
\t By setting to \"True\", the possibility of CP violation is included in the model files. \n
(iii) \"ModelNr\", Values Integer, Default: \"1\" \n
\t The number added to file names. \n
(iv) \"CompHep\", Values: \"True\" or \"False\", Default: \"False\" \n
\t By setting to \"True\" the model files are written in the CompHep format. \n
(v) \"NoSplittingWith\", Values: Particles List, Default: \"{}\" \n
\t If one of the given particles appears in a four-point interaction, the interaction is not split using auxiliary fields \n
(vi) \"NoSplittingOnly\", Values: Particles List, Default: \"{}\" \n
\t If all particles of a four-point interaction appear in the given list, the interaction is not split using auxiliary fields \n
(vii) \"UseRunningCoupling\", Values: \"True\" or \"False\", Default: \"False\" \n
\t Defines,if the standard running of the strong coupling should be included in the model file. \n
(viii) \"SLHAinput\", Values: \"True\" or\"False\",Default:\"False\" \n
\t Defines, if parameter values should be read from a LesHouches input file";

MakeFeynArts::notes="MakeFeynArts: As options can \"AddCounterTerms\[Rule]True\" be used to add counter terms to each parameter: in that case all appearing parameters are replaced by \"x -> x + \[Delta]x\".";

MakeVertexList::notes="The options of MakeVertexList are the following: \n
(i) \"effectiveOperators\",  Values: \"True\" or \"False\", Default: \"False\" \n
\t If also higher dimensional operators should be calculated. By default,this concerns only four point interactions. \n
(ii) \"SixParticleInteractions\", Values: \"True\" or \"False\", Default: \"False\" \n
\t If also the six-point interactions should be calculated. \n
(iii) \"GenericClasses\", Values: List of generic classes or \"ALL\", Default: \"All\" \n
\t Only the vertices for the given, generic classes are calcualtes, e.g. {SSS}, or {SSSS,FFS}. \n
(iv) \"VerticesForLoop\", Values: \"True\" or \"False\", Default: \"False\" \n
\t If set to \"True\", also the vertices needed for loop corrections are calculated, \n
\t where one external particle is replaced by its gauge eigenstates \n
(v) \"SimplifySums\", Values: \"True\" or \"False\", Default: \"True\" \n
\t Defines, if SARAH should try to simplify the appearing sums.
\n
\n
The results are saved in lists  \n
\n
\t \"SA`VertexList[Type]\" \n
\n
separated by the generic Type (Type = SSS, SSSS, SSVV, SSV, SVV, VVVV, VVV, FFS, FFV, GGS, GGV). \n
Also lists with all 3- and 4-point interactions are generated: \n
\t  VertexList3, VertexList4";

ModelOutput::notes ="The options of ModelOutput are the following: \n
(i) \"WriteTeX\", Values: \"True\" or \"False\", Default: \"False\" \n
\t If a LaTeX file containing all information about the model should be written. \n
(ii) \"WriteFeynArts\",  Values: \"True\" or \"False\", Default: \"False\" \n
\t If a model file for FeynArts should be written. \n
(iii) \"WriteCHep\",  Values: \"True\" or \"False\", Default: \"False\" \n
\t If a model file for CompHep/CalcHep should be written. \n
(iv) \"effectiveOperators\",  Values: \"True\" or \"False\", Default: \"False\" \n
\t If also higher dimensional operators should be calculated. By default,this concerns only four point interactions. \n
(v) \"SixParticleInteractions\", Values: \"True\" or \"False\", Default: \"False\" \n
\t If also the six-point interactions should be calculated. \n
(vi) \"FeynmanDiagrams\", , Values: \"True\" or \"False\", Default: \"True\" \n
\t If Feynman diagrams for each vertex should be drawn in the LaTeX file. \n
(vii) \"ReadLists\", , Values: \"True\" or \"False\", Default: \"False\" \n
\t If the results of former calculations should be used to save time. \n
(viii) \"IncludeRGEs\",  Values: \"True\" or \"False\", Default: \"False\" \n
\t If the RGEs should be calculated. \n
(ix) \"TwoLoopRGEs\", , Values: \"True\" or \"False\", Default: \"True\" \n
\t If the two loop RGEs should be calculated. (\"IncludeRGEs\" must be set to \"True\") \n
(x) \"IncludeLoopCorrections\", , Values: \"True\" or \"False\", Default: \"False\" \n
\t If the one-loop corrections to the self-energy and the tadpoles should be calculated.
\n \n
Note, ModelOutput calls MakeVertexList to calculate the vertices. ";

MakeTeX::notes="The options of MakeTeX[] are the following: \n
(i) \"FeynmanDiagrams\", Values: \"True\" or \"False\",Default: \"True\" \n
\t Defines,if the Feynman diagrams for all interactions should be drawn. \n
(ii) \"effectiveOperators\", Values: \"True\" or \"False\", Default: \"True\"\n
\t Defines, if the higher dimensional operators should be included in the LaTeX file.By default,this are only the vertices involving up to four particles. For switching on six particle interactions, \"SixParticleInteractions\" is used. \n
(iii) \"SixParticleInteractions\", Values: \"True\" or \"False\",Default: \"False\" \n
\t Defines, if also the six-particle interactions should be added to the LaTeX output \n
(iv) \"ShortForm\", Values: \"True\" or \"False\",Default: \"False\" \n
\t Defines,if a shorter notation for the vertices should be used  \n
(v) \"WriteSARAH\", Values: \"True\" or \"False\",Default: \"False\" \n
\t Defines,if the names and parameters used in SARAH should be written";

CalcRGEs::notes="The options of CalcRGEs are the following: \n
(i) \"TwoLoop\",Values: \"True\" or \"False\",Default: \"True\" \n
\t If also the two loop RGEs should be calculated. \n
(ii) \"ReadLists\", Values: \"True\" or \"False\",Default: \"False\" \n
\t If the RGEs have already be calculated, the results are saved \n
\t in the output directory. The RGEs can be read from these files \n
\t instead of doing  the complete calculation again. \n
(iii) \"VariableGenerations\", Value: List of particles, Default: \"{}\"\n
\t Some theories contain heavy superfields which should be integrated out \n
\t above the SUSY scale. Therefore, it is possible to calculate the RGEs \n
\t assuming the number of generations of specific superfields as free variable \n
\t  to make the dependence on these fields obvious. \n
\t The new variable is named \"NumberGenertions[X]\", \n
\t where \"X\" is the name of the superfield. \n
(iv) \"NoMatrixMultiplication\", Values: \"True\" or \"False\",Default: \"True\" \n
\t Normally, the beta-functions are simplified by writing the sums over generation indices \n
\t as matrix multiplication.This can be switched off using this option.
\n \n
The results are saved in: \n
 - \"Gij\":Anomalous dimensions of all chiral superfields \n
 - \"BetaWijkl\":Quartic superpotential parameters \n
 - \"BetaYijk\":Trilinear superpotential parameters \n
 - \"BetaMuij\":Bilinear superpotential parameters \n
 - \"BetaLi\":Linear superpotential parameters \n
 - \"BetaQijkl\":Quartic soft-breaking parameters \n
 - \"BetaTijk\":Trilinear soft-breaking parameters \n
 - \"BetaBij\":Bilinear soft-breaking parameters \n
 - \"BetaSLi\":Linear soft-breaking parameters \n
 - \"Betam2ij\":Scalar squared masses \n
 - \"BetaMi\":Gaugino masses \n
 - \"BetaGauge\":Gauge couplings \n
 - \"BetaVEVs\":VEVs";

(*
SARAH`FirstSteps:=Block[{},
Print["Welcome to the SARAH package. SARAH is supposed to give you an easy and quick access to information about supersymmetric, but partly also non-supersymmetric models. This includes mass matrices, vertices, renormalization group equations and one-loop corrections to self-energies and tadpoles. SARAH also creates everything for you what is needed to implement new models in tools like SPheno, WHIZARD/Omega, FeynArts/FormCalc, CalcHep/CompHep and MicrOmegas."];
Print[""];
Print["This might be your first steps: "];
Print[" - To generate the entire output for SPheno, WHIZARD, FeynArts, CalcHep and LaTeX, you can use \"MakeAll[]\""];
Print[" - If you have recently created the model, you might check the implementation for consistency using \"CheckModel\""];
Print[" - To take a look at the mass matrices of this model, use \"MassMatrices[",Last[NameOfStates],"]\""];
Print[" - For an overview about the most important commands use \"SARAH`Commands\""];
Print[" - Run the examples delivered with the package."];
Print[""];
Print["If you have any questions or feedback, please send an eMail to"];
Print["fnstaub@th.physik.uni-bonn.de"];
];
*)

SARAH`FirstSteps:=Block[{},
Print["Welcome to the SARAH package. SARAH is supposed to give you an easy and quick access to information about supersymmetric, but partly also non-supersymmetric models. This includes mass matrices, vertices, renormalization group equations and one-loop corrections to self-energies and tadpoles. SARAH also creates everything for you what is needed to implement new models in tools like SPheno, WHIZARD/Omega, FeynArts/FormCalc, CalcHep/CompHep and MicrOmegas."];
Print[""];
Print["This might be your first steps: "];
Print[" - To generate the entire output for SPheno, WHIZARD, FeynArts, CalcHep and LaTeX, you can use ",StyleForm["MakeAll[]","Section",FontSize->12]];
Print[" - If you have recently created the model, you might check the implementation for consistency using ",StyleForm["CheckModel","Section",FontSize->12]];
Print[" - To take a look at the mass matrices of this model, use ",StyleForm["MassMatrices[","Section",FontSize->12],Last[NameOfStates],StyleForm["]","Section",FontSize->12]];
Print[" - For an overview about the most important commands use ",StyleForm["SARAH`Commands","Section",FontSize->12]];
Print[" - Run the examples delivered with the package."];
Print[""];
Print["If you have any questions or feedback, please send an eMail to"];
Print["florian.staub@cern.ch"];
];




Vertex::notes="The options of Vertex are the following: \n
(i) \"Eigenstates\", Value: \"Name of Eigenstates\", Default: Last entry in \"NameOfState\" \n
\t Fixes the considered eigenstates \n
(ii) \"UseDependences\": Value \"True\" or \"False\", Default: \"False\" \n
\t Optional relations between the parameters will be used, if \"UseDependences\" is set to \"True\".
\n
\n
Vertex will return as result an array: \n
\n
\t \"{{ParticleList},{{Coefficient 1,Lorentz 1},{Coefficient 2,Lorentz 2},...}\"  \n
\n
First,the list of the involved particles is given and the indices are inserted.The second part consists of the value of the vertex and can be also a list,if different Lorentz structures are possible.In the part independent of Lorentz indices can appear.";

Tadpoles1LoopList::usage = "Tadpoles1LoopList[Eigenstates] returns a list with all one-loop corrections to the tadpoles for given Eigenstates. Note, CalcLoopCorrections[Eigenstates] has to be used before to derive that information.";
Tadpoles1LoopSum::usage = "Tadpoles1LoopSum[Eigenstates] returns the exprssions for all one-loop corrections to the tadpoles for given Eigenstates. Note, CalcLoopCorrections[Eigenstates] has to be used before to derive that information.";
SelfEnergy1LoopList::usage = "SelfEnergy1LoopList[Eigenstates] returns a list with all one-loop self-energies for given Eigenstates. Note, CalcLoopCorrections[Eigenstates] has to be used before to derive that information.";
SelfEnergy1LoopSum::usage = "SelfEnergy1LoopSum[Eigenstates] returns the exprssions for all one-loop self-energies to the tadpoles for given Eigenstates. Note, CalcLoopCorrections[Eigenstates] has to be used before to derive that information.";

CheckModel::usage="CheckModel checks the model and involved definitions for consistency.";
NumericalValue::usage="NumericalValue[expr] calculates the numerical values for a given expression or parameter";
ReadSpectrum::usage="ReadSpectrum[File] reads the spectrum from a given Les Houches file";
ExportModelInformation::usage="Write two files with all information about the particles and parameters of a given model";
ShowSuperpotentialContractions::usage="ShowSuperpotentialContractions shows the contraction of the charge indices in the superpotential.";

GaugeSector::NewSyntax = "The syntax for the definition of the rotations in the gauge sector has changed (since version 3.0.beta30). Please, use the new syntax or change the Head in the input file to \"DEFINITION[...][GaugeSectorOld]\"";

CheckModelFiles::MissingParticle="The following particle are not defined in ParticleDefinitions in particles.m: ``";
CheckModelFiles::MissingParameter="The following parameters are not defined in ParameterDefinitions in paramaters.m: ``";
CheckModelFiles::MissingOutputName="For the following particles is no OutputName defined: ``";
CheckModelFiles::MissingOutputNameParameter="For the following parameters is no OutputName defined: ``";
CheckModelFiles::WrongPDG="The number of PDG numbers defined for the following particles does not fit to their number of generations: ``";
CheckModelFiles::WrongPDGIX="The number of PDG.IX numbers defined for the following particles does not fit to their number of generations: ``";
CheckModelFiles::MissingLH="For the following parameters is no LesHouches Block defined: ``";

SARAH`Commands:=Block[{i},
(*
Print["---------------------------------------------------------------"];
Print["Commands to produce output for other tools"];
Print["---------------------------------------------------------------"];
*)
Print[StyleForm["Commands to produce output for other tools","Section",FontSize->12]];
For[i=1,i<=Length[SA`CommandsOutput],
Print[SA`CommandsOutput[[i]]];
i++;];

(*
Print["---------------------------------------------------------------"];
Print["Commands to perform calculations and to get physical information"];
Print["---------------------------------------------------------------"];
*)
Print[StyleForm["Commands to perform calculations and to get physical information","Section",FontSize->12]];
For[i=1,i<=Length[SA`CommandsCalculation],
Print[SA`CommandsCalculation[[i]]];
i++;];

(*Print["---------------------------------------------------------------"];
Print["Commands to get information about the particles and parameters "];
Print["---------------------------------------------------------------"];*)
Print[StyleForm["Commands to get information about the particles and parameters","Section",FontSize->12]];
For[i=1,i<=Length[SA`CommandsModel],
Print[SA`CommandsModel[[i]]];
i++;];

(*Print["---------------------------------------------------------------"];
Print["Commands to perform checks of the model   "];
Print["---------------------------------------------------------------"];*)
Print[StyleForm["Commands to perform checks of the model","Section",FontSize->12]];
For[i=1,i<=Length[SA`CommandsChecks],
Print[SA`CommandsChecks[[i]]];
i++;];

];

CheckModelFile:=Block[{i,j,k,l},

PrintDebug["Checking Model Files ..."];
Print["Checking model files: ",Dynamic[DynamicCheckModelFiles]];

DynamicCheckModelFiles="Processing main file";

ModelFileOK=True;

If[Head[ModelName]=!=String,
Message[ModelFile::BadModelName];
];

neededLength = 3 + Length[Gauge]+Length[Global];

If[SupersymmetricModel=!=False,
For[i=1,i<=Length[Fields],
If[Length[Fields[[i]]]!= neededLength,
Message[ModelFile::badlengthSF,Fields[[i,3]]];
ModelFileOK=False;
];
i++;];,
For[i=1,i<=Length[ScalarFields],
If[Length[ScalarFields[[i]]]!= neededLength,
Message[ModelFile::badlengthSF,ScalarFields[[i,1]]];
ModelFileOK=False;
];
i++;];
For[i=1,i<=Length[FermionFields],
If[Length[FermionFields[[i]]]!= neededLength,
Message[ModelFile::badlengthSF,FermionFields[[i,1s]]];
ModelFileOK=False;
];
i++;];
];


ListSF=Transpose[Fields][[3]];

For[i=1,i<=Length[SuperPotential],
For[j=1,j<=Length[SuperPotential[[i,2]]],
If[FreeQ[ListSF,SuperPotential[[i,2,j]]]==True,
Message[ModelFile::undefinedSF,SuperPotential[[i,2,j]]];
ModelFileOK=False;
];
j++;];
i++;];

For[i=1,i<=Length[NameOfStates],
If[FreeQ[DEFINITION[NameOfStates[[i]]][GaugeFixing],DEFINITION],
For[j=1,j<=Length[DEFINITION[NameOfStates[[i]]][GaugeFixing]],
If[FreeQ[DEFINITION[NameOfStates[[i]]][GaugeFixing][[j,2]],RXi]==True,
Message[ModelFile::NoGaugeFixingParameter,DEFINITION[NameOfStates[[i]]][GaugeFixing][[j,2]]];
ModelFileOK=False;
];
j++;];
];
i++;];


For[i=1,i<=Length[NameOfStates],
If[FreeQ[DEFINITION[NameOfStates[[i]]][GaugeSectorOld],DEFINITION],
For[j=1,j<=Length[DEFINITION[NameOfStates[[i]]][GaugeSectorOld]],
If[StringTake[ToString[DEFINITION[NameOfStates[[i]]][GaugeSectorOld][[j,1]]],1]==="V",
For[k=2,k<=Length[DEFINITION[NameOfStates[[i]]][GaugeSectorOld][[j]]],
For[l=2,l<=Length[DEFINITION[NameOfStates[[i]]][GaugeSectorOld][[j,k]]],
If[StringTake[ToString[RE[DEFINITION[NameOfStates[[i]]][GaugeSectorOld][[j,k,l,1]]]],1]=!="V",
Message[ModelFile::badvectorboson,DEFINITION[NameOfStates[[i]]][GaugeSectorOld][[j,k,l,1]]];
ModelFileOK=False;
];
l++;];
k++;];
];
j++;];
];
i++;];

If[ModelFileOK==True,
PrintDebug["    Model File is okay"];
];

DynamicCheckModelFiles="Processing particle file";

ParticleFileOK=True;

For[i=1,i<=Length[NameOfStates],
If[Head[ParticleDefinitions[NameOfStates[[i]]]]===List,
CheckParticleDefinitions[ParticleDefinitions[NameOfStates[[i]]]];,
Message[ModelFile::MissingDefParticle,NameOfStates[[i]]];
ParticleFileOK=False;
];
i++;];

If[ParticleFileOK==True,
PrintDebug["    Particle File is okay"];
];

DynamicCheckModelFiles="Processing parameter file";
ParameterFileOK=True;


CheckParameterDefinitions[ParameterDefinitions];

If[ParameterFileOK==True,
PrintDebug["    Parameter File is okay"];
];

If[ParameterFileOK==True && ParticleFileOK==True && ModelFileOK==True,
DynamicCheckModelFiles="All files okay";,
DynamicCheckModelFiles="Found problems. Main file: "<>(ModelFileOK /. {True->"ok",False->"buggy"})<>". Particle file: "<>(ParticleFileOK /. {True->"ok",False->"buggy"})<>". Parameter file: "<>(ParameterFileOK /. {True->"ok",False->"buggy"})<>"\n";
	];

];



CheckParameterDefinitions[list_]:=Block[{temp,i},
KnownEntries={Dependence,DependenceNum,DependenceOptional,Description,DependenceSPheno,Form,GUTnormalization,LaTeX,LesHouches,OutputName,Real,Value,MatrixProduct};
temp=Intersection[Flatten[Transpose[list][[2]]] /. (a_ -> b_)->a];
temp=Complement[temp,KnownEntries];

If[temp=!={},
ParameterFileOK = False;
For[i=1,i<=Length[temp],
Message[ModelFile::UnknownKeywordParameter,temp[[i]]];
i++;];
If[FreeQ[temp,Symmetry]==False,
Symmetry::obsolete="Note, the Definition of the symmetry of a parameter is no longer necessary in parameters.m. This information is now derived by SARAH automatically.";
Message[Symmetry::obsolete];
];

];
];

CheckParticleDefinitions[list_]:=Block[{temp,i},
KnownEntries={Description,FeynArtsNr,LaTeX,Mass,MassDependence,OutputName,PDG,PDG.IX,ElectricCharge,Width,LHPC, Goldstone};
temp=Intersection[Flatten[Transpose[list][[2]]] /. (a_ -> b_)->a];
temp=Complement[temp,KnownEntries];

If[temp=!={},
ParticleFileOK = False;
For[i=1,i<=Length[temp],
Message[ModelFile::UnknownKeywordParticle,temp[[i]]];
i++;];
If[FreeQ[temp,RParity]==False,
RParity::obsolete="Note, the Definition of the R-partiy is no longer necessary in particles.m, but has been replaced by the definition of global symmetries in the model file.";
Message[RParity::obsolete];
];
];
];


CheckConsistency[ES_]:=Block[{i, missingParticle={},missingParameter={},missingPDG={}, missingLHparameter={},allParticleNames,allParameterNames,missingOutputNames,missingPDGIX,UsePDGIXsave},

Print["Checking model for missing definitions"];

MakeTypeListParticles[ES];

allParticleNames = Flatten[{Transpose[PART[F]][[1]],Transpose[PART[V]][[1]],Transpose[PART[S]][[1]],Transpose[PART[G]][[1]]}];
allParameterNames = Transpose[parameters][[1]];

missingParticle = Select[allParticleNames,(FreeQ[Transpose[ParticleDefinitions[ES]][[1]],#]&)];
If[missingParticle=!={}, Message[CheckModelFiles::MissingParticle,missingParticle];];

missingParameter = Select[allParameterNames,((FreeQ[Transpose[ParameterDefinitions][[1]],#] && Head[#]=!=Mass)&)];
If[missingParameter=!={},Message[CheckModelFiles::MissingParameter,missingParameter];];

missingOutputNames = Select[allParticleNames, (getOutputName[#,1,1]===None )&];
If[missingOutputNames=!={}, Message[CheckModelFiles::MissingOutputName,missingOutputNames];];

UsePDGIXsave=UsePDGIX;
UsePDGIX=False;

allParticleNames = Flatten[{Transpose[PART[F]][[1]],Transpose[PART[V]][[1]],Transpose[PART[S]][[1]]}];
missingPDG = Select[allParticleNames,((getFla[#]*getGen[#]=!=Length[getPDG[#]]  && getPDG[#]=!=None)&)];
missingPDG = Select[missingPDG,(FreeQ[SGauge,#] || Length[getPDG[#]]<1)&];
missingPDG = Select[missingPDG,(FreeQ[FGauge /. diracSubBack1[ES] /. diracSubBack2[ES],#] || Length[getPDG[#]]<1)&];

If[missingPDG=!={},Message[CheckModelFiles::WrongPDG,missingPDG];];

UsePDGIX=True;

If[DeleteCases[Flatten[getGen/@allParticleNames],None]==={},
Print["PDG.IX not used, skipping check"];,
missingPDGIX = Select[allParticleNames,((getFla[#]*getGen[#]=!=Length[getPDG[#]]  && getPDG[#]=!=None)&)];
missingPDGIX = Select[missingPDG,(FreeQ[SGauge,#] || Length[getPDG[#]]<1)&];
missingPDGIX = Select[missingPDG,(FreeQ[FGauge /. diracSubBack1[ES] /. diracSubBack2[ES],#] || Length[getPDG[#]]<1)&];
If[missingPDGIX=!={},Message[CheckModelFiles::WrongPDGIX,missingPDGIX];];
];

UsePDGIX=UsePDGIXsave;

missingLHparameter = Select[allParticleNames, (Head[getLHBlockName[#]]===None)&];
If[missingLHparameter=!={},Message[CheckModelFiles::MissingLH,missingLHparameter];];

missingOutputNameParameter=Select[allParameterNames,(getEntryParameter[#,OutputName]===None && Head[#]=!=Mass)&];
If[missingOutputNameParameter=!={},Message[CheckModelFiles::MissingOutputNameParameter,missingOutputNameParameter];];

(* longOutputName = Select[allParameterNames, (StringLength[ToString[getEntryParameter[#,OutputName]]]>4)&]; *)

];


