# frozen_string_literal: true

require "test_helper"

class ReportDataTest < ActiveSupport::TestCase
  test "shows chart_data and salary_range_data on range R$ 1.045,00" do
    salary = "1.044,00"
    create(:bidder, salary:, inss_discount: InssDiscount.new(salary).discount)
    service = ReportData.new

    assert_includes service.chart_data, ["Até R$ 1.045,00", 1]
    assert_includes service.salary_range_data, { title: "Até R$ 1.045,00", bidders: Bidder.first_salary_group.presence }
  end

  test "shows chart_data and salary_range_data on range R$ 1.045,01 to R$ 2.089,60" do
    salary = "2.070,60"
    create(:bidder, salary:, inss_discount: InssDiscount.new(salary).discount)
    service = ReportData.new

    assert_includes service.chart_data, ["De R$ 1.045,01 a R$ 2.089,60", 1]
    assert_includes service.salary_range_data,
                    { title: "De R$ 1.045,01 a R$ 2.089,60", bidders: Bidder.second_salary_group.presence }
  end

  test "shows chart_data and salary_range_data on range R$ 2.089,61 to R$ 3.134,40" do
    salary = "3.124,40"
    create(:bidder, salary:, inss_discount: InssDiscount.new(salary).discount)
    service = ReportData.new

    assert_includes service.chart_data, ["De R$ 2.089,61 até R$ 3.134,40", 1]
    assert_includes service.salary_range_data,
                    { title: "De R$ 2.089,61 até R$ 3.134,40", bidders: Bidder.third_salary_group.presence }
  end

  test "shows chart_data and salary_range_data on range R$ 3.134,41 to R$ 6.101,06" do
    salary = "6.000,06"
    create(:bidder, salary:, inss_discount: InssDiscount.new(salary).discount)
    service = ReportData.new

    assert_includes service.chart_data, ["De R$ 3.134,41 até R$ 6.101,06", 1]
    assert_includes service.salary_range_data,
                    { title: "De R$ 3.134,41 até R$ 6.101,06", bidders: Bidder.fourth_salary_group.presence }
  end
end
