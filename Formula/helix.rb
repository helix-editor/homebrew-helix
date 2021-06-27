class Helix < Formula
  desc "Post-modern modal text editor"
  homepage "https://helix-editor.com"
  url "https://github.com/helix-editor/helix/releases/download/v0.3.0/helix-v0.3.0-x86_64-macos.tar.xz"
  sha256 "834ae3a94ac19bad12fdf97aae7a698783e3d45d640f8a536a5550a2f18f320e"
  license "MPL-2.0"

  bottle :unneeded
  def install
    libexec.install Dir["*"]
    (bin/"hx").write_env_script(libexec/"hx", :HELIX_RUNTIME => libexec/"runtime")
  end
end
