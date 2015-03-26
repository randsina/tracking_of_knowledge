module ApplicationHelper
  def include_technology?(user, theme)
    user.technologies.include?(Technology.find(theme.technology_id))
  end

  def progress_theme(user, survey_id)
    survey = Survey::Survey.find(survey_id)
    user_attempts = survey.attempts.for_participant(user)
    if user_attempts.empty?
      "0%"
    else
      "#{(user_attempts.high_score.fdiv(survey.questions.count) * 100).to_i}%"
    end
  end
end
