import * as k8s from "@pulumi/kubernetes";
import * as pulumi from "@pulumi/pulumi";

const nginxPod = new k8s.core.v1.Pod("local-nginx-pod", {
    metadata: {
        name: "my-nginx-pod",
        labels: { app : "frontend" }
    },
    spec: {
        containers: [{
            name: "nginx",
            image: "nginx:latest",
            ports: [{ containerPort : 80 }]
        }]
    }
})

export const podName = nginxPod.metadata.name;

const appConfig = new k8s.core.v1.ConfigMap("app-settings" , {
    metadata: { name : "app-settings" },
    data : {
        DEBUG_MODE: "true",
        APP_THEME: "dark"
    }
})

const configuredPod = new k8s.core.v1.Pod("local-configured-pod" , {
    metadata : { name: "my-configured-pod"},
    spec: {
        containers: [{
            name: "app",
            image: "nginx:lates",
            env: [{
                name: "DEBUG",
                valueFrom: {
                    configMapKeyRef: {
                        name: "app-settings",
                        key: "DEBUG_MODE"
                    }
                }
            }]
        }]
    }
})

const appLabels = { app: "local-web-app"};


const webDeployment = new k8s.apps.v1.Deployment("web-deployment" , {
    spec: {
        replicas: 3,
        selector : { matchLabels : appLabels },
        template : {
            metadata : {labels : appLabels},
            spec: {
                containers : [{ name: "nginx" , image : "nginx:latest"}]
            }
        }
    }
});

const webService = new k8s.core.v1.Service("web-service" , {
    metadata : { name: "web-service" },
    spec: {
        selector: appLabels,
        ports: [{ port: 80 , targetPort: 80}]
    }
});

export const serviceInternalIp = webService.spec.clusterIP