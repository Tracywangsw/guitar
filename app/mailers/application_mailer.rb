class ApplicationMailer < ActionMailer::Base
  default from: "lemonstudio@aliyun.com"
  default charset: 'utf-8'
  layout 'mailer'
end
