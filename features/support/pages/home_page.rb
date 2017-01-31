class HomePage
  include PageObject

  HOMEPAGE_URL ||= Fixtures['urls.base']

  text_field(:search_field, id: 'landingsearch_input')
  image(:continue, id: 'continue')
  list_items(:slide_banner, css: '#highlights div ul li')
  link(:next_on_slide_banner, class: 'flex-next')

  page_url(HOMEPAGE_URL)

  def loaded?
    search_field_element.visible?
  end

  def skip_ad
    continue_element.click if continue_element.visible?
  end

  def get_slide_banner_index(campaign_name)
    slide_banner_elements.index {|item| item.text.downcase.include? campaign_name }
  end

  def click_slide_banner(index)
    (index - 1).times do
      next_on_slide_banner
    end
    slide_banner_elements[index].div_element.click
  end

  def number_available_campaigns
    slide_banner_elements.count
  end

end
