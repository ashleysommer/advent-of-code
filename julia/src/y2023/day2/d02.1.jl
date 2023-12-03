module D02P1
#AdventOfCode.Y2023.D02.D02P1
    const max_possible_red::Int32 = 12;
    const max_possible_green::Int32 = 13;
    const max_posible_blue::Int32 = 14;

    read_colours_tuple(colour_s) = (colour_s_parts -> (colour_s_parts[2], parse(Int32, colour_s_parts[1])))(split(colour_s, " ", keepempty=false))
    extract_group_parts(group_parts_s) = Dict(read_colours_tuple.(strip.(split(strip(group_parts_s, [' ']), ",", keepempty=false), ' ')))
    extract_groups(groups_string) = lstrip.(split(strip(groups_string, ['\n', ' ']), ";", keepempty=false), ' ')
    extract_group_id(group_id_string) = parse(Int32,replace(rstrip(group_id_string,[':', ' ']),"Game "=>""))
    game_group_tuples(game_string_parts) = (extract_group_id(game_string_parts[1]),extract_group_parts.(extract_groups(game_string_parts[2])))

    is_possible_game(game_groups)::Bool = (m=collect_maximums(game_groups); m[1] <= max_possible_red && m[2] <= max_possible_green && m[3] <= max_posible_blue)

    function collect_maximums(game_groups)::Tuple{Int32, Int32, Int32}
        max_red::Int32 = 0
        max_green::Int32 = 0
        max_blue::Int32 = 0
        (gg -> (
            max_red=(r = get(gg, "red", 0))>max_red ? r : max_red;
            max_green=(g = get(gg, "green", 0))>max_green ? g : max_green;
            max_blue=(b = get(gg, "blue", 0))>max_blue ? b : max_blue;
            )
        ).(game_groups)
        max_red, max_green, max_blue
    end


    function go(inputs::Vector{String})
        games_groups = game_group_tuples.(split.(inputs, ":", keepempty=false))
        sum([g_num for (g_num, g_groups) in games_groups if is_possible_game(g_groups)])
    end
end