# frozen_string_literal: true

require 'swagger_helper'

describe 'Send SMS' do
  path '/sms_messages' do
    post 'Envia Mensagem SMS' do
      tags 'SMS'
      description 'Endpoint para teste de envio de mensagem pela ferramenta Twilio'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          sms_message: {
            type: :object,
            properties: {
              mobile_number: { type: :string, example: '+5519981907137' },
              message: { type: :string, example: 'Mesagem de Teste' }
            }
          }
        },
        required: %w[mobile_number message]
      }
      produces 'application/json'

      response '201', 'Enviou com sucesso!' do
        let(:params) { { sms_message: { mobile_number: '+5519981907137', message: 'Mesagem de Teste' } } }
        run_test!
      end
    end
  end
end
