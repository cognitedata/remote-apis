"Load googleapis imports"

load("@googleapis//:repository_rules.bzl", "switched_rules_by_language")

# buildifier: disable=unused-variable
def _googleapis_extension(module_ctx):
    switched_rules_by_language(
        name = "com_google_googleapis_imports",
        cc = True,
        java = True,
        go = True,
    )


googleapis = module_extension(
    implementation = _googleapis_extension,
)

