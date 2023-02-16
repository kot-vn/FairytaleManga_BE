class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def set_image_url
    self.image_url = Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end

  def set_images_url
    self.images_url = []
    if images.attached?
      images.each do |image|
        self.images_url << Rails.application.routes.url_helpers.url_for(image) 
      end
    end
  end
end
