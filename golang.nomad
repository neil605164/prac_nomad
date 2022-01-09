job "golang" {
    datacenters = ["dc1"]

    group "go" {

        count = 3

        network {
            port "http" {
                to = 8080
            }
        }

        service {
            name = "golang-service"
            port = "http"

            check {
                type     = "http"
                port     = "http"
                path     = "/"
                interval = "10s"
                timeout  = "2s"
            }
        }

        task "server" {
            driver = "docker"
            config {
                image = "neil605164/hello-go"
                ports = ["http"]
            }

            resources {
                cpu    = 500 # 500 MHz
                memory = 256 # 256MB
            }
        }
    }
}