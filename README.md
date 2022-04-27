# data-streaming-with-kafka
Small test project for testing kafka capabilities. With minikube kafka deploy and Scala code base. 

## Kafka
### Deploy:
Run `minikube_deploy.sh` to deploy kafka in kubernetes.

In case of something stuck - delete everything or `minikube delete`.

### Running CLI:
```bash
kubectl run kafka-client --restart='Never' --image docker.io/bitnami/kafka:2.8.1-debian-10-r73 --namespace kafka --command -- sleep infinity
kubectl exec --tty -i kafka-client --namespace kafka -- bash
```

```bash
 PRODUCER:
        kafka-console-producer.sh \
            
            --broker-list kafka-0.kafka-headless.kafka.svc.cluster.local:9092 \
            --topic test

    CONSUMER:
        kafka-console-consumer.sh \
            
            --bootstrap-server kafka.kafka.svc.cluster.local:9092 \
            --topic test \
            --from-beginning
```