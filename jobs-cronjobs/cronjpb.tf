resource "kubernetes_cron_job_v1" "demo_cronjob" {
  metadata {
    name      = "hourly-cleanup-cronjob"
    namespace = "default"
  }

  spec {
    # Standard Linux Cron format: (Har minute chalne ke liye: "* * * * *")
    schedule = "*/1 * * * *"

    # Puraane successful/failed jobs ka kitna record rakhna hai
    successful_jobs_history_limit = 3
    failed_jobs_history_limit     = 1

    job_template {
      metadata {
        name = "hourly-cleanup-cronjob"
      }

      spec {
        template {
          metadata {
            name = "hourly-cleanup-cronjob"
          }
          spec {
            container {
              name    = "cleanup-agent"
              image   = "busybox:latest"
              command = ["sh", "-c", "echo 'System Cleanup activity started at '$(date)"]
            }
            restart_policy = "OnFailure"
          }
        }
      }
    }
  }
}