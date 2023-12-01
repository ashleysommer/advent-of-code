module D02

@enum HandShape begin
    rock = 1      # A, X
    paper = 2     # B, Y
    scissors = 3  # C, Z
end

@enum RoundIntent begin
    lose = 1     # X
    draw = 2     # Y
    win  = 3     # Z
end

function get_shape(in_char::Char)::HandShape
    (in_char == 'A' || in_char == 'X') && return rock
    (in_char == 'B' || in_char == 'Y') && return paper
    (in_char == 'C' || in_char == 'Z') && return scissors
    error("Bad instruction for shape: $in_char")
end

function get_intent(in_char::Char)::RoundIntent
    in_char == 'X' && return lose
    in_char == 'Y' && return draw
    in_char == 'Z' && return win
    error("Bad instruction for intent: $in_char")
end

function battle_round(them::HandShape, us::HandShape)::Tuple{Int32, Int32}
    # Returns handscore, resultscore
    handscore::Int32 = Int32(us)
    resultscore::Int32 = -1
    if them == us
        # draw
        resultscore = 3 
    elseif us == rock
        resultscore = (them == paper) ? 0 : 6
    elseif us == paper
        resultscore = (them == scissors) ? 0 : 6
    else # us == scissors
        resultscore = (them == rock) ? 0 : 6
    end
    return (handscore, resultscore)
end

function get_inputs_1()
    instruction_pairs::Vector{Tuple{HandShape, HandShape}} = Vector()
    for li in readlines("src/y2022/day2/input.txt")
        p1, p2 = split(li, ' ', limit=2)
        push!(instruction_pairs, (get_shape(p1[1]), get_shape(p2[1])))
    end
    return instruction_pairs
end

function get_inputs_2()
    instruction_pairs::Vector{Tuple{HandShape, RoundIntent}} = Vector()
    for li in readlines("src/y2022/day2/input.txt")
        p1, p2 = split(li, ' ', limit=2)
        push!(instruction_pairs, (get_shape(p1[1]), get_intent(p2[1])))
    end
    return instruction_pairs
end

include("d02.1.jl")
include("d02.2.jl")
end