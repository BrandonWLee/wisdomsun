ActiveAdmin.register Book do
  index do
    selectable_column
    column :picture do |book|
      image_tag(book.picture.url(:medium)) 
    end 
    column :title
    column :description do |book|
      simple_format(book.description)
    end
    column :purchase_url
    default_actions
  end
  show do |book|
    attributes_table do
      row :title
      row :description
      row :purchase_url
      row :picture do
        image_tag(book.picture.url(:medium))
      end
      row :picture_url do
        book.picture.url
      end
      row :picture_file_name
      row :picture_content_type
      row :picture_file_size
      row :picture_updated_at

    end
  end

  collection_action :display, :method => :get do
    flash[:notice] = "display action"
    redirect_to books_path
  end

  collection_action :test, :method => :get do
    @books = Book.all
    flash[:notice] = "test action"
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
  	f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :title
      f.input :author
      f.input :purchase_url
      f.input :description
      f.input :picture, :as => :file, 
          :hint => f.object.picture.nil? || f.object.picture.url.include?("missing.png") ? f.template.content_tag(:span, "no picture yet") :  f.template.image_tag(f.object.picture.url(:medium))
    end
    f.actions
  end
  controller do
    def edit
      if (not Book.exists?(params[:id]))
        flash[:notice] = "Book does not exist"
        redirect_to '/admin/books'
        return
      end
      super
    end

    def update
      if (params[:book][:title].nil? or params[:book][:title].empty?)
        flash[:notice] = "Cannot have empty title"
        redirect_to '/admin/books'
        return
      end
      update!
    end
    def create
      if (params[:book][:title].nil? or params[:book][:title].empty?)
        flash[:notice] = "Cannot have empty title"
        redirect_to '/admin/books'
        return
      end
      create!
    end
  end
end
#ActiveAdmin.register_page "Test Page" do
#  page_action :ex, :method => :post do
#    # do stuff here
#    redirect_to admin_test_page_path, :notice => "You did stuff!"
#  end
#
#  action_item do
#    link_to "Do Stuff", admin_test_page_ex_path, :method => :post
#  end
#
#  action_item do
#    link_to "Fuck Stuff", books_path, :method => :get
#  end
#
#  sidebar :help do
#    ul do
#      li "First Line of Help"
#    end
#  end
#
#  content do
#    para "Hello World"
#  end
#end
