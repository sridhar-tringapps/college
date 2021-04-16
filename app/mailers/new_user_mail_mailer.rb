class NewUserMailMailer < ApplicationMailer

   def new_comment(user)
    @user = user
    mail to: @user.email, subject: "welcome to my site", from: "sridharsnkl@gmail.com"
   end
   

end
