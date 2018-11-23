module ApplicationHelper

  def image_url_for(restaurant)
    if restaurant.images.attached?
      image_path url_for(restaurant.images.first)
    else
      "https://kitt.lewagon.com/placeholder/cities/shanghai"
    end
  end

    def image_url_for_user_image(restaurant)
    if restaurant.user.image.attached?
      image_path url_for(restaurant.user.image)
    else
      "https://kitt.lewagon.com/placeholder/users/tgenaitay"
    end
  end

end
