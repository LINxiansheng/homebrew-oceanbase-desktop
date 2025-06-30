class OceanbaseDesktop < Formula
  desc "A wrapper to run oceanbase-ce using docker containers"
  homepage "https://open.oceanbase.com/"
  url "https://obbusiness-private.oss-cn-shanghai.aliyuncs.com/download-center/opensource/obdesktop/4.3.5.0/OceanBase-Desktop-1.0.0-arm64.dmg"
  sha256 "10b82028247f3fb9699659cdbe64d9280728a10f5155f07277f7f1ccb5d5c620"
  license "Apache-2.0"

  depends_on "orbstack"  # 指定依赖 OrbStack

  def install
    system "hdiutil", "attach", "-nobrowse", "OceanBase-Desktop-1.0.0-arm64.dmg"
    system "cp", "-r", "/Volumes/OceanBase Desktop/OceanBase-Desktop.app", "#{prefix}/OceanBase-Desktop.app"
    system "hdiutil", "detach", "/Volumes/OceanBase Desktop"
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
    # 简单测试以确保 Formula 工作。可以尝试启动应用或检查文件存在性。
    assert_predicate "#{prefix}/OceanBase-Desktop.app", :exist?, "App is not installed"
  end
end
