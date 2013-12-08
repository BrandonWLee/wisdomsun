ActiveAdmin.register Quote do
  index do
    selectable_column
    column :quote
    column :source
    default_actions
  end
  form do |f|
  	f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :quote
      f.input :source
    end
    f.actions
  end
  controller do
    def edit
      if (not Quote.exists?(params[:id]))
        flash[:notice] = "Quote does not exist"
        redirect_to '/admin/quotes'
        return
      end
      super
    end
  end

end
