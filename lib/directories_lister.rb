class DirectoriesLister
  attr_reader :albums

  def initialize target_directory
    @albums = list_directory(target_directory)
  end

  def list_directory target_directory
    entries = Dir.entries(target_directory).reject { |entry| entry == '.' or entry == '..' }

    file_entries = entries.select { |entry| File.file?("#{target_directory}/#{entry}") }

    if file_entries.any?
      return [{ name: '', songs: file_entries }]
    else
      return []
    end
  end
end
