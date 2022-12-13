class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @usergroups = Usergroup.where(user_id: current_user)
    @groups = []
    @usergroups.each do |usergroup|
      @groups << usergroup.group
    end
  end
end
