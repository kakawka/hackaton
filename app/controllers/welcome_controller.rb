class WelcomeController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :eula

  def index
  end

  def faq
  end

  def docs
  end

  def color_changer
  end

  def eula
    render :text => Rails.application.assets['eula.js']
  end
end
