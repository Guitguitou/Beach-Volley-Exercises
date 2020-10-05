class ExercicesController < ApplicationController
  def show
    @exercice = Exercice.find(params[:id])
  end

  def new
    @exercice = Exercice.new
  end

  def create
    @exercice = Exercice.new(exercices_params)
    @exercice.user = current_user
    if @exercice.save
      redirect_to exercice_path(@exercice)
    else
      :new
    end
  end

  private

  def exercices_params
    params.require(:exercice).permit(:nom, :description, :worked, :fonction, :user_id)
  end
end