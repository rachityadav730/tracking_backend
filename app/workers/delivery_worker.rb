# app/workers/delivery_worker.rb
class DeliveryWorker
    include Sidekiq::Worker
  
    def perform(dlvy_id)
      # Your job logic here
      p "Hello we will start from here",dlvy_id
      a = Delivery.find(dlvy_id)
      b = a.update(status: "reached",address: "Gods House")
      ActionCable.server.broadcast "delivery_channel", b.as_json

    end
  end
  