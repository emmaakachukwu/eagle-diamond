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
end
