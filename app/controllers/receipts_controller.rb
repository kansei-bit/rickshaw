class ReceiptsController < ApplicationController
  before_action :authenticate_shafu!

  def index
    @receipts = Receipt.order('created_at DESC')
  end

  def new
    @receipt = Receipt.new
  end

  def create
    @receipt = Receipt.new(receipt_params)
    if @receipt.save
      redirect_to receipts_path
    else
      render :new
    end
  end

  def show
    @receipt = Receipt.find(params[:id])
    respond_to do |format|
      format.html { redirect_to action: :show, format: :pdf, debug: true }
      format.pdf do
        render pdf: "receipt",
        layout: 'pdf.html.erb',
        template: "receipts/show.html.erb",
        encoding: 'UTF-8',
        show_as_html: params.key?('debug')
      end
    end
  end

  private
  def receipt_params
    params.require(:receipt).permit(:customer_name, :fee, :cashless, :date, :course_id, :adult_id, :child_id, :group, :departure_from, :arrive_at, :departure_time, :arrival_time, :course_time, :overtime).merge(shafu_id: current_shafu.id)
  end
end
