ActiveAdmin.register OtherPage do
  form do |f|
  	f.semantic_errors *f.object.errors.keys
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

    def update
      title = params[:other_pages][:title].downcase.tr(" ", "_")
      params[:other_pages].merge!(:refactored_title => title)
      update!
    end
  end
end
