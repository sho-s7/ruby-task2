class Janken

    def initialize
        @result = "drow" #結果判定用の変数に予めdrowを入れておく
        @numbers = [1, 2, 3, 4]
    end

    #じゃんけんの結果を判定する
    def judgement
        jankens = ["グー","チョキ","パー"]
        puts "じゃんけん…"

        while @result == "drow" #結果が引き分けの間は処理を繰り返す

            puts "1(グー)2(チョキ)3(パー)4(戦わない)"
            player_number = gets.to_i
            if !@numbers.include?(player_number)
                puts "1から4の数字を入力してください"
                redo
            elsif player_number == 4
                puts "じゃんけんが放棄されたため、終了します"
                exit
            end
            program_number = rand(3)
            puts "ホイ！"
            puts "--------------------"
            puts "あなた：#{jankens[player_number - 1]}"
            puts "相手：#{jankens[program_number]}"
            puts "--------------------"

            case program_number - (player_number - 1)
            when 0
                @result = "drow"
                puts "あいこで…"
            when 1, -2
                @result = "win"
            when 2, -1
                @result = "lose"
            end
        end
        acchimuite_hoi()
    end

    # あっち向いてホイの処理
    def acchimuite_hoi
        hands = ["上","下","左","右"]
        re_enter = true
        puts "あっち向いて…"
        puts "1(上)2(下)3(左)4(右)"
        

        while re_enter == true
            player_hand = gets.to_i
            if !@numbers.include?(player_hand)
                puts "1から4の数字を入力してください"
                redo
            else
                program_hand = rand(4)
                puts "ホイ！"
                puts "--------------------"
                puts "あなた：#{hands[player_hand - 1]}"
                puts "相手：#{hands[program_hand]}"
                puts "--------------------"
                re_enter = false
            end
        end

        if (player_hand - 1) != program_hand
            @result = "drow"
            next_game = true
        elsif @result == "win"
            puts "あなたの勝ちです！"
            next_game = false
        elsif @result == "lose"
            puts "あなたの負けです"
            next_game = false
        end

        if next_game == true
            judgement()
        end
    end

end

test = Janken.new()
test.judgement()