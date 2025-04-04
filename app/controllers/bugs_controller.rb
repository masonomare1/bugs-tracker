# frozen_string_literal: true

# TODO: we don't need this comment
# this is bug controller
class BugsController < ApplicationController
  # TODO: why the callbacks are not used here?

  # TODO: why don't we have a index for bugs?
  def index
    # Your code here
  end

  # TODO: why don't we have a show for bugs?
  def show
    # Your code here
  end

  def new
    # TODO: if you need to find the project in every action, then why not use a callback for this?
    @project = Project.find(params[:project_id])
    @bug = Bug.new
  end

  def edit
    # TODO: if you need to find the project in every action, then why not use a callback for this?
    @project = Project.find(params[:project_id])
    @bug = @project.bugs.find(params[:id])
    @bug.dev_id = current_user.id
    @bug.status = 'started'

    if @bug.save
      # TODO: flash is missing here
      redirect_to project_path(@project)
    else
      # TODO: flash is missing here
      render 'show'
    end
  end

  def create
    # TODO: if you need to find the project in every action, then why not use a callback for this?
    @project = Project.find(params[:project_id])
    # TODO: can we do this: `bug_params.merge(creator: current_user)`
    @bug = @project.bugs.create(bug_params)
    @bug.creator_id = current_user.id
    # TODO: if you have create bug like this `@project.bugs.create(bug_params)`
    # then you don't have to re-assign the project_id to the bug it's already assigned
    @bug.project_id = @project.id

    if @bug.save
      # TODO: flash is missing here
      redirect_to project_path(@project)
    else
      # TODO: flash is missing here
      render 'new'
    end
  end

  # TODO: why can't we update a bug?
  def update
    # Your code here
  end

  # TODO: why can't we destroy a bug?
  def destroy
    # Your code here
  end

  private

  def bug_params
    # TODO: what is the bug parameter is missing?
    # TODO: this will raise a ActionController::ParameterMissing missing error
    # handle this error in exception handler
    params.require(:bug).permit(:bug_title, :deadline, :type, :status, :creator_id, :dev_id, :project_id)
  end
end
# TODO: remove this
# puts "bug_params: #{bug_params.inspect}"
# puts "Bug: #{@bug.dev_id}"
