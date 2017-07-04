ActiveAdmin.register Site do
	permit_params :name, contacts_attributes: [ :id, :first_name, :last_name, :phone, :email ]

  # Show
  show do
    attributes_table do
     row  :name
    end

    panel 'Concacts' do
      table_for site.contacts do
        column :first_name
        column :last_name
        column :phone
        column :email
      end
    end
  end

	form do |f|
		f.inputs 'Details' do
			f.input :name
		end

		f.inputs 'Contacts' do
			f.has_many :contacts do |c|
				c.input :first_name
				c.input :last_name
				c.input :phone
				c.input :email
			end
		end
		
		f.actions
	end
end
