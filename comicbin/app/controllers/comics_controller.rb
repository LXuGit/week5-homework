class ComicsController < ApplicationController
  def index
    @comics = Comic.all
  end

  def show
    @comic = Comic.find(params[:comic_id])
    @image = @comic.image
    @title = @comic.title
    @description = @comic.description
  end

  def create
    @comic = Comic.new
    @comic.title = params[:title]
    @comic.image = params[:image]
    @comic.description = params[:description]
    if @comic.save
      redirect_to comics_path
    else
      render 'new'
    end
  end

  def new
    @comic = Comic.new
  end

  def destroy
    Comic.find(params[:comic_id]).destroy
    redirect_to comics_path
  end
end
