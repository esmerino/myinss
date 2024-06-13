# frozen_string_literal: true

require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]

  def login
    user = create(:user)

    visit new_session_path
    fill_in "E-mail", with: user.email
    fill_in "Senha", with: user.password
    click_button "Entrar"

    assert_current_path bidders_path
  end

  def wait_page_load
    sleep 0.1
  end
end
