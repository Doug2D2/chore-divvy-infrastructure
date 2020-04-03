output "db_endpoint" {
    value = module.db.endpoint
}

output "app_server_public_ip" {
    value = "App server running at ${module.app.public_ip}:8080"
}

output "web_server_public_ip" {
    value = "Web server running at ${module.web.public_ip}:80"
}
