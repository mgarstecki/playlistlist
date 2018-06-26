require 'rspec'
require 'directories_lister'

describe 'directories_lister' do
  let (:mocks_dir) { File.dirname(__FILE__) + "/mocks"}
  describe 'walk_dir' do
    it 'returns an empty array when given an empty folder' do
      target_dir = "#{mocks_dir}/emptydir"

      tested = DirectoriesLister.new target_dir

      expect(tested.albums).to eq []
    end

    it 'returns an array that contains an array when called on a single album' do
      target_dir = "#{mocks_dir}/singlealbum"

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
