class TodoListsController < ApplicationController

	def index
		@todo_lists = TodoList.all
		@todo_list = TodoList.new
	end

	def create
		@todo_list = TodoList.new(params[:todo_list])
		# @todo_list.items.build(params[:todo_list][:items])
		@todo_list.save!
		# if @todo_list.save
		# 	redirect_to todo_lists_url
		# else
		# 	render :new
		# end

		respond_to do |format|
			format.html { render :index }
			format.json { render :json => @todo_list }
		end
	end

	def new
		@todo_list = TodoList.new
	end

	def destroy
		@todo_list = TodoList.find(params[:id])
		@todo_list.destroy

		render :text => "yay!"
	end
end
