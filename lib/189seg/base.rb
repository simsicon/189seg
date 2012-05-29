module CnTelecomeSeg
  class Base
    def initialize(apid, key, product_id)
      @apid = apid
      @key = key
      @product_id = product_id
    end
    
    def segment(phrase)
      api_url = 'http://125.64.11.43:8080/udt-see/StartServiceServlet'
      params = init_params
      params['params']['DivideText'] = phrase
      response = RestClient.post api_url, encode_json(params), :content_type => :json, :accept => :json
      decoded_response = decode_json(response.to_s)
      decoded_response
    end
    
    private
      def logger(msg)
        puts msg.inspect
      end
    
      def encrypt(message, key)
        key = Base64.decode64(key)
        cipher = OpenSSL::Cipher::Cipher.new("des-ede3")
        cipher.encrypt
        cipher.key = key
        ciphertext = cipher.update(message) + cipher.final
        Base64.encode64(ciphertext).gsub(/\n/, '')
      end

      def encode_json(params)
        Yajl::Encoder.encode(params)
      end

      def decode_json(response)
        parser = Yajl::Parser.new
        hash = parser.parse(response)
        hash
      end

      def init_params
        timestamp                           = Time.now.strftime('%Y%m%d%H%M%S')

        params                              = {}
        params['params']                    = {}
        params['params']['APID']            = @apid
        params['params']['Key']             = encrypt(timestamp+@apid, @key)
        params['params']['ProductID']       = @product_id
        params['params']['TimeStamp']       = timestamp
        params['serviceId']                 = '2011110214151'
        params
      end
  end
end