class WelcomeController < ApplicationController
  def index
  end

  def faq
    @questions = Question.all
  end

  def docs
  end

  def color_changer
  end
end
