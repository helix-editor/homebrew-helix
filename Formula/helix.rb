# frozen_string_literal: true

class Helix < Formula
  desc "Post-modern modal text editor"
  homepage "https://helix-editor.com"
  version "22.05"
  license "MPL-2.0"

  head do
    url "https://github.com/helix-editor/helix.git", branch: "master"
    depends_on "rust" => :build
  end

  on_macos do
    # We don't need a Hardware::CPU.intel? check here. The x86_64 binary
    # will also work for ARM64.
    url "https://github.com/helix-editor/helix/releases/download/#{version}/helix-#{version}-x86_64-macos.tar.xz"
    sha256 "b76fba41375794ba8be8f848a9c480604945f51ec171ce7dfd3327722c2b8d18"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/helix-editor/helix/releases/download/#{version}/helix-#{version}-x86_64-linux.tar.xz"
      sha256 "73eb3fa54858d81dc7f393166044f30a0c04eeb9f88f49971146ef9ddfc043f9"
    end
  end

  def install
    bash_completion.install "contrib/completion/hx.bash" => "hx"
    fish_completion.install "contrib/completion/hx.fish"
    zsh_completion.install "contrib/completion/hx.zsh" => "_hx"

    if build.head?
      system "cargo", "install", *std_cargo_args(path: "helix-term")
      rm_r "runtime/grammars/sources/"
      libexec.install "runtime"
      libexec.install "target/release/hx"
    else
      libexec.install Dir["*"]
    end

    (bin / "hx").write_env_script(libexec / "hx", HELIX_RUNTIME: libexec / "runtime")
  end

  test do
    system bin / "hx", "--version"
  end
end
