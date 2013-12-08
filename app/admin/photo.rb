ActiveAdmin.register Photo do
  index do
    selectable_column
    column :picture do |photo|
      image_tag(photo.picture.url(:small)) 
    end 
    column :description
    column :album_name do  |photo|
      if photo.album != nil
        link_to photo.album.name, admin_album_path(photo.album)
      else
        "Not in an album"
      end
    end
    default_actions
  end

  show do |photo|
    attributes_table do
      row :description
      row :picture do
        image_tag(photo.picture.url(:medium))
      end
      row :album
      row :picture_url do
        photo.picture.url
      end
      row :picture_file_name
      row :picture_content_type
      row :picture_file_size
      row :picture_updated_at
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :album, :as => :select, :label_method => :name
#      f.actions do 
#        link_to "New Album", new_admin_album_path, :style => "padding-left: 10px "
#      end
      f.input :picture, :as => :file, 
          :hint => f.object.picture.nil? || f.object.picture.url.include?("missing.png") ? f.template.content_tag(:span, "no picture yet") :  f.template.image_tag(f.object.picture.url(:medium))
      f.input :description
    end
    f.actions
  end


end
