class StaticPublicController < ApplicationController
  before_action :authenticate_user!, except: [:landing_page]
  #skip_before_action :authenticate_user!, only: %i[:landing_page]
  def landing_page
  end

  def privacy
  end

  def terms
  end
end
