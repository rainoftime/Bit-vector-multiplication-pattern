(set-logic QF_BV)
(declare-fun v1 () (_ BitVec 8)) 
(declare-fun v2 () (_ BitVec 8)) 
(declare-fun v3 () (_ BitVec 8)) 
(declare-fun v4 () (_ BitVec 8)) 
(declare-fun v5 () (_ BitVec 8)) 
(declare-fun v6 () (_ BitVec 8)) 
(define-fun $e7 () (_ BitVec 16) (concat #b00000000 v1))
(define-fun $e8 () (_ BitVec 16) (concat #b00000000 v3))
(define-fun $e9 () (_ BitVec 16) (concat #b00000000 v4))
(define-fun $e10 () (_ BitVec 16) (concat #b00000000 v5))
(define-fun $e11 () (_ BitVec 16) (concat #b00000000 v6))
(define-fun $e12 () (_ BitVec 16) (concat #b00000000 v2))
(assert (not (= (bvadd (concat (concat #b0000000000000000 (bvmul $e7 $e8)) #b00000000000000000000000000000000) (bvadd (concat (concat #b000000000000000000000000 (bvmul $e7 $e9)) #b000000000000000000000000) (bvadd (concat (concat #b00000000000000000000000000000000 (bvmul $e7 $e10)) #b0000000000000000) (bvadd (concat (concat #b0000000000000000000000000000000000000000 (bvmul $e7 $e11)) #b00000000) (bvadd (bvadd (bvadd (concat #b000000000000000000000000000000000000000000000000 (bvmul $e11 $e12)) (concat (concat #b0000000000000000000000000000000000000000 (bvmul $e10 $e12)) #b00000000)) (concat (concat #b00000000000000000000000000000000 (bvmul $e9 $e12)) #b0000000000000000)) (concat (concat #b000000000000000000000000 (bvmul $e8 $e12)) #b000000000000000000000000)))))) (bvmul (concat (concat (concat (concat #b00000000000000000000000000000000 v3) v4) v5) v6) (concat (concat #b000000000000000000000000000000000000000000000000 v1) v2)))))
(check-sat)
(exit)