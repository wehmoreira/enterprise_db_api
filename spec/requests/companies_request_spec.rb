require 'rails_helper'

describe 'Companies', type: :request do
  describe 'POST /companies' do
    subject(:post_companies) { post '/api/v1/companies', params: data }

    context 'when there is only valid data' do
      let(:data) do
        {
          name: "Empresa Teste", cnpj: "00000000000191",
          total_employees: 100, total_systems: 2
        }
      end

      it 'creates a company' do
        expect { post_companies }.to change { Company.count }.by(1)
      end

      it 'returns a json' do
        post_companies

        expect(JSON.parse(response.body).deep_symbolize_keys).to include(data)
      end

      it { is_expected.to eq(200) }
    end
  end
end

