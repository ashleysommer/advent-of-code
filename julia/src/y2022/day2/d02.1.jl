module D02P1
#AdventOfCode.Y2022.D02.D02P1
    using ..D02
    function go()
        input_pairs = D02.get_inputs_1()
        total_score::Int32 = 0
        for (them, me) in input_pairs
            handscore, roundscore = D02.battle_round(them, me)
            total_score += handscore + roundscore 
        end
        return total_score
    end
    print("Answer $(go())\n")
end