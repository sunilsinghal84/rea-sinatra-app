resource "aws_security_group" "instance_sg" {
  name   = "${var.project_name}-instance-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port       = 9292
    to_port         = 9292
    protocol        = "tcp"
    security_groups = [aws_security_group.lb_sg.id]
    description     = "Allow all inbound access from load balancer"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.vpc.cidr_block]
    description = "Allow all inbound access from VPC CIDR block IP range"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "${var.project_name}-instance-sg"
    CostCode = var.cost_code
  }
}

resource "aws_launch_template" "lt" {
  name          = "${var.project_name}-lt"
  instance_type = var.instance_type
  image_id      = aws_ami_copy.enc_ami.id
  key_name      = var.ssh_key_name

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name     = "${var.project_name}-instance"
      CostCode = var.cost_code
    }
  }

  user_data              = base64encode(file("user-data/user-data.sh"))
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
}

resource "aws_autoscaling_group" "asg" {
  name = "${var.project_name}-asg"
  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }
  min_size            = var.asg_min_size
  max_size            = var.asg_max_size
  vpc_zone_identifier = data.aws_subnet_ids.subnets.ids
  target_group_arns   = [aws_lb_target_group.tg.arn]
  health_check_type   = "ELB"

  tags = [
    {
      key                 = "Name"
      value               = "${var.project_name}-asg"
      propagate_at_launch = true
    },
    {
      key                 = "CostCode"
      value               = var.cost_code
      propagate_at_launch = true
    }
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "lb_sg" {
  name   = "${var.project_name}-lb-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all inbound access from internet"
  }

  egress {
    from_port   = 9292
    to_port     = 9292
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow outbound access to app server"
  }

  tags = {
    Name     = "${var.project_name}-lb-sg"
    CostCode = var.cost_code
  }
}

resource "aws_lb" "lb" {
  name            = "${var.project_name}-lb"
  internal        = false
  subnets         = data.aws_subnet_ids.subnets.ids
  security_groups = [aws_security_group.lb_sg.id]

  tags = {
    Name     = "${var.project_name}-lb"
    CostCode = var.cost_code
  }
}

resource "aws_lb_target_group" "tg" {
  name        = "${var.project_name}-tg"
  protocol    = "HTTP"
  port        = "9292"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    port                = "9292"
    protocol            = "HTTP"
    interval            = "30"
    timeout             = "15"
    healthy_threshold   = "3"
    unhealthy_threshold = "5"
  }

  tags = {
    Name     = "${var.project_name}-tg"
    CostCode = var.cost_code
  }
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}