# frozen_string_literal: true

class InssDiscountJob < ApplicationJob
  queue_as :default

  def perform(bidder_id)
    bidder = Bidder.find(bidder_id)
    bidder.update(inss_discount: InssDiscount.new(bidder.salary.to_s).discount)
  end
end
