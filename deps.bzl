load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

BATS_SHELLMOCK_BUILD="""
sh_library(
    name = "shellmock",
    srcs = ["load.bash"] + glob(["src/*"]),
    visibility = ["//visibility:public"],
)

sh_library(
    name = "test_helper",
    srcs = ["test/test_helper.bash"],
    visibility = ["//visibility:public"],
    data = [
        "@bazel_shellmock_deps//bats-support",
        "@bazel_shellmock_deps//bats-assert",
        "@bazel_shellmock_deps//bats-file",
    ],
)

sh_library(
    name = "test_lib",
    srcs = ["test/shellmock.bats"],
    visibility = ["//visibility:public"],
    deps = [
        ":test_helper",
    ],
)
exports_files(glob(["test/**"]))
"""

def bazel_shellmock_dependencies(
        version = "e4bf4a07a46a69c19fbc656167b490f62024816f",
        sha256 = "a22a97db52b59b71fcc9cfb688543b705cc874dc020853b03b68820b0d60c84a"):
    http_archive(
        name = "bats_shellmock",
        build_file_content = BATS_SHELLMOCK_BUILD,
        urls = [
            "https://github.com/jmelahman/bats-shellmock/archive/%s.tar.gz" % version,
        ],
        strip_prefix = "bats-shellmock-%s" % version,
        sha256 = sha256,
    )
