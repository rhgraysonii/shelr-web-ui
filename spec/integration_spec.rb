require './lib/shelr'
require 'pry'

describe Shelr::Wrapper do
  describe "#help" do
    it "can open shelr" do
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
