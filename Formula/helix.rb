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
    sha256 "8c4d2d8ba06702bd7381a853539de0faf9d9d050a982e5faf496e5b3a5c8c871"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/helix-editor/helix/releases/download/#{version}/helix-#{version}-x86_64-linux.tar.xz"
      sha256 "75d932308ae221247b2c905e5dee0da9b0d53312910b695c8611fc4bf108e730"
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

  test do
    system bin / "hx", "--version"
  end
end
