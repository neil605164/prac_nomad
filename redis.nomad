job "redis" {
    datacenters = ["dc1"]
    group "cache" {
        network {
            port "db" {
                to = 6379
            }
        }

        count = 1

        task "redis-service" {
            driver = "docker"
            config {
                image = "redis:6.2-alpine"
                ports = ["db"]
            }

            resources {
                cpu    = 500 # 500 MHz
                memory = 256 # 256MB
            }
        }
    }
}