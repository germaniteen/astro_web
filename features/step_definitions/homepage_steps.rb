When(/^I visit the (.*)$/) do |page|
  visit_page_and_count_time(page)
end

When(/^I skip the ad page$/) do
  on(HomePage).skip_ad
end

When(/^I get all links on home page$/) do
  @hrefs = DataHelper.get_all_links(@browser.html)
end

When(/^I get the index of Auto-debit campain on home page$/) do
  @campaign_index = on(HomePage).get_slide_banner_index('auto-debit')
end

When(/^I click the Auto-Debit campaign$/) do
  on(HomePage).click_slide_banner(@campaign_index)
end

When(/^I have number of available campaigns$/) do
  @number_available_campaigns = on(HomePage).number_available_campaigns
end

Then(/^the page loads within 0.1 second$/) do
  on(HomePage).wait_until { @current_page.loaded? }
  expect(on(HomePage)).to be_loaded
  expect($total_time == 0.1).to be true
end

Then(/^the page loads within 5 seconds$/) do
  on(HomePage).wait_until { @current_page.loaded? }
  expect(on(HomePage)).to be_loaded
  expect($total_time == 5).to be true
end

Then(/^the page loads successfully$/) do
  on(HomePage).wait_until { @current_page.loaded? }
  expect(on(HomePage)).to be_loaded
end

Then(/^all links returns 200 HTTPOK$/) do
  expect(DataHelper.all_links_returns_200?(@hrefs)).to be true
end

Then(/^Auto-Debit campaign should not more than the third$/) do
  expect(@campaign_index <= 2).to be true
end

Then(/^Auto-Debit campaign should not in the last number of available campaigns$/) do
  expect(@campaign_index + 1 < @number_available_campaigns).to be true
end


