# frozen_string_literal: true

class Helix < Formula
  desc "Post-modern modal text editor"
  homepage "https://helix-editor.com"
  version "22.03"
  license "MPL-2.0"

  head do
    url "https://github.com/helix-editor/helix.git", branch: "master"
    depends_on "rust" => :build
  end

  on_macos do
    # We don't need a Hardware::CPU.intel? check here. The x86_64 binary
    # will also work for ARM64.
    url "https://github.com/helix-editor/helix/releases/download/#{version}/helix-#{version}-x86_64-macos.tar.xz"
    sha256 "4624be398aff68af39c40ef401ec95a2d8722ae724328c1204afb663ffde72fb"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/helix-editor/helix/releases/download/#{version}/helix-#{version}-x86_64-linux.tar.xz"
      sha256 "844ec88c81e2e4ca6153499a8b371cfbd3602f32492326b91bf2547d515f528f"
    end
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args(path: "helix-term")
      libexec.install "runtime"
      libexec.install "target/release/hx"
    else
      libexec.install Dir["*"]
    end

    (bin / "hx").write_env_script(libexec / "hx", HELIX_RUNTIME: libexec / "runtime")
  end

  def caveats
    if build.head?
      <<~EOS
        Building tree-sitter grammars:

        Tree-sitter grammars must be fetched and compiled if not pre-packaged.
        Fetch grammars with `hx --grammar fetch` (requires git) and compile them with `hx --grammar build` (requires a C compiler).
      EOS
    end
  end

  test do
    system bin / "hx", "--version"
  end
end
