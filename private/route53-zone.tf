# ------------------------------------------------------------------------------
# create a route53 zone
# ------------------------------------------------------------------------------
resource "aws_route53_zone" "private_zone" {
    name = var.zone_name

    dynamic "vpc" {
        for_each = var.vpc_ids
        content {
            vpc_id     = vpc.value["id"]
            vpc_region = vpc.value["region"]
        }
    }

    tags = var.tags
}
