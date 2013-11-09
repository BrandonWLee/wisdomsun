ActiveAdmin.register OtherPages do
  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :category
      f.input :body, input_html: {class: 'redactor'}
    end
    f.actions
  end
end
