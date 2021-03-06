#Public ALB
resource "aws_cloudwatch_metric_alarm" "pub_alb_requestcount" {
  alarm_name          = "${var.project}-${var.environment}_pub_alb_request_count"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "RequestCount"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "70000"
  alarm_description   = "The number of requests received by the load balancer is more than 70000/min"
  treat_missing_data  = "notBreaching"

  ok_actions = [
    "${var.sns_arn}",
  ]

  alarm_actions = [
    "${var.sns_arn}",
  ]

  dimensions {
    "LoadBalancer" = "${var.pub_alb_arn_suffix}"
  }
}

resource "aws_cloudwatch_metric_alarm" "pub_alb_activeconnection" {
  alarm_name          = "${var.project}-${var.environment}_pub_alb_active_connection"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "ActiveConnectionCount"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "4000"
  alarm_description   = "The total number of concurrent TCP connections active from  clients to the load balancer and from the load balancer to targets is greater than 4000/min"
  treat_missing_data  = "notBreaching"

  ok_actions = [
    "${var.sns_arn}",
  ]

  alarm_actions = [
    "${var.sns_arn}",
  ]

  dimensions {
    "LoadBalancer" = "${var.pub_alb_arn_suffix}"
  }
}

resource "aws_cloudwatch_metric_alarm" "pub_alb_newconnectioncount" {
  alarm_name          = "${var.project}-${var.environment}_pub_alb_new_connection_count"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "NewConnectionCount"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "50000"
  alarm_description   = "The total number of new TCP connections established from clients to the load balancer and from the load balancer to targets is greater than 50000/min"
  treat_missing_data  = "notBreaching"

  ok_actions = [
    "${var.sns_arn}",
  ]

  alarm_actions = [
    "${var.sns_arn}",
  ]

  dimensions {
    "LoadBalancer" = "${var.pub_alb_arn_suffix}"
  }
}

resource "aws_cloudwatch_metric_alarm" "pub_alb_httpcode_target_4xx_count" {
  alarm_name          = "${var.project}-${var.environment}_pub_alb_httpcode_target_4xx_count"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "HTTPCode_Target_4XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "100"
  alarm_description   = "The number of 4XX HTTP response codes generated by the targets is more than 10/min."
  treat_missing_data  = "notBreaching"

  ok_actions = [
    "${var.sns_arn}",
  ]

  alarm_actions = [
    "${var.sns_arn}",
  ]

  dimensions {
    "LoadBalancer" = "${var.pub_alb_arn_suffix}"
  }
}

resource "aws_cloudwatch_metric_alarm" "pub_alb_httpcode_target_5xx_count" {
  alarm_name          = "${var.project}-${var.environment}_pub_alb_httpcode_target_5xx_count"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "HTTPCode_Target_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "10"
  alarm_description   = "The number of 5XX HTTP response codes generated by the targets is more than 10 per minute."
  treat_missing_data  = "notBreaching"

  ok_actions = [
    "${var.sns_arn}",
  ]

  alarm_actions = [
    "${var.sns_arn}",
  ]

  dimensions {
    "LoadBalancer" = "${var.pub_alb_arn_suffix}"
  }
}
