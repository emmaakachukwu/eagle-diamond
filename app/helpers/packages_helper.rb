# frozen_string_literal: true

module PackagesHelper
  def package_preview_css_class(package, recipient)
    classes = ['message']
    classes << 'message--new' unless recipient.opened?
    classes << 'message--active' if current_page? package_path(package)
    classes.join ' '
  end
end
