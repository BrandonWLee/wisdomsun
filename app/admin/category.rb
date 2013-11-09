ActiveAdmin.register Category do
  form do |f|
    f.inputs "Details" do
      f.input :position
      f.input :name
    end
    f.actions
  end

  controller do
  	def create
  		name = params[:category][:name].downcase.tr(" ", "_")
  		params[:category].merge!(:refactored_name => name)
  		create!
  	end
  end
end
