ActiveAdmin.register Category do
  form do |f|
    f.inputs "Details" do
      f.input :position
      f.input :name
    end
    f.actions
  end
end
