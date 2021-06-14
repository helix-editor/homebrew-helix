class Helix < Formula
  desc "Post-modern modal text editor"
  homepage "https://helix-editor.com"
  url "https://github.com/helix-editor/helix/releases/download/v0.2.1/helix-v0.2.1-x86_64-macos.tar.xz"
  sha256 "ba095274ea9d2c6202f7252344fdd91fb67b95f24aa0099cfd956e3b2c8e5735"
  license "MPL-2.0"

  bottle :unneeded
  def install
    libexec.install Dir["*"]
    (bin/"hx").write_env_script(libexec/"hx", :HELIX_RUNTIME => libexec/"runtime")
  end
end
