# frozen_string_literal: true

class SentPackagesController < ApplicationController
  def index
    @packages = current_user.sent_packages
    @title = 'Sent Packages'

    render 'packages/index'
  end

  def show
    @packages = current_user.sent_packages
    @package = @packages.find params[:id]
    @title = "#{@package.title} | Sent Packages"

    render 'packages/index'
  rescue ActiveRecord::RecordNotFound
    raise ActionController::RoutingError, "You didn't send out such package"
  end
end
