# Kerminator Build Image

This is the runtime container for Kerminator in the new slack deployment.

This container basically contains nodejs and the runtime stuff needed to run kerminator. It expects the source code of kermiantor to be mounted in as a volume (vs baked into the image) so we can iterate very quickly and not need a new container for a branch deploy and whatnot.

This is based on alpine.
