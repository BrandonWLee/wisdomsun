ActiveAdmin.register Album do
  index do
    column :album_cover do |album|
      image_tag(album.album_cover.url) 
    end 
    column :name
    column :description
    column :number_of_photos do |album|
      album.photos.size
    end
    default_actions
  end

  show do |album|
    attributes_table do
      row :name
      row :description
      row :album_cover do
        image_tag(album.album_cover.url)
      end
      row :album_cover_url do
        album.album_cover.url
      end
      row :album_cover_file_name
      row :album_cover_content_type
      row :album_cover_file_size
      row :album_cover_updated_at
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :description
      f.input :album_cover
    end
    f.buttons
  end
end
