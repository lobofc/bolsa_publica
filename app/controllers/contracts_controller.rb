class ContractsController < ApplicationController
 before_action :set_contract, only: [:show, :edit, :update, :destroy]
 before_action :set_setting, only: [:index, :show, :edit, :update, :destroy, :new, :concurso]
  # GET /contracts
  # GET /contracts.json
  def index
    @contracts = Contract.all
    @contracts = @contracts.all.order("created_at DESC") 
  end

  def contrataciones
    @contracts = Contract.all
    @contracts = @contracts.all.order("created_at DESC") 
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
  end

  # GET /contracts/new
  def new
    @contract = Contract.new
  end

  # GET /contracts/1/edit
  def edit
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(contract_params)

    respond_to do |format|
      if @contract.save
        format.html { redirect_to @contract, notice: 'El registro a sido creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contracts/1
  # PATCH/PUT /contracts/1.json
  def update
    respond_to do |format|
      if @contract.update(contract_params)
        format.html { redirect_to @contract, notice: 'El registro ha sido actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract.destroy
    respond_to do |format|
      format.html { redirect_to contracts_url, notice: 'El registro ha sido borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = Contract.find(params[:id])
    end

    def set_setting
      @setting = Setting.first
      @render = params[:config]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_params
      params.require(:contract).permit(:titulo, :descripcion, :document)
    end
end




