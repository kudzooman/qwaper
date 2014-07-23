class FollowMailer < ActionMailer::Base
  default from: "theqwapper@gmail.com"

  def new_post(user, post)
    @user = user
    @post = post

    # New Headers
    headers["Message-ID"] = "<user/#{@user.id}@qwapper.com>"
    headers["References"] = "<post/#{@post.id}@qwapper.com>"

    mail(to: user.email, subject: "New qwap by #{user.name}")
  end

end
  