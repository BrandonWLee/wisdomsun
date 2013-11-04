ActiveAdmin.register Book do
  index do
    column :picture do |book|
      image_tag(book.picture.url) end column :title
    column :description
    column :purchase_url
    default_actions
  end
    show do |book|
      attributes_table do
        row :title
        row :description
        row :purchase_url
        row :picture do
          image_tag(book.picture.url)
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
    f.inputs "Details" do
      f.input :title
      f.input :author
      f.input :purchase_url
      f.input :description
      f.input :picture
    end
    f.buttons
  end
end
ActiveAdmin.register_page "Test Page" do
  page_action :ex, :method => :post do
    # do stuff here
    redirect_to admin_test_page_path, :notice => "You did stuff!"
  end

  action_item do
    link_to "Do Stuff", admin_test_page_ex_path, :method => :post
  end

  action_item do
    link_to "Fuck Stuff", books_path, :method => :get
  end

  sidebar :help do
    ul do
      li "First Line of Help"
    end
  end

  content do
    para "Hello World"
  end
end
