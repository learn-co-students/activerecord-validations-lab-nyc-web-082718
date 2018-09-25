class MyValidator < ActiveModel::Validator
  def validate(record)
    click_bait_array = ["Won't Believe", "Secret", "Top[number]", "Guess"]
    click_bait_array.each do |phrase|
      unless record.name.includes?(phrase)
        record.errors[:name] << 'Need a clickbait word in this title!'
      end
    end
  end
end
