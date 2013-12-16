Forem::Admin::MembersController.class_eval do
  def add_with_username
    user = Forem.user_class.where(:email => params[:email]).first
    if user
      params[:user_id] = user
      add
    else
      flash[:alert] = "#{params[:email]} does not exist"
      redirect_to [:admin, group]
    end
  end
end
