class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  # Cria uma empresa e faz o link com o usuário logado
  def create
    company = Company.new(company_params)
    company.user_id = current_user.id
    company.save!

    redirect_to events_url, notice: 'Empresa criada com sucesso! :)'
  end

  private

  def company_params
    params.require(:company).permit(:name, :phone, :cnpj)
  end
end
