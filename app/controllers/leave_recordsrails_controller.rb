class LeaveRecordsController < ApplicationController
  before_action :set_leave_record, only: [:show, :update, :destroy]

  def index
    render json: LeaveRecord.all
  end

  def show
    render json: @leave_record
  end

  def create
    leave_record = LeaveRecord.new(leave_record_params)
    if leave_record.save
      render json: leave_record, status: :created
    else
      render json: leave_record.errors, status: :unprocessable_entity
    end
  end

  def update
    if @leave_record.update(leave_record_params)
      render json: @leave_record
    else
      render json: @leave_record.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @leave_record.destroy
    head :no_content
  end

  private
    def set_leave_record
      @leave_record = LeaveRecord.find(params[:id])
    end

    def leave_record_params
      params.require(:leave_record).permit(:user_id, :start_date, :end_date, :reason, :status)
    end
end
