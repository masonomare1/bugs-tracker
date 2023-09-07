# frozen_string_literal: true

# this is bug controller
class BugsController < ApplicationController
  def index
    # Your code here
  end

  def show
    # Your code here
  end

  def new
    @project = Project.find(params[:project_id])
    @bug = Bug.new
  end

  def edit
    @project = Project.find(params[:project_id])
    @bug = @project.bugs.find(params[:id])
    @bug.dev_id = current_user.id
    @bug.status = 'started'

    if @bug.save
      redirect_to project_path(@project)
    else
      render 'show'
    end
  end

  def create
    @project = Project.find(params[:project_id])
    @bug = @project.bugs.create(bug_params)
    @bug.creator_id = current_user.id
    @bug.project_id = @project.id

    if @bug.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def update
    # Your code here
  end

  def destroy
    # Your code here
  end

  private

  def bug_params
    params.require(:bug).permit(:bug_title, :deadline, :type, :status, :creator_id, :dev_id, :project_id)
  end
end
# puts "bug_params: #{bug_params.inspect}"
# puts "Bug: #{@bug.dev_id}"
