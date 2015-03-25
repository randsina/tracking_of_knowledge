class SurveysController < ApplicationController

  before_filter :load_survey, :only => [:show, :edit, :update]

  def index
    @surveys = Survey::Survey.all
  end

  def new
    @survey = Survey::Survey.new
  end

  def create
    @theme = Theme.find_by(name: survey_params[:name])
    env_params = survey_params
    env_params[:theme_id] = @theme.id
    @survey = Survey::Survey.new(env_params)


    if @survey.valid? && @survey.save
      @theme.update_attributes(survey_id: @survey.id)
      default_redirect
    else
      render :action => :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @survey.update_attributes(survey_params)
      default_redirect
    else
      render :action => :edit
    end
  end

  private

  def default_redirect
    redirect_to surveys_path, alert: I18n.t("surveys_controller.#{action_name}")
  end

  def load_survey
    @survey = Survey::Survey.find(params[:id])
  end

  def survey_params
    rails4? ? params_whitelist : params[:survey_survey]
  end

  def params_whitelist
    params.require(:survey_survey).permit(Survey::Survey::AccessibleAttributes)
  end

end
