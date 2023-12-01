module D01P2
#AdventOfCode.Y2022.D01.D01P2

    function go()
        total_lines::Int64 = 0
        total_gaps::Int64 = 0
        in_gap::Bool = false
        accum_sum::Int64 = 0
        elf_totals::Vector{Int64} = Vector()
        in_lines = readlines("src/y2022/day1/input.txt")
        for l in in_lines
            total_lines += 1
            if length(l) < 1
                # Found a gap
                if !in_gap
                    in_gap = true
                    total_gaps += 1
                    push!(elf_totals, accum_sum)
                    accum_sum = 0
                end
                continue
            end
            if in_gap
                in_gap = false
            end
            
            li = parse(Int64, l)
            accum_sum += li
        end
        sorted_elves = sort(elf_totals, rev=true)
        top_3 = sum(sorted_elves[1:3])
        return top_3
    end
    print("Answer: $(go())\n")
    
end