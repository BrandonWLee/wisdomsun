ActiveAdmin.register Category do
  index do
    selectable_column
    column :name
    column :position 
    column :show_in_menu
    column :refactored_name
    column :other_pages do |category|
      titles = []
      category.other_pages.each do |page|
        titles += [link_to(page.title, main_app.otherPage_path(page))]
      end
      simple_format(titles.join ", ")
    end
    default_actions
  end
  form do |f|
  	f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :position
      f.input :name
      f.input :show_in_menu, :label => "Show in Menu under Others"
    end
    f.actions
  end

  controller do
  	def create
  		name = params[:category][:name].downcase.tr(" ", "_")
  		params[:category].merge!(:refactored_name => name)
  		create!
  	end

    def update
      name = params[:category][:name].downcase.tr(" ", "_")
      params[:category].merge!(:refactored_name => name)
      update!
    end
  end
end
