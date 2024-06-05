###############################
#           GAP  loss         #
###############################


"""
Structure that realize a GAP loss.
This structure can be used as function.

# Fields:
- `lr`: a lagranian sub-problem loss of type `loss_LR`.

The constructor need no paramameters.
"""
struct loss_GAP <: abstract_loss
	lr::loss_LR
	loss_GAP() = new(loss_LR())
end


"""
Structure that should be used to construct a GAP loss function.
"""
struct loss_GAP_factory <: abstract_loss_factory end


"""
# Arguments:
- `_`: a factory, for this implentation it should be of type ~`loss_GAP_factory`.

Return a loss corresponding to the factory.
"""
create_loss(_::loss_GAP_factory) = loss_GAP()


"""
# Arguments:
- `π`: a Lagrangian Multipliers Vector,
- `example`: an abstract example.

Computes the value of the GAP loss.
"""
function (l::loss_GAP)(π; example::abstract_example)
	return (1 - l.lr(π; example) / (example.gold.objLR)) * 100
end

# declare the Gap Loss as Flux functor
Flux.@functor loss_GAP

"""
# Arguments:
- `_`: lagrangian multipliers (are not used in this implementation),
- `v`: loss function value,
- `example`: an abstract_example,
- `_`: loss function. 

Compute the sub-problem value without solving the Lagrangian Sub-Problem, if it is already solved during the computation of the loss.
"""
function sub_problem_value(_, v, example, _::loss_GAP)
	return (1 - v / 100) * (example.gold.objLR)
end