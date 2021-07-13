ActiveAdmin.register Answer do
  includes :contact
  
  permit_params :contact_id, :content
  
  controller do
    def create 
      @answer = Answer.new(permitted_params[:answer])
      if @answer.save!
        AnswerMailer.send_mail(@answer).deliver_now
        redirect_to manage_answers_path
      else
        render :new
      end
    end
  end
end
