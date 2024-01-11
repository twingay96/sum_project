class StaticPublicController < ApplicationController
  before_action :authenticate_user!, except: [:landing_page]
  #skip_before_action :authenticate_user!, only: %i[:landing_page]
  def landing_page
    unless session[:visit_landing_page]
      flash.now[:visit_first]="this is landingpage!"
      session[:visit_landing_page]= true
    end
  end

  def privacy
  end

  def terms
  end
end
