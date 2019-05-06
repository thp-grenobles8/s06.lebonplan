class UserMailer < ApplicationMailer
  default from: 'no-reply@zebonplan.fr'

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://zebonplan.herokuapp.com/login'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def attendance_email(attendance)
    @attendance = attendance
    @user = @attendance.attendee
    @url = 'http://zebonplan.herokuapp.com/login'
    mail(
      to: @user.email,
      subject: "Tu as rejoins l'évenement #{
        @attendance.event.title
      } !")
  end
end
