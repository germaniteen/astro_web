require 'json'

module ApiHelper
  def self.api_post(host, auth = {}, data = {}, headers = {})
    retries = 0
    begin
      host = RestClient::Resource.new(host, auth.fetch(:user_basic_auth), auth.fetch(:password_basic_auth))
      host.post data, headers
    rescue => e
      retries += 1
      raise "Cannot connect to #{host} due to #{e}" if retries >= PageObject.default_retries
      sleep(5 * retries)
      retry
    end
  end

  def self.api_get(host, auth = {}, headers = {})
    retries = 0
    begin
      host = RestClient::Resource.new(host, auth.fetch(:user_basic_auth), auth.fetch(:password_basic_auth))
      host.get headers
    rescue => e
      retries += 1
      raise "Cannot connect to #{host} due to #{e}" if retries >= PageObject.default_retries
      sleep(5 * retries)
      retry
    end
  end

  def self.api_delete(host, auth = {}, headers = {})
    begin
      host = RestClient::Resource.new(host, auth.fetch(:user_basic_auth), auth.fetch(:password_basic_auth))
      host.delete headers
    rescue => e
      raise "Cannot connect to #{host} due to #{e}"
    end
  end

  def self.api_execute_get_request(**args)
    args = args.merge(method: :get)
    retries = 0

    begin
      RestClient::Request.execute(args)
    rescue => e
      retries += 1
      raise "Cannot connect to #{args[:url]} due to #{e}" if retries >= PageObject.default_retries
      sleep(5 * retries)
      retry
    end
  end

  def self.download_and_parse_json(url=nil)
    raise 'Please check the URL' unless url
    uri = URI.parse(url)

    response = Net::HTTP.get_response(uri)

    if response.code == "200" && !response.body.nil?
      JSON.parse(response.body)
    else
      puts "ERROR!!! Cannot download the JSON"
    end
  end

end