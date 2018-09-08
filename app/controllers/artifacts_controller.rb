class ArtifactsController < ApplicationController
  access instructor: [:all], instructor_pending: [:all], admin: :all, student: [:all]
  def new

  end

  def create

  end
end