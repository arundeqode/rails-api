ActiveAdmin.register Product do
  permit_params :name, :price

  index do
    selectable_column
    id_column
    column :name 
    column :price
    column :created_at
    actions
  end

  filter :name
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name 
      f.input :price
    end
    f.actions
  end

end
