module Epaybg
  class Response
    attr_accessor :encoded, :checksum

    def initialize(encoded, checksum)
      @encoded = encoded
      @checksum = checksum
    end

    def decoded
      Base64.strict_decode64(@encoded)
    end

    def to_hash
      i = decoded.strip.gsub("\n", ":").split(":").flat_map{ |c| c.split("=")}
      Hash[*i]
    end

    def valid? secret
      Epaybg.hmac(@encoded, secret) == @checksum
    end

    def status
      to_hash['STATUS']
    end

    def invoice
      to_hash['INVOICE']
    end

    def stan
      to_hash['STAN'] if status == 'PAID'
    end

    def bcode
      to_hash['BCODE'] if status == 'PAID'
    end
    
    def stan
      to_hash["STAN"] if status == "PAID"
    end

    def bcode
      to_hash["BCODE"] if status == "PAID"
    end

    def paid_on
      DateTime.parse(to_hash['PAY_TIME']) if status == 'PAID'
    end

    def [](key)
      to_hash[key]
    end

    def response_for(status)
      response_statuses = [:ok, :err, :no]
      raise "Status must be one of #{response_statuses}" unless response_statuses.include? status
      "INVOICE=#{to_hash['INVOICE']}:STATUS=#{status.to_s.upcase}"
    end
  end
end
