(set-logic QF_BV)
(declare-fun v1 () (_ BitVec 8)) 
(declare-fun v2 () (_ BitVec 8)) 
(declare-fun v3 () (_ BitVec 8)) 
(declare-fun v4 () (_ BitVec 8)) 
(declare-fun v5 () (_ BitVec 8)) 
(define-fun $e6 () (_ BitVec 16) (concat #b00000000 v4))
(define-fun $e7 () (_ BitVec 16) (concat #b00000000 v1))
(define-fun $e8 () (_ BitVec 16) (bvmul $e6 $e7))
(define-fun $e9 () (_ BitVec 16) (concat #b00000000 v5))
(define-fun $e10 () (_ BitVec 16) (concat #b00000000 v2))
(define-fun $e11 () (_ BitVec 16) (bvmul $e6 $e10))
(define-fun $e12 () (_ BitVec 16) (concat #b00000000 v3))
(define-fun $e13 () (_ BitVec 16) (bvmul $e6 $e12))
(assert (not (= (bvadd (concat $e8 #b000000000000000000000000000000000000000000000000) (bvadd (concat (concat #b00000000 $e8) #b0000000000000000000000000000000000000000) (bvadd (bvadd (concat (concat #b000000000000000000000000 (bvmul $e7 $e9)) #b000000000000000000000000) (bvadd (concat (concat (concat #b00000000 $e11) $e13) #b000000000000000000000000) (bvadd (concat (concat (concat #b0000000000000000 $e11) $e13) #b0000000000000000) (bvadd (concat (concat #b00000000000000000000000000000000 (bvmul $e9 $e10)) (bvmul $e9 $e12)) (concat (concat (concat #b000000000000000000000000 $e11) $e13) #b00000000))))) (concat (concat #b0000000000000000 $e8) #b00000000000000000000000000000000)))) (bvmul (concat (concat (concat (concat #b00000000000000000000000000000000 v4) v4) v4) v5) (concat (concat (concat (concat #b00000000000000000000000000000000 v1) v2) #b00000000) v3))))) 
(check-sat)
(exit)
