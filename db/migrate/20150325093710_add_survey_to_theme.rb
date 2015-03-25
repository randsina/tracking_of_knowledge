class AddSurveyToTheme < ActiveRecord::Migration
  def change
    add_reference :themes, :survey, index: true
    add_reference :survey_surveys, :theme, index: true
    add_foreign_key :themes, :survey_surveys
    add_foreign_key :survey_surveys, :themes
  end
end
