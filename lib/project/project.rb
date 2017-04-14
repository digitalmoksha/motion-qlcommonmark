module Motion::Project

  class Config
    variable :qlcommommark

    #------------------------------------------------------------------------------
    def qlcommonmark(&block)
      @qlcommommark ||= Motion::Project::QLCommonMark.new(self)
      if block
        @qlcommommark.instance_eval &block
      end
      @qlcommommark
    end
  end

  class Builder

    # before app is signed, we need to install the generator into the app and sign
    # if needed
    #------------------------------------------------------------------------------
    def codesign_with_qlcommommark(config, platform)
      if File.directory?(config.qlcommonmark.vendored_generator_dir)
        App.info 'QuickLook', "Copying generator to #{config.qlcommonmark.embedded_dir}"
        FileUtils.mkdir_p(config.qlcommonmark.embedded_dir)
        `cp -R "#{App.config.qlcommonmark.vendored_generator_file}" "#{config.qlcommonmark.embedded_dir}"`

        if config.qlcommonmark.signing_enabled
          App.info 'Codesign', config.qlcommonmark.embedded_file
          `/usr/bin/codesign --force --sign '#{config.codesign_certificate}' "#{config.qlcommonmark.embedded_file}"`
        end
      end
      codesign_without_qlcommommark(config, platform)
    end

    alias_method "codesign_without_qlcommommark", "codesign"
    alias_method "codesign", "codesign_with_qlcommommark"
  end
  
end
