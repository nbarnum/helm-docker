[![](https://images.microbadger.com/badges/version/nbarnum/helm.svg)](https://microbadger.com/images/nbarnum/helm "microbadger.com") [![](https://images.microbadger.com/badges/image/nbarnum/helm.svg)](https://microbadger.com/images/nbarnum/helm "microbadger.com") [![](https://images.microbadger.com/badges/commit/nbarnum/helm.svg)](https://microbadger.com/images/nbarnum/helm "microbadger.com")

[Helm](https://helm.sh/) binaries in scratch containers.

## Tags

* `v3.3.3`, `v3`, `3`, `latest`
* `v2.16.12`, `v2`, `2`

## Usage

```
$ docker pull nbarnum/helm
```

```
$ docker run --rm --rm nbarnum/helm version
version.BuildInfo{Version:"v3.0.3", GitCommit:"ac925eb7279f4a6955df663a0128044a8a6b7593", GitTreeState:"clean", GoVersion:"go1.13.6"}
```

Enables easy switching of helm versions based on current context. Create `helm` shell script and put it in PATH:

```
#!/bin/bash

case "$(kubectl config current-context)" in
    prod)
        HELM_VERSION="v2.16.1"
        ;;
    dev)
        HELM_VERSION="v3.0.3"
        ;;
    *)
        HELM_VERSION="latest"
        ;;
esac

docker run --rm \
    -v ~/.helm:/.helm \
    -v ~/.kube/config:/.kube/config:ro \
    -v /etc/ssl:/etc/ssl:ro \
    nbarnum/helm:${HELM_VERSION} "$@"
```
