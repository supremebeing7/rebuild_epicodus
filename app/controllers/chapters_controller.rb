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
    params[:chapter][:slug] = params[:chapter][:name].parameterize
    @chapter = Chapter.new(params[:chapter])
    if @chapter.save
      redirect_to("/chapters/#{@chapter.slug}")
    else
      render('chapters/new.html.erb')
    end
  end

  def show
    @chapter = Chapter.find_by(slug: params[:chapter_slug])
    render('chapters/show.html.erb')
  end

  def edit
    @chapter = Chapter.find_by(slug: params[:chapter_slug])
    render('chapters/edit.html.erb')
  end

  def update
    @chapter = Chapter.find_by(slug: params[:chapter_slug])
    @chapter.update(params[:chapter])
    redirect_to("/chapters/#{@chapter.id}")
  end

  def destroy
    @chapter = Chapter.find_by(slug: params[:chapter_slug])
    @chapter.destroy
    redirect_to("/chapters")
  end
end
