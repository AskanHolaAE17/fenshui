class AddInfoToSectors < ActiveRecord::Migration

  
  
  Sector.create sector: 'Семья', description: 'Такi стосовно сiм`i. Варто б зробити от що...'
  
  Sector.create sector: 'Здоровье', description: 'Такi стосовно здоров`я. Варто б зробити от що...'
  
  Sector.create sector: 'Известность', description: 'Такi стосовно вiдомостi. Варто б зробити от що...'
  
  Sector.create sector: 'Богатство', description: 'Такi стосовно грошей. Варто б зробити от що...'
  
  Sector.create sector: '...', description: 'Такi стосовно вiчностi. Варто б зробити от що...'



end

