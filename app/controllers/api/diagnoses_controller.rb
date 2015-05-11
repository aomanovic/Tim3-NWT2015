class Api::DiagnosesController < ApiController
  before_filter :restrict_api_access

  #Shows project with specified id
  def show
    begin
      foundedDiagnosis = Diagnosis.find(params[:id])
      render response: { foundedDiagnosis: foundedDiagnosis.to_json }
    rescue
      render response: { :message => "Diagnosis with specified id not found!"}
    end
  end

  #Creates new project with provided parameters, and assigns user that created project as project_manager (role_id = 1)
  def create
    new_diagnosis = Diagnosis.new(diagnosis_params)
    new_diagnosis.save!
    user_diagnosis=UserDiagnosis.new(user_id: @current_user.id, diagnosis_id: new_diagnosis.id)
    user_diagnosis.save!

    render response: { :message => "Diagnosis added."}
  end

  #Updates project with specified id
  def update
    Diagnosis.find(params[:id]).update(diagnosis_params)
    render response: { :message => "Diagnosis successfully edited."}
  end

  #Deletes project with provided id
  def destroy
    begin
      Diagnosis.find(params[:id]).destroy
      render response: { :message => "Diagnosis deleted."}
    rescue
      render response: { :message => "Diagnosis with specified id not found!"}
    end
  end

  #Shows all diagnoses
  def index
    diagnoses = current_user.diagnoses
    render response: { diagnoses: diagnoses}
  end

  #Diagnosis parameters
  private
  def diagnosis_params
    params.permit(:name, :code, :description)
  end

end
