(* mathcomp analysis (c) 2017 Inria and AIST. License: CeCILL-C.              *)
Require Import Reals.
From Coq Require Import ssreflect ssrfun ssrbool.
From mathcomp Require Import ssrnat eqtype choice order ssralg ssrnum.
Require Import boolp reals.

(******************************************************************************)
(* This file develops tools to make the manipulation of positive numbers      *)
(* easier, thanks to canonical structures.                                    *)
(*                                                                            *)
(*          !! x == triggers pretyping to fill the holes of the term x. The   *)
(*                  main use case is to trigger typeclass inference in the    *)
(*                  body of a ssreflect have := !! body.                      *)
(*                  Credits: Enrico Tassi.                                    *)
(*    {posnum R} == interface type for elements in R that are positive; R     *)
(*                  must have a numDomainType structure.                      *)
(*                  Allows to solve automatically goals of the form x > 0 if  *)
(*                  x is canonically a {posnum R}. {posnum R} is canonically  *)
(*                  stable by addition, multiplication, inverse, min and sqrt *)
(*                  All positive natural numbers ((n.+1)%:R) are also         *)
(*                  canonically in {posnum R}                                 *)
(*   PosNum xgt0 == packs the proof xgt0 : x > 0, for x : R, to build a       *)
(*                  {posnum R}.                                               *)
(*        x%:pos == explicitely casts x to {posnum R}, triggers the inference *)
(*                  of a {posnum R} structure for x.                          *)
(*        x%:num == explicit cast from {posnum R} to R.                       *)
(*       posreal == notation for {posnum R}, where R is the type of real      *)
(*                  numbers.                                                  *)
(*             2 == notation for 2%:R.                                        *)
(*    [gt0 of x] == infers a {posnum R} structure for x and outputs the proof *)
(*                  that x is positive.                                       *)
(******************************************************************************)

Reserved Notation "'{posnum' R }" (at level 0, format "'{posnum'  R }").
Reserved Notation "x %:pos" (at level 0, format "x %:pos").
Reserved Notation "x %:num" (at level 0, format "x %:num").
Reserved Notation "[gt0 'of' x ]" (format "[gt0 'of'  x ]").

Set Implicit Arguments.
Unset Strict Implicit.
Unset Printing Implicit Defensive.
Import Order.TTheory Order.Syntax GRing.Theory Num.Theory.

Delimit Scope R_scope with coqR.
Delimit Scope real_scope with real.
Close Scope R_scope.
Open Scope ring_scope.
Open Scope real_scope.
Bind Scope ring_scope with R.

