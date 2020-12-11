require 'net/http'
require 'uri'
require 'json'

class Tradutor
    def initialize
        @uri = URI.parse("https://api.gotit.ai/Translation/v1.1/Translate")
        @request = Net::HTTP::Post.new(@uri, 'Content-Type' => 'application/json')
        @request.basic_auth("1997-xbNkOVkI", "ayhEcSvTyS5kmFN1yu0mrc/sdbDsSpiJbeI7LHfN")
    end

    def traduzir(frase, ori, tra)
        @request.body = {T: frase, SL: ori, TL: tra}.to_json
        response = Net::HTTP.start(@uri.hostname, @uri.port, use_ssl: @uri.scheme == "https") do |http|
            http.request(@request)
        end

        request_json = JSON.parse(@request.body)
        response_json = JSON.parse(response.body)
        log(request_json, response_json)
        
        return response_json["result"]
    end

    def log(request, response)
        time = Time.new
        frase = request["T"]
        ori = request["SL"]
        tra = request["TL"]
        traducao = response["result"]

        file = File.open(time.strftime("%m-%d-%Y.%H.%M.%S") + ".txt", 'w') do |fline|
            fline.puts ("Idioma_original: #{ori}")
            fline.puts ("Idioma_traducao: #{tra}")
            fline.puts ("Frase: #{frase}")
            fline.puts ("Tradução: #{traducao}")
        end
    end
end
 
