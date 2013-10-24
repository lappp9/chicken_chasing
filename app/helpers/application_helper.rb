module ApplicationHelper
  def logo
    @logo = image_tag("chickenLogo-small.jpg", :alt => "Chicken Chasing")
  end
end
