# == Schema Information
#
# Table name: movies
#
#  id              :integer          not null, primary key
#  description     :text
#  director        :string
#  duration        :string
#  image_file_name :string           default("placeholder.png")
#  rating          :string
#  released_on     :date
#  title           :string
#  total_gross     :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy

  RATINGS = %w(G PG PG-13 R NC-17)

  validates_presence_of :title, :released_on, :duration
  validates :description, length: { minimum: 25, message: "bozo" }
  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }
  validates :image_file_name, format: {
    with: /\w+\.(jpg|png)\z/i,
    message: "must be a JPG or PNG image"
  }
  validates :rating, inclusion: { in: RATINGS }

  def self.released
    range = 100.years.ago..Date.today
    where(released_on: range).order(released_on: :desc)
  end

  def flop?
    total_gross.blank? || total_gross <= 10000
  end
end
