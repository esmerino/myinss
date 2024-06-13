# frozen_string_literal: true

class InssDiscount
  def initialize(salary)
    @salary = convert_to_number(salary)
  end

  def discount
    [
      first_salary_range(salary),
      second_salary_range(salary),
      third_salary_range(salary),
      fourth_salary_range(salary)
    ].sum
  end

  private

  attr_accessor :salary

  def first_salary_range(salary)
    if (0..1045.00).include?(salary)
      salary * 0.075
    else
      1045.00 * 0.075
    end
  end

  def second_salary_range(salary)
    return 0.0 if salary < 1045.01

    if (1045.01..2089.60).include?(salary)
      (salary - 1045.00) * 0.09
    else
      (2089.60 - 1045.00) * 0.09
    end
  end

  def third_salary_range(salary)
    return 0.0 if salary < 2089.61

    if (2089.61..3134.40).include?(salary)
      (salary - 2089.60) * 0.12
    else
      (3134.40 - 2089.60) * 0.12
    end
  end

  def fourth_salary_range(salary)
    return 0.0 if salary < 3134.41

    if (3134.41..6101.06).include?(salary)
      (salary - 3134.40) * 0.14
    else
      (6101.06 - 3134.40) * 0.14
    end
  end

  def convert_to_number(salary)
    Monetize.parse(salary).fractional / 100.0
  end
end
