ActiveAdmin.register Event do
  index do
    selectable_column
    column :name
    column :date
    column :description do |event|
      simple_format(event.description)
    end
    column :location
    column :time
    default_actions
  end
    
  form do |f|
  	f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :name
      f.input :date
      f.input :description, input_html: {class: 'redactor'}
      f.input :location
      f.input :time
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
