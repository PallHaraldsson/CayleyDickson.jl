"""
    Exo4Real{T <: Real} = Parabolic{TriExoplex{T}}

A 4-exo-real number is a parabolic Cayley-Dickson construct with tri-exoplex numbers.
"""
const Exo4Real{T <: Real} = Parabolic{TriExoplex{T}}

function Exo4Real(z::TriExoplex{T}) where T <: Real
    Exo4Real{T}(z, zero(TriExoplex{T}))
end

function Exo4Real(z::BiExoplex{T}) where T <: Real
    Exo4Real{T}(
        TriExoplex{T}(z, zero(BiExoplex{T})),
        zero(TriExoplex{T})
    )
end

function Exo4Real(z::Exoplex{T}) where T <: Real
    Exo4Real{T}(
        TriExoplex{T}(
            BiExoplex{T}(z, zero(Exoplex{T})),
            zero(BiExoplex{T})),
        zero(TriExoplex{T})
    )
end

function cloak(z::Exo4Real{T}) where T <: Real
    Exo4Real{T}(cloak(z.l), dagger(z.r))
end

function dagger(z::Exo4Real{T}) where T <: Real
    Exo4Real{T}(dagger(z.l), cloak(z.r))
end

function star(z::Exo4Real{T}) where T <: Real
    Exo4Real{T}(dagger(star(z.r)), star(z.l))
end

function selfstar(z::Exo4Real)
    (z + star(z) + dagger(z) + star(dagger(z))) / 4
end

function anti_selfstar(z::Exo4Real)
    (z - star(z) + dagger(z) - star(dagger(z))) / 4
end

"""
    unreal(z::Exo4Real)

The unreal part of a 4-exo-real number is a 15-vector.
"""
function unreal(z::Exo4Real)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::Exo4Real)
    print(io, "[1: ")
    print(io, z.l.l.l.l)
    print(io, ", a: ")
    print(io, z.l.l.l.r)
    print(io, ", b: ")
    print(io, z.l.l.r.l)
    print(io, ", ab: ")
    print(io, z.l.l.r.r)
    print(io, ", c: ")
    print(io, z.l.r.l.l)
    print(io, ", ac: ")
    print(io, z.l.r.l.r)
    print(io, ", bc: ")
    print(io, z.l.r.r.l)
    print(io, ", (ab)c: ")
    print(io, z.l.r.r.r)
    print(io, ", d: ")
    print(io, z.r.l.l.l)
    print(io, ", ad: ")
    print(io, z.r.l.l.r)
    print(io, ", bd: ")
    print(io, z.r.l.r.l)
    print(io, ", (ab)d: ")
    print(io, z.r.l.r.r)
    print(io, ", cd: ")
    print(io, z.r.r.l.l)
    print(io, ", (ac)d: ")
    print(io, z.r.r.l.r)
    print(io, ", (bc)d: ")
    print(io, z.r.r.r.l)
    print(io, ", ((ab)c)d: ")
    print(io, z.r.r.r.r)
    print(io, "]")
end

function random(::Type{Exo4Real{T}}) where T <: Real
    Exo4Real{T}(random(TriExoplex{T}), random(TriExoplex{T}))
end
