module D01P2
#AdventOfCode.Y2023.D01.D01P2
    using ..D01
    i0 = Char('0')
    i9 = Char('9')

    function get_text_number(line::String, offset::Integer)::Tuple{Int32, Int64}
        strlen = length(line)
        if line[offset][1] == 'o' && (offset + 2 <= strlen) && line[offset:offset+2] == "one"
            return (1, 2)
        elseif line[offset][1] == 't' && (offset + 2 <= strlen) && line[offset:offset+2] == "two"
            return (2, 2)
        elseif line[offset][1] == 't' && (offset + 4 <= strlen) && line[offset:offset+4] == "three"
            return (3, 4)
        elseif line[offset][1] == 'f' && (offset + 3 <= strlen) && line[offset:offset+3] == "four"
            return (4, 3)
        elseif line[offset][1] == 'f' && (offset + 3 <= strlen) && line[offset:offset+3] == "five"
            return (5, 3)
        elseif line[offset][1] == 's' && (offset + 2 <= strlen) && line[offset:offset+2] == "six"
            return (6, 2)
        elseif line[offset][1] == 's' && (offset + 4 <= strlen) && line[offset:offset+4] == "seven"
            return (7, 4)
        elseif line[offset][1] == 'e' && (offset + 4 <= strlen) && line[offset:offset+4] == "eight"
            return (8, 4)
        elseif line[offset][1] == 'n' && (offset + 3 <= strlen) && line[offset:offset+3] == "nine"
            return (9, 3)
        end
        return (-1, 0)
    end


    function go()
        lines = D01.get_inputs()
        accum::Int32 = 0
        for li in lines
            print("Line: $li\n")
            first_seen::Bool = false
            first_int::Int32 = -1
            last_int::Int32 = -1
            skip_chars::Int64 = 0
            for offi in 1:length(li)
                if skip_chars > 0
                    skip_chars -= 1
                    continue
                end
                li_v = li[offi]
                ch = li_v[1]
                if (ch >= i0) && (ch <= i9)
                    print("i: $offi, ch: $ch, found int\n")
                    if !first_seen
                        first_int = Int32(ch) - 48
                        first_seen = true
                    else
                        last_int = Int32(ch) - 48
                    end
                elseif (ch == 'o') || (ch == 't') || (ch == 'f') || (ch == 's') || (ch == 'e') || (ch == 'n')
                    print("i: $offi, ch: $ch, check num? ")
                    (text_number::Int32, skip_add::Int64) = get_text_number(li, offi)
                    # This tripped me up. Skipping over the length of the found string actually gives the wrong answer
                    # Thats because there must be some lines like "twone" that must much both 2 and 1, or "threeight" that must match 3 and 8.
                    #skip_chars += skip_add
                    if text_number >= 0
                        if !first_seen
                            first_int = text_number
                            first_seen = true
                        else
                            last_int = text_number
                        end
                    end
                else
                    print("i: $offi, ch: $ch, no matches\n")
                end

            end
            if last_int < 1
                last_int = first_int
            end
            print("First = $first_int, Last = $last_int\n")
            two_digit::Int32 = (first_int * 10) + last_int
            accum += two_digit
        end
        return accum
    end
    print("Answer2: $(go())\n")
end