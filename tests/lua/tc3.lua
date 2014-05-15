local env = empty_environment()
local t1  = mk_lambda("A", Type, mk_lambda("a", Var(0), Var(0)), binder_info(true))
local t2  = mk_lambda("A", Type, mk_lambda("a", Var(0), Var(0)))
print(t1)
print(t2)
local tc  = type_checker(env)
local T1  = mk_pi("A", Type, mk_arrow(Var(0), Var(1)), binder_info(true))
local T2  = mk_pi("A", Type, mk_arrow(Var(0), Var(1)))
print(T1)
print(T2)
assert(T1 == T2) -- The default equality ignores binder information
assert(not (T1:is_bi_equal(T2)))
print(tc:check(t1))
print(tc:check(t2))
assert(tc:check(t1):binder_info():is_implicit())
assert(not tc:check(t2):binder_info():is_implicit())
assert(tc:check(t1):is_bi_equal(T1))
assert(tc:check(t2):is_bi_equal(T2))
