(* ::Package:: *)

Begin["System`Private`"]
(* Hide any symbols which are created *)

protected = Unprotect[$ProcessorCount]
$ProcessorCount = ToExpression [Environment["OMP_NUM_THREADS"]]
protected = Protect [$ProcessorCount]

WriteString [$Output, "Mathematica running on Myriad, Kathleen, Aristotle etc. at UCL"]

End[]
