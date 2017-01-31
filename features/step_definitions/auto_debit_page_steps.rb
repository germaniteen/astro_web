When(/^I click register button on auto debit page$/) do
  on(AutoDebitPage).wait_until { @current_page.loaded? }
  on(AutoDebitPage).click_signup_button
end