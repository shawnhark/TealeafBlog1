PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

resources :posts, except:[:destroy] do
	resources :comments, only: [:create]
end

#GET /posts/2/comments
#GET /posts/2/comments/new
#POST /posts/2/comments 
#GET /posts/2/coments/edit
#PATCH /posts/2/comments/4


end
