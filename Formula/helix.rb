class Helix < Formula
  desc "Post-modern modal text editor"
  homepage "https://helix-editor.com"
  url "https://github.com/helix-editor/helix/releases/download/v0.0.9/helix-v0.0.9-x86_64-macos.tar.xz"
  sha256 "b0ad1b07dafe0a15fa1dd6d8e700b23988cc46ae4238371ccc75fc57ede4bab4"
  license "MPL-2.0"

  bottle :unneeded
  def install
    libexec.install Dir["*"]
    (bin/"hx").write_env_script(libexec/"hx", :HELIX_RUNTIME => libexec/"runtime")
  end
end
