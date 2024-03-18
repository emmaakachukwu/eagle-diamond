# frozen_string_literal: true

module PackagesHelper
  def recipient_user(package, user)
    package.recipients.find_by user:
  end

  def package_preview_css_class(package, recipient)
    classes = ['message']
    classes << 'message--new' unless recipient.opened?
    classes << 'message--active' if package.id == params[:id]
    classes.join ' '
  end
end
