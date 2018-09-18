class ArtifactsController < ApplicationController
  access instructor: :all, instructor_pending: :all, admin: :all, student: :all
  def new
    @artifact = Artifact.new
    @artifact.author_actor_id = params[:author_actor_id]
  end

  def create
    @artifact = Artifact.new(artifact_params)
    respond_to do |format|
      if @artifact.save
        format.html {redirect_to({controller: "student_tasks", action: "list"}, notice: 'Artifact was successfully created.')}
      else
        format.html { render :new }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_artifact
    @artifact = Artifact.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def artifact_params
    params.require(:artifact).permit(:content, :author_actor_id)
  end
end