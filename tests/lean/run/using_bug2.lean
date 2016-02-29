variable {A : Type}
variable {f : A → A → A}
variable {finv : A → A}
premise  (h : ∀ x y : A, finv (f x y) = y)

include h
theorem foo₁ : ∀ x y z : A, f x y = f x z → y = z :=
λ x y z, assume e, sorry

theorem foo₂ : ∀ x y z : A, f x y = f x z → y = z :=
λ x y z, assume e,
assert s₁ : finv (f x y) = finv (f x z), by rewrite e,
show y = z, by rewrite *h at s₁; exact s₁
