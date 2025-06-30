class OceanbaseCe < Formula
  desc "A wrapper to run oceanbase-ce using docker containers"
  homepage "https://github.com/chris-sun-star/oceanbase-ce"
  url "https://github.com/chris-sun-star/homebrew-oceanbase-ce/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "0f36cd48a4d103b62f27b4364ebd3b4c35a8c4a1cb232d421f0c525b4abc6886"
  license "Apache-2.0"

  def install
    ENV.prepend_path "PATH", "/usr/local/bin"
    bin.install "src/oceanbase-ce.sh" => "oceanbase-ce"
    system "docker", "pull", "quay.io/oceanbase/oceanbase-ce"
  end

  def post_install
    chmod 0755, bin/'oceanbase-ce'
    puts "Permissions set to 0755 for #{bin/'oceanbase-ce'}"
  end

  def test
    ENV.prepend_path "PATH", "/usr/local/bin"
    system "oceanbase-ce", "-h"
  end

  def post_uninstall
    ENV.prepend_path "PATH", "/usr/local/bin"
    system "docker", "rm", "-f", "oceanbase-ce"
    system "rm", "-rf", "~/.oceanbase-ce/*"
  end
end
