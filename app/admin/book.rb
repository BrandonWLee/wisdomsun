ActiveAdmin.register Book do
  collection_action :display, :method => :get do
    flash[:notice] = "display action"
    redirect_to books_path
  end

  collection_action :test, :method => :get do
    @books = Book.all
    flash[:notice] = "test action"
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
