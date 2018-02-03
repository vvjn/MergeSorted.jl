module MergeSorted

import Base.Order: Ordering, Forward, ord, lt
export mergesorted, mergesorted!

# merge sorted vectors vl and vr into v
# from indices lo to hi in v
function mergesorted!(v::AbstractVector,
                      lo::Int, hi::Int,
                      vl::AbstractVector,
                      lol::Int, hil::Int,
                      vr::AbstractVector,
                      lor::Int, hir::Int,                      
                      order::Ordering)
    c = lol
    p = lor
    nl = hil
    nr = hir
    i = lo
    @inbounds while c <= nl && p <= nr && i <= hi
        if lt(order, vr[p], vl[c])
            v[i] = vr[p]
            p = p+1
            i = i+1
        else
            v[i] = vl[c]
            c = c+1
            i = i+1
        end
    end
    @inbounds while p <= nr && i <= hi
        v[i] = vr[p]
        i = i+1
        p = p+1
    end
    @inbounds while c <= nl && i <= hi
        v[i] = vl[c]
        i = i+1
        c = c+1
    end
    v
end

function mergesorted!(v::AbstractVector, vl::AbstractVector,
                      vr::AbstractVector, order::Ordering)
    inds = indices(v,1)
    indsl = indices(vl,1)
    indsr = indices(vr,1)
    mergesorted!(v,first(inds),last(inds),vl,first(indsl),last(indsl),
                 vr,first(indsr),last(indsr),order)
end

"""
    mergesorted!(v, vl, vr; lt=isless, by=identity, rev::Bool=false, order::Ordering=Forward)

Merge sorted vectors `vl` and `vr`, overwriting vector `v`. Assumes
that `vl` and `vr` are sorted and does not check whether `vl` or `vr`
are sorted. You could used `issorted` to check if `vl` and `vr` are sorted.
If length of `v` is less than the sum of the lengths of
`vl` and `vr`, this simply stops when all indices in `v` are filled.
The `by` keyword lets you provide a function that will be applied to
each element before comparison; the `lt` keyword allows providing a
custom "less than" function; use `rev=true` to reverse the sorting
order. These options are independent and can be used together in all
possible combinations: if both `by` and `lt` are specified, the `lt`
function is applied to the result of the `by` function; `rev=true`
reverses whatever ordering specified via the `by` and `lt` keywords.
"""
function mergesorted!(v::AbstractVector,
                      vl::AbstractVector,
                      vr::AbstractVector;
                      lt=isless,
                      by=identity,
                      rev::Bool=false,
                      order::Ordering=Forward)
    ordr = ord(lt,by,rev,order)
    mergesorted!(v, vl, vr, ordr)
end

"""
    mergesorted(vl, vr; lt=isless, by=identity, rev::Bool=false, order::Ordering=Forward)

Merge sorted vectors `vl` and `vr`. See [`mergesorted!`](@ref).
"""
function mergesorted(vl::AbstractVector,
                      vr::AbstractVector;
                      lt=isless,
                      by=identity,
                      rev::Bool=false,
                      order::Ordering=Forward)
    v = similar(promote_type(typeof(vl),typeof(vr)), length(vl)+length(vr))
    ordr = ord(lt,by,rev,order)
    mergesorted!(v, vl, vr, ordr)
end

end # module
