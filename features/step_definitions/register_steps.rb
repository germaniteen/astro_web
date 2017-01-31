When(/^I register new user on the register page$/) do
  on(RegisterPage).wait_until { @current_page.loaded? }
  on(RegisterPage).register
end

Then(/^new user is registered successfully on the register page$/) do
  on(RegisterPage).wait_until { @current_page.has_successful_register? }
  expect(on(RegisterPage)).to have_successful_register
end