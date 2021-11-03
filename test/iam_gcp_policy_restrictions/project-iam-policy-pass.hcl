module "tfplan-functions" {
  source = "../../tfplan-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-project-iam-pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}