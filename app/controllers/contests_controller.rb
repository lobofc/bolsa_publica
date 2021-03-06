class ContestsController < ApplicationController
 before_action :set_contest, only: [:show, :edit, :update, :destroy]
 before_action :set_setting, only: [:index, :show, :edit, :update, :destroy, :new, :concurso]
  # GET /contests
  # GET /contests.json
  def index
    @contests = Contest.all
    @contests = @contests.all.order("created_at DESC") 
  end

  def concurso
    @contests = Contest.all
    @contests = @contests.all.order("created_at DESC") 
  end

  # GET /contests/1
  # GET /contests/1.json
  def show
  end

  # GET /contests/new
  def new
    @contest = Contest.new
  end

  # GET /contests/1/edit
  def edit
  end

  # POST /contests
  # POST /contests.json
  def create
    @contest = Contest.new(contest_params)

    respond_to do |format|
      if @contest.save
        format.html { redirect_to @contest, notice: 'El registro a sido creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @contest }
      else
        format.html { render :new }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contests/1
  # PATCH/PUT /contests/1.json
  def update
    respond_to do |format|
      if @contest.update(contest_params)
        format.html { redirect_to @contest, notice: 'El registro ha sido actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @contest }
      else
        format.html { render :edit }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contests/1
  # DELETE /contests/1.json
  def destroy
    @contest.destroy
    respond_to do |format|
      format.html { redirect_to contests_url, notice: 'El registro ha sido borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contest
      @contest = Contest.find(params[:id])
    end

    def set_setting
      @setting = Setting.first
      @render = params[:config]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contest_params
      params.require(:contest).permit(:titulo, :descripcion, :document)
    end
end
