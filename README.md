[![](https://images.microbadger.com/badges/version/nbarnum/helm.svg)](https://microbadger.com/images/nbarnum/helm "microbadger.com") [![](https://images.microbadger.com/badges/image/nbarnum/helm.svg)](https://microbadger.com/images/nbarnum/helm "microbadger.com") [![](https://images.microbadger.com/badges/commit/nbarnum/helm.svg)](https://microbadger.com/images/nbarnum/helm "microbadger.com")

[Helm](https://helm.sh/) binaries in scratch containers.

## Tags

* `v3.4.0`, `v3`, `3`, `latest`
* `v2.17.0`, `v2`, `2`

## Usage

```
$ docker pull nbarnum/helm
```

```
$ docker run --rm --rm nbarnum/helm version
version.BuildInfo{Version:"v3.3.4", GitCommit:"a61ce5633af99708171414353ed49547cf05013d", GitTreeState:"clean", GoVersion:"go1.14.9"}
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
