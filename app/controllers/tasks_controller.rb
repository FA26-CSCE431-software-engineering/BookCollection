class TasksController < ApplicationController
  def index
    @tasks = ['Fold laundry', 'Sweep porch', 'Wash dishes', 'Mow lawn']
    @page = params[:page].to_i
  end

  def new
  end

  def edit
  end
end
