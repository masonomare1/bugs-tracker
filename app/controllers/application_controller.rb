# frozen_string_literal: true

# this application controller
class ApplicationController < ActionController::Base
  include Pundit::Authorization

  # TODO: exception handling is missing from the project
  # TODO: better to use a concern for handling all the exceptions
  # TODO: handle a StandardError exception at the top to catch all errors
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'

    redirect_back(fallback_location: root_path)
  end
end
