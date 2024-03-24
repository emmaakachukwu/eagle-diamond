# frozen_string_literal: true

class PackagesController < ApplicationController
  def index
    @packages = current_user.packages
    @title = 'Packages'
  end

  def show
    @packages = current_user.packages
    @package = @packages.find params[:id]
    @recipient = @package.recipients.recipient(current_user).first
    @title = "#{@package.title} | Packages"

    render 'packages/index'
  rescue ActiveRecord::RecordNotFound
    raise ActionController::RoutingError, "We don't have the package you're looking for"
  end

  def create
    @resource = Package.new(package_params)
    if @resource.save
      redirect_to sent_packages_path
    else
      redirect_back fallback_location: sent_packages_path, status: :unprocessable_entity
    end
  end

  private

  def package_params
    params.require(:package)
          .permit(:title, :body)
          .merge(recipients_attributes:)
  end

  def recipients_params
    params.require(:package).permit(:recipients)
  end

  def recipients_attributes
    recipients = recipients_params
                 .fetch(:recipients, '')
                 .split(',')
                 .map(&:strip)
    User.where(email: recipients).map { |user| { user: } }
  end
end
