ActiveAdmin.register Event do
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :date
      f.input :description, input_html: {class: 'redactor'}
      f.input :location
      f.input :time
    end
    f.actions
  end
end
