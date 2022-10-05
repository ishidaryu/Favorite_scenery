class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres =Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def destroy
    @genre = Genre.find_by(id: params[:id])
    @genre.destroy
    redirect_to admin_genres_path(@genre)
  end

  def edit
    @genre = Genre.find_by(id: params[:id])
  end

  def update
    @genre = Genre.find_by(id: params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path(@genre)
  end


private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
