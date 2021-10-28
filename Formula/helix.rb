class Helix < Formula
  desc "Post-modern modal text editor"
  homepage "https://helix-editor.com"
  url "https://github.com/helix-editor/helix/releases/download/v0.5.0/helix-v0.5.0-x86_64-macos.tar.xz"
  sha256 "6f71c420a7ff19db32717765129fc02f327974f718d6905307d02498a5bc1b08"
  license "MPL-2.0"

  def install
    libexec.install Dir["*"]
    (bin/"hx").write_env_script(libexec/"hx", :HELIX_RUNTIME => libexec/"runtime")
  end
end
