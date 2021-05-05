class ThoughtsController < ApplicationController
  before_action :set_thought, only: %i[ show edit update destroy ]
  before_action :set_user, only: %i[ index show new create ]

  # GET /thoughts or /thoughts.json
  def index
    @thoughts = current_user.thoughts
    @thought = Thought.new
  end

  # GET /thoughts/1 or /thoughts/1.json
  def show
  end

  # GET /thoughts/new
  def new
    @thought = Thought.new
  end

  # GET /thoughts/1/edit
  def edit
  end

  # POST /thoughts or /thoughts.json
  def create
    @thought = Thought.new(thought_params)
    @thought.user = current_user

    respond_to do |format|
      if @thought.save
        format.html { redirect_to request.referrer, notice: "Thought was successfully created." }
        format.json { render :show, status: :created, location: @thought }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @thought.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thoughts/1 or /thoughts/1.json
  def update
  end

  # DELETE /thoughts/1 or /thoughts/1.json
  def destroy
    @thought.destroy
    respond_to do |format|
      format.html { redirect_to thoughts_url, notice: "Thought was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thought
      @thought = Thought.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    # Only allow a list of trusted parameters through.
    def thought_params
      params.require(:thought).permit(:head)
    end
end

