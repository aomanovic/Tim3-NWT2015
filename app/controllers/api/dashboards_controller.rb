class Api::DashboardsController < ApiController
  before_filter :restrict_api_access

  #Shows all dashboard data for current user. Dashboard contains all notifications (adjusted representation) and projects assigned to user.
  def show
    content = User.all
    render response: { dashboard: content }
  end
end