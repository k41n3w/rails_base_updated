# frozen_string_literal: true

class Session
  def initialize(user)
    @user = user
  end

  def token
    JsonWebToken.new(user_id: @user.id).encoded
  end
end
