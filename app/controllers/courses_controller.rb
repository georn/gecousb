require 'google/apis/drive_v2'
require 'google/api_client/client_secrets'

class CoursesController < ApplicationController

  def index
    redirect_to('/oauth2callback') unless session.key?(:credentials)
    client_opts = JSON.parse(session[:credentials])
    auth_client = Signet::OAuth2::Client.new(client_opts)
    drive = Google::Apis::DriveV2::DriveService.new
    geco_folder = drive.list_files(q: "title = 'GECO'", options: { authorization: auth_client })
    @geco_content = drive.list_files(q: "'#{geco_folder.items.first.id}' in parents and mimeType = 'application/vnd.google-apps.folder'", options: { authorization: auth_client })
  end

  def show
  end

  def oauth2callback
    client_secrets = Google::APIClient::ClientSecrets.load(File.join(Rails.root, 'config', 'client_secret.json'))
    auth_client = client_secrets.to_authorization
    auth_client.update!(
      scope: 'https://www.googleapis.com/auth/drive.metadata.readonly',
      redirect_uri: url_for(controller: 'courses', action: 'oauth2callback'),
      # additional_parameters: { 'include_granted_scopes': true }
    )
    if request['code'] == nil
      auth_uri = auth_client.authorization_uri.to_s
      redirect_to(auth_uri)
    else
      auth_client.code = request['code']
      auth_client.fetch_access_token!
      auth_client.client_secret = nil
      session[:credentials] = auth_client.to_json
      redirect_to('/courses')
    end
  end
end
