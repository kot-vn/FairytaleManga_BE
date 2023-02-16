Rails.application.routes.draw do
  devise_for :readers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :readers do
        #     Sign_up and Sign_in
        resources :readers
        resources :sessions, only: [:create]
        resources :reader_activations, only: [:edit]

        #     Get all categories for partials
        # get "/header/", to: "partials#header"
        resources :partials do
          collection do
            get :header
          end
        end

        #     Search hot stories
        # get "/hotday/", to: "hotstories#hot_day"
        # get "/hotweek/", to: "hotstories#hot_week"
        # get "/hotmonth/", to: "hotstories#hot_month"
        resources :hotstories do
          collection do
            get :hot_day
            get :hot_month
            get :hot_week
          end
        end

        #     Show Stories And Read story
        # resources :histories, only: [:show] #show stories
        # post "/read_story/:id", to: "histories#read_story" #read stories
        # get "/read_chapter/:name_story/:name_chapter/", to: "histories#showchapter" #show chap
        resources :stories, only: [:show, :index] do
          member do
            post :read_story
            get :show_chapter
            get :show_list_chapters
          end
          collection do
            get :search_stories
          end
        end

        #     Notification
        # get "/list/", to: "notifications#list_story"
        resources :notifications do
          collection do
            get :list_story
          end
        end
        #     Recommend Story
        # get "/recommend/", to: "recommends#recommend_story"
        # get "/recommend/", to: "recommends#recommend_story"
        resources :recommends do
          collection do
            get :recommend_story
          end
          member do
            get :get_story_by_category
          end
        end
        # Gift
        resources :gifts, only: [:index, :show] do
        end

        resources :scores do
          collection do
            put :increase_score
            put :decrease_score
          end
        end

        resources :comments, only: [:create, :index, :update, :destroy]

        resources :authors, shallow: true do
          resources :comments, only: [:create, :index], module: "authors"
        end

        resources :chapters, shallow: true do
          resources :comments, only: [:create, :index], module: "chapters"
        end

        resources :comments, shallow: true do
          resources :comments, only: [:create, :index], module: "comments"
        end

        resources :stories, shallow: true do
          resources :comments, only: [:create, :index], module: "stories"
        end

        resources :likes, only: [:create, :index, :destroy]

        resources :authors, shallow: true do
          resources :likes, only: [:create, :index], module: "authors"
        end

        resources :comments, shallow: true do
          resources :likes, only: [:create, :index], module: "comments"
        end

        resources :stories, shallow: true do
          resources :likes, only: [:create, :index], module: "stories"
        end

        resources :reports do
          member do
            get :createreports
          end
        end
      end
      namespace :admins do
        resources :missions, only: [:create, :update, :index]
        resources :sessions, only: [:create]
        resources :admins do
          collection do
            get :show_current_admin
            put :update_admin
          end
        end
        resources :gifts do
          member do
            get :compensation
            get :received
          end
        end
          
        resources :comments do
          member do
            put :ban_comment
          end
        end

        resources :authors
        resources :categories
        resources :readers, only: [:index]
        resources :stories do 
          collection do
            get :get_categories
            get :get_authors
          end
          member do
            get :show_list_chapters
          end
        end
        resources :chapters
      end
    end
  end
end
