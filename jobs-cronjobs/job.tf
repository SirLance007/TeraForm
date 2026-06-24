resource "kubernetes_job_v1" "demo_job" {
  metadata {
    name      = "math-calculator-job"
    namespace = "default"
  }

  spec {
    # Agar job fail ho jaye, toh kitni baar retry kare
    backoff_limit = 4 

    template {
      metadata {
        name = "math-calculator-job"
      }

      spec {
        container {
          name    = "calculator"
          image   = "alpine:latest"
          # Ye command ek simple math operation karegi aur exit ho jayegi
          command = ["sh", "-c", "echo 'Calculating deep data...'; expr 5 + 10; sleep 5; echo 'Done!'"]
        }

        # Jobs ke liye restart_policy hamesha "Never" ya "OnFailure" hoti hai (Always nahi ho sakti)
        restart_policy = "Never"
      }
    }
  }
}