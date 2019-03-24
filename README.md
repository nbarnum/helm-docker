[![](https://images.microbadger.com/badges/version/nbarnum/helm.svg)](https://microbadger.com/images/nbarnum/helm "microbadger.com") [![](https://images.microbadger.com/badges/image/nbarnum/helm.svg)](https://microbadger.com/images/nbarnum/helm "microbadger.com") [![](https://images.microbadger.com/badges/commit/nbarnum/helm.svg)](https://microbadger.com/images/nbarnum/helm "microbadger.com")

[Helm](https://helm.sh/) binaries in scratch containers.

```
$ docker pull nbarnum/helm
```

```
$ docker run --rm \
    -v ~/.helm:/.helm \
    -v ~/.kube/config:/.kube/config:ro \
    -v /etc/ssl:/etc/ssl:ro \
    nbarnum/helm version
Client: &version.Version{SemVer:"v2.11.0", GitCommit:"2e55dbe1fdb5fdb96b75ff144a339489417b146b", GitTreeState:"clean"}
Server: &version.Version{SemVer:"v2.11.0", GitCommit:"2e55dbe1fdb5fdb96b75ff144a339489417b146b", GitTreeState:"clean"}
```

Enables easy switching of helm versions based on current context. Create `helm` shell script and put it in PATH:

```
#!/bin/bash

case "$(kubectl config current-context)" in
    prod)
        HELM_VERSION="v2.11.0"
        ;;
    dev)
        HELM_VERSION="v2.13.0"
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
