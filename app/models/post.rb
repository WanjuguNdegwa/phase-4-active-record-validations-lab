class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_is_clickbaity

  def title_is_clickbaity
    patterns = [
      /Won't Believe/i,
      /Secret/i,
      /Top \d/i,
      /Guess/i
    ]
    
    if patterns.none? { |pattern| pattern.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
