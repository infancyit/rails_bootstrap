class PeopleController < ApplicationController
  def index
    @person = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    # render :json => @person
    if @person.email == @person.email_confirm
      #render :json => @person
      if @person.save
        flash.now[:notice] = "Successfully Created and Waiting for Next Action"
        redirect_to :action => 'show', :id => @person.id
      else
        flash.now[:danger] = "Something Went Wrong"
        render :action => 'new'
      end
    else
      flash.now[:danger] = "Email not matched"
      render :action => :new
    end
  end


  def person_params
    params.require(:person).permit(:first_name, :last_name, :email, :country_id, :state_id, :email_confirm)
  end


  def show
    @person = Person.find(params[:id])
  end


  def edit
    @person = Person.find(params[:id])
  end



  def update
    @person = Person.find(params[:id])
    if person_params['email'] == person_params['email_confirm']
      if @person.update_attributes(person_params)
        flash.now[:notice] = "Successfully Updated"
        redirect_to :action => 'show', :id => @person.id
      else
        flash.now[:danger] = "Something Went Wrong"
        render :action => :edit
      end
    else
      flash.now[:danger] = "Email not matched"
      render :action => :edit
    end
  end


  def destroy
    @person = Person.find params[:id]
    @person.destroy
    flash.now[:notice] = "Successfully Deleted"
    render :action => :index
  end


  def proceed
    @person = Person.find(params[:id])
     if UserMailer.welcome_email(@person).deliver_later
       flash.now[:notice] = "Congrats, Mail sent successfully!!"
       render 'message'
     else
       flash.now[:danger] = "Something Went Wrong!"
       render 'message'
     end
  end




end
