class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    baity = ["Won't Believe", "Secret", "Top", "Guess"]
    if value
      unless value.match(Regexp.union(baity))
        record.errors[attribute] << (options[:message] || "not clickbaity enough")
      end
    end
  end
end # end class TitleValidator

class Post < ActiveRecord::Base
  validates :title, presence: true,  title: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
end # end class Post
