# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "is valid with valid attributes" do
    user = create(:user)

    assert_predicate user, :valid?
  end

  test "is invalid without name" do
    user = User.new(name: nil)

    user.validate

    assert_includes user.errors[:name], I18n.t("errors.messages.blank")
  end
end
