if [ -f /replicated.txt ]; then
  echo "Mongo is already set up"
else
  echo "Setting up mongo replication and seeding initial data..."
  # Wait for few seconds until the mongo server is up
  sleep 50
  mongo mongo-primary:27017 replicate.js
  echo "Replication done..."
  # Wait for few seconds until replication takes effect
fi