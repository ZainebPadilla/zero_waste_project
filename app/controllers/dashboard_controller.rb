class DashboardController < ApplicationController
  def index
    @productions = current_user.productions
  end
end
