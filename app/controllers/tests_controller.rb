class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
    @tests = Test.find(params[:id])
    render inline: '<h2><%= @tests.title %></h2>'
  end

  def new
    
  end
end
