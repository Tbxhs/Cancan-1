module ApplicationHelper

  def gravatar_link(user, options = {})
    options[:size] ||= 48
    link_to image_tag(user.gravatar_url(:size => options[:size])), user_path(:id => user.id)
  end
  def gravatar_img(user, options = {})
    options[:size] ||= 48
    image_tag(user.gravatar_url(:size => options[:size]))
  end

end
