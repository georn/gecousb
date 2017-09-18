require 'google/apis/drive_v2'
require 'google/api_client/client_secrets'
class StaticPagesController < ApplicationController
  def home
    # p "=== CREDENTIALS ==="
    # p session[:credentials]
    # p "=== END CREDENTIALS ==="
    # p "=== SESSION ==="
    # p session
    # p "=== END SESSION ==="
    unless session.has_key?(:credentials)
      redirect to('/oauth2callback')
    end
    # p File.read(Rails.root,'config','client_secret.json')
    # client_secret = File.join(Rails.root,'config','client_secret.json')
    # client_opts = JSON.parse(File.read(client_secret))
    client_opts = JSON.parse(session[:credentials])
    # p "==== Client Opts Class ===="
    # p client_opts.class
    # auth_client = Signet::OAuth2::Client.new(client_opts)
    auth_client = Signet::OAuth2::Client.new(client_opts)
    # p "=== Auth Client Class ==="
    # p auth_client.class
    drive = Google::Apis::DriveV2::DriveService.new
    # p "=== Drive Class ==="
    # p drive.class
    # client_secrets = Google::APIClient::ClientSecrets.load(client_secret)
    # p "=== Client Secrets Class ==="
    # p client_secret
    # p client_secret.class
    # p auth_client.methods
    # auth_client = client_secrets.to_authorization
    # p auth_client.class
    # auth_client.update!(
    #   scope: 'https://www.googleapis.com/auth/drive.metadata.readonly',
    #   redirect_uri: url('/')
    # )
    geco_folder = drive.list_files(q: "title = 'GECO'", options: { authorization: auth_client })
    geco_content = drive.list_files(q: "'#{geco_folder.items.first.id}' in parents and mimeType = 'application/vnd.google-apps.folder'", options: { authorization: auth_client })
    p geco_content.items.length
    # p geco_folder
  end

  def about
  end

  def oauth2callback
    p "Passed over OAuth2Callback"
    client_secrets = Google::APIClient::ClientSecrets.load(File.join(Rails.root,'config','client_secret.json'))
    auth_client = client_secrets.to_authorization
    auth_client.update!(
      scope: 'https://www.googleapis.com/auth/drive.metadata.readonly',
      # redirect_uri: url('/oauth2callback')
      redirect_uri: url_for(controller: 'static_pages', action: 'oauth2callback')
    )
    if request['code'] == nil
      p "Request['code'] was NIL"
      auth_uri = auth_client.authorization_uri.to_s
      p auth_uri
      redirect_to(auth_uri)
    else
      p "Request['code'] was not NIL"
      auth_client.code = request['code']
      auth_client.fetch_access_token!
      auth_client.client_secret = nil
      session[:credentials] = auth_client.to_json
      redirect_to('/')
    end
  end
end
