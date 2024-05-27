# Learning_Lagrangian_Multipliers.jl



This package provides the implementation of the learning framework presented in: 

"Predicting Lagrangian Multipliers for Mixed Integer Linear Programs"

Francesco Demelas, Joseph Le Roux, Mathieu Lacroix, Axel Parmentier 

It depends on the package:

https://github.com/FDemelas/Instances

where we develop the instance encoding and the resolution of the Lagrangian Sub-Problem and the Continuous Relaxation.

The dataset used in the paper can be found at:

https://github.com/FDemelas/datasets_learningPi

## Getting started

```
julia --project=.
```

or equivalently:

```
julia
```

and then once in Julia

```julia
using Pkg;
Pkg.activate(".");
```

To install all the dependencies it is sufficient to use this commands:

```julia
using Pkg;
Pkg.instantiate();
```

then the package can be used 

```julia
using LearningPi
```