class GroupsController < ApplicationController

	def index
    	@groups = Group.paginate(page: params[:page])
    	@new_group = Group.new
  	end

  	def new
  		@group = Group.new
  		@origin_address = Address.new
  		@destination_address = Address.new
  	end

  	def create
	    @group = Group.new(params[:group])
	    #@group.users.build(current_user)
	   	
	   	@origin_address = Address.create(params[:origin_address])
		@destination_address = Address.create(params[:destination_address])

	    @group.origin_address_id = @origin_address.id
	    @group.destination_address_id = @destination_address.id

	    if @group.save
	      flash[:success] = "Awesome, your a group owner!"
	      redirect_to @group
	    else
	      render "new"      
	    end
  	end

  	def show
   		@group = Group.find(params[:id])
 		@origin_address = Address.find(@group.origin_address_id)
  		@destination_address = Address.find(@group.destination_address_id)
  	end
end
