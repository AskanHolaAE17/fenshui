class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  
  helper_method :akey
  
  
  
  def akey(*m)
    #key_int = 3.times.map{rand(1..99)}
    #key_str = 3.times.map{('a'..'z').to_a[rand(26)]}
    #key_int.concat(key_str)
    #key_int.shuffle!
    #key_int.shuffle!    
    #key_int.join  
        
	  m = m[0] ? m[0] : false 
	  n = m || 2 
	  time = Time.now.sec
	
  	key_secret = if time % 2 == 0
	      n.times.map{rand(1..99)}
      else
        n.times.map{('a'..'z').to_a[rand(26)]}	
      end	
	
	
    key_int = n.times.map{rand(1..99)}
    key_str_low = n.times.map{('a'..'z').to_a[rand(26)]}
    key_str_up = n.times.map{('A'..'Z').to_a[rand(26)]}
    key_int.concat(key_str_low)
    key_int.concat(key_str_up)
    key_int.shuffle!
    key_int.shuffle!    
    
    key_int.concat(key_secret)
    key_int.shuffle!    
      
    
    len = key_int.length
    
    ins_pos = if time % 3 == 0
      len/2 	
    elsif time % 2 == 0
      len-3
    else
      len/3	
    end	
    
    key_int.insert(ins_pos, '_')
    key_int.join
  end   

  
end
