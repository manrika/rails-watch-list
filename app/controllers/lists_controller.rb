class ListsController < ApplicationController
  before_action :find_list, only: [:show]

  def index
    @lists = List.all
  end

  def show
    @movies = @list.movies
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(require_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def find_list
    @list = List.find(params[:id])
  end

  def require_params
    params.require(:list).permit(:name, :photo)
  end
end
