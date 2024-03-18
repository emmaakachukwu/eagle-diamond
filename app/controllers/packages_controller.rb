# frozen_string_literal: true

class PackagesController < ApplicationController
  def index; end

  def show
    @package = current_user.packages.find params[:id]
    @recipient = @package.recipients.recipient(current_user).first
    render 'packages/index'
  rescue ActiveRecord::RecordNotFound
    raise ActionController::RoutingError, "We don't have the package you're looking for"
  end
end
