class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @user = User.find(params[:user_id])
    @ticket = Ticket.new(ticket_params)
    @ticket.user = @user
    if @ticket.save
      redirect_to tickets_path(@ticket)
    else
      render :new
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to tickets_path(@ticket)
  end

  private

  def ticket_params
    params.require(:ticket).permit(:event_price, :event_name, :event_date, :user_id)
  end
end