ActiveAdmin.register User do
  form :html => { :enctype => "multipart/form-data" } do |f|
  	f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :admin
      f.input :forem_admin
      f.input :forem_state
      f.input :forem_auto_subscribe
    end
    f.actions
  end
  show do |user|
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row :admin
      row :forem_admin
      row :forem_state
      row :sign_in_count
      row :forem_auto_subscribe
      row :last_sign_in_at
      row :last_sign_in_ip
      row :current_sign_in_at
      row :current_sign_in_ip
      row :created_at
      row :updated_at
      row :confirmed_at
      row :remember_me
    end
  end
  index do
    selectable_column
    column :email
    column :first_name
    column :last_name
    column :admin
    column :forem_admin
    column :forem_state
    column :created_at
    column :sign_in_count
    default_actions
  end

end
