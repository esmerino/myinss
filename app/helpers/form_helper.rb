# frozen_string_literal: true

module FormHelper
  def invalid_class_for(object, attribute)
    "is-invalid" if object.errors.include?(attribute)
  end
end
