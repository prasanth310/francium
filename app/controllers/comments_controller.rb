class CommentsController < ApplicationController
    def create
        @matrimonies= Matrimony.find(params[:matrimony_id])
        @comment = @matrimonies.comments.create(params[:comment].permit(:name, :body))
        redirect_to matrimony_path(@matrimonies)
    end
    def destroy
        @matrimonies = Matrimony.find(params[:matrimony_id])
        @comment = @matrimonies.comments.find(params[:id])
        @comment.destroy
        redirect_to matrimony_path(@matrimonies)
    end
end
