# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  comment    :text
#  name       :string
#  stars      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :integer          not null
#
# Indexes
#
#  index_reviews_on_movie_id  (movie_id)
#
# Foreign Keys
#
#  movie_id  (movie_id => movies.id)
#
class Review < ApplicationRecord
  belongs_to :movie

  STARS = [1, 2, 3, 4, 5]

  validates_presence_of :name
  validates :comment, length: { minimum: 4 }
  validates :stars, inclusion: { in: STARS, message: "must be between 1 and 5" }
end
