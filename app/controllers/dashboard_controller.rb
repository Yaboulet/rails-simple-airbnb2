class DashboardController < ApplicationController
  # after_action :verify_policy_scoped, only: :index

  def index
    @flats = policy_scope(Flat)
    @flats = current_user.flats
    @bookings = current_user.bookings
    # @flat = Flat.find(params[:flat_id])
  end
end
