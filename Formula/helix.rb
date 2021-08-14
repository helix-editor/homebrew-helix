class Helix < Formula
  desc "Post-modern modal text editor"
  homepage "https://helix-editor.com"
  url "https://github.com/helix-editor/helix/releases/download/v0.4.1/helix-v0.4.1-x86_64-macos.tar.xz"
  sha256 "4789acfa22c996ece3d4069422c86177b062f099d7fccaf8a253c9ad9553759a"
  license "MPL-2.0"

  bottle :unneeded
  def install
    libexec.install Dir["*"]
    (bin/"hx").write_env_script(libexec/"hx", :HELIX_RUNTIME => libexec/"runtime")
  end
end
