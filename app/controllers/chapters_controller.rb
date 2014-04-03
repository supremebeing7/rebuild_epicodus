class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.all
    render('chapters/index.html.erb')
  end

  def new
    @chapter = Chapter.new
    render('chapters/new.html.erb')
  end

  def create
    @chapter = Chapter.new(params[:chapter])
    if @chapter.save
      redirect_to("/chapters/#{@chapter.id}")
    else
      render('chapters/new.html.erb')
    end
  end

  def show
    @chapter = Chapter.find(params[:id])
    render('chapters/show.html.erb')
  end

  def edit
    @chapter = Chapter.find(params[:id])
    render('chapters/edit.html.erb')
  end

  def update
    @chapter = Chapter.find(params[:id])
    @chapter.update(params[:chapter])
    redirect_to("/chapters/#{@chapter.id}")
  end

  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy
    redirect_to("/chapters")
  end
end
