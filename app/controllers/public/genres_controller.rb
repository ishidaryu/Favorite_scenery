class Public::GenresController < ApplicationController
  def show
    @genres = Genre.all.page(params[:page]).per(6)
    @genre = Genre.find_by(id: params[:id])
    @genreitems = Scenery.where(genre_id: @genre.id).page(params[:page]).per(6)
    @search = Scenery.ransack(params[:q])
    @items = @search.result
  end
end