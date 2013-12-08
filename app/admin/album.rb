ActiveAdmin.register Album do
  index do
    column :album_cover do |album|
      image_tag(album.album_cover.url(:small)) 
    end 
    column :name
    column :description do |album|
      simple_format(album.description)
    end
    column :number_of_photos do |album|
      album.photos.size
    end
    actions do |album|
      link_to "View", admin_album_path(album)
      link_to "Edit", edit_admin_album_path(album)
      link_to "Delete", admin_album_path(album), :method => :delete
      link_to "Delete with Photos", destroy_photos_admin_album_path(album), :method => :delete
    end
  end

  show do |album|
    attributes_table do
      row :name
      row :description
      row :album_cover do
        image_tag(album.album_cover.url(:medium))
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
      f.input :album_cover, :as => :file, 
          :hint => f.object.album_cover.nil? || f.object.album_cover.url.include?("missing.png") ? f.template.content_tag(:span, "no album cover yet") :  f.template.image_tag(f.object.album_cover.url(:medium))
    end
    f.actions
  end

  member_action :destroy_photos, :method => :delete do 
    album = Album.find_by_id(params[:id])
    Photo.destroy_in_album(album.id)
    album.destroy
    redirect_to admin_albums_path
  end

end
