# WeakCacheSets

This package impliments 1 datastructe `WeakCacheSet` and one function `getkey!`. `WeakCacheSet` is simiar to a julia `WeakKeyDict`, but specificially taylored to use as a cache. A `WeakKeyDict` has significant overhead. Specifically, `WeakKeyDict` has a lot of overhead necessary to keep track of `length` and to support manual deletion. By contrast, `WeakCacheSet` has only a constructor and `getkey!` which functions as follows:

`getkey!(c::WeakCacheSet, key)`
if `key` is equal to an entry in `c`, return that key. Otherwise, insert the provided `key` and return it.
