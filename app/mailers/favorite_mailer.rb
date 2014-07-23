
class FavoriteMailer < ActionMailer::Base
  default from: "theqwapper@gmail.com"

  def new_comment(user, post, comment)
    @user = user
    @post = post
    @comment = comment

    # New Headers
    headers["Message-ID"] = "<comments/#{@comment.id}@qwapper.com>"
    headers["In-Reply-To"] = "<post/#{@post.id}@qwapper.com>"
    headers["References"] = "<post/#{@post.id}@qwapper.com>"

    mail(to: user.email, subject: "New comment on #{post.body}")
  end
  
end
