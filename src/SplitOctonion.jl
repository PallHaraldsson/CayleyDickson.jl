"""
    SplitOctonion{T <: Real} = Hyperbolic{Hamilton{T}}

A split-octonion is a hyperbolic Cayley-Dickson construct with Hamilton quaternions.
"""
const SplitOctonion{T <: Real} = Hyperbolic{Hamilton{T}}

function SplitOctonion(z::Hamilton{T}) where T <: Real
    SplitOctonion{T}(z, zero(Hamilton{T}))
end

function SplitOctonion(z::Cplex{T}) where T <: Real
    SplitOctonion{T}(
        Hamilton{T}(z, zero(Cplex{T})),
        zero(Hamilton{T})
    )
end

function SplitOctonion(a::T, b::T, c::T, d::T, f::T, g::T, h::T, j::T) where T <: Real
    SplitOctonion{T}(
        Hamilton{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        Hamilton{T}(
            Cplex{T}(f, g),
            Cplex{T}(h, j)
        )
    )
end

function SplitOctonion(a::T, b::T, c::T, d::T, f::T, g::T, h::T) where T <: Real
    SplitOctonion{T}(
        Hamilton{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        Hamilton{T}(
            Cplex{T}(f, g),
            Cplex{T}(h, zero(T))
        )
    )
end

function SplitOctonion(a::T, b::T, c::T, d::T, f::T, g::T) where T <: Real
    SplitOctonion{T}(
        Hamilton{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        Hamilton{T}(
            Cplex{T}(f, g),
            zero(Cplex{T})
        )
    )
end

function SplitOctonion(a::T, b::T, c::T, d::T, f::T) where T <: Real
    SplitOctonion{T}(
        Hamilton{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        Hamilton{T}(
            Cplex{T}(f, zero(T)),
            zero(Cplex{T})
        )
    )
end

function SplitOctonion(a::T, b::T, c::T, d::T) where T <: Real
    SplitOctonion{T}(
        Hamilton{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        zero(Hamilton{T})
    )
end

function SplitOctonion(a::T, b::T, c::T) where T <: Real
    SplitOctonion{T}(
        Hamilton{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, zero(T))
        ),
        zero(Hamilton{T})
    )
end

function SplitOctonion(a::T, b::T) where T <: Real
    SplitOctonion{T}(
        Hamilton{T}(
            Cplex{T}(a, b),
            zero(Cplex{T})
        ),
        zero(Hamilton{T})
    )
end

function SplitOctonion(a::T) where T <: Real
    SplitOctonion{T}(
        Hamilton{T}(
            Cplex{T}(a, zero(T)),
            zero(Cplex{T})
        ),
        zero(Hamilton{T})
    )
end

function SplitOctonion(a::Real, b::Real)
    SplitOctonion(promote(a, b)...)
end

function SplitOctonion(a::Real, b::Real, c::Real)
    SplitOctonion(promote(a, b, c)...)
end

function SplitOctonion(a::Real, b::Real, c::Real, d::Real)
    SplitOctonion(promote(a, b, c, d)...)
end

function SplitOctonion(a::Real, b::Real, c::Real, d::Real, f::Real)
    SplitOctonion(promote(a, b, c, d, f)...)
end

function SplitOctonion(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real)
    SplitOctonion(promote(a, b, c, d, f, g)...)
end

function SplitOctonion(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real)
    SplitOctonion(promote(a, b, c, d, f, g, h)...)
end

function SplitOctonion(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real, j::Real)
    SplitOctonion(promote(a, b, c, d, f, g, h, j)...)
end


"""
    unreal(z::SplitOctonion)

The unreal part of a split-octonion is a 7-vector.
"""
function unreal(z::SplitOctonion)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::SplitOctonion)
    print(io, "[1: ")
    print(io, z.l.l.l)
    print(io, ", i: ")
    print(io, z.l.l.r)
    print(io, ", j: ")
    print(io, z.l.r.l)
    print(io, ", ij: ")
    print(io, z.l.r.r)
    print(io, ", s: ")
    print(io, z.r.l.l)
    print(io, ", is: ")
    print(io, z.r.l.r)
    print(io, ", js: ")
    print(io, z.r.r.l)
    print(io, ", (ij)s: ")
    print(io, z.r.r.r)
    print(io, "]")
end

function random(::Type{SplitOctonion{T}}) where T <: Real
    SplitOctonion{T}(random(Hamilton{T}), random(Hamilton{T}))
end
