module D01P1
#AdventOfCode.Y2023.D01.D01P1
    using ..D01
    i0 = Char('0')
    i9 = Char('9')
    function go()
        lines = D01.get_inputs()
        accum::Int32 = 0
        for li in lines
            first_seen::Bool = false
            first_int::Int32 = -1
            last_int::Int32 = -1
            chars::Vector{Char} = collect(li)
            for ch in chars
                if (ch >= i0) && (ch <= i9)
                    if !first_seen
                        first_int = Int32(ch) - 48
                        first_seen = true
                    else
                        last_int = Int32(ch) - 48
                    end
                end
            end
            if last_int < 1
                last_int = first_int
            end
            print("First = $first_int, Last = $last_int")
            two_digit::Int32 = (first_int * 10) + last_int
            accum += two_digit
        end
        return accum
    end
    print("Answer1: $(go())\n")
end