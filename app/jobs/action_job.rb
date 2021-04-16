class ActionJob < ApplicationJob
  queue_as :default

  def perform(user)
    NewUserMailMailer.new_comment(user).deliver
  end
end
