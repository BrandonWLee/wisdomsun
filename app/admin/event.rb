ActiveAdmin.register Event do
  index do
    selectable_column
    column :picture do |event|
      image_tag(event.picture.url(:medium))
    end
    column :name
    column :date
    column :description do |event|
      simple_format(event.description)
    end
    column :location
    column :time
    default_actions
  end
  show do |event|
    attributes_table do
      row :name
      row :date
      row :description
      row :location
      row :picture do
        image_tag(event.picture.url(:medium))
      end
      row :picture_url do
        event.picture.url
      end
      row :picture_file_name
      row :picture_content_type
      row :picture_file_size
      row :picture_updated_at

    end
  end
    
  form do |f|
  	f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :name
      f.input :date
      f.input :description, input_html: {class: 'redactor'}
      f.input :location
      f.input :time
      f.input :picture, :as => :file,
          :hint => f.object.picture.nil? || f.object.picture.url.include?("missing.png") ? f.template.content_tag(:span, "no picture yet") : f.template.image_tag(f.object.picture.url(:thumb))
    end
    f.actions
  end
  controller do
    def edit
      if (not Event.exists?(params[:id]))
        flash[:notice] = "Event does not exist"
        redirect_to '/admin/events'
        return
      end
      super
    end

    def update
      if (params[:event][:name].nil? or params[:event][:name].empty?)
        flash[:notice] = "Cannot have empty name"
        redirect_to '/admin/events'
        return
      end
      update!
    end
    def create
      if (params[:event][:name].nil? or params[:event][:name].empty?)
        flash[:notice] = "Cannot have empty name"
        redirect_to '/admin/events'
        return
      end
      create!
    end
  end
end
