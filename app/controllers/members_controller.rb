# frozen_string_literal: true

class MembersController < ApplicationController
  def index
    @project = Project.find(params[:id])
    @users = User.where(user_type: 'qa').or(User.where(user_type: 'developer'))
  end

  def create
    @project = Project.find(params[:project_id])
    @user = User.find(params[:user_id])

    @user.projects << @project

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'Project was successfully created.' }
      else
        format.html { render :'home/show', status: :unprocessable_entity }
      end
    end
  end
end
