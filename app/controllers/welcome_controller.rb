class WelcomeController < ApplicationController
  def index
  end

  def faq
    @questions = Question.all
  end
end
