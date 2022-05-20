class Api::V1::ConsultingRoomsController < ApplicationController
  before_action :authenticate_user_by_token
  before_action :can_to_do_admin_actions
  before_action :set_consulting_room, only: [:show, :update, :destroy]

  def index
    req_paginated = ConsultingRoom.page(params[:from]).per(params[:size])
    @consulting_rooms = req_paginated
    filtering_params(params[:filters]).each do |key, value|
      @consulting_rooms = @consulting_rooms.public_send("filter_by_#{key}", value) if value.present?
    end
    render json: format_pagination_response(@consulting_rooms, params), status: 200
  end

  def show
    if @consulting_room
      render json: @consulting_room, status: 200
    else
      render json: {error: "Consulting room not found"}, status: 404
    end
  end

  def create
    @consulting_room = ConsultingRoom.new(consulting_room_params)
    if @consulting_room.save
      render json: @consulting_room, status: 201
    else
      render json: {error: @consulting_room.errors.full_messages.join(', ')}, status: 400
    end
  end

  def update
    if @consulting_room.update(consulting_room_params)
      render json: @consulting_room, status: 200
    else
      render json: {error: @consulting_room.errors.full_messages.join(', ')}, status: 400
    end
  end

  def destroy
    if @consulting_room.destroy
      render json: {message: "Consulting room deleted"}, status: 200
    else
      render json: {error: @consulting_room.errors.full_messages.join(', ')}, status: 400
    end
  end

  private
  def consulting_room_params
    params.require(:consulting_room).permit(
      :name,
      :specialty_id,
      :loc_country,
      :loc_region,
      :loc_city,
      :loc_commune,
      :loc_address,
      :loc_description
    )
  end

  def set_consulting_room
    @consulting_room = ConsultingRoom.find_by_id(params[:id])
  end
end
