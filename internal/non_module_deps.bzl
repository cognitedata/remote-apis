"Module extension for loading dependencies not in bzlmod"

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# buildifier: disable=unused-variable
def _non_module_deps_extension(module_ctx):
    http_archive(
        name = "googleapis",
        sha256 = "9d1a930e767c93c825398b8f8692eca3fe353b9aaadedfbcf1fca2282c85df88",
        strip_prefix = "googleapis-64926d52febbf298cb82a8f472ade4a3969ba922",
        urls = ["https://github.com/googleapis/googleapis/archive/64926d52febbf298cb82a8f472ade4a3969ba922.zip"],
    )

    http_archive(
        name = "rules_gapic",
        sha256 = "913d88485702c6605ff481678a63cfd710877252a74ff9181bf0452515039625",
        strip_prefix = "rules_gapic-0.28.1",
        urls = [
            "https://github.com/googleapis/rules_gapic/archive/v0.28.1.tar.gz",
        ],
    )


non_module_deps = module_extension(
    implementation = _non_module_deps_extension,
)
