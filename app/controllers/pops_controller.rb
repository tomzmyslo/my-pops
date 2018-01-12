class PopsController < ApplicationController
  before_action :set_pop, only: [ :show, :edit, :update, :destroy ]

  def index
    @pops = Pop.all
  end

  def show
  end

  def new
    @pop = Pop.new()
  end

  def create
    @pop = Pop.new(pop_params)
    if @pop.save
      redirect_to @pop, notice: "The Pop! has been successfully saved."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @pop.update_attributes(pop_params)
      redirect_to @pop, notice: "The Pop! was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @pop.destroy
    redirect_to @pops, notice: "The Pop! was successfully removed."
  end

  private

  def pop_params
    params.require(:pop).permit(:name, :number, :collection, :category, :exclusivity, :amount_paid, :quantity, :condition, :box_number, :notes, :ppg_url)
  end

  def set_pop
    @pop = Pop.find(params[:id])
  end

end
