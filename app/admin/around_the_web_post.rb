ActiveAdmin.register AroundTheWebPost do
  form do |f|
  	f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :title
      f.input :external_link
      f.input :commentary
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
  end

end