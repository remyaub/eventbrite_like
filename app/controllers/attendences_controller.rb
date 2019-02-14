class AttendencesController < ApplicationController
    def new
        @event = Event.find(params[:event_id])
    end

    def create
        @event = Event.find(params[:event_id])
        @amount = @event.price * 100
        
     
        customer = Stripe::Customer.create(
          :email => params[:stripeEmail],
          :source  => params[:stripeToken]
        )
     
        charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => @amount,
          :description => 'Rails Stripe customer',
          :currency    => 'usd'
        )
     
        Attendence.create(attendee: current_user, event: Event.find(params[:event_id]), stripe_customer_id: params[:stripeToken])
        redirect_to charges_path
     
        rescue Stripe::CardError => e
          flash[:error] = e.message
          redirect_to new_event_attendance_path(params[:event_id])
     end

    def index
        @event = Event.find(params[:event_id])
        @current_user = current_user
    end
end
