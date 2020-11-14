class ReceiptsController < ApplicationController
  before_action :authenticate_shafu!
  def new
    @receipt = Receipt.new
  end

  def create
    @receipt = Receipt.new(receipt_params)
    unless @receipt.save
      render :new
    end
  end

  private
  def receipt_params
    params.require(:receipt).permit(:customer_name, :fee, :cashless, :date, :course_id, :adult_id, :child_id, :group, :departure_from, :arrive_at, :departure_time, :arrival_time, :course_time, :overtime).merge(shafu_id: current_shafu.id)
  end
end
