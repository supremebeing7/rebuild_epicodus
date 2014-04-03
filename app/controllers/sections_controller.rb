class SectionsController < ApplicationController
  def index
    @sections = Section.all
    render('sections/index.html.erb')
  end

  def new
    @chapters = Chapter.all
    @section = Section.new
    render('sections/new.html.erb')
  end

  def create
    params[:section][:slug] = params[:section][:name].parameterize
    @section = Section.new(params[:section])
    if @section.save
      redirect_to("/chapters/#{@section.chapter.slug}/sections/#{@section.slug}")
    else
      render('sections/new.html.erb')
    end
  end

  def show
    @section = Section.find_by(slug: params[:section_slug])
    render('sections/show.html.erb')
  end

  def edit
    @section = Section.find_by(slug: params[:section_slug])
    render('sections/edit.html.erb')
  end

  def update
    @section = Section.find_by(slug: params[:section_slug])
    @section.update(params[:section])
    redirect_to("/chapters/#{@section.chapter.slug}/sections/#{@section.slug}")
  end

  def destroy
    @section = Section.find_by(slug: params[:section_slug])
    @section.destroy
    redirect_to("/sections")
  end
end
