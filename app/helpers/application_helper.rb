module ApplicationHelper
  def user_avatar(user)
    user.avatar_url ||= asset_path 'avatar.png'
  end

  def questions_number
    @questions.size
  end
end
