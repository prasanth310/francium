class GuidesController < ApplicationController
  before_action :set_guide, only: %i[ show edit update destroy ]
  access all: [:show, :index], user: {except: [:destroy, :create, :update, :edit]}, site_admin: :all

  # GET /guides or /guides.json
  def index
    @guides = Guide.all
  end

  # GET /guides/1 or /guides/1.json
  def show
    @guide = Guide.includes(:posts).find(params[:id])
    @post = Post.new
    @guide_tittle = @guide.tittle
  end

  # GET /guides/new
  def new
    @guide = Guide.new
  end

  # GET /guides/1/edit
  def edit
  end

  # POST /guides or /guides.json
  def create
    @guide = Guide.new(guide_params)

    respond_to do |format|
      if @guide.save
        format.html { redirect_to @guide, notice: "Guide was successfully created." }
        format.json { render :show, status: :created, location: @guide }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guides/1 or /guides/1.json
  def update
    respond_to do |format|
      if @guide.update(guide_params)
        format.html { redirect_to @guide, notice: "Guide was successfully updated." }
        format.json { render :show, status: :ok, location: @guide }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guides/1 or /guides/1.json
  def destroy
    @guide.destroy
    respond_to do |format|
      format.html { redirect_to guides_url, notice: "Guide was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guide
      @guide = Guide.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guide_params
      params.require(:guide).permit(:tittle, :body)
    end
end
