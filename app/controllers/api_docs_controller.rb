class ApiDocsController < ApplicationController
  skip_before_filter :login_required

  def index
    load_api_docs
  end

protected

  def load_api_docs
    @api_docs = {}
    %w{
      login
      users
      notebooks
      notes
      note_assets
      comments
      tags sync
      activities
      invitations
      overview
      changelog
    }.each do |section|
      @api_docs[section] = YAML::load(File.open("#{Rails.root}/api/doc/#{section}.yml"))
    end
  end

end
