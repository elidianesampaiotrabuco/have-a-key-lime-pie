from os import path


PROJECT_ROOT = path.join(path.dirname(path.abspath(__file__)), "..")


MANIFEST_NS = "http://schemas.android.com/git-repo/manifest"


__all__ = ["PROJECT_ROOT", "MANIFEST_NS"]