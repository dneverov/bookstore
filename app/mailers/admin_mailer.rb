class AdminMailer < ApplicationMailer
  default to: ENV['MY_RECEIVER_EMAIL']

  def sendinblue_client
    @sendinblue_client ||= SibApiV3Sdk::SMTPApi.new
  end

  def new_user(user)
    @user = user
    mail(subject: "New User #{user.email}")
  end

  def new_book(book)
    template_id = 1
    book_name = book.name

    send_smtp_email = SibApiV3Sdk::SendSmtpEmail.new

    send_smtp_email = {
      'to'=>[{
        'email'=>ENV['SENDINBLUE_USER_NAME'],
        'name'=>'John Doe'
      }],
      'templateId'=>template_id,
      'params'=> {
        'name'=>'Greetings',
        'book_name'=>book_name
      },
      'headers'=> {
        'X-Mailin-custom'=>'custom_header_1:custom_value_1|custom_header_2:custom_value_2'
      }
    };

    # sendinblue_client
    begin
      #Send a transactional email
      result = sendinblue_client.send_transac_email(send_smtp_email)
      p result
    rescue SibApiV3Sdk::ApiError => e
      puts "Exception when calling SMTPApi->send_transac_email: #{e}"
    end

  end
end
