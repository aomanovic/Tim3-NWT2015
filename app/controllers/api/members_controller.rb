class Api::MembersController < ApiController
  before_filter :restrict_api_access

  # Adds new member on specified project.
  # POST   /api/projects/:project_id/members    api/members#create
  def create
    UserSymptom.create(:user_id => params[:id], :symptom_id => params[:symptom_id])
    render response: { :message => "Member added."}
  end

  # Gets all members on specified project.
  # GET    /api/projects/:project_id/members   api/members#index
  def index
    begin
      members = @current_user.projects.find(params[:project_id]).users.includes(:user_projects)
      render response: { :users => members }
    rescue
      raise NotAuthorized
    end
  end

  # Search available users (not-members on specified project) by username. Client sends keyword and server returns all users whose username contains keyword.
  # GET    /api/projects/:project_id/members/search   api/members#search
  def search
    begin
      search_usernames = @current_user.projects.find(params[:project_id]).get_available_users.where("username like ?", "%#{params[:name]}%")
      render response: { :users => search_usernames }
    rescue
      raise NotAuthorized
    end
  end

  # Removes member from specified project.
  # DELETE /api/projects/:project_id/members/:id   api/members#destroy
  def destroy
    begin
      UserSymptom.find_by(:user_id => params[:id]).destroy
      render response: { :users => "Member deleted." }
    rescue
      raise NotAuthorized
    end
  end

  #Member parameters
  private
  def member_params
    params.permit(:id)
  end
end