class Admin::InstructorController < ApplicationController
    def instructor
         if current_user = user.instructor(true)
    end
end