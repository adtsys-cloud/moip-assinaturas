module Moip::Assinaturas
  class Payment

    class << self

      def list(invoice_id, opts={})
        response = Moip::Assinaturas::Client.list_payments(invoice_id, opts)
        hash     = JSON.load(response.body).with_indifferent_access

        case response.code
        when 200
          return {
            success:  true,
            payments: hash[:payments]
          }
        else
          raise(WebServerResponseError, response)
        end
      end

      def details(id, opts={})
        response = Moip::Assinaturas::Client.details_payment(id, opts)
        hash     = JSON.load(response.body).with_indifferent_access

        case response.code
        when 200
          return {
            success:  true,
            payment:  hash
          }
        else
          raise(WebServerResponseError, response)
        end
      end

    end
  end
end