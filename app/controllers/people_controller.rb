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
       flash.now[:notice] = "Successfully Created and Waiting for Next Action"
       redirect_to :action => 'show', :id => @person.id
     else
       flash.now[:error] = "Something Went Wrong"
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
    if @person.update_attributes(person_params)
      flash.now[:notice] = "Successfully Updated"
      redirect_to :action => 'show', :id => @person.id
    else
      flash.now[:error] = "Something Went Wrong"
      render :action => :edit
    end
  end


  def destroy
    @person = Person.find params[:id]
    @person.destroy
    flash.now[:success] = "Successfully Deleted"
    redirect_to people_path
  end


  def proceed
    @person = Person.find(params[:id])
     @message = UserMailer.welcome_email(@person)
     if @message.deliver
       flash.now[:notice] = "Mail Sent to User"
       render 'message'
     else
       flash.now[:alert] = "Something Went Wrong"
       render 'message'
     end
  end




end
