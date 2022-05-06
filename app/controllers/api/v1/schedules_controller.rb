class Api::V1::SchedulesController < ApplicationController
  before_action :authenticate_user_by_token
  before_action :can_to_do_admin_actions
  before_action :set_schedule, only: [:show, :update, :destroy]

  def index
    @schedules = Schedule.all
    render json: @schedules, status: 200
  end

  def show
    if @schedule
      render json: @schedule, status: 200
    else
      render json: {error: "Schedule not found"}, status: 404
    end
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      render json: @schedule, status: 201
    else
      render json: {error: @schedule.errors.full_messages.join(', ')}, status: 400
    end
  end

  def update
    if @schedule.update(schedule_params)
      render json: @schedule, status: 200
    else
      render json: {error: @schedule.errors.full_messages.join(', ')}, status: 400
    end
  end

  def destroy
    if @schedule.destroy
      render json: {message: "Schedule deleted"}, status: 200
    else
      render json: {error: @schedule.errors.full_messages.join(', ')}, status: 400
    end
  end

  private
  def schedule_params
    params.require(:schedule).permit(
      :date,
      :time,
      :available,
      :consulting_room_id,
    )
  end

  def set_schedule
    @schedule = Schedule.find_by_id(params[:id])
  end
end
