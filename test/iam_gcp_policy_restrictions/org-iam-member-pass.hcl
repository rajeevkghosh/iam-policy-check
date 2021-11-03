module "tfplan-functions" {
  source = "../../tfplan-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-org-iam-member-pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}