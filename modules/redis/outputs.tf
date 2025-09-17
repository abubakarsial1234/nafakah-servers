# .../modules/redis/outputs.tf

output "redis_connection_string" {
  description = "The connection endpoint for the Redis instance."
  value       = alicloud_kvstore_instance.redis.connection_string
}

output "redis_port" {
  description = "The port for the Redis instance."
  value       = alicloud_kvstore_instance.redis.port
}

output "redis_id" {
  description = "The ID of the Redis instance."
  value       = alicloud_kvstore_instance.redis.id
}