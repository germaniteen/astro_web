class AutoDebitPage
  include PageObject

  list_item(:menu, css: '#menu li')
  div(:signup_link, id: 'acmregister')

  def loaded?
    menu_element.visible?
  end

  def click_signup_button
    signup_link_element.click
  end
end