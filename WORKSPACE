workspace(name = "bazel_remote_apis")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_skylib",
    sha256 = "66ffd9315665bfaafc96b52278f57c7e2dd09f5ede279ea6d39b2be471e7e3aa",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.4.2/bazel-skylib-1.4.2.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.4.2/bazel-skylib-1.4.2.tar.gz",
    ],
)

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

# Pull in go rules, which we need in order to selectively pull in Go dependencies.
http_archive(
    name = "io_bazel_rules_go",
    sha256 = "d6ab6b57e48c09523e93050f13698f708428cfd5e619252e369d377af6597707",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.43.0/rules_go-v0.43.0.zip",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.43.0/rules_go-v0.43.0.zip",
    ],
)

# Gazelle, which we need in order to selectively pull in Gazelle dependencies for Go.
http_archive(
    name = "bazel_gazelle",
    sha256 = "b7387f72efb59f876e4daae42f1d3912d0d45563eac7cb23d1de0b094ab588cf",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.34.0/bazel-gazelle-v0.34.0.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.34.0/bazel-gazelle-v0.34.0.tar.gz",
    ],
)

# Needed for protobuf.
http_archive(
    name = "com_google_protobuf",
    sha256 = "535fbf566d372ccf3a097c374b26896fa044bf4232aef9cab37bd1cc1ba4e850",
    strip_prefix = "protobuf-3.15.0",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/v3.15.0.zip"],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

# Needed for C++ gRPC.
http_archive(
    name = "com_github_grpc_grpc",
    sha256 = "197f62bc6a4fc67b736384307d1b694010e304753b2dd2f839ff3a993a540fab",
    strip_prefix = "grpc-1.48.1",
    urls = ["https://github.com/grpc/grpc/archive/refs/tags/v1.48.1.zip"],
)

# Pull in all gRPC dependencies.
load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")

grpc_deps()

# More gRPC dependencies. grpc_extra_deps does not work out of the box.
load("@upb//bazel:workspace_deps.bzl", "upb_deps")
load("@build_bazel_rules_apple//apple:repositories.bzl", "apple_rules_dependencies")
load("@build_bazel_apple_support//lib:repositories.bzl", "apple_support_dependencies")

upb_deps()

apple_rules_dependencies()

apple_support_dependencies()

bind(
    name = "grpc_cpp_plugin",
    actual = "@com_github_grpc_grpc//:grpc_cpp_plugin",
)

bind(
    name = "grpc_lib",
    actual = "@com_github_grpc_grpc//:grpc++",
)

load("//:remote_apis_deps.bzl", "remote_apis_go_deps")

remote_apis_go_deps()

# Needed for the googleapis protos.
http_archive(
    name = "googleapis",
    sha256 = "9d1a930e767c93c825398b8f8692eca3fe353b9aaadedfbcf1fca2282c85df88",
    strip_prefix = "googleapis-64926d52febbf298cb82a8f472ade4a3969ba922",
    urls = [
        "https://github.com/googleapis/googleapis/archive/64926d52febbf298cb82a8f472ade4a3969ba922.zip",
    ],
)

load("@googleapis//:repository_rules.bzl", "switched_rules_by_language")

switched_rules_by_language(
    name = "com_google_googleapis_imports",
    cc = True,
    java = True,
    go = True,
)

http_archive(
    name = "rules_gapic",
    sha256 = "913d88485702c6605ff481678a63cfd710877252a74ff9181bf0452515039625",
    strip_prefix = "rules_gapic-0.28.1",
    urls = [
        "https://github.com/googleapis/rules_gapic/archive/v0.28.1.tar.gz",
    ],
)

load("@rules_gapic//:repositories.bzl", "rules_gapic_repositories")

rules_gapic_repositories()
