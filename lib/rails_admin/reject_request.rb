# lib/rails_admin/reject_request.rb

module RailsAdmin
  module Config
    module Actions
      class RejectRequest < RailsAdmin::Config::Actions::Base
        # This ensures the action only shows up for Users
        register_instance_option :visible? do
          authorized? && bindings[:object].class == Request
        end
        # We want the action on members, not the Users collection
        register_instance_option :member do
          true
        end
        register_instance_option :link_icon do
          'icon-remove-sign'
        end
        # You may or may not want pjax for your action
        register_instance_option :pjax? do
          false
        end
        register_instance_option :controller do
          Proc.new do
            @object.update(status: "Rejected")
            redirect_to back_or_index
          end
        end
      end
    end
  end
end