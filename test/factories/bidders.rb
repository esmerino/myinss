# frozen_string_literal: true

FactoryBot.define do
  factory :bidder do
    name { Faker::Name.name }
    cpf { Faker::IdNumber.brazilian_cpf(formatted: true) }
    salary { ["1.045,00", "2.089,60", "3.134,40", "6.101,06"].sample }
  end
end
