module Motion::Project
  class QLCommonMark

    attr_accessor :signing_enabled

    FILE_NAME = 'QLCommonMark.qlgenerator'
    ZIP_FILE  = 'QLCommonMark.qlgenerator.zip'

    #------------------------------------------------------------------------------
    def initialize(config)
      @config = config
      @signing_enabled = true
      check_and_install
    end

    #------------------------------------------------------------------------------
    def vendored_generator_dir
      "#{@config.project_dir}/vendor/QLCommonMark"
    end

    #------------------------------------------------------------------------------
    def vendored_generator_file
      "#{vendored_generator_dir}/#{FILE_NAME}"
    end
    
    #------------------------------------------------------------------------------
    def vendored_zip_file
      "#{vendored_generator_dir}/#{ZIP_FILE}"
    end

    #------------------------------------------------------------------------------
    def distrib_zip_file
      File.join(File.dirname(__FILE__), "../../vendor/#{ZIP_FILE}")
    end

    #------------------------------------------------------------------------------
    def embedded_file
      File.join(embedded_dir, FILE_NAME)
    end

    #------------------------------------------------------------------------------
    def embedded_dir
      File.join(App.config.app_bundle('MacOSX'), "Library/QuickLook")
    end

    #------------------------------------------------------------------------------
    def installed?
      File.directory?(vendored_generator_dir) && File.file?(vendored_generator_file)
    end

    # copy the zip from our gem into the vendor of project, and unzip it
    #------------------------------------------------------------------------------
    def install
      FileUtils.rm_rf(vendored_generator_dir) if File.directory?(vendored_generator_dir) # force clean install
      FileUtils.mkdir_p(vendored_generator_dir)
      `cp #{distrib_zip_file} #{vendored_zip_file}`
      `unzip #{vendored_zip_file} -d #{vendored_generator_dir}`
      `rm #{vendored_zip_file}`
      App.info 'QuickLook', 'Installed'
    end

    #------------------------------------------------------------------------------
    def check_and_install
      install unless installed?
    end

    #------------------------------------------------------------------------------
    def verify_installation
      if installed?
        App.info "QuickLook", "Generator installed in #{vendored_generator_dir}"
      else
        App.fail "QuickLook generator not correctly copied to #{vendored_generator_dir}
Run `rake qlcommonmark:install` manually or, if the problem persists, 
please explain your setup and problem as an issue on GitHub at:
https://github.com/digitalmoksha/motion-qlcommonmark/issues
"
      end
    end
  end
end

