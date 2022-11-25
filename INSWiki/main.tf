provider "aws" {
  region="ap-south-1"
  access_key = "AKIAWGRN2CJWT7LKIQAX"
  secret_key = "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"
}



resource "aws_amplify_app" "amplify-terraform" {
  name       = "amplify-terraform"
 


  # The default build_spec added by the Amplify Console for React.
  build_spec = <<-EOT
    version: 0.1
    frontend:
      phases:
        preBuild:
          commands:
            - yarn install
        build:
          commands:
            - yarn run build
      artifacts:
        baseDirectory: build
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
  EOT

  # The default rewrites and redirects added by the Amplify Console.
  custom_rule {
    source = "/<*>"
    status = "404"
    target = "/index.html"
  }

  environment_variables = {
    ENV = "test"
  }
}


