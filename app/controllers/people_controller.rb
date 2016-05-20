class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to people_path, notice: "#{@person} has been sucessfully created."
    else
      render new
    end
  end

  def edit
    @person = Person.find(parms[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(person_params)
      redirect_to people_path, notice: "#{@person} has been updated successfully"
    else
      render edit
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name)
  end
end
