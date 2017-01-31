module ReportHelper

  def generate_report_path(scenario_title)
    time = Time.now.strftime('%Y_%m_%d_%Y_%H_%M_%S')
    FileUtils::mkdir_p("failuretracker/#{time}")
    path = "#{Dir.pwd}/failuretracker/#{time}/FAILED_#{scenario_title.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}"
    {
        screenshot_path: "#{path}.png",
        info_file_path:  "#{path}.txt",
        html_path:       "#{path}.html",
    }
  end

  def write_html_file(html_file_path)
    File.write(html_file_path, @browser.html)
  end

  def write_info_file(info_file_path)
    File.write(info_file_path, "URL: #{@browser.url}\nReadyState: #{@browser.ready_state}")
  end

  def take_failed_step_screenshot(screenshot_file_path)
    @browser.screenshot.save(screenshot_file_path)
    screenshot_file_path
  end

  def add_failed_logs(scenario)
    scenario_title = scenario.name.downcase
    file_path      = generate_report_path(scenario_title)
    write_html_file(file_path[:html_path])
    write_info_file(file_path[:info_file_path])
    take_failed_step_screenshot(file_path[:screenshot_path])
  end
end