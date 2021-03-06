ActiveAdmin.register OtherPage do
  index do
    selectable_column
    column :category
    column :body do |other_page|
      simple_format(strip_tags(other_page.body))
    end
    column :title
    column :refactored_title
    default_actions
  end
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
  		title = params[:other_page][:title].downcase.tr(" ", "_")
  		params[:other_page].merge!(:refactored_title => title)
  		create!
  	end

    def update
      title = params[:other_page][:title].downcase.tr(" ", "_")
      params[:other_page].merge!(:refactored_title => title)
      update!
    end
  end
end
