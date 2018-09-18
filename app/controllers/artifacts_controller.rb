class ArtifactsController < ApplicationController
  access instructor: :all, instructor_pending: :all, admin: :all, student: :all
  def new
    @artifact = Artifact.new
    @artifact.author_actor_id = params[:author_actor_id]
  end

  def create

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_artifact
    @artifact = Artifact.find(params[:id])
  end
end