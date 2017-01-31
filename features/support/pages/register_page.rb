class RegisterPage
  include PageObject

  DEFAULT_DATA ||= {first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    id: Faker::Number.hexadecimal(5).to_s + Faker::Name.first_name,
                    email: Faker::Name.first_name.downcase + '@mailinator.com',
                    password: Faker::Number.hexadecimal(10)}

  text_field(:first_name, class: 'txtfirstname')
  text_field(:last_name, class: 'txtlastname')
  text_field(:id, class: 'txtastroid')
  text_field(:email, class: 'txtemail')
  text_field(:password, class: 'txtpassword')
  button(:submit, id: 'btnSubmit')
  span(:message, id: 'body_lblResultMsg')

  def loaded?
    first_name_element.visible?
  end

  def register(data={})
    data = DEFAULT_DATA.merge(data)
    self.first_name = data.fetch(:first_name)
    self.last_name = data.fetch(:last_name)
    self.id = data.fetch(:id)
    self.email = data.fetch(:email)
    self.password = data.fetch(:password)
    puts "#{data.fetch(:email)} / #{data.fetch(:password)}"
    submit
  end

  def has_successful_register?
    message_element.text.downcase.include? 'congratulations'
  end
end