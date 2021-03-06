# Installing

## Requirements
- [The Coq Proof Assistant version ≥ 8.8](https://coq.inria.fr)
- [Mathematical Components version ≥ 1.8.0](https://github.com/math-comp/math-comp)
- [Bigenough version 1.0.0](https://github.com/math-comp/bigenough)
- [Finmap library version 1.2.0](https://github.com/math-comp/finmap)

These requirements can be installed in a custom way or through [opam 2](https://opam.ocaml.org/) using the repository https://coq.inria.fr/opam/released, which you can add by typing `opam repo add coq-released https://coq.inria.fr/opam/released`.

Detailed instructions for possible installations of Mathematical Components are located [here](https://github.com/math-comp/math-comp/blob/master/INSTALL.md).

## Short Instructions
- Custom (assuming Coq ≥ 8.8, Mathematical Components version ≥ 1.8.0, Bigenough version 1.0.0 and Finmap version 1.2.0 have been installed):
  + Type `make` to use the provided `Makefile`.
- Through opam:
  + Type `opam install coq-mathcomp-analysis`
  (all the dependencies should be automatically installed, assuming `opam` has been properly configured and `coq-released` repository is added)

## From scratch instructions
### How to install as a package
1. Install opam
- any linux system:
```
$ sh <(curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)
```

2. Configure opam
```
$ export OPAMROOT=~/.opam_mathcomp_analysis
$ opam init -j4 # adapt to the number of cores you have
$ eval `opam config env`
$ opam repo add coq-released https://coq.inria.fr/opam/released
```
3. Install our package (and all its dependencies)
```
$ opam install coq-mathcomp-analysis
```
4. Everytime you want to work in this same context, you need to type
```
$ export OPAMROOT=~/.opam_mathcomp_analysis 
$ eval `opam config env`
```

### How to edit and test the source code
If you would rather edit and test the files than intalling them, we suggest that you replace `opam install coq-mathcomp-analysis` command with the following
```
$ opam install coq-mathcomp-analysis --deps-only
$ git clone https://github.com/math-comp/analysis
$ cd analysis
$ make
```
You may then browse the files using `coqide` (you might want to `opam install coqide`) or using [proof general for emacs](https://github.com/ProofGeneral/PG)

## Break-down of phase 3 of the installation procedure step by step
1. Install Coq 8.9.1
```
$ opam install coq.8.9.1
```
2. Install Mathematical Components development version 
```
$ opam install coq-mathcomp-ssreflect.1.8.0
$ opam install coq-mathcomp-fingroup.1.8.0
$ opam install coq-mathcomp-algebra.1.8.0
$ opam install coq-mathcomp-solvable.1.8.0
$ opam install coq-mathcomp-field.1.8.0
$ opam install coq-mathcomp-bigenough.1.0.0
```
3. Install Finite maps library
```
$ opam install coq-mathcomp-finmap.1.2.0
```
4. Download and compile `coq-mathcomp-analysis` without installing
```
$ git clone https://github.com/math-comp/analysis
$ cd analysis
$ make
```
## How to clean you computer
- If you installed the package `coq-mathcomp-analysis` and wish to get rid of it, just type
```
$ opam remove coq-mathcomp-analysis
```
- However if you wish to clean the entire installation (including `coq` and `mathcomp` dependencies) you should remove the opam root we created for this purpose:
```
$ rm -rf ~/.opam_mathcomp_analysis
```
