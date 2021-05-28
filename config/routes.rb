Rails.application.routes.draw do

  # Routes for the Element type resource:

  # CREATE
  post("/insert_element_type", { :controller => "element_types", :action => "create" })
          
  # READ
  get("/element_types", { :controller => "element_types", :action => "index" })
  
  get("/element_types/:path_id", { :controller => "element_types", :action => "show" })
  
  # UPDATE
  
  post("/modify_element_type/:path_id", { :controller => "element_types", :action => "update" })
  
  # DELETE
  get("/delete_element_type/:path_id", { :controller => "element_types", :action => "destroy" })

  #------------------------------

  # Routes for the Palette safe resource:

  # CREATE
  post("/insert_palette_safe", { :controller => "palette_saves", :action => "create" })
          
  # READ
  get("/palette_saves", { :controller => "palette_saves", :action => "index" })
  
  get("/palette_saves/:path_id", { :controller => "palette_saves", :action => "show" })
  
  # UPDATE
  
  post("/modify_palette_safe/:path_id", { :controller => "palette_saves", :action => "update" })
  
  # DELETE
  get("/delete_palette_safe/:path_id", { :controller => "palette_saves", :action => "destroy" })

  #------------------------------

  # Routes for the Project safe resource:

  # CREATE
  post("/insert_project_safe", { :controller => "project_saves", :action => "create" })
          
  # READ
  get("/project_saves", { :controller => "project_saves", :action => "index" })
  
  get("/project_saves/:path_id", { :controller => "project_saves", :action => "show" })
  
  # UPDATE
  
  post("/modify_project_safe/:path_id", { :controller => "project_saves", :action => "update" })
  
  # DELETE
  get("/delete_project_safe/:path_id", { :controller => "project_saves", :action => "destroy" })

  #------------------------------

  # Routes for the Invitation resource:

  # CREATE
  post("/insert_invitation", { :controller => "invitations", :action => "create" })
          
  # READ
  get("/invitations", { :controller => "invitations", :action => "index" })
  
  get("/invitations/:path_id", { :controller => "invitations", :action => "show" })
  
  # UPDATE
  
  post("/modify_invitation/:path_id", { :controller => "invitations", :action => "update" })
  
  # DELETE
  get("/delete_invitation/:path_id", { :controller => "invitations", :action => "destroy" })

  #------------------------------

  # Routes for the Manufacturer resource:

  # CREATE
  post("/insert_manufacturer", { :controller => "manufacturers", :action => "create" })
          
  # READ
  get("/manufacturers", { :controller => "manufacturers", :action => "index" })
  
  get("/manufacturers/:path_id", { :controller => "manufacturers", :action => "show" })
  
  # UPDATE
  
  post("/modify_manufacturer/:path_id", { :controller => "manufacturers", :action => "update" })
  
  # DELETE
  get("/delete_manufacturer/:path_id", { :controller => "manufacturers", :action => "destroy" })

  #------------------------------

  # Routes for the Material resource:

  # CREATE
  post("/insert_material", { :controller => "materials", :action => "create" })
          
  # READ
  get("/materials", { :controller => "materials", :action => "index" })
  
  get("/materials/:path_id", { :controller => "materials", :action => "show" })
  
  # UPDATE
  
  post("/modify_material/:path_id", { :controller => "materials", :action => "update" })
  
  # DELETE
  get("/delete_material/:path_id", { :controller => "materials", :action => "destroy" })

  #------------------------------

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

  # CREATESPACE&ELEMENTS
  post("/create_space_and_elements", { :controller => "rooms", :action => "create_space_and_elements" })
          
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

  #SHOW USER DETAILS
  get("/user/:user_id", { :controller => "user_authentication", :action => "show" }) 

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
