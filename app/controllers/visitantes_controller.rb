class VisitantesController < ApplicationController
  before_action :set_visitante, only: [:show, :edit, :update, :destroy]

  # GET /visitantes
  # GET /visitantes.json
  def index
    @visitantes = Visitante.all
  end

  # GET /visitantes/1
  # GET /visitantes/1.json
  def show
  end

  # GET /visitantes/new
  def new
    @visitante = Visitante.new
    @visit = Visitante.last
    @codigo = @visit.id
  end

  # GET /visitantes/1/edit
  def edit
  end

  # POST /visitantes
  # POST /visitantes.json
  def create
    @visitante = Visitante.new(visitante_params)
    

    respond_to do |format|
      if @visitante.save
        
        format.html { redirect_to root_path, notice: 'Visitante was successfully created.' }
        format.json { render :show, status: :created, location: @visitante }
      else
        format.html { render :new }
        format.json { render json: @visitante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visitantes/1
  # PATCH/PUT /visitantes/1.json
  def update
    respond_to do |format|
      if @visitante.update(visitante_params)
        format.html { redirect_to @visitante, notice: 'Visitante was successfully updated.' }
        format.json { render :show, status: :ok, location: @visitante }
      else
        format.html { render :edit }
        format.json { render json: @visitante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitantes/1
  # DELETE /visitantes/1.json
  def destroy
    @visitante.destroy
    respond_to do |format|
      format.html { redirect_to visitantes_url, notice: 'Visitante was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitante
      @visitante = Visitante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visitante_params
      params.require(:visitante).permit(:nome, :email, :telefone)
    end
end
