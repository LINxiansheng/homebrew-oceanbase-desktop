class OceanbaseDesktop < Formula
  desc "OceanBase Desktop - A GUI tool for installing and managing OceanBase"
  homepage "https://open.oceanbase.com/"
  url "https://obbusiness-private.oss-cn-shanghai.aliyuncs.com/download-center/opensource/obdesktop/4.3.5.0/OceanBase-Desktop-1.0.0-arm64.dmg"
  sha256 "10b82028247f3fb9699659cdbe64d9280728a10f5155f07277f7f1ccb5d5c620"
  license "Apache-2.0"

  def install
    # Get the downloaded DMG file path
    dmg_file = Pathname.new(cached_download).basename.to_s
    
    # Mount the DMG
    system "hdiutil", "attach", "-nobrowse", dmg_file
    
    # Copy the app to the prefix
    system "cp", "-r", "/Volumes/OceanBase Desktop/OceanBase-Desktop.app", "#{prefix}/OceanBase-Desktop.app"
    
    # Unmount the DMG
    system "hdiutil", "detach", "/Volumes/OceanBase Desktop"
    
    # Create symlink
    bin.install_symlink "#{prefix}/OceanBase-Desktop.app/Contents/MacOS/OceanBase-Desktop" => "obdesktop"
  end

  def caveats
    <<~EOS
      OceanBase Desktop has been installed. The app is located at:
        #{prefix}/OceanBase-Desktop.app
      A symlink has been created, you can start it using:
        obdesktop
    EOS
  end

  test do
    # Test that the app is installed
    assert_predicate "#{prefix}/OceanBase-Desktop.app", :exist?, "App is not installed"
    
    # Test that the symlink exists
    assert_predicate bin/"obdesktop", :exist?, "Symlink was not created"
    
    # Test that the executable exists
    assert_predicate "#{prefix}/OceanBase-Desktop.app/Contents/MacOS/OceanBase-Desktop", :executable?, "Executable is not found or not executable"
  end
end
