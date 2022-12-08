class SwapChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    swap = Swap.find(params[:id])
    stream_for swap
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
