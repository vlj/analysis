# Changelog (unreleased)

## [Unreleased]

### Added

- in `boolp.v`, new lemma `andC`
- in `topology.v`:
  + new lemma `open_nbhsE`
  + `uniformType` a structure for uniform spaces based on entourages
    (`entourage`)
  + `uniformType` structure on products, matrices, function spaces
  + definitions `nbhs_`, `topologyOfEntourageMixin`, `split_ent`, `nbhsP`,
    `entourage_set`, `entourage_`, `uniformityOfBallMixin`, `nbhs_ball`
  + lemmas `nbhs_E`, `nbhs_entourageE`, `filter_from_entourageE`,
    `entourage_refl`, `entourage_filter`, `entourageT`, `entourage_inv`,
    `entourage_split_ex`, `split_entP`, `entourage_split_ent`,
    `subset_split_ent`, `entourage_split`, `nbhs_entourage`, `cvg_entourageP`,
    `cvg_entourage`, `cvg_app_entourageP`, `cvg_mx_entourageP`,
    `cvg_fct_entourageP`, `entourage_E`, `entourage_ballE`,
    `entourage_from_ballE`, `entourage_ball`, `entourage_proper_filter`
  + `completePseudoMetricType` structure
  + `completePseudoMetricType` structure on matrices and function spaces
- in `classical_sets.v`:
  + lemmas `setICr`, `setUidPl`, `subsets_disjoint`, `disjoints_subset`, `setDidPl`,
    `setIidPl`, `setIS`, `setSI`, `setISS`, `bigcup_recl`, `bigcup_distrr`,
    `setMT`
- in `ereal.v`:
  + notation `\+` (`ereal_scope`) for function addition
  + notations `>` and `>=` for comparison of extended real numbers
  + definition `is_real`, lemmas `is_realN`, `is_realD`, `ERFin_real_of_er`, `adde_undef`
  + basic lemmas: `addooe`, `adde_Neq_pinfty`, `adde_Neq_ninfty`, `addERFin`,
    `subERFin`, `real_of_erN`, `lb_ereal_inf_adherent`
  + arithmetic lemmas: `oppeD`, `subre_ge0`, `suber_ge0`, `lee_add2lE`, `lte_add2lE`,
    `lte_add`, `lte_addl`, `lte_le_add`, `lte_subl_addl`, `lee_subr_addr`,
    `lee_subl_addr`, `lte_spaddr`, `addeAC`, `addeCA`
- in `normedtype.v`:
  + lemmas `natmul_continuous`, `cvgMn` and `is_cvgMn`.
  + `uniformType` structure for `ereal`
- in `sequences.v`:
  + definitions `arithmetic`, `geometric`, `geometric_invn`
  + lemmas `increasing_series`, `cvg_shiftS`, `mulrn_arithmetic`,
    `exprn_geometric`, `cvg_arithmetic`, `cvg_expr`,
    `geometric_seriesE`, `cvg_geometric_series`,
    `is_cvg_geometric_series`.

### Changed

- moved from `normedtype.v` to `boolp.v` and renamed:
  + `forallN` -> `forallNE`
  + `existsN` -> `existsNE`
- `topology.v`:
  + `unif_continuous` uses `entourage`
  + `pseudoMetricType` inherits from `uniformType`
  + `generic_source_filter` and `set_filter_source` use entourages
  + `cauchy` is based on entourages and its former version is renamed
    `cauchy_ball`
  + `completeType` inherits from `uniformType` and not from `pseudoMetricType`
- moved from `posnum.v` to `Rbar.v`: notation `posreal`
- moved from `normedtype.v` to `Rstruct.v`:
  + definitions `R_pointedType`, `R_filteredType`, `R_topologicalType`,
    `R_uniformType`, `R_pseudoMetricType`
  + lemmas `continuity_pt_nbhs`, `continuity_pt_cvg`, `continuity_ptE`,
    `continuity_pt_cvg'`, `continuity_pt_nbhs'`, `nbhs_pt_comp`

### Renamed

- in `classical_sets.v`,
  + `ub` and `lb` are renamed to `ubound` and `lbound`
  + new lemmas:
    * `setUCr`, `setCE`, `bigcup_set1`, `bigcapCU`, `subset_bigsetU`
