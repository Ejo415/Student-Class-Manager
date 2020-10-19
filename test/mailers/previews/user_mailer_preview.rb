# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def reminder
        UserMailer.with(user: User.find_by_id(3)).reminder(User.find_by_id(3))
      end
end
