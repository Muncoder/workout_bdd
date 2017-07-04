ActiveAdmin.register Contact do
	permit_params :first_name, :last_name, :phone, :email, :site_id
end
