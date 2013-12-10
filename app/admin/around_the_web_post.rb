ActiveAdmin.register AroundTheWebPost do
  index do
    selectable_column
    column :title
    column :external_link
    column :commentary
    default_actions
  end
  form do |f|
  	f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :title
      f.input :external_link
      f.input :commentary, input_html: {class: 'redactor'}
    end
    f.actions
  end

  controller do
    def create
      external_link = params[:around_the_web_post][:external_link].strip
      if not (external_link.start_with? "http://" or external_link.start_with? "https://")
        external_link = "http://" + external_link
        params[:around_the_web_post][:external_link] = external_link
      end
  		create!
    end
    def update
      external_link = params[:around_the_web_post][:external_link].strip
      if not (external_link.start_with? "http://" or external_link.start_with? "https://")
        external_link = "http://" + external_link
        params[:around_the_web_post][:external_link] = external_link
      end
      update!
    end
    def edit
      if (not AroundTheWebPost.exists?(params[:id]))
        flash[:notice] = "Around The Web Post does not exist"
        redirect_to '/admin/around_the_web_posts'
        return
      end
      super
    end
  end
end
