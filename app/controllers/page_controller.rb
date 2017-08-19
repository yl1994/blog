class PageController < ApplicationController

  def welcome
    @issues  = Issue.all.order(id: :desc)
  end

  def about
    
  end
end