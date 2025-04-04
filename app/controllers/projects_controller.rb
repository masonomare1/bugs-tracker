# frozen_string_literal: true

# PENDING:
# TODO: extra comment
# this user policy
class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  # TODO: either add these comments to each action or remove from here as well
  # TODO: is this action returning json as well or not?
  # GET /projects or /projects.json
  def index
    @projects = policy_scope(Project)
    authorize @projects
  end

  # TODO: can a other managers see the details of a project?
  # TODO: same here
  # GET /projects/1 or /projects/1.json
  def show; end

  # TODO: shouldn't we use a pundit policy here?
  # TODO: can a developer create a new project?
  # TODO: can a QA create a new project?
  # GET /projects/new
  def new
    @project = Project.new
  end

  # TODO: shouldn't we use a pundit policy here?
  # GET /projects/1/edit
  # TODO: ordering of actions is not correct
  # index, show, new, create, edit, update, destroy
  def edit; end

  # TODO: can a developer create a new project?
  # TODO: can a QA create a new project?
  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # TODO: same for update as for create and new?
  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  # TODO: same for update as for create?
  def destroy
    # TODO: what is the project couldn't be deleted
    # TODO: shouldn't this be in a if condition?
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:title, :user_id)
  end
end
