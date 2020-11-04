Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })
  
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:path_id", { :controller => "photos", :action => "show" })

  get("/delete_photo/:path_id", { :controller => "photos", :action => "remove" })
  get("/add_photo", { :controller => "photos", :action => "add"})
  get("/update_photo/:update_id", { :controller => "photos", :action => "update" })

  get("/insert_comment_record", { :controller => "comments", :action => "add" })
end
