class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    render('lessons/index.html.erb')
  end

  def new
    @sections = Section.all
    @lesson = Lesson.new
    render('lessons/new.html.erb')
  end

  def create
    params[:lesson][:slug] = params[:lesson][:name].parameterize
    @sections = Section.all
    @lesson = Lesson.new(params[:lesson])
    if @lesson.save
      redirect_to("/sections/#{@lesson.section.slug}/lessons/#{@lesson.slug}")
    else
      render('lessons/new.html.erb')
    end
  end

  def show
    @lesson = Lesson.find_by(slug: params[:lesson_slug])
    @section = Section.find(@lesson.section_id)
    render('lessons/show.html.erb')
  end

  def edit
    @sections = Section.all
    @lesson = Lesson.find_by(slug: params[:lesson_slug])
    render('lessons/edit.html.erb')
  end

  def update
    @lesson = Lesson.find_by(slug: params[:lesson_slug])
    @lesson.update(params[:lesson])
    redirect_to("/sections/#{@lesson.section.slug}/lessons/#{@lesson.slug}")
  end

  def destroy
    @lesson = Lesson.find_by(slug: params[:lesson_slug])
    @lesson.destroy
    redirect_to('/sections')
  end

end
