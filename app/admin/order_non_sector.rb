ActiveAdmin.register OrderNonSector do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
  
  permit_params :user_id, :payed, :sector, :sector_id, :price, :exchange_rate, :currency, :akey, :akey_primary, :done, :birthday, :answer
                                                     
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
