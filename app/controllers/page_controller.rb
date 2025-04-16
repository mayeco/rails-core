class PageController < ApplicationController
  before_action :authenticate_user!

  def index
    log_current_user

    $redis.incr("current_user_#{current_user.id}")
  end

  private

  def log_current_user
    Debugbar.msg("current_user:", { current_user: current_user })
  end
end
