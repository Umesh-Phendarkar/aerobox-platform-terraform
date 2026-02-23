# ---------------------------------------------------
# Key Pair Creation from PEM
# ---------------------------------------------------

resource "aws_key_pair" "this" {
  key_name   = "${var.project_name}-key"
  public_key = file(var.public_key_path)
}

# ---------------------------------------------------
# Launch Template
# ---------------------------------------------------

resource "aws_launch_template" "this" {
  name_prefix   = "${var.project_name}-lt-"
  image_id      = var.ami
  instance_type = "t3.micro"
  key_name      = aws_key_pair.this.key_name

  vpc_security_group_ids = [var.app_sg]

  user_data = base64encode(<<EOF
#!/bin/bash
yum update -y
yum install -y python3
pip3 install flask

cat <<EOT > /home/ec2-user/app.py
from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "<h1>AeroBox Working</h1>"

app.run(host="0.0.0.0", port=3000)
EOT

nohup python3 /home/ec2-user/app.py &
EOF
  )
}

# ---------------------------------------------------
# Auto Scaling Group (Public Subnets)
# ---------------------------------------------------

resource "aws_autoscaling_group" "this" {
  name                = "${var.project_name}-asg"
  desired_capacity    = 1
  max_size            = 1
  min_size            = 1
  vpc_zone_identifier = var.public_subnets
  health_check_type   = "EC2"

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]

  tag {
    key                 = "Name"
    value               = "${var.project_name}-ec2"
    propagate_at_launch = true
  }
}
