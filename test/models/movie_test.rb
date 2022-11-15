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
require "test_helper"

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
