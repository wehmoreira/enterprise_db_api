require 'rails_helper'

shared_examples 'post fails' do |expected_error|
  it 'doesn\'t create a company' do
    expect { subject }.not_to change { Company.count }
  end

  it 'returns a json with errors' do
    post_companies

    expect(JSON.parse(response.body).deep_symbolize_keys)
      .to include(errors: expected_error)
  end

  it { is_expected.to eq(422) }
end
