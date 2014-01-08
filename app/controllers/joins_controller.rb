class JoinsController < ApplicationController
  before_action :set_join, only: [:show, :edit, :update, :destroy]

  # GET /joins
  # GET /joins.json
  def index
    @joins = Join.all
  end

  # GET /joins/1
  # GET /joins/1.json
  def show
  end

  # GET /joins/new
  def new
    @join = Join.new
  end

  # GET /joins/1/edit
  def edit
  end

  # POST /joins
  # POST /joins.json
  def create
    @join = Join.new(join_params)

    respond_to do |format|
      if @join.save
        format.html { redirect_to @join, notice: 'Thanks for joinning' }
        format.json { render action: 'show', status: :created, location: @join }
      else
        format.html { render action: 'new' }
        format.json { render json: @join.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /joins/1
  # PATCH/PUT /joins/1.json
  def update
    respond_to do |format|
      if @join.update(join_params)
        format.html { redirect_to @join, notice: 'Join was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @join.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /joins/1
  # DELETE /joins/1.json
  def destroy
    @join.destroy
    respond_to do |format|
      format.html { redirect_to joins_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_join
      @join = Join.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def join_params
      params.require(:join).permit(:email, :association_type, :message)
    end
end
