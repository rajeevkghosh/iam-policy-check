module "tfplan-functions" {
  source = "../../tfplan-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-project-iam-binding-pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}