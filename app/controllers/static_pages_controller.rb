class StaticPagesController < ApplicationController
	def index
		@subscriber = Subscriber.new
	end

	def thank_you
		@name = params[:name]
		@email = params[:email]
		@message = params[:message]
		ActionMailer::Base.mail(:from => @email,
		    :to => 'ashortsleeves@gmail.com',
		    :subject => "A new contact form message from #{@name}",
		    :body => @message).deliver_later
	end
end
