module ApplicationHelper

  def image_url_for(restaurant)
    if restaurant.images.present?
      image_path restaurant.images.first
    else
      "https://kitt.lewagon.com/placeholder/cities/shanghai"
    end
  end
end
