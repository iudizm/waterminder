class HydrationRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @hydration_records = current_user.hydration_records
  end

  def new
    @hydration_record = current_user.hydration_records.new
  end

  def create
    @hydration_record = current_user.hydration_records.new(hydration_record_params)
    @hydration_record.recorded_at = Time.current

    if @hydration_record.save
      redirect_to hydration_records_path, notice: "Registro de hidratação criado com sucesso."
    else
      render :new
    end
  end

  def show
    @hydration_record = current_user.hydration_records.find(params[:id])
  end

  def edit
    @hydration_record = current_user.hydration_records.find(params[:id])
  end

  def update
    @hydration_record = current_user.hydration_records.find(params[:id])

    if @hydration_record.update(hydration_record_params)
      redirect_to hydration_record_path(@hydration_record), notice: "Registro de hidratação atualizado com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @hydration_record = current_user.hydration_records.find(params[:id])
    @hydration_record.destroy
    redirect_to hydration_records_path, notice: "Registro de hidratação excluído com sucesso."
  end

  private

  def hydration_record_params
    params.require(:hydration_record).permit(:amount)
  end
end
