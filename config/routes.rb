CenatusCms::Application.routes.draw do                      
  
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  
  get "sitemap/sitemap"

  resources :content_areas
  resources :pages
  resources :categories
  resources :assets
  devise_for :users
  
  
  ##########################
  # culled from Rails Admin
  ##########################
  # Prefix route urls with "admin" and route names with "rails_admin_"
  # scope "admin", :module => :rails_admin, :as => "rails_admin" do
  #   scope "history", :as => "history" do
  #     controller "history" do
  #       match "/list", :to => :list, :as => "list"
  #       match "/slider", :to => :slider, :as => "slider"
  #       match "/:model_name", :to => :for_model, :as => "model"
  #       match "/:model_name/:id", :to => :for_object, :as => "object"
  #     end
  #   end
  # 
  #   # Routes for rails_admin controller
  #   controller "main" do
  #     match "/", :to => :index, :as => "dashboard"
  #     get "/:model_name", :to => :list, :as => "list"
  #     post "/:model_name/list", :to => :list, :as => "list_post"
  #     match "/:model_name/export", :to => :export, :as => "export"
  #     get "/:model_name/new", :to => :new, :as => "new"
  #     match "/:model_name/get_pages", :to => :get_pages, :as => "get_pages"
  #     post "/:model_name", :to => :create, :as => "create"
  # 
  #     get "/:model_name/:id", :to => :show, :as => "show"
  #     get "/:model_name/:id/edit", :to => :edit, :as => "edit"
  #     put "/:model_name/:id", :to => :update, :as => "update"
  #     get "/:model_name/:id/delete", :to => :delete, :as => "delete"
  #     delete "/:model_name/:id", :to => :destroy, :as => "destroy"
  # 
  #     post "/:model_name/bulk_action", :to => :bulk_action, :as => "bulk_action"
  #     post "/:model_name/bulk_destroy", :to => :bulk_destroy, :as => "bulk_destroy"
  #   end
  # end 
  #############################
  # end culled from Rails Admin
  #############################


  match "sitemap.xml" => "sitemap#sitemap"
  root :to => "pages#dynamic"


  match "page_content_areas/:page_id/:name" => "content_areas#page_content_areas", :as => :page_content_areas
  match "/:slug" => "pages#dynamic", :as => :pages


end
