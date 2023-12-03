module D02


function get_inputs()::Vector{String}
    return readlines("src/y2023/day2/input.txt")
end

include("d02.1.jl")
include("d02.2.jl")

using .D02P1
using .D02P2
print("Answer1: $(D02P1.go(get_inputs()))\n")
print("Answer2: $(D02P2.go(get_inputs()))\n")
end