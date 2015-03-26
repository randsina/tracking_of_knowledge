module ApplicationHelper
  def include_technology?(user, theme)
    user.technologies.include?(Technology.find(theme.technology_id))
  end

  def progress_theme(user, survey_id)
    survey = Survey::Survey.find(survey_id)
    user_attempts = survey.attempts.for_participant(user)
    user_attempts.empty? ? 0 : (user_attempts.high_score.fdiv(survey.questions.count) * 100).to_i
  end

  def progress_technology(user, technology)
    percentage = technology.themes.reduce(0) do |progress, theme|
      if theme.survey_id
        progress += progress_theme(user, theme.survey_id)
      end
      progress
    end
    percentage.fdiv(technology.themes.count)
  end
end
