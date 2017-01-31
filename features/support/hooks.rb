include ReportHelper

Before do |scenario|
  @scenario = scenario
  initialize_scenario
end

After do |scenario|
  if scenario.failed?
    begin
      add_failed_logs(scenario)
    rescue Exception => e
      puts "Cannot get the report due to #{e}"
    end
  end
  scenario_teardown
end

def initialize_scenario
  @browser ||= Watir::Browser.new :ff
  @browser.goto('about:blank')
  @browser.cookies.clear
end

def scenario_teardown
  @browser.close
end