"""
    Exo4Real{T <: Real} = Parabolic{Exo3Real{T}}

A 4-exo-real number is a parabolic Cayley-Dickson construct with 3-exo-real numbers.
"""
const Exo4Real{T <: Real} = Parabolic{Exo3Real{T}}

function Exo4Real(z::Exo3Real{T}) where T <: Real
    Exo4Real{T}(z, zero(Exo3Real{T}))
end

function Exo4Real(z::Exo2Real{T}) where T <: Real
    Exo4Real{T}(
        Exo3Real{T}(z, zero(Exo2Real{T})),
        zero(Exo3Real{T})
    )
end

function Exo4Real(z::Exo1Real{T}) where T <: Real
    Exo4Real{T}(
        Exo3Real{T}(
            Exo2Real{T}(z, zero(Exo1Real{T})),
            zero(Exo2Real{T})),
        zero(Exo3Real{T})
    )
end

function Exo4Real(v::T...) where T <: Real
    n = length(v)
    if n <= 8
        return Exo4Real{T}(Exo3Real(v...), zero(Exo3Real{T}))
    end
    
    if n > 16
        return Exo4Real{T}(Exo3Real(v[1:8]...), Exo3Real(v[9:16]...))
    end

    Exo4Real{T}(Exo3Real(v[1:8]...), Exo3Real(v[9:end]...))
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
    Exo4Real{T}(random(Exo3Real{T}), random(Exo3Real{T}))
end
