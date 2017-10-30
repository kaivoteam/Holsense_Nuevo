# lib/rails_admin/review_request.rb

module RailsAdmin
  module Config
    module Actions
      class ReviewRequest < RailsAdmin::Config::Actions::Base
        # This ensures the action only shows up for Users
        register_instance_option :visible? do
          authorized? && bindings[:object].class == Request
        end
        # We want the action on members, not the Users collection
        register_instance_option :member do
          true
        end
        register_instance_option :link_icon do
          'icon-ok'
        end
        # You may or may not want pjax for your action
        register_instance_option :pjax? do
          false
        end
        register_instance_option :controller do
          Proc.new do
            subject = @object.section.subject.name
            school = @object.user.school.name
            posible_user = subject + " " + school
            user = User.find_by(nickname: posible_user)

            school.downcase!.delete(' ')

            if user.nil?
              #crear
              
            else
              @object.update(status: "Accepted", teacher_role_id: user.id, utp_role_id: @object.user_id)
            end

            redirect_to back_or_index
          end
        end
      end
    end
  end
end