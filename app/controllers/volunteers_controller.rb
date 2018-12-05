class VolunteersController < ApplicationController
  def new
    @volunteer = Volunteer.new
  end

  # Cria uma empresa e faz o link com o usuário logado
  def create
    volunteer = Volunteer.new(volunteer_params)
    volunteer.user_id = current_user.id
    Volunteer.transaction do
      volunteer.save!
      current_user.update! role: 'volunteer'
    end

    redirect_to events_url, notice: 'Cadastro criado com sucesso! :)'
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:name, :phone, :cpf)
  end
end
