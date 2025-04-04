# frozen_string_literal: true

class MembersController < ApplicationController
  def index
    # TODO: move the below line to a callback
    # TODO: @project is not being used here, remove this if not needed
    @project = Project.find(params[:id])
    @users = User.where(user_type: 'qa').or(User.where(user_type: 'developer'))
  end

  def create
    # TODO: move the below line to a callback
    @project = Project.find(params[:project_id])
    @user = User.find(params[:user_id])

    @user.projects << @project

    # TODO: no need to use respond_to unless you have to respond to multiple formats
    respond_to do |format|
      # TODO: move this out of respond_to
      if @user.save
        format.html { redirect_to root_path, notice: 'Project was successfully created.' }
      else
        # TODO: use path_name to refer to any route
        # TODO: this redirecting to the root
        format.html { render :'home/show', status: :unprocessable_entity }
      end
    end
  end
end
