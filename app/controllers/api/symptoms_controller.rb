class Api::SymptomsController < ApiController
before_filter :restrict_api_access

  #Shows project with specified id
  def show
    begin
      foundedSymptom = Symptom.find(params[:id])
      render response: { foundedSymptom: foundedSymptom.to_json }
	rescue
	  render response: { :message => "Symptom with specified id not found!"}
	end
  end

  #Creates new project with provided parameters, and assigns user that created project as project_manager (role_id = 1)
  def create
    new_symptom = Symptom.new(symptom_params)
    new_symptom.save!
	  user_symptom=UserSymptom.new(user_id: @current_user.id, symptom_id: new_symptom.id)
    user_symptom.save!

    render response: { :message => "Symptom added."}
  end

  #Updates project with specified id
  def update
    Symptom.find(params[:id]).update(symptom_params)
    render response: { :message => "Symptom successfully edited."}
  end

  #Deletes project with provided id
  def destroy
    begin
      Symptom.find(params[:id]).destroy
      render response: { :message => "Symptom deleted."}
	rescue
	  render response: { :message => "Symptom with specified id not found!"}
	end
  end

  #Shows all projects
  def index
    symptoms = current_user.symptoms
    render response: { symptoms: symptoms}
  end

  #Project parameters
  private
  def symptom_params
    params.permit(:name, :code, :description)
  end

end