(* Enrico's trick for tc resolution in have *)
Notation "!! x" := (ltac:(refine x)) (at level 100, only parsing).
(* infer class to help typeclass inference on the fly *)
Class infer (P : Prop) := Infer : P.
Hint Mode infer ! : typeclass_instances.
Hint Extern 0 (infer _) => (exact) : typeclass_instances.
Lemma inferP (P : Prop) : P -> infer P. Proof. by []. Qed.

Lemma splitr (R : numFieldType) (x : R) : x = x / 2%:R + x / 2%:R.
Proof. by rewrite -mulr2n -mulr_natr mulfVK //= pnatr_eq0. Qed.

Record posnum_of (R : numDomainType) (phR : phant R) := PosNumDef {
  num_of_pos : R;
  posnum_gt0 :> num_of_pos > 0
}.
Hint Resolve posnum_gt0 : core.
Hint Extern 0 ((0%R < _)%O = true) => exact: posnum_gt0 : core.
Notation "'{posnum' R }" := (posnum_of (@Phant R)).
Definition PosNum (R : numDomainType) x x_gt0 : {posnum R} :=
  @PosNumDef _ (Phant R) x x_gt0.

Notation "x %:num" := (num_of_pos x) : ring_scope.
Definition pos_of_num (R : numDomainType) (x : {posnum R})
   (phx : phantom R x%:num) := x.
Notation "x %:pos" := (pos_of_num (Phantom _ x)) : ring_scope.
Notation posreal := {posnum R}.
Notation "2" := 2%:R : ring_scope.

Section Order.
Variable (R : numDomainType).

Canonical posnum_subType := [subType for @num_of_pos R (Phant R)].
Definition posnum_eqMixin := [eqMixin of {posnum R} by <:].
Canonical posnum_eqType := EqType {posnum R} posnum_eqMixin.
Definition posnum_choiceMixin := [choiceMixin of {posnum R} by <:].
Canonical posnum_choiceType := ChoiceType {posnum R} posnum_choiceMixin.
Definition posnum_porderMixin := [porderMixin of {posnum R} by <:].
Canonical posnum_porderType := POrderType ring_display {posnum R} posnum_porderMixin.

Lemma posnum_le_total : totalPOrderMixin [porderType of {posnum R}].
Proof. by move=> x y; apply/real_comparable; apply/gtr0_real/posnum_gt0. Qed.

Canonical posnum_latticeType := DistrLatticeType {posnum R} posnum_le_total.
Canonical posnum_orderType := OrderType {posnum R} posnum_le_total.

End Order.

Section PosNum.
Context {R : numDomainType}.
Implicit Types (x y : {posnum R}).

Definition posnum_gt0_def x (phx : phantom R x%:num) := posnum_gt0 x.

Lemma posnum_ge0 x : x%:num >= 0 :> R. Proof. by apply: ltW. Qed.
Lemma posnum_eq0 x : (x%:num == 0 :> R) = false. Proof. by rewrite gt_eqF. Qed.
Lemma posnum_neq0 x : (x%:num != 0 :> R). Proof. by rewrite gt_eqF. Qed.

Lemma add_pos_gt0 x y : 0 < x%:num + y%:num.
Proof. by rewrite addr_gt0. Qed.
Canonical addr_posnum x y := PosNum (add_pos_gt0 x y).

Lemma mul_pos_posnum x y : 0 < x%:num * y%:num.
Proof. by rewrite mulr_gt0. Qed.
Canonical mulr_posnum x y := PosNum (mul_pos_posnum x y).

Lemma muln_pos_posnum x n : 0 < x%:num *+ n.+1.
Proof. by rewrite pmulrn_lgt0. Qed.
Canonical mulrn_posnum x n := PosNum (muln_pos_posnum x n).

Lemma inv_pos_gt0 x : 0 < x%:num^-1. Proof. by rewrite invr_gt0. Qed.
Canonical invr_posnum x := PosNum (inv_pos_gt0 x).

Lemma one_pos_gt0 : 0 < 1 :> R. Proof. by rewrite ltr01. Qed.
Canonical oner_posnum := PosNum one_pos_gt0.

Lemma posnum_le0 x : (x%:num <= 0 :> R) = false.
Proof. by rewrite lt_geF. Qed.

Lemma posnum_lt0 x : (x%:num < 0 :> R) = false.
Proof. by rewrite lt_gtF. Qed.

End PosNum.
Hint Extern 0 ((0%R <= _)%O = true) => exact: posnum_ge0 : core.
Hint Extern 0 ((_ != 0%R)%O = true) => exact: posnum_neq0 : core.

Section PosNumReal.
Context {R : realDomainType}.
Implicit Types (x y : {posnum R}).

Lemma min_posE x y : Num.min x%:num y%:num = (Num.min x y)%:num.
Proof.
case: (lcomparable_ltgtP (comparableT x y)) => [yx|xy|<-]; last first.
- by rewrite meetxx.
- by rewrite (meet_idPr _)// ltW.
- by rewrite (meet_idPl _)// ltW.
Qed.

Lemma min_pos_gt0 x y : 0 < Num.min x%:num y%:num.
Proof. by rewrite ltxI !posnum_gt0. Qed.
Canonical minr_posnum x y := PosNum (@min_pos_gt0 x y).

End PosNumReal.

Lemma sqrt_pos_gt0 (R : rcfType) (x : {posnum R}) : 0 < Num.sqrt (x%:num).
Proof. by rewrite sqrtr_gt0. Qed.
Canonical sqrt_posnum (R : rcfType) (x : {posnum R}) := PosNum (sqrt_pos_gt0 x).

CoInductive posnum_spec (R : numDomainType) (x : R) :
  R -> bool -> bool -> bool -> Type :=
| IsPosnum (p : {posnum R}) : posnum_spec x (p%:num) false true true.

Lemma posnumP (R : numDomainType) (x : R) : 0 < x ->
  posnum_spec x x (x == 0) (0 <= x) (0 < x).
Proof.
move=> x_gt0; case: real_ltgt0P (x_gt0) => []; rewrite ?gtr0_real // => _ _.
by rewrite -[x]/(PosNum x_gt0)%:num; constructor.
Qed.

Hint Resolve posnum_gt0 : core.
Hint Resolve posnum_ge0 : core.
Hint Resolve posnum_neq0 : core.
Notation "[gt0 'of' x ]" := (posnum_gt0_def (Phantom _ x)).
