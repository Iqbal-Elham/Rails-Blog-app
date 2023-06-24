class LikesController < ApplicationController
    def create
        @like = Like.new(author_id: current_user.id, post_id: params[:post_id])
    
        if @like.save
          flash[:notice] = 'Liked successfully'
        else
          flash.now[:alert] = 'Oops, something wrong'
        end
        redirect_to "/users/#{@like.author_id}/posts/#{@like.post_id}"
      end
end
