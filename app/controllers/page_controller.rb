class PageController < ApplicationController
  before_action :authenticate_user!

  def index
    log_current_user
  end

  private

  def log_current_user
    Debugbar.msg("current_user:", { current_user: current_user }) if defined?(Debugbar)
  end
end
