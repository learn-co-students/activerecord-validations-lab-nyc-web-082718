class Post < ActiveRecord::Base
validates :title, presence: true
validates :content, length: {minimum: 250}
validates :summary, length: {maximum: 250}
validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
validate  :click_bait_validation



def click_bait_validation
  if title
    click_bait = [
      "Won't Believe", "Secret", "Top", "Guess"
    ]
    current_bait = []

    click_bait.each do |bait|
     if title.include? bait
       current_bait << bait
     end
    end

    if current_bait.empty?
      self.errors[:title] << "Not enough bait"
      return false
    end
  end
end


  # def click_bait_validation

    # if self.title.match(/(Won't Believe)|(Secret)|(Top)|(Guess)/)
    #   return true
    # end
    #
    # self.errors[:title] << "Not click bait!"
    # return false
  #   if self.title != nil
  #     click_bait.match()
  #     end
  #     values.each do |checked_value|
  #       if checked_value == true
  #         return true
  #       end
  #     end
  #   end
  #   return false
  # end

end
