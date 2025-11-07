class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :update, :destroy]

  def index
    render json: Assignment.all
  end

  def show
    render json: @assignment
  end

  def create
    assignment = Assignment.new(assignment_params)
    if assignment.save
      render json: assignment, status: :created
    else
      render json: assignment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @assignment.update(assignment_params)
      render json: @assignment
    else
      render json: @assignment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @assignment.destroy
    head :no_content
  end

  private
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def assignment_params
      params.require(:assignment).permit(:user_id, :shift_id)
    end
end
