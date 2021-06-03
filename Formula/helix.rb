class Helix < Formula
  desc "Post-modern modal text editor"
  homepage "https://helix-editor.com"
  url "https://github.com/helix-editor/helix/releases/download/v0.0.8/helix-v0.0.8-x86_64-macos.tar.xz"
  sha256 "3ade355d680a839c0288b928e3ace4fe24eef1235134fd3e804ae80bb2cebf97"
  license "MPL-2.0"

  bottle :unneeded
  def install
    libexec.install Dir["*"]
    (bin/"hx").write_env_script(libexec/"hx", :HELIX_RUNTIME => libexec/"runtime")
  end
end
