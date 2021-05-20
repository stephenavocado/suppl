Rails.application.routes.draw do

  # Routes for the Element resource:

  # CREATE
  post("/insert_element", { :controller => "elements", :action => "create" })
          
  # READ
  get("/elements", { :controller => "elements", :action => "index" })
  
  get("/elements/:path_id", { :controller => "elements", :action => "show" })
  
  # UPDATE
  
  post("/modify_element/:path_id", { :controller => "elements", :action => "update" })
  
  # DELETE
  get("/delete_element/:path_id", { :controller => "elements", :action => "destroy" })

  #------------------------------

  # Routes for the Palette resource:

  # CREATE
  post("/insert_palette", { :controller => "palettes", :action => "create" })
          
  # READ
  get("/palettes", { :controller => "palettes", :action => "index" })
  
  get("/palettes/:path_id", { :controller => "palettes", :action => "show" })
  
  # UPDATE
  
  post("/modify_palette/:path_id", { :controller => "palettes", :action => "update" })
  
  # DELETE
  get("/delete_palette/:path_id", { :controller => "palettes", :action => "destroy" })

  #------------------------------

  # Routes for the Room resource:

  # CREATE
  post("/insert_room", { :controller => "rooms", :action => "create" })
          
  # READ
  get("/rooms", { :controller => "rooms", :action => "index" })
  
  get("/rooms/:path_id", { :controller => "rooms", :action => "show" })
  
  # UPDATE
  
  post("/modify_room/:path_id", { :controller => "rooms", :action => "update" })
  
  # DELETE
  get("/delete_room/:path_id", { :controller => "rooms", :action => "destroy" })

  #------------------------------

  # Routes for the Project resource:

  # CREATE
  post("/insert_project", { :controller => "projects", :action => "create" })
          
  # READ
  get("/projects", { :controller => "projects", :action => "index" })
  
  get("/projects/:an_id", { :controller => "projects", :action => "show" })
  
  # UPDATE
  
  post("/modify_project/:path_id", { :controller => "projects", :action => "update" })
  
  # DELETE
  get("/delete_project/:path_id", { :controller => "projects", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })    

  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })  

  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  get("/", { :controller => "search", :action => "search"})

end
