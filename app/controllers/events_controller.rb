class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update]
  def create
    @user = current_user
    @event = Event.new(title: params["title"].capitalize, description: params["description"], price: params["price"],
    admin: @user, location: params["location"].capitalize, start_date: params["start_date"])

    if @event.save
        redirect_to root_path
    else @event.errors.any?
        render :new
    end

  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(title: params["title"], start_date: params["start_date"], description: params["description"], 
      duration: params["duration"], location: params["location"], price: params["price"], admin: current_user)
      redirect_to event_path(params[:id])
    else
      redirect_to edit_event_path(params[:id])
    end
  end

  def show
    @event = Event.find(params[:id])
  end
  

  def destroy
  end

  def index
  end
end
