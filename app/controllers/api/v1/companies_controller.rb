module Api
  module V1
    class CompaniesController < ApplicationController

      # POST /companies
      def create
        company = Company.new(company_params)

        if company.save
          render json: company, status: :ok
        else
          render json: { errors: company.errors }, status: :unprocessable_entity
        end
      end

      private

      def company_params
        params.permit(:name, :cnpj, :total_employees, :total_systems)
      end
    end
  end
end
