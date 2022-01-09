class Helix < Formula
  desc "Post-modern modal text editor"
  homepage "https://helix-editor.com"
  url "https://github.com/helix-editor/helix/releases/download/v0.6.0/helix-v0.6.0-x86_64-macos.tar.xz"
  sha256 "df23d88d4c9ba13a90bffe230563b8668dd36f3296c9757427328a96e5992d1b"
  license "MPL-2.0"

  def install
    libexec.install Dir["*"]
    (bin/"hx").write_env_script(libexec/"hx", :HELIX_RUNTIME => libexec/"runtime")
  end
end
