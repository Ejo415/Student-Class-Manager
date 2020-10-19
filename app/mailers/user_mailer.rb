class UserMailer < ApplicationMailer
    def reminder(user)
        @user = user
        #byebug
        mail(to: user.email, subject: 'Scheduled Class Reminder')
      end
end
