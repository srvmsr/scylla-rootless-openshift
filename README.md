# ScyllaDB Docker Image for OpenShift/OKD

A stripped version of the [original Scylla Docker image][scylla-docker].

This image is compatible with OpenShift/OKD and
doesn't require root permissions to run.

## Try out the docker image 
```bash
docker pull srvmsr/scylla-ocp:tagname:3.3.4
```

## Openshift Deployment with emptydir
```bash
oc apply -f openshift/deployment-emptydir.yaml
```

## Openshift Deployment with persistence volume
```bash
oc apply -f openshift/deployment-pvc.yaml
```

## See Also

- [Scylla][scylla]
- [Scylla Docker Image][scylla-docker]

[scylla]: https://github.com/scylladb/scylla
[scylla-docker]: https://github.com/scylladb/scylla/tree/master/dist/docker/redhat
