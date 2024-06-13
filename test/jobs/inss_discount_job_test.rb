# frozen_string_literal: true

require "test_helper"

class InssDiscountJobTest < ActiveJob::TestCase
  test "perform" do
    bidder = create(:bidder)

    InssDiscountJob.perform_now(bidder.id)
    bidder.reload
    discount = InssDiscount.new(bidder.salary.to_s).discount

    assert_equal number_to_currency(discount), number_to_currency(bidder.inss_discount)
  end
end
