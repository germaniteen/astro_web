module DataHelper

  def self.get_all_links(html_page)
    hrefs = []
    links = Nokogiri::HTML(html_page).css('a')
    links.each { |link| hrefs << link['href'] }
    hrefs.uniq!.reject! { |item| item.nil? || item == '' || item == '#' }.reject! { |l| l.include? 'astro.com.my' }
    hrefs.find_all { |l| l.match /^\/\// }.each { |l| l.gsub!(/^\/\//, 'http://') }
  end

  def self.all_links_returns_200?(links)
    result = []
    links.each do |link|
      begin
        response = Net::HTTP.get_response(URI.parse(link))
        result << response.code
        puts "#{link} returns #{response.code}"
      rescue Exception => e
        puts "Exception #{e.message} with #{link}"
      end
    end
    result.all? { |r| r.to_s == '200' }
  end
end