"""
    Cplex{T <: Real} = Elliptic{T}

A complex number is an elliptic Cayley-Dickson construct with real numbers.
"""
const Cplex{T <: Real} = Elliptic{T}

function Cplex(a::T, b::T) where T <: Real
    Cplex{T}(a, b)
end

function Cplex(a::T) where T <: Real
    Cplex{T}(a, zero(T))
end

function Cplex(a::Real, b::Real)
    Cplex(promote(a, b)...)
end

"""
    unreal(z::Cplex)

The unreal part of a complex number is a 1-vector.
"""
function unreal(z::Cplex{T}) where T <: Real
    T[z.r]
end

function show(io::IO, z::Cplex)
    print(io, "[1: ")
    print(io, z.l)
    print(io, ", i: ")
    print(io, z.r)
    print(io, "]")
end

function random(::Type{Cplex{T}}) where T <: Real
    Cplex{T}(rand(T), rand(T))
end

function random(::Type{Cplex{BigInt}})
    Cplex{BigInt}(randomBigInt(), randomBigInt())
end

function random(::Type{Cplex{BigFloat}})
    Cplex{BigFloat}(randomBigFloat(), randomBigFloat())
end

function random(::Type{Cplex{Rational{BigInt}}})
    Cplex{Rational{BigInt}}(randomBigRational(), randomBigRational())
end

function convert(::Type{Cplex{T}}, a::Real) where T <: Real
    Cplex{T}(a, zero(T))
end

function convert(::Type{Cplex{T}}, z::Cplex) where T <: Real
    Cplex{T}(z.l, z.r)
end

function promote_rule(::Type{Cplex{T}}, ::Type{S}) where {T <: Real, S <: Real}
    Cplex{promote_type(T, S)}
end

function promote_rule(::Type{Cplex{T}}, ::Type{Cplex{S}}) where {T <: Real, S <: Real}
    Cplex{promote_type(T, S)}
end
