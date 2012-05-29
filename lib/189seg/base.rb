module CnTelecomeSeg
  class Base
    def initialize(apid, key, product_id)
      @apid = apid
      @key = key
      @product_id = product_id
    end
    
    def segment(phrase)
      logger.info "get into segment"
      api_url = 'http://125.64.11.43:8080/udt-see/StartServiceServlet'
      logger.info "start to init params"
      params = init_params
      logger.info "get params"
      logger.info params
      params['DivideText'] = phrase
      logger.info "start to post"
      res = Net::HTTP.post_form(URI.parse(api_url), encode_json(params))
      res.body
    end
    
    private
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
        timestamp                 = Time.now.strftime('%Y%m%d%H%M%S')

        params                    = {}
        params['APID']            = @apid
        params['Key']             = encrypt(timestamp+@apid, @key)
        params['ProductID']       = @product_id
        params['TimeStamp']       = timestamp
        params
      end
  end
end