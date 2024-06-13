# frozen_string_literal: true

class ApplicationFormBuilder < ActionView::Helpers::FormBuilder
  include FormHelper

  FORM_BASIC_TAGS = %i[
    text_field text_area date_field phone_field email_field password_field check_box file_field
  ].freeze

  FORM_BASIC_TAGS.each do |tag|
    define_method(tag) do |attribute, options = {}|
      add_invalid_class_to_options(attribute, options)
      input_field(attribute, super(attribute, options), show_label?(options))
    end
  end

  def collection_select(attribute, collection, value_method, text_method, options = {}, html_options = {}) # rubocop:disable Metrics/ParameterLists
    add_invalid_class_to_options(attribute, html_options)
    input_field(attribute, super, show_label?(options))
  end

  def select(attribute, choices = nil, options = {}, html_options = {}, &)
    add_invalid_class_to_options(attribute, html_options)
    input_field(attribute, super, show_label?(options))
  end

  def trix_editor_field(attribute, options = {})
    options[:input] = field_id(attribute)
    add_invalid_class_to_options(attribute, options)

    elements = []
    elements << hidden_field(attribute)
    elements << @template.content_tag("trix-editor", "", options)
    elements << errors_for(attribute)

    @template.safe_join(elements)
  end

  private

  def add_invalid_class_to_options(attribute, options)
    return if object.blank?

    attribute_name = attribute_name_for_error(attribute)
    css_class = invalid_class_for(object, attribute_name)
    options[:class] ||= ""
    options[:class] = options[:class].dup << " #{css_class}"
  end

  def show_label?(options)
    options.fetch(:label, true)
  end

  def input_field(attribute, field, show_label)
    elements = []
    elements << build_label(attribute) if show_label
    elements << field
    elements << errors_for(attribute)

    @template.safe_join(elements)
  end

  def build_label(attribute)
    label_class = "form-label"
    label_class += " required" if presence_validator?(object, attribute)

    label(attribute, class: label_class)
  end

  def presence_validator?(object, attribute)
    return false if object.blank?

    attribute_without_id = field_name_without_id(attribute)
    object.class.validators_on(attribute_without_id).any? { |v| v.kind == :presence }
  end

  def errors_for(attribute)
    attribute_name = attribute_name_for_error(attribute)
    return if object.blank? || object.errors[attribute_name].empty?

    errors = object.errors.full_messages_for(attribute_name).map do |error_message|
      @template.content_tag(:div, error_message, class: "invalid-feedback d-block")
    end

    @template.safe_join(errors)
  end

  def attribute_name_for_error(attribute)
    return field_name_without_id(attribute) if attribute.to_s.end_with?("_id")

    attribute
  end

  def field_name_without_id(attribute)
    attribute.to_s.remove("_id").to_sym
  end
end
