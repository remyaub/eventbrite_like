class EventMailer < ApplicationMailer
    default from: 'no-reply@monsite.fr'
 
    def event_email(attendee, event, admin)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
        @attendee = attendee
        @event = event
        @admin = admin
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'http://monsite.fr/login' 
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @admin.email, subject: 'Une nouvelle personne participe à votre Event') 
    end
end
