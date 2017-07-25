"""
    Exo3Real{T <: Real} = Parabolic{BiExoplex{T}}

A 3-exo-real number is a parabolic Cayley-Dickson construct with bi-exoplex numbers.
"""
const Exo3Real{T <: Real} = Parabolic{BiExoplex{T}}

function Exo3Real(z::BiExoplex{T}) where T <: Real
    Exo3Real{T}(z, zero(BiExoplex{T}))
end

function Exo3Real(z::Exoplex{T}) where T <: Real
    Exo3Real{T}(
        BiExoplex{T}(z, zero(Exoplex{T})),
        zero(BiExoplex{T})
    )
end

function Exo3Real(a::T, b::T, c::T, d::T, f::T, g::T, h::T, j::T) where T <: Real
    Exo3Real{T}(
        BiExoplex{T}(
            Exoplex{T}(a, b),
            Exoplex{T}(c, d)
        ),
        BiExoplex{T}(
            Exoplex{T}(f, g),
            Exoplex{T}(h, j)
        )
    )
end

function Exo3Real(a::T, b::T, c::T, d::T, f::T, g::T, h::T) where T <: Real
    Exo3Real{T}(
        BiExoplex{T}(
            Exoplex{T}(a, b),
            Exoplex{T}(c, d)
        ),
        BiExoplex{T}(
            Exoplex{T}(f, g),
            Exoplex{T}(h, zero(T))
        )
    )
end

function Exo3Real(a::T, b::T, c::T, d::T, f::T, g::T) where T <: Real
    Exo3Real{T}(
        BiExoplex{T}(
            Exoplex{T}(a, b),
            Exoplex{T}(c, d)
        ),
        BiExoplex{T}(
            Exoplex{T}(f, g),
            zero(Exoplex{T})
        )
    )
end

function Exo3Real(a::T, b::T, c::T, d::T, f::T) where T <: Real
    Exo3Real{T}(
        BiExoplex{T}(
            Exoplex{T}(a, b),
            Exoplex{T}(c, d)
        ),
        BiExoplex{T}(
            Exoplex{T}(f, zero(T)),
            zero(Exoplex{T})
        )
    )
end

function Exo3Real(a::T, b::T, c::T, d::T) where T <: Real
    Exo3Real{T}(
        BiExoplex{T}(
            Exoplex{T}(a, b),
            Exoplex{T}(c, d)
        ),
        zero(BiExoplex{T})
    )
end

function Exo3Real(a::T, b::T, c::T) where T <: Real
    Exo3Real{T}(
        BiExoplex{T}(
            Exoplex{T}(a, b),
            Exoplex{T}(c, zero(T))
        ),
        zero(BiExoplex{T})
    )
end

function Exo3Real(a::T, b::T) where T <: Real
    Exo3Real{T}(
        BiExoplex{T}(
            Exoplex{T}(a, b),
            zero(Exoplex{T})
        ),
        zero(BiExoplex{T})
    )
end

function Exo3Real(a::T) where T <: Real
    Exo3Real{T}(
        BiExoplex{T}(
            Exoplex{T}(a, zero(T)),
            zero(Exoplex{T})
        ),
        zero(BiExoplex{T})
    )
end

function Exo3Real(a::Real, b::Real)
    Exo3Real(promote(a, b)...)
end

function Exo3Real(a::Real, b::Real, c::Real)
    Exo3Real(promote(a, b, c)...)
end

function Exo3Real(a::Real, b::Real, c::Real, d::Real)
    Exo3Real(promote(a, b, c, d)...)
end

function Exo3Real(a::Real, b::Real, c::Real, d::Real, f::Real)
    Exo3Real(promote(a, b, c, d, f)...)
end

function Exo3Real(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real)
    Exo3Real(promote(a, b, c, d, f, g)...)
end

function Exo3Real(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real)
    Exo3Real(promote(a, b, c, d, f, g, h)...)
end

function Exo3Real(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real, j::Real)
    Exo3Real(promote(a, b, c, d, f, g, h, j)...)
end

function cloak(z::Exo3Real{T}) where T <: Real
    Exo3Real{T}(cloak(z.l), dagger(z.r))
end

function dagger(z::Exo3Real{T}) where T <: Real
    Exo3Real{T}(dagger(z.l), cloak(z.r))
end

function star(z::Exo3Real{T}) where T <: Real
    Exo3Real{T}(dagger(star(z.r)), star(z.l))
end

function selfstar(z::Exo3Real)
    (z + star(z)) / 2
end

function anti_selfstar(z::Exo3Real)
    (z - star(z)) / 2
end

"""
    unreal(z::Exo3Real)

The unreal part of a 3-exo-real number is a 7-vector.
"""
function unreal(z::Exo3Real)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::Exo3Real)
    print(io, "[1: ")
    print(io, z.l.l.l)
    print(io, ", a: ")
    print(io, z.l.l.r)
    print(io, ", b: ")
    print(io, z.l.r.l)
    print(io, ", ab: ")
    print(io, z.l.r.r)
    print(io, ", c: ")
    print(io, z.r.l.l)
    print(io, ", ac: ")
    print(io, z.r.l.r)
    print(io, ", bc: ")
    print(io, z.r.r.l)
    print(io, ", (ab)c: ")
    print(io, z.r.r.r)
    print(io, "]")
end

function random(::Type{Exo3Real{T}}) where T <: Real
    Exo3Real{T}(random(BiExoplex{T}), random(BiExoplex{T}))
end
