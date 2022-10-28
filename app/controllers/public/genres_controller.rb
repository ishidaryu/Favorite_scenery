class Public::GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find_by(id: params[:id])
    @genreitems = Scenery.where(genre_id: @genre.id)  ##.page(params[:page])
    @search = Scenery.ransack(params[:q])
    @items = @search.result
  end
end