class MatrimoniesController < ApplicationController
    
    #before_action :authenticatr_user!, except: %i[ show edit update destroy ]
    access all: [:show, :index], user: {except: [:destroy, :update, :edit]}, site_admin: :all
    def index
        @matrimonies = Matrimony.all
    end
    
    def new
        @matrimonies = Matrimony.new
    end
    
    def create
        @matrimonies = Matrimony.new(params.require(:matrimony).permit(:name, :age , :spa, :main_image, :thumb_image))
        
        respond_to do |format|
        if @matrimonies.save
            format.html { redirect_to matrimonies_path, notice: "matrimonies was successfully created." }
            format.json { render :show, status: :created, location: @matrimonies }
        else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @matrimonies.errors, status: :unprocessable_entity }
        end
        end
    end
    
    def edit
        @matrimonies = Matrimony.find(params[:id])
    end
    
    def update
        @matrimonies = Matrimony.find(params[:id])
        respond_to do |format|
        if @matrimonies.update(params.require(:matrimony).permit(:name, :age , :spa, :main_image, :thumb_image))
            format.html { redirect_to matrimonies_path, notice: "Successfully updated." }
            format.json { render :show, status: :ok, location: @matrimonies }
        else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @matrimonies.errors, status: :unprocessable_entity }
        end
        end
    end
    
    def show
        @matrimonies = Matrimony.includes(:comments).find(params[:id])
        @comment = Comment.new
       
    end
    
    def destroy
        @matrimonies = Matrimony.find(params[:id])
        @matrimonies.destroy
        respond_to do |format|
          format.html { redirect_to matrimonies_url, notice: "Guide was successfully destroyed." }
          format.json { head :no_content }
        end
    end
    
    
end
