ActiveAdmin.register Quote do
  form do |f|
  	f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :quote
      f.input :source
    end
    f.actions
  end

end
