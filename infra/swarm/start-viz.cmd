echo "Starting viz on a manager node"

docker stack deploy -c services/viz.yml viz
