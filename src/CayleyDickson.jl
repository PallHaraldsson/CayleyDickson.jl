__precompile__()

module CayleyDickson

import Base: +, -, *, /, \, real, isreal, conj, inv, abs2, show, zero, one, iszero, ==,
             promote_rule, widen, convert, float
# import Unreal: unreal

"Error when finding the inverse of a zero divisor."
const ZeroDivisorInverse = "inverse of zero divisor"

"Error when the denominator in a quotient is zero."
const ZeroDenominator = "denominator is zero"

include("Construct.jl")
include("Elliptic.jl")
include("Cplex.jl")
include("Hamilton.jl")
include("Cayley.jl")
include("Hyperbolic.jl")
include("Perplex.jl")
include("Cockle.jl")
include("SplitOctonion.jl")
include("Parabolic.jl")
include("Exoplex.jl")
include("BiExoplex.jl")
include("ExoComplex.jl")
include("ExoPerplex.jl")
include("TriExoplex.jl")
include("BiExoComplex.jl")
include("BiExoPerplex.jl")
include("ExoHamilton.jl")
include("ExoCockle.jl")
include("Sedenion.jl")
include("TetraExoplex.jl")
include("random.jl")

# Types
export Construct, Elliptic, Hyperbolic, Parabolic,
       Cplex, Perplex, Exoplex,
       Hamilton, Cockle, BiExoplex, ExoComplex, ExoPerplex,
       Cayley, SplitOctonion, ExoHamilton, ExoCockle, TriExoplex, BiExoComplex, BiExoPerplex,
       Sedenion, TetraExoplex

# Methods
export unreal, array, iszerodivisor, random,
       commutator, associator, jacobiator, alternatorL, alternatorR, flexator,
       anti_commutator, anti_associator, anti_alternatorL, anti_alternatorR, anti_flexator,
       cloak, dagger, star, selfstar, anti_selfstar

end
