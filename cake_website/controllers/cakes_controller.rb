class CakesController < Sinatra::Base
	
  set :root, File.join(File.dirname(__FILE__), '..')
	set :views, Proc.new { File.join(root, "views") } 

  configure :development do
      register Sinatra::Reloader
      set :public, "public"
  end

  # Database

  $cakes = [{
     id: 0,
     name: "Red Velvet",
     type: "Cupcake",
     image: "/red_velvet.jpg",
     icing_text: "",
     icing_flavour: ""
  },
  {
    id: 1,
    name: "Oreo Cookie",
    type: "Cheesecake",
    image: "/oreo_cheesecake.jpg",
    icing_text: "",
    icing_flavour: ""
  },
  {
    id: 2,
    name: "Lemon Drizzle",
    type: "Traditional",
    image: "/lemon_drizzle.jpg",
    icing_text: "",
    icing_flavour: ""
  }]

  #Index
  get "/cakes" do
  	@title = "Cake Site"
  	@cakes = $cakes
  	erb :"cakes/index"

	end

	#New
	get "/cakes/new" do
		erb :"cakes/new"
		
	end

	#Show
	get "/cakes/:id" do
		id = params[:id].to_i
    @cake = $cakes[id]
    erb :"cakes/show"
	end

	#Create
	post "/cakes" do
		id = params[:id].to_i
    @cake = $cakes[id]
	 	"Cake ordered."
	end

	#Delete
	delete "/cakes/:id" do
		"404 not found"
	end

	#Update
	put "cakes/:id" do

	end

	#Edit
	get "/cakes/:id/edit" do
		id = params[:id].to_i
    @cake = $cakes[id]
		erb :"cakes/edit"
	end

end