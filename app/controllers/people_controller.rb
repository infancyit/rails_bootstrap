class PeopleController < ApplicationController
  def index
    @person = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
     if @person.save
    #   #redirect_to '/people'
       redirect_to :action => 'show', :id => @person.id
     else
      render :action => 'new'
     end
  end


  def person_params
    params.require(:person).permit(:first_name, :last_name, :email, :country_id, :state_id)
  end


  def show
    @person = Person.find(params[:id])
  end


  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if
      @person.update_attributes(person_params)
      redirect_to :action => 'show', :id => @person.id
    else
      render :action => :edit
    end
  end


  def destroy
    @person = Person.find params[:id]
    @person.destroy
    redirect_to people_path
  end


  def proceed
    @person = Person.find(params[:id])
    UserMailer.welcome_email(@person).deliver
    #render :json => @person.email
    redirect_to :action => 'show', :id => @person.id
  end


end
