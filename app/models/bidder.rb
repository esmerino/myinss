# frozen_string_literal: true

class Bidder < ApplicationRecord
  validates :name, :cpf, :salary, presence: true
  monetize :salary_cents, allow_nil: true

  scope :first_salary_group, -> { where(salary_cents: first_salary_range) }
  scope :second_salary_group, -> { where(salary_cents: second_salary_range) }
  scope :third_salary_group, -> { where(salary_cents: third_salary_range) }
  scope :fourth_salary_group, -> { where(salary_cents: fourth_salary_range) }

  def self.first_salary_range
    0..Monetize.parse("1.045,00").fractional
  end

  def self.second_salary_range
    Monetize.parse("1.045,00").fractional..Monetize.parse("2.089,60").fractional
  end

  def self.third_salary_range
    Monetize.parse("2.089,60").fractional..Monetize.parse("3.134,40").fractional
  end

  def self.fourth_salary_range
    Monetize.parse("3.134,41").fractional..Monetize.parse("6.101,06").fractional
  end
end
