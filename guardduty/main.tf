resource "aws_guardduty_detector" "MY-Detector" {
  enable = true
  finding_publishing_frequency = "SIX_HOURS"
}