# frozen_string_literal: true

module PackagesHelper
  def package_preview_css_class(package, recipient)
    classes = ['message']
    classes << 'message--new' unless recipient.opened?
    classes << 'message--active' if package.id.to_s == params[:id]
    classes.join ' '
  end
end
