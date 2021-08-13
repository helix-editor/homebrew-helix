class Helix < Formula
  desc "Post-modern modal text editor"
  homepage "https://helix-editor.com"
  url "https://github.com/helix-editor/helix/releases/download/v0.4.0/helix-v0.4.0-x86_64-macos.tar.xz"
  sha256 "0307de36e6be533ff772954c403f4f9b95c63f30492cec2f93d5dd97ffed0274"
  license "MPL-2.0"

  bottle :unneeded
  def install
    libexec.install Dir["*"]
    (bin/"hx").write_env_script(libexec/"hx", :HELIX_RUNTIME => libexec/"runtime")
  end
end
