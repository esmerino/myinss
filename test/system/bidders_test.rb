# frozen_string_literal: true

require "application_system_test_case"

class BiddersTest < ApplicationSystemTestCase
  test "visiting the index" do
    login
    visit bidders_path

    assert_text "Proponentes"
  end

  test "creates bidder" do
    name = Faker::Name.name
    cpf = Faker::IdNumber.brazilian_cpf(formatted: true)
    salary = "1045.00"
    inss_discount = "78.38"

    login
    visit new_bidder_path
    fill_in "Nome", with: name
    fill_in "CPF", with: cpf
    fill_in "Salário", with: salary
    click_button "Salvar", class: "top-submit"

    assert_text "Proponente cadastrado com sucesso."
    assert_text name
    assert_text number_to_currency(salary)
    assert_text number_to_currency(inss_discount)
  end

  test "updates bidder" do
    bidder = create(:bidder)
    name = Faker::Name.name

    login
    visit edit_bidder_path(bidder)
    fill_in "Nome", with: name
    click_button "Salvar", class: "top-submit"

    assert_text "Proponente atualizado com sucesso."
    assert_text name
  end

  test "destroy bidder" do
    bidder = create(:bidder)

    login
    visit edit_bidder_path(bidder)
    accept_confirm do
      click_link "Excluir"
    end
    
    assert_text "Proponente excluído com sucesso."
  end

  test "previews of inss discounts" do
    bidder = create(:bidder)

    login
    visit edit_bidder_path(bidder)

    fill_in "Salário", with: "1045.00"
    find_by_id("card-bidder-body").click
    wait_page_load

    assert_text "Desconto do INSS R$ 78,38"

    fill_in "Salário", with: "5000.00"
    find_by_id("card-bidder-body").click
    wait_page_load

    assert_text "Desconto do INSS R$ 558,95"

    fill_in "Salário", with: "7000.00"
    find_by_id("card-bidder-body").click
    wait_page_load
    
    assert_text "Desconto do INSS R$ 713,10"
  end
end
