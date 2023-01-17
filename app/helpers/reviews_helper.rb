module ReviewsHelper

  def average_stars(movie)
    if movie.average_stars.zero?
      content_tag(:strong, "No reviews")
    else
      pluralize(number_with_precision(movie.average_stars, precision: 1), 'star')
      
      # asterisk/star option below, but i like the decimal pt value used above :shrug:
      # "*" * movie.average_stars.round
    end
  end
end
