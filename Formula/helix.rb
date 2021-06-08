class Helix < Formula
  desc "Post-modern modal text editor"
  homepage "https://helix-editor.com"
  url "https://github.com/helix-editor/helix/releases/download/v0.0.10/helix-v0.0.10-x86_64-macos.tar.xz"
  sha256 "7fa351f81aedf80e0d8abc04afa79426e78d3b98f727851497146908622a6f28"
  license "MPL-2.0"

  bottle :unneeded
  def install
    libexec.install Dir["*"]
    (bin/"hx").write_env_script(libexec/"hx", :HELIX_RUNTIME => libexec/"runtime")
  end
end
