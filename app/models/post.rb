class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :sufficiently_clickbait_y_title
  
    def sufficiently_clickbait_y_title
      if title.present? && !title.include?("Won't Believe") && !title.include?("Secret") && !title.match?(/Top \d+/) && !title.include?("Guess")
        errors.add(:title, "must be sufficiently clickbait-y")
      end
    end
  end
