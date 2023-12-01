module D02P2
#AdventOfCode.Y2022.D02.D02P2
    using ..D02
    function go()
        input_pairs = D02.get_inputs_2()
        total_score::Int32 = 0
        for (them, intent) in input_pairs
            if intent == D02.draw
                me::D02.HandShape = them
            else
                if them == D02.rock
                    me = (intent == D02.win) ? D02.paper : D02.scissors
                elseif them == D02.paper
                    me = (intent == D02.win) ? D02.scissors : D02.rock
                else # them == D02.scissors
                    me = (intent == D02.win) ? D02.rock : D02.paper
                end
            end
            handscore, roundscore = D02.battle_round(them, me)
            total_score += handscore + roundscore 
        end
        return total_score
    end
    print("Answer $(go())\n")
end