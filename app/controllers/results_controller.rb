class ResultsController < ApplicationController
  def index
    receipts = Receipt.group("DAY(created_at)")
    @sums = receipts.sum(:fee)
    cussions = Receipt.select(:date).distinct
    dates = []
    cussions.each do |cussion|
      dates << cussion[:date]
    end
    @how_many_cars = []
    dates.each do |date|
      @how_many_cars << Receipt.where(date: date).select(:shafu_id).distinct.count
    end
  end
end
