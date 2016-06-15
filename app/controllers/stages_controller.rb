class StagesController < ApplicationController
  before_action :set_stage, only: [:show, :edit, :update, :destroy]

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization'
  end

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'

      render :json => '{}', :content_type => 'application/json'
    end
  end

  # GET /stages
  # GET /stages.json
  def index
    @stages = Stage.all

    respond_to do |format|
      if @stages.count > 0
        format.json { render json: @stages, status: :ok }
      else
        format.json { render json: "{ 'error' : 'Bad parameters, any stage founded' }", status: :unprocessable_entity }
      end
    end
  end

  # GET /stages/1
  # GET /stages/1.json
  def show
  end

  # GET /stages/new
  def new
    @stage = Stage.new
  end

  # GET /stages/1/edit
  def edit
  end

  # POST /stages
  # POST /stages.json
  def create
    @stage = Stage.new(stage_params)

    respond_to do |format|
      if @stage.save
        format.html { redirect_to @stage, notice: 'Stage was successfully created.' }
        format.json { render :show, status: :created, location: @stage }
      else
        format.html { render :new }
        format.json { render json: @stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stages/1
  # PATCH/PUT /stages/1.json
  def update
    respond_to do |format|
      if @stage.update(stage_params)
        format.html { redirect_to @stage, notice: 'Stage was successfully updated.' }
        format.json { render :show, status: :ok, location: @stage }
      else
        format.html { render :edit }
        format.json { render json: @stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stages/1
  # DELETE /stages/1.json
  def destroy
    @stage.destroy
    respond_to do |format|
      format.html { redirect_to stages_url, notice: 'Stage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stage
      @stage = Stage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stage_params
      params.require(:golfer).permit(:title, :country, :city, :holes_count, holes_attributes: [:number, :distance_m, :distance_w, :par])
    end
end
