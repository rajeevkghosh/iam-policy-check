provider "google" {

#credentials = file("../key.json")
access_token = var.access_token

}

/*
google_project_iam_policy
google_project_iam_binding
google_project_iam_member
google_organization_iam_policy
google_organization_iam_binding
google_organization_iam_member

*/


resource "google_project_iam_policy" "project" {
  project     = "airline1-sabre-wolverine"
  policy_data = data.google_iam_policy.admin-project.policy_data
}

data "google_iam_policy" "admin-project" {
  binding {
    role = "roles/editor"

    members = [
      "user:romil@example.com",
      "group:rajeevgroup@googlegroup.com",
      "serviceAccount:407536364561-compute@developer.gserviceaccount.com"
    ]
  }
}

resource "google_project_iam_binding" "project-binding" {
  project = "airline1-sabre-wolverine"
  role    = "roles/editor"

  members = [
    "user:jane@example.com",
    "group:rajeevgroup@googlegroup.com",
    "serviceAccount:407536364561-compute@developer.gserviceaccount.com"
  ]
}

resource "google_project_iam_member" "project-iam-member" {
  project = "airline1-sabre-wolverine"
  role    = "roles/editor"
  member  = "user:ravi@example.com"
  
}

resource "google_organization_iam_policy" "organization" {
  org_id      = "airline1"
  policy_data = data.google_iam_policy.admin.policy_data
}

data "google_iam_policy" "admin" {
  binding {
    role = "roles/editor"

    members = [
      "user:mahesh@example.com",
      "group:rajeevgroup@googlegroup.com",
      "serviceAccount:407536364561-compute@developer.gserviceaccount.com"
    ]
  }
}

resource "google_organization_iam_binding" "organization-binding" {
  org_id      = "airline1"
  role    = "roles/editor"

  members = [
    "user:jane@example.com",
    "serviceAccount:407536364561-compute@developer.gserviceaccount.com"
  ]
}

resource "google_organization_iam_member" "organization-member" {
  org_id      = "airline1"  
  role    = "roles/editor"
  member  = "user:rajeev@example.com"
}



