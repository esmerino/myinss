# frozen_string_literal: true

class BiddersController < ApplicationController
  before_action :set_bidder, only: %i[edit update destroy]

  def index
    @bidders = Bidder.order(:name).page(params[:page]).per(5)
  end

  def new
    @bidder = Bidder.new
  end

  def edit; end

  def create
    @bidder = Bidder.new(bidder_params)

    if @bidder.save
      InssDiscountJob.perform_later(@bidder.id)
      redirect_to bidders_path, notice: "Proponente cadastrado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @bidder.update(bidder_params)
      InssDiscountJob.perform_later(@bidder.id)
      redirect_to bidders_path, notice: "Proponente atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bidder.destroy
    redirect_to bidders_path, notice: "Proponente excluído com sucesso."
  end

  private

  def set_bidder
    @bidder = Bidder.find(params[:id])
  end

  def bidder_params
    params.require(:bidder).permit(:name, :cpf, :birth_date, :street, :number, :neighbourhood, :city, :state,
                                   :postcode, :telephone, :salary)
  end
end
