require 'rspec'
require 'directories_lister'

describe 'directories_lister' do

  describe 'walk_dir' do
    before :all do
      @mocks_dir = File.dirname(__FILE__) + "/mocks"
      Dir.mkdir("#{@mocks_dir}/emptydir") unless File.exists?("#{@mocks_dir}/emptydir")
    end

    after :all do
      Dir.rmdir("#{@mocks_dir}/emptydir") if File.exists?("#{@mocks_dir}/emptydir")
    end

    it 'returns an empty array when given an empty folder' do
      target_dir = "#{@mocks_dir}/emptydir"

      tested = DirectoriesLister.new target_dir

      expect(tested.albums).to eq []
    end

    it 'returns an array that contains an array when called on a single album' do
      target_dir = "#{@mocks_dir}/singlealbum"

      tested = DirectoriesLister.new target_dir

      expect(tested.albums).to eq [
        { name: '', songs: [
            'song1.mp3',
            'song2.mp3',
          ]
        }
      ]
    end
  end
end
