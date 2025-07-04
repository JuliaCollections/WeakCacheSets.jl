using WeakCacheSets
using Test

# This doesn't work if put inside a testset
wcs = WeakCacheSet{Vector{Int}}()
# The only function we have is `getkey!`, so we check
# contents using `repr`.
@test repr(wcs) == "WeakCacheSet()"
a = [1,2,3]
b = @inferred getkey!(wcs, a)
@test repr(wcs) == "WeakCacheSet([1, 2, 3])"
@test b === a
c = @inferred getkey!(wcs, b)
@test a === b === c
a = b = c = nothing

# hopefully this is enough
GC.gc(); GC.gc(); GC.gc()

@test repr(wcs) == "WeakCacheSet()"
