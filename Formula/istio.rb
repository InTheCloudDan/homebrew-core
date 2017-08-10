class Istio < Formula
  desc "Sample code, build, tests and governance material for the Istio project."
  homepage "https://istio.io"
  url "https://github.com/istio/pilot/archive/0.2.0.tar.gz"
  sha256 "1b5c341911a96264f3f287c3e4af081bd6ff8bfa057f0f4e2a847affdb8f2ace"

  depends_on "go" => :build
  depends_on "bazel" => :build

  def install
    Dir.chdir "cmd/istioctl" do
      system "bazel", "build", "--sandbox_debug", "--verbose_failures", ":istioctl"
    end
    bin.install "bazel-bin/cmd/istioctl/istioctl"
  end

  test do
    system "#{bin}/istioctl", "--help"
  end
end