- in `boolp.v`,
  + `existsPN` -> `not_existsP`
  + `forallPN` -> `not_forallP`
  + `Nimply` -> `not_implyP`
- in `classical_sets.v`, `ub` and `lb` are renamed to `ubound` and `lbound`
- in `ereal.v`:
  + `eadd` -> `adde`, `eopp` -> `oppe`
- in `topology.v`:
  + `locally` -> `nbhs`
  + `locally_filterE` -> `nbhs_filterE`
  + `locally_nearE` -> `nbhs_nearE`
  + `Module Export LocallyFilter` -> `Module Export NbhsFilter`
  + `locally_simpl` -> `nbhs_simpl`
    * three occurrences
  + `near_locally` -> `near_nbhs`
  + `Module Export NearLocally` -> `Module Export NearNbhs`
  + `locally_filter_onE` -> `nbhs_filter_onE`
  + `filter_locallyT` -> `filter_nbhsT`
  + `Global Instance locally_filter` -> `Global Instance nbhs_filter`
  + `Canonical locally_filter_on` -> `Canonical nbhs_filter_on`
  + `neigh` -> `open_nbhs`
  + `locallyE` -> `nbhsE`
  + `locally_singleton` -> `nbhs_singleton`
  + `locally_interior` -> `nbhs_interior`
  + `neighT` -> `open_nbhsT`
  + `neighI` -> `open_nbhsI`
  + `neigh_locally` -> `open_nbhs_nbhs`
  + `within_locallyW` -> `within_nbhsW`
  + `prod_loc_filter` -> `prod_nbhs_filter`
  + `prod_loc_singleton` -> `prod_nbhs_singleton`
  + `prod_loc_loc` -> `prod_nbhs_nbhs`
  + `mx_loc_filter` -> `mx_nbhs_filter`
  + `mx_loc_singleton` -> `mx_nbhs_singleton`
  + `mx_loc_loc` -> `mx_nbhs_nbhs`
  + `locally'` -> `nbhs'`
  + `locallyE'` -> `nbhsE'`
  + `Global Instance locally'_filter` -> `Global Instance nbhs'_filter`
  + `Canonical locally'_filter_on` -> `Canonical nbhs'_filter_on`
  + `locally_locally'` -> `nbhs_nbhs'`
  + `Global Instance within_locally_proper` -> `Global Instance within_nbhs_proper`
  + `locallyP` -> `nbhs_ballP`
  + `locally_ball` -> `nbhsx_ballx`
  + `neigh_ball` -> `open_nbhs_ball`
  + `mx_locally` -> `mx_nbhs`
  + `prod_locally` -> `prod_nbhs`
  + `Filtered.locally_op` -> `Filtered.nbhs_op`
  + `locally_of` -> `nbhs_of`
  + `open_of_locally` -> `open_of_nhbs`
  + `locally_of_open` -> `nbhs_of_open`
  + `locally_` -> `nbhs_ball`
  + lemma `locally_ballE` -> `nbhs_ballE`
  + `locallyW` -> `nearW`
  + `nearW` -> `near_skip_subproof`
  + `locally_infty_gt` -> `nbhs_infty_gt`
  + `locally_infty_ge` -> `nbhs_infty_ge`
  + `cauchy_entouragesP` -> `cauchy_ballP`
