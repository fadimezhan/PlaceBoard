class CommentMailer < ApplicationMailer

  def new_comment(place)
    @place = place

    mail to: @place.owner.email,
        subject: 'You have a comment'
  end
end
