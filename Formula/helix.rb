class Helix < Formula
  desc "Post-modern modal text editor"
  homepage "https://helix-editor.com"
  url "https://github.com/helix-editor/helix/releases/download/v0.2.0/helix-v0.2.0-x86_64-macos.tar.xz"
  sha256 "9cef20be98d033d45785da9df1db72ce8957ba6afe38eb1f4976c18753fbb31e"
  license "MPL-2.0"

  bottle :unneeded
  def install
    libexec.install Dir["*"]
    (bin/"hx").write_env_script(libexec/"hx", :HELIX_RUNTIME => libexec/"runtime")
  end
end
