ActiveAdmin.register Slider do
  index do
    column :name
    column :link
    column :picture do |slider|
      image_tag(slider.picture.url) 
    end 
    default_actions
  end
  show do |slider|
    attributes_table do
      row :name
      row :link
      row :picture do
        image_tag(slider.picture.url)
      end
      row :picture_url do
        slider.picture.url
      end
      row :picture_file_name
      row :picture_content_type
      row :picture_file_size
      row :picture_updated_at
    end
  end
  collection_action :display, :method => :get do
    flash[:notice] = "display action"
    redirect_to sliders_path
  end
  collection_action :test, :method => :get do
    @sliders = Slider.all
    flash[:notice] = "test action"
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
  	f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :name
      f.input :link
      f.input :picture
    end
    f.actions
  end
  controller do
    def edit
      if (not Slider.exists?(params[:id]))
        flash[:notice] = "Slider does not exist"
        redirect_to '/admin/sliders'
        return
      end
      super
    end

    def update
      if (params[:slider][:name].nil? or params[:slider][:name].empty?)
        flash[:notice] = "Cannot have empty name"
        redirect_to '/admin/sliders'
        return
      end
      update!
    end
    def create
      notice = ""
      if (params[:slider][:name].nil? or params[:slider][:name].empty?)
        notice += "Cannot have empty name. "
      end
      if (params[:slider][:link].nil? or params[:slider][:link].empty?)
        notice += "Cannot have empty link. "
      end
      if (params[:slider][:picture].nil? or params[:slider][:picture].empty?)
        notice += "Cannot have empty picture. "
      end
      if notice != ""
        flash[:notice] = notice
        redirect_to '/admin/sliders'
        return
      end
      create!
    end
  end
end

