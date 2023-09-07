# frozen_string_literal: true

# this is the home controller
class HomeController < ApplicationController
  def index; end

  def show
    @projects = policy_scope(Project)
    authorize @projects
  end
end
