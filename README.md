# MergeSorted

[![Build Status](https://travis-ci.org/vvjn/MergeSorted.jl.svg?branch=master)](https://travis-ci.org/vvjn/MergeSorted.jl) [![codecov.io](http://codecov.io/github/vvjn/MergeSorted.jl/coverage.svg?branch=master)](http://codecov.io/github/vvjn/MergeSorted.jl?branch=master)

Efficiently merge two sorted vectors into one sorted vector. Provides the `mergesorted` and `mergesorted!` functions.

E.g.

```julia
using MergeSorted

a = sort!(rand(1000), order=Base.Reverse)
b = sort!(rand(1000), order=Base.Reverse)
c = mergesorted(a,b, order=Base.Reverse)
sort!(vcat(a,b), order=Base.Reverse) == c
```

MergeSorted can be installed as follows.

```julia
Pkg.add("MergeSorted")
```

