# Decorator Template

A simple template of a Decorator for an ActiveRecord object.  Decorators are a great way to prevent your models from becoming bloated with callbacks.

Example usage in a controller:

	class SomeController < ApplicationController
	    respond_to :json

	    def create
	        @user = UserCreator.new(params)

	        if @user.save
	            render :json => @user
	        else
	            render :json => @user.errors
	        end
	    end
	end