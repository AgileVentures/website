Given(/^(?:|I )am on the "(.*?)" page$/) do |page|
  case page
    when "Home" then visit root_path('show')
    when "contributors" then visit ("/#{page}")
    when "sign up" then visit new_user_registration_path
    when "sign in" then visit new_user_session_path
    when "about" then visit page_path('About')
  end
end

Then(/^(?:|I )should see "(.*?)"$/) do |string|
  expect(page).to have_content(string)
end

Then /^show me the page$/ do
  save_and_open_page
end

Then(/^(?:|I )should see a navigation bar$/) do
  expect(page).to have_css('div.navbar')
end

And(/^(?:|I )should see navigation links$/) do
  expect(page).to have_css('ul.nav')
end

Then /^(?:|I )should see the "([^\"]*)" link$/ do |link|
  page.should(have_css("a", :text => link))
end

Then /^(?:|I )should not see the "([^\"]*)" link$/ do |link|
  page.should_not(have_css("a", :text => link))
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )fill in "([^"]*)" for "([^"]*)"$/ do |value, field|
  fill_in(field, :with => value)
end