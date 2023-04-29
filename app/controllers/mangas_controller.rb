class MangasController < ApplicationController
  before_action :set_manga, only: [:show, :edit, :update, :destroy]
  before_action :set_bookmark, only: [:show]

  def index
    @mangas = Manga.all
  end

  def show
    @chapters = @manga.chapters.order(chapter_number: :asc)
    @manga_review = MangaReview.new
  end

  def new
    @manga = current_user.mangas.new
  end

  def create
    @manga = current_user.mangas.new(manga_params)

    if @manga.save
      redirect_to @manga, notice: "Manga was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @manga.update(manga_params)
      redirect_to @manga, notice: "Manga was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @manga.destroy
    redirect_to mangas_url, notice: "Manga was successfully destroyed."
  end

  private

  def set_manga
    @manga = Manga.find(params[:id])
  end

  def set_bookmark
    if user_signed_in?
      @bookmark = current_user.bookmarks.find_by(manga_id: @manga.id)
    end
  end

  def manga_params
    params.require(:manga).permit(:manga_title, :author, :description, :genre_tag, :cover_image)
  end
end
