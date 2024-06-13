# frozen_string_literal: true

class ReportData
  def chart_data
    data = []
    data << ["Até R$ 1.045,00", first_salary_group.count] if first_salary_group
    data << ["De R$ 1.045,01 a R$ 2.089,60", second_salary_group.count] if second_salary_group
    data << ["De R$ 2.089,61 até R$ 3.134,40", third_salary_group.count] if third_salary_group
    data << ["De R$ 3.134,41 até R$ 6.101,06", fourth_salary_group.count] if fourth_salary_group
    data
  end

  def salary_range_data
    data = []
    data << { title: "Até R$ 1.045,00", bidders: first_salary_group } if first_salary_group
    data << { title: "De R$ 1.045,01 a R$ 2.089,60", bidders: second_salary_group } if second_salary_group
    data << { title: "De R$ 2.089,61 até R$ 3.134,40", bidders: third_salary_group } if third_salary_group
    data << { title: "De R$ 3.134,41 até R$ 6.101,06", bidders: fourth_salary_group } if fourth_salary_group
    data
  end

  private

  def first_salary_group
    @first_salary_group ||= Bidder.first_salary_group.presence
  end

  def second_salary_group
    @second_salary_group ||= Bidder.second_salary_group.presence
  end

  def third_salary_group
    @third_salary_group ||= Bidder.third_salary_group.presence
  end

  def fourth_salary_group
    @fourth_salary_group ||= Bidder.fourth_salary_group.presence
  end
end
