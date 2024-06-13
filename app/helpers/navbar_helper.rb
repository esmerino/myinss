# frozen_string_literal: true

module NavbarHelper
  def menu_items
    items = []

    items << { label: "Proponentes", path: bidders_path }
    items << { label: "Relatório", path: reports_path }

    items
  end
end
