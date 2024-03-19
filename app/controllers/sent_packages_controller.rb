# frozen_string_literal: true

class SentPackagesController < ApplicationController
  def index
    @packages = current_user.sent_packages

    render 'packages/index'
  end

  def show
    @packages = current_user.sent_packages
    @package = current_user.sent_packages.find params[:id]

    render 'packages/index'
  rescue ActiveRecord::RecordNotFound
    raise ActionController::RoutingError, "You didn't send out such package"
  end
end
