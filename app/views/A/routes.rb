# rails3
resources :photos do
  get "serve", :on => :member
end

# rails 2.x
resources :photos, :member => {:serve => :get}