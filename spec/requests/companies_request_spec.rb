require 'rails_helper'

describe 'Companies', type: :request do
  describe 'POST /companies' do
    let(:data) do
      {
        name: 'Empresa Teste', cnpj: '00000000000191',
        total_employees: 100, total_systems: 2
      }
    end

    subject(:post_companies) { post '/api/v1/companies', params: data }

    context 'when there is an invalid total_employees' do
      before { data[:total_employees] = 'wrong_value' }

      it_behaves_like 'post fails', { total_employees: ['is not a number'] }
    end

    context 'when there is an invalid total_systems' do
      before { data[:total_systems] = 'wrong_value' }

      it_behaves_like 'post fails', { total_systems: ['is not a number'] }
    end

    context 'when there is an invalid name' do
      before { data[:name] = '' }

      it_behaves_like 'post fails', { name: ['can\'t be blank'] }
    end

    context 'when there is an invalid cnpj' do
      before { data[:cnpj] = '' }

      it_behaves_like 'post fails', { cnpj: ['can\'t be blank'] }
    end


    context 'when there is only valid data' do
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
