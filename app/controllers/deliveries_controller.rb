class DeliveriesController < ApplicationController
    def create
      @delivery = Delivery.new(delivery_params)
      if @delivery.save
        ActionCable.server.broadcast "delivery_channel", @delivery
        DeliveryWorker.perform_async(@delivery.id)
        render json: @delivery, status: :created
      else
        render json: @delivery.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def delivery_params
      params.require(:delivery).permit(:status, :address)
    end
  end
  
