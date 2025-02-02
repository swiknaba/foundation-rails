module FoundationRailsTestHelpers
  def create_dummy_app
    FileUtils.cd(tmp_path) do
      %x(rails new dummy --skip-active-record --skip-test-unit --skip-spring --skip-bundle)
      File.open(dummy_app_path + '/Gemfile', 'a') do |f|
        f.puts "gem 'foundation-rails', path: '#{File.join(File.dirname(__FILE__), '..', '..')}'"
      end
    end
    FileUtils.cd(dummy_app_path) do
      # @WARNING: hacking in the old (pre-Rails 6) asset pipeline folders.
      %x(mkdir -p app/assets/javascripts)
      %x(touch app/assets/javascripts/application.js) unless File.exist?("#{dummy_app_path}/app/assets/javascripts/application.js")
      %x(bundle install)
    end
  end

  def remove_dummy_app
    FileUtils.rm_rf(dummy_app_path)
  end

  def install_foundation
    FileUtils.cd(dummy_app_path) do
      puts %x(bundle exec rails g foundation:install -f 2>&1)
    end
  end

  def dummy_app_path
    File.join(tmp_path, 'dummy')
  end

  def tmp_path
    @tmp_path ||= File.join(File.dirname(__FILE__), '..')
  end
end
