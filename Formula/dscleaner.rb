class Dscleaner < Formula
  include Language::Python::Virtualenv

  desc "Find and delete macOS .DS_Store files"
  homepage "https://github.com/yal212/DScleaner"
  url "https://github.com/yal212/DScleaner/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "cfa1c2c25a68610b028e36a2fadfa469d275d11743b197bc48ad68cabe2f5bb7"
  license "MIT"

  depends_on "python@3.12"

  def install
    # No third-party dependencies, so no `resource` blocks are needed.
    virtualenv_install_with_resources
  end

  test do
    dir = testpath/"sub"
    dir.mkpath
    (dir/".DS_Store").write "test"
    system bin/"dscleaner", "-y", testpath
    refute_predicate dir/".DS_Store", :exist?
  end
end
