(set-option :produce-proofs true)
(declare-const a Int)
(assert (and (> a 3) (< a 2)))
(check-sat)
(get-proof)
