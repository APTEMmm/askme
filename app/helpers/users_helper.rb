module UsersHelper
  def display_nickname(user)
    "@#{user.nickname}"
  end

  def default_navbar_color
    '#370617'
  end
end