- in `normedtype.v`:
  + `locallyN` -> `nbhsN`
  + `locallyC` -> `nbhsC`
  + `locallyC_ball` -> `nbhsC_ball`
  + `locally_ex` -> `nbhs_ex`
  + `Global Instance Proper_locally'_numFieldType` -> `Global Instance Proper_nbhs'_numFieldType`
  + `Global Instance Proper_locally'_realType` -> `Global Instance Proper_nbhs'_realType`
  + `ereal_locally'` -> `ereal_nbhs'`
  + `ereal_locally` -> `ereal_nbhs`
  + `Global Instance ereal_locally'_filter` -> `Global Instance ereal_nbhs'_filter`
  + `Global Instance ereal_locally_filter` -> `Global Instance ereal_nbhs_filter`
  + `ereal_loc_singleton` -> `ereal_nbhs_singleton`
  + `ereal_loc_loc` -> `ereal_nbhs_nbhs`
  + `locallyNe` -> `nbhsNe`
  + `locallyNKe` -> `nbhsNKe`
  + `locally_oo_up_e1` -> `nbhs_oo_up_e1`
  + `locally_oo_down_e1` -> `nbhs_oo_down_e1`
  + `locally_oo_up_1e` -> `nbhs_oo_up_1e`
  + `locally_oo_down_1e` -> `nbhs_oo_down_1e`
  + `locally_fin_out_above` -> `nbhs_fin_out_above`
  + `locally_fin_out_below` -> `nbhs_fin_out_below`
  + `locally_fin_out_above_below` -> `nbhs_fin_out_above_below`
  + `locally_fin_inbound` -> `nbhs_fin_inbound`
  + `ereal_locallyE` -> `ereal_nbhsE`
  + `locally_le_locally_norm` -> `nbhs_le_locally_norm`
  + `locally_norm_le_locally` -> `locally_norm_le_nbhs`
  + `locally_locally_norm` -> `nbhs_locally_norm`
  + `filter_from_norm_locally` -> `filter_from_norm_nbhs`
  + `locally_ball_norm` -> `nbhs_ball_norm`
  + `locally_simpl` -> `nbhs_simpl`
  + `Global Instance filter_locally` -> `Global Instance filter_locally`
  + `locally_interval` -> `nbhs_interval`
  + `ereal_locally'_le` -> `ereal_nbhs'_le`
  + `ereal_locally'_le_finite` -> `ereal_nbhs'_le_finite`
  + `locally_image_ERFin` -> `nbhs_image_ERFin`
  + `locally_open_ereal_lt` -> `nbhs_open_ereal_lt`
  + `locally_open_ereal_gt` -> `nbhs_open_ereal_gt`
  + `locally_open_ereal_pinfty` -> `nbhs_open_ereal_pinfty`
  + `locally_open_ereal_ninfty` -> `nbhs_open_ereal_ninfty`
  + `continuity_pt_locally` -> `continuity_pt_nbhs`
  + `continuity_pt_locally'` -> `continuity_pt_nbhs'`
  + `nbhs_le_locally_norm` -> `nbhs_le_nbhs_norm`
  + `locally_norm_le_nbhs` -> `nbhs_norm_le_nbhs`
  + `nbhs_locally_norm` -> `nbhs_nbhs_norm`
  + `locally_normP` -> `nbhs_normP`
  + `locally_normE` -> `nbhs_normE`
  + `near_locally_norm` -> `near_nbhs_norm`
  + lemma `locally_norm_ball_norm` -> `nbhs_norm_ball_norm`
  + `locally_norm_ball` -> `nbhs_norm_ball`
  + `pinfty_locally` -> `pinfty_nbhs`
  + `ninfty_locally` -> `ninfty_nbhs`
  + lemma `locally_pinfty_gt` -> `nbhs_pinfty_gt`
  + lemma `locally_pinfty_ge` -> `nbhs_pinfty_ge`
  + lemma `locally_pinfty_gt_real` -> `nbhs_pinfty_gt_real`
  + lemma `locally_pinfty_ge_real` -> `nbhs_pinfty_ge_real`
  + `locally_minfty_lt` -> `nbhs_minfty_lt`
  + `locally_minfty_le` -> `nbhs_minfty_le`
  + `locally_minfty_lt_real` -> `nbhs_minfty_lt_real`
  + `locally_minfty_le_real` -> `nbhs_minfty_le_real`
  + `lt_ereal_locally` -> `lt_ereal_nbhs`
  + `locally_pt_comp` -> `nbhs_pt_comp`
- in `derive.v`:
  + `derivable_locally` -> `derivable_nbhs`
  + `derivable_locallyP` -> `derivable_nbhsP`
  + `derivable_locallyx` -> `derivable_nbhsx`
  + `derivable_locallyxP` -> `derivable_nbhsxP`
- in `sequences.v`,
  + `cvg_comp_subn` -> `cvg_centern`,
  + `cvg_comp_addn` -> `cvg_shiftn`,
  + `telescoping` -> `telescope`
  + `sderiv1_series` -> `seriesSB`
  + `telescopingS0` -> `eq_sum_telescope`

### Removed

- in `topology.v`:
  + definitions `entourages`, `topologyOfBallMixin`, `ball_set`
  + lemmas `locally_E`, `entourages_filter`, `cvg_cauchy_ex`

### Infrastructure

### Misc