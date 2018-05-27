class Client::ContactsController < ApplicationController
  def index
    response = Unirest.get("http://localhost:3000/api/contacts")
    @contacts = response.body
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    client_params = {
                    first_name: params[:first_name],
                    middle_name: params[:middle_name],
                    last_name: params[:last_name],
                    email: params[:email]
                    }
    response = Unirest.post(
                          "http://localhost:3000/api/contacts",
                          parameters: client_params
                          )
    render 'create.html.erb'
  end

  def show
    recipe_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/contacts/#{contact_id}")
    @contact = response.body
    render 'show.html.erb'
  end

  def edit
    contact_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/contacts/#{contact_id}")
    @contact = response.body
    render "edit.html.erb"
  end

  def update
    client_params = {
                    first_name: params[:first_name],
                    middle_name: params[:middle_name],
                    last_name: params[:last_name],
                    email: params[:email]
                    }
    response = Unirest.patch(
                            "http://localhost:3000/api/contacts/#{ params [:id] }", parameters:client_params
                            )
    render 'update.html.erb'
  end

  def destroy
    contact_id = params[:id]
    response = Unirest.delete("http://localhost:3000/api/contacts/#{ contact_id }")
    render "destroy.html.erb"  
  end
end
