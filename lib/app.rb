require 'grape'

class FileReceiver < Grape::API
  FILES_DIR = 'files'.freeze

  params do
    requires :file, type: File
  end
  post '/upload' do
    FileUtils.mkdir_p(FILES_DIR) unless File.exist?(FILES_DIR)

    File.open("#{FILES_DIR}/sample.mp3", 'wb') do |f|
      f.write(params[:file][:tempfile].read)
    end
  end
end