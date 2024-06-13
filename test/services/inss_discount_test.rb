# frozen_string_literal: true

require "test_helper"

class InssDiscountTest < ActiveSupport::TestCase
  test "shows discout for salary 3.000,00" do
    salary = "3.000,00"
    service = InssDiscount.new(salary)

    assert_includes number_to_currency(service.discount), "R$ 281,64"
  end

  test "shows discout for salary 1.045,00" do
    salary = "1.045,00"
    service = InssDiscount.new(salary)

    assert_includes number_to_currency(service.discount), "R$ 78,38"
  end

  test "shows discout for salary 2.089,60" do
    salary = "2.089,60"
    service = InssDiscount.new(salary)

    assert_includes number_to_currency(service.discount), "R$ 172,39"
  end

  test "shows discout for salary 3.134,40" do
    salary = "3.134,40"
    service = InssDiscount.new(salary)

    assert_includes number_to_currency(service.discount), "R$ 297,77"
  end

  test "shows discout for salary 6.101,06" do
    salary = "6.101,06"
    service = InssDiscount.new(salary)

    assert_includes number_to_currency(service.discount), "R$ 713,10"
  end
end
