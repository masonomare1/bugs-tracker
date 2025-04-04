# frozen_string_literal: true

# TODO: don't need this comment
# this is the home controller
class HomeController < ApplicationController
  # TODO: why do we need a home controller, can't we directly use the projects controller
  def index
    # TODO: the below lie could be moved to a callback
    @projects = policy_scope(Project)
    authorize @projects
  end

  # TODO: Repetitive code
  # TODO: do we need this action
  def show
    @projects = policy_scope(Project)
    authorize @projects
  end
end
