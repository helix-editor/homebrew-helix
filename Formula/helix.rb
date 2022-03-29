class Helix < Formula
  desc "Post-modern modal text editor"
  homepage "https://helix-editor.com"
  url "https://github.com/helix-editor/helix/releases/download/22.03/helix-22.03-x86_64-macos.tar.xz"
  sha256 "4624be398aff68af39c40ef401ec95a2d8722ae724328c1204afb663ffde72fb"
  license "MPL-2.0"

  def install
    libexec.install Dir["*"]
    (bin/"hx").write_env_script(libexec/"hx", :HELIX_RUNTIME => libexec/"runtime")
  end
end
