# frozen_string_literal: true

require "test_helper"

class BidderTest < ActiveSupport::TestCase
  test "is valid with valid attributes" do
    bidder = create(:bidder)

    assert_predicate bidder, :valid?
  end

  test "is invalid without name, cpf and salary" do
    bidder = build(:bidder, name: nil, cpf: nil, salary: nil)

    bidder.validate

    assert_includes bidder.errors[:name], I18n.t("errors.messages.blank")
    assert_includes bidder.errors[:cpf], I18n.t("errors.messages.blank")
    assert_includes bidder.errors[:salary], I18n.t("errors.messages.blank")
  end

  test "scope first_salary_group" do
    salary = "1.045,00"
    bidder = create(:bidder, salary:)

    assert_includes Bidder.first_salary_group, bidder
  end

  test "scope second_salary_group" do
    salary = "2.089,60"
    bidder = create(:bidder, salary:)

    assert_includes Bidder.second_salary_group, bidder
  end

  test "scope third_salary_group" do
    salary = "3.134,40"
    bidder = create(:bidder, salary:)

    assert_includes Bidder.third_salary_group, bidder
  end

  test "scope fourth_salary_group" do
    salary = "6.101,06"
    bidder = create(:bidder, salary:)

    assert_includes Bidder.fourth_salary_group, bidder
  end
end
