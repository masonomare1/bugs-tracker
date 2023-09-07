# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @user = User.all
    # @projects = @user.projects
    authorize @user
  end

  def create

  end


end
