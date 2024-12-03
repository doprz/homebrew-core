class FernApi < Formula
  desc "Stripe-level SDKs and Docs for your API"
  homepage "https://buildwithfern.com/"
  url "https://registry.npmjs.org/fern-api/-/fern-api-0.45.2.tgz"
  sha256 "721c59542f509cf3a4664856d1672436be708a192dc60cce94a11dbae14bc71a"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "03dad17e9a8434bff666cba2d64be8d1c522971d30063d09c894765a33b1c5a0"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/fern init 2>&1", 1)
    assert_match "Login required", output

    system bin/"fern", "--version"
  end
end
