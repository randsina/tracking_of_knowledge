module ApplicationHelper
  def include_technology?(user, theme)
    user.technologies.include?(Technology.find(theme.technology_id))
  end
end
