# frozen_string_literal: true

class CalculatorsController < ApplicationController
  def index
    discount = InssDiscount.new(params[:salary]).discount
    render turbo_stream: turbo_stream.update("discount",
                                             partial: "bidders/discount",
                                             locals: { value: discount })
  end
end
