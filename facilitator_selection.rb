Facilitators = ["けーきさん", "脩斗さん", "Grimさん", "だーしさん", "たいきさん"]

class FacilitatorSelection
  def self.confirm
    @number_of_people = Facilitators.count
    puts "登録されている人数と氏名に誤りはございませんか？"
    puts "人数： #{@number_of_people}人"
    puts "氏名： #{Facilitators.join("、")}"
    puts "合っていれば0を、修正が必要な場合は1を入力してください。"
    @input_number = gets.chomp
    a = ["0", "1"]
    while true
      if a.include?(@input_number)
        return @input_number.to_i
      else
        puts "0か1の数字を入力してください。"
        puts "登録されている人数と氏名で問題ない：0"
        puts "修正が必要：1"
        @input_number = gets.chomp
      end
    end
  end

  def self.selection
    if @input_number == "0"
      puts "直近#{@number_of_people}日間の朝礼・終礼のファシリテーターは以下の通りです。"
    else
      puts "システム管理者に修正を依頼してください。"
      exit
    end
    morning = Facilitators.shuffle
    evening = Facilitators.shuffle
    while (morning[0] == evening[0] || morning[1] == evening[1] || morning[2] == evening[2] || morning[3] == evening[3] || morning[4] == evening[4])
      morning = Facilitators.shuffle
      evening = Facilitators.shuffle
    end
    puts "朝礼：#{morning.join("、")}"
    puts "終礼：#{evening.join("、")}"
  end
end

FacilitatorSelection.confirm
FacilitatorSelection.selection