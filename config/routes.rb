RebuildThisSite::Application.routes.draw do

  match('/', {via: :get, to: 'chapters#index'})

  match('/chapters', {via: :get, to: 'chapters#index'})
  match('/chapters', {via: :post, to: 'chapters#create'})
  match('/chapters/new', {via: :get, to: 'chapters#new'})
  match('/chapters/:id', {via: :get, to: 'chapters#show'})
  match('/chapters/:id/edit', {via: :get, to: 'chapters#edit'})
  match('/chapters/:id', {via: [:patch, :put], to: 'chapters#update'})
  match('/chapters/:id', {via: :delete, to: 'chapters#destroy'})

  match('/sections', {via: :get, to: 'sections#index'})
  match('/chapters/:chapter_id/sections', {via: :post, to: 'sections#create'})
  match('/chapters/:chapter_id/sections/new', {via: :get, to: 'sections#new'})
  match('/chapters/:chapter_id/sections/:id', {via: :get, to: 'sections#show'})
  match('/chapters/:chapter_id/sections/:id/edit', {via: :get, to: 'sections#edit'})
  match('/chapters/:chapter_id/sections/:id', {via: [:patch, :put], to: 'sections#update'})
  match('/sections/:id', {via: :delete, to: 'sections#destroy'})

  match('/lessons', {via: :get, to: 'lessons#index'})
  match('/sections/:section_id/lessons', {via: :post, to: 'lessons#create'})
  match('/sections/:section_id/lessons/new', {via: :get, to: 'lessons#new'})
  match('/sections/:section_id/lessons/:id', {via: :get, to: 'lessons#show'})
  match('/sections/:section_id/lessons/:id/edit', {via: :get, to: 'lessons#edit'})
  match('/sections/:section_id/lessons/:id', {via: [:patch, :put], to: 'lessons#update'})
  match('/lessons/:id', {via: :delete, to: 'lessons#destroy'})

end
