RebuildThisSite::Application.routes.draw do

  match('/', {via: :get, to: 'chapters#index'})

  match('/chapters', {via: :get, to: 'chapters#index'})
  match('/chapters', {via: :post, to: 'chapters#create'})
  match('/chapters/new', {via: :get, to: 'chapters#new'})
  match('/chapters/:chapter_slug', {via: :get, to: 'chapters#show'})
  match('/chapters/:chapter_slug/edit', {via: :get, to: 'chapters#edit'})
  match('/chapters/:chapter_slug', {via: [:patch, :put], to: 'chapters#update'})
  match('/chapters/:chapter_slug', {via: :delete, to: 'chapters#destroy'})

  match('/sections', {via: :get, to: 'sections#index'})
  match('/chapters/:chapter_slug/sections', {via: :post, to: 'sections#create'})
  match('/chapters/:chapter_slug/sections/new', {via: :get, to: 'sections#new'})
  match('/chapters/:chapter_slug/sections/:section_slug', {via: :get, to: 'sections#show'})
  match('/chapters/:chapter_slug/sections/:section_slug/edit', {via: :get, to: 'sections#edit'})
  match('/chapters/:chapter_slug/sections/:section_slug', {via: [:patch, :put], to: 'sections#update'})
  match('/sections/:section_slug', {via: :delete, to: 'sections#destroy'})

  match('/lessons', {via: :get, to: 'lessons#index'})
  match('/sections/:section_slug/lessons', {via: :post, to: 'lessons#create'})
  match('/sections/:section_slug/lessons/new', {via: :get, to: 'lessons#new'})
  match('/sections/:section_slug/lessons/:lesson_slug', {via: :get, to: 'lessons#show'})
  match('/sections/:section_slug/lessons/:lesson_slug/edit', {via: :get, to: 'lessons#edit'})
  match('/sections/:section_slug/lessons/:lesson_slug', {via: [:patch, :put], to: 'lessons#update'})
  match('/lessons/:lesson_slug', {via: :delete, to: 'lessons#destroy'})

end
