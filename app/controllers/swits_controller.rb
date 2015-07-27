class SwitsController < ApplicationController
  before_action :set_swit, only: [:show, :edit, :update, :destroy]

  # GET /swits
  # GET /swits.json
  def index
    @swits = Swit.all
    @swits.order! 'created_at DESC'
    @comment = Comment.new
  end

  # GET /swits/1
  # GET /swits/1.json
  def show

  end

  # GET /swits/new
  def new
    @swit = Swit.new
    @swit = current_user.swits.build

    @swits = Swit.all
    @swits.order! 'created_at DESC'
    @comment = Comment.new
  end

  # GET /swits/1/edit
  def edit
  end

  # POST /swits
  # POST /swits.json
  def create
    @swit = Swit.new(swit_params)

    respond_to do |format|
      if @swit.save
        format.html { redirect_to :back }#, notice: 'Swit was successfully created.' }
        format.json { render :show, status: :created, location: @swit }
        
      else
        format.html { render :new }
        format.json { render json: @swit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swits/1
  # PATCH/PUT /swits/1.json
  def update
    respond_to do |format|
      if @swit.update(swit_params)
        format.html { redirect_to @swit, notice: 'Swit was successfully updated.' }
        format.json { render :show, status: :ok, location: @swit }
      else
        format.html { render :edit }
        format.json { render json: @swit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swits/1
  # DELETE /swits/1.json
  def destroy
    @swit.destroy
    respond_to do |format|
      format.html { redirect_to swits_url, notice: 'Swit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def upvote
    @swit = Swit.find(params[:id])
    @swit.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @swit = Swit.find(params[:id])
    @swit.downvote_by current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swit
      @swit = Swit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swit_params
      params.require(:swit).permit(:user_id, :content)
    end
end
