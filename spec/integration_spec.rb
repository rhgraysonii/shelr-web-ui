require './lib/shelr'
require './lib/wrapper'

require 'sinatra'
require 'rack/test'
require 'pry'

set :environment, :test


describe "our wrapper" do
  subject { Shelr.wrapper }

  describe "#play_last" do
    it "can play the last session" do
      io = subject.play_last
      binding.pry
    end
  end

  describe "#help" do
    it "can open shelr help" do
      expected = %Q(
  Usage: shelr command [arg]

  COMMANDS:

    Recording:

      record              - record new shellcast
      record --sound      - record new shellcast with sound

    Publishing:

      push last           - publish last record
      push last --private - publish private record
      push RECORD_ID      - publish record with given id

    Getting record as json:

      dump last           - dump last record as json to current dir
      dump RECORD_ID      - dump any record as json to current dir

    Replaying:

      list                - print list of records
      play last           - play last local record
      play RECORD_ID      - play local record
      play RECORD_URL     - play remote record
      play dump.json      - play local file dumped with `shelr dump`

    Setup:

      setup API_KEY [API_URL] - set your API key and API site
      backend [ttyrec|script] - setup recorder backend

    Visit: http://shelr.tv/ for more info.
      ).strip
      result = subject.help.strip
      expect(result).to eq expected
    end
  end
end

describe "the web frontend" do
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end

  it "shows the help menu" do
    expected = %Q(

  Usage: shelr command [arg]

  COMMANDS:

    Recording:

      record              - record new shellcast
      record --sound      - record new shellcast with sound

    Publishing:

      push last           - publish last record
      push last --private - publish private record
      push RECORD_ID      - publish record with given id

    Getting record as json:

      dump last           - dump last record as json to current dir
      dump RECORD_ID      - dump any record as json to current dir

    Replaying:

      list                - print list of records
      play last           - play last local record
      play RECORD_ID      - play local record
      play RECORD_URL     - play remote record
      play dump.json      - play local file dumped with `shelr dump`

    Setup:

      setup API_KEY [API_URL] - set your API key and API site
      backend [ttyrec|script] - setup recorder backend

    Visit: http://shelr.tv/ for more info.

    ).strip
    get '/'
    expect(last_response.body.strip).to eq expected
  end
end

