class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(
      title: params[:title],
      description: params[:description],
      start_date: params[:start_date],
      duration: params[:duration].to_i,
      price: params[:price].to_i,
      location: params[:location],
      administrator: current_user
    )
    if @event.save
      flash[:success] = "Ton évènement a été ajouté !"
      redirect_to :root
    else
      flash[:danger] = "Ton évènement n'est pas valide !"
      render :new
    end
  end
end
