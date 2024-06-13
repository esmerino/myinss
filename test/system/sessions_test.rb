# frozen_string_literal: true

require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  test "logs in successfully with valid credentials" do
    login

    assert_text "Login efetuado com sucesso!"
    assert_equal bidders_path, current_path
  end

  test "fails to log in with invalid credentials" do
    visit new_session_path

    click_button "Entrar"

    assert_text "Usuário e/ou senha inválidos!"
  end

  test "allows logout user" do
    login

    find_by_id("navbarDropdownUser").click
    click_link "Sair"
    wait_page_load

    assert_equal new_session_path, current_path
  end
end
