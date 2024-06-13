# frozen_string_literal: true

require "application_system_test_case"

class ReportsTest < ApplicationSystemTestCase
  test "shows bidders first group range" do
    salary = "1.044,00"
    bidder = create(:bidder, salary:, inss_discount: InssDiscount.new(salary).discount)

    login
    visit reports_path

    assert_text "Até R$ 1.045,00"
    assert_text bidder.name
    assert_text number_to_currency(bidder.salary)
    assert_text number_to_currency(bidder.inss_discount)
  end

  test "shows bidders second group range" do
    salary = "2.070,60"
    bidder = create(:bidder, salary:, inss_discount: InssDiscount.new(salary).discount)

    login
    visit reports_path

    assert_text "De R$ 1.045,01 a R$ 2.089,60"
    assert_text bidder.name
    assert_text number_to_currency(bidder.salary)
    assert_text number_to_currency(bidder.inss_discount)
  end

  test "shows bidders third group range" do
    salary = "3.124,40"
    bidder = create(:bidder, salary:, inss_discount: InssDiscount.new(salary).discount)

    login
    visit reports_path

    assert_text "De R$ 2.089,61 até R$ 3.134,40"
    assert_text bidder.name
    assert_text number_to_currency(bidder.salary)
    assert_text number_to_currency(bidder.inss_discount)
  end

  test "shows bidders fourth group range" do
    salary = "6.000,06"
    bidder = create(:bidder, salary:, inss_discount: InssDiscount.new(salary).discount)

    login
    visit reports_path

    assert_text "De R$ 3.134,41 até R$ 6.101,06"
    assert_text bidder.name
    assert_text number_to_currency(bidder.salary)
    assert_text number_to_currency(bidder.inss_discount)
  end
end
