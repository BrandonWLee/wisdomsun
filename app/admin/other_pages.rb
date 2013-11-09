ActiveAdmin.register OtherPages do
  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :category
      f.input :body, input_html: {class: 'redactor'}
    end
    f.actions
  end

  controller do
  	def create
  		title = params[:other_pages][:title].downcase.tr(" ", "_")
  		params[:other_pages].merge!(:refactored_title => title)
  		create!
  	end
  end
end
