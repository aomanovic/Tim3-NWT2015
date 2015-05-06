class Api::DashboardsController < ApiController
  before_filter :restrict_api_access

  #Shows all dashboard data for current user. Dashboard contains all notifications (adjusted representation) and projects assigned to user.
  def show
    # symptoms = Symptom.where("symptom_id in (?)", @current_user.symptoms.map {|s| s.id})
    # content = Domain::Decorators::AddWrapping.new(symptoms.map(&:serializable_hash), @current_user).decorate
    # render response: { dashboard: content }
  end
end