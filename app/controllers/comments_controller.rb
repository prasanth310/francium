class CommentsController < ApplicationController
    def create
        @matrimonies = Matrimony.find(params[:matrimony_id])
        @comment = @matrimonies.comments.create(params[:comment].permit(:body))
        @comment.user_id = current_user.id
        @comment.save
        redirect_to matrimony_path(@matrimonies) if @comment.save
    end
    def destroy
        @matrimonies = Matrimony.find(params[:matrimony_id])
        @comment = @matrimonies.comments.find(params[:id])
        @comment.destroy
        redirect_to matrimony_path(@matrimonies)
    end
end
