# Simple Sinatra App

https://github.com/rea-cruitment/simple-sinatra-app

# Prerequisites

- Must have an AWS Account
- Must have docker installed.
- Must have awscli installed and configured for AWS account.
- A ssh key pair with name *rea-sinatra-app-instance-key* in AWS account.

# How to run - Creating infrastructure

- Run *git clone https://github.com/sunilsinghal84/rea-sinatra-app.git* to clone this repository.

- Run *docker build -t sinatra-app:0.1 .* to create a docker image.

- Run *docker run -v <.aws directory absolute path on local>:/root/.aws/ sinatra-app:0.1 scripts/apply.sh*. Use displayed link to access the website.

- Run *docker run -v <.aws directory absolute path on local>:/root/.aws/ sinatra-app:0.1 scripts/destroy.sh* command to destory the infrastructure.

# Accessing app instance
Access to app instance is restricted only to VPC CIDR range. I had created a bastion-host for ssh to app instance for any debugging.

# Sample run showing infrastructure creation
<pre><code>
 $docker run -v /home/sunils/.aws/:/root/.aws/ test:0.1 scripts/apply.sh
Checking if bucket rea-sinatra-app-state-store already exists...
Bucket rea-sinatra-app-state-store does not exist. Creating it...
{
    "Location": "http://rea-sinatra-app-state-store.s3.amazonaws.com/"
}
Ensuring versioning is enabled for bucket...
Ensuring encryption is enabled for bucket...
Ensuring versioning is enabled for bucket...
Ensuring encryption is enabled for bucket...
Done!

Initializing the backend...

Successfully configured the backend "s3"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "aws" (hashicorp/aws) 2.54.0...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.aws: version = "~> 2.54"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
data.aws_vpc.vpc: Refreshing state...
data.aws_subnet_ids.subnets: Refreshing state...
data.aws_caller_identity.current: Refreshing state...
aws_lb_target_group.tg: Refreshing state... [id=arn:aws:elasticloadbalancing:ap-southeast-2:AccountID:targetgroup/rea-sinatra-app-tg/18f73748ffc6164d]
aws_kms_key.kms_key: Refreshing state... [id=d866401a-392d-4e53-ab27-5fd391c038bc]
aws_kms_alias.kms-alias: Refreshing state... [id=alias/rea-sinatra-app-kms-key]
aws_ami_copy.enc_ami: Refreshing state... [id=ami-05d10a716adb5093a]
aws_ami_copy.enc_ami: Creating...
aws_security_group.lb_sg: Creating...
aws_lb_target_group.tg: Creating...
aws_lb_target_group.tg: Creation complete after 2s [id=arn:aws:elasticloadbalancing:ap-southeast-2:AccountID:targetgroup/rea-sinatra-app-tg/a80aeae7d4307e95]
aws_security_group.lb_sg: Creation complete after 2s [id=sg-09ee3f4cbcb338371]
aws_lb.lb: Creating...
aws_security_group.instance_sg: Creating...
aws_security_group.instance_sg: Creation complete after 3s [id=sg-04bd95ecdf3d7b6ab]
aws_ami_copy.enc_ami: Still creating... [10s elapsed]
aws_lb.lb: Still creating... [10s elapsed]
aws_ami_copy.enc_ami: Still creating... [20s elapsed]
aws_lb.lb: Still creating... [20s elapsed]
aws_ami_copy.enc_ami: Still creating... [30s elapsed]
aws_lb.lb: Still creating... [30s elapsed]
aws_ami_copy.enc_ami: Still creating... [40s elapsed]
aws_lb.lb: Still creating... [40s elapsed]
aws_ami_copy.enc_ami: Still creating... [50s elapsed]
aws_lb.lb: Still creating... [50s elapsed]
aws_ami_copy.enc_ami: Still creating... [1m0s elapsed]
aws_lb.lb: Still creating... [1m0s elapsed]
aws_ami_copy.enc_ami: Still creating... [1m10s elapsed]
aws_lb.lb: Still creating... [1m10s elapsed]
aws_ami_copy.enc_ami: Still creating... [1m20s elapsed]
aws_lb.lb: Still creating... [1m20s elapsed]
aws_ami_copy.enc_ami: Still creating... [1m30s elapsed]
aws_lb.lb: Still creating... [1m30s elapsed]
aws_ami_copy.enc_ami: Still creating... [1m40s elapsed]
aws_lb.lb: Still creating... [1m40s elapsed]
aws_ami_copy.enc_ami: Still creating... [1m50s elapsed]
aws_lb.lb: Still creating... [1m50s elapsed]
aws_ami_copy.enc_ami: Still creating... [2m0s elapsed]
aws_lb.lb: Still creating... [2m0s elapsed]
aws_ami_copy.enc_ami: Still creating... [2m10s elapsed]
aws_lb.lb: Still creating... [2m10s elapsed]
aws_ami_copy.enc_ami: Still creating... [2m20s elapsed]
aws_lb.lb: Still creating... [2m20s elapsed]
aws_lb.lb: Creation complete after 2m25s [id=arn:aws:elasticloadbalancing:ap-southeast-2:AccountID:loadbalancer/app/rea-sinatra-app-lb/de873e23c1073d95]
aws_lb_listener.lb_listener: Creating...
aws_lb_listener.lb_listener: Creation complete after 0s [id=arn:aws:elasticloadbalancing:ap-southeast-2:AccountID:listener/app/rea-sinatra-app-lb/de873e23c1073d95/d8a7ee2f0d48307c]
aws_ami_copy.enc_ami: Still creating... [2m30s elapsed]
aws_ami_copy.enc_ami: Still creating... [2m40s elapsed]
aws_ami_copy.enc_ami: Still creating... [2m50s elapsed]
aws_ami_copy.enc_ami: Still creating... [3m0s elapsed]
aws_ami_copy.enc_ami: Still creating... [3m10s elapsed]
aws_ami_copy.enc_ami: Still creating... [3m20s elapsed]
aws_ami_copy.enc_ami: Still creating... [3m30s elapsed]
aws_ami_copy.enc_ami: Still creating... [3m40s elapsed]
aws_ami_copy.enc_ami: Still creating... [3m50s elapsed]
aws_ami_copy.enc_ami: Still creating... [4m0s elapsed]
aws_ami_copy.enc_ami: Still creating... [4m10s elapsed]
aws_ami_copy.enc_ami: Still creating... [4m20s elapsed]
aws_ami_copy.enc_ami: Still creating... [4m30s elapsed]
aws_ami_copy.enc_ami: Still creating... [4m40s elapsed]
aws_ami_copy.enc_ami: Still creating... [4m50s elapsed]
aws_ami_copy.enc_ami: Still creating... [5m0s elapsed]
aws_ami_copy.enc_ami: Still creating... [5m10s elapsed]
aws_ami_copy.enc_ami: Creation complete after 5m11s [id=ami-024476c8388fd4b20]
aws_launch_template.lt: Creating...
aws_launch_template.lt: Creation complete after 0s [id=lt-05409ebe5aaf21e52]
aws_autoscaling_group.asg: Creating...
aws_autoscaling_group.asg: Still creating... [10s elapsed]
aws_autoscaling_group.asg: Still creating... [20s elapsed]
aws_autoscaling_group.asg: Still creating... [30s elapsed]
aws_autoscaling_group.asg: Still creating... [40s elapsed]
aws_autoscaling_group.asg: Creation complete after 41s [id=rea-sinatra-app-asg]

Apply complete! Resources: 8 added, 0 changed, 0 destroyed.

Outputs:

website_url = http://rea-sinatra-app-lb-382902837.ap-southeast-2.elb.amazonaws.com/
Please wait, your website is coming up and will soon be available.....
Please wait, your website is coming up and will soon be available.....
Please wait, your website is coming up and will soon be available.....
Please wait, your website is coming up and will soon be available.....
Please wait, your website is coming up and will soon be available.....
Please wait, your website is coming up and will soon be available.....
Please wait, your website is coming up and will soon be available.....
Please wait, your website is coming up and will soon be available.....
Please wait, your website is coming up and will soon be available.....
Please wait, your website is coming up and will soon be available.....
Please wait, your website is coming up and will soon be available.....
Please wait, your website is coming up and will soon be available.....
Hurray!!!, Your website is up and running now, thanks for your patience
Please use 'http://rea-sinatra-app-lb-382902837.ap-southeast-2.elb.amazonaws.com/' to access the application
</code></pre>

# Sample run showing infrastructure destroy

<pre><code>

$ docker run -v /home/sunils/.aws/:/root/.aws/ test:0.1 scripts/destroy.sh
Checking if bucket rea-sinatra-app-state-store already exists...
Bucket rea-sinatra-app-state-store already exists, not creating it again.
Ensuring versioning is enabled for bucket...
Ensuring encryption is enabled for bucket...
Done!

Initializing the backend...

Successfully configured the backend "s3"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "aws" (hashicorp/aws) 2.54.0...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.aws: version = "~> 2.54"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
data.aws_subnet_ids.subnets: Refreshing state...
data.aws_vpc.vpc: Refreshing state...
aws_lb_target_group.tg: Refreshing state... [id=arn:aws:elasticloadbalancing:ap-southeast-2:AccountID:targetgroup/rea-sinatra-app-tg/a80aeae7d4307e95]
data.aws_caller_identity.current: Refreshing state...
aws_security_group.lb_sg: Refreshing state... [id=sg-09ee3f4cbcb338371]
aws_lb.lb: Refreshing state... [id=arn:aws:elasticloadbalancing:ap-southeast-2:AccountID:loadbalancer/app/rea-sinatra-app-lb/de873e23c1073d95]
aws_security_group.instance_sg: Refreshing state... [id=sg-04bd95ecdf3d7b6ab]
aws_lb_listener.lb_listener: Refreshing state... [id=arn:aws:elasticloadbalancing:ap-southeast-2:AccountID:listener/app/rea-sinatra-app-lb/de873e23c1073d95/d8a7ee2f0d48307c]
aws_kms_key.kms_key: Refreshing state... [id=d866401a-392d-4e53-ab27-5fd391c038bc]
aws_kms_alias.kms-alias: Refreshing state... [id=alias/rea-sinatra-app-kms-key]
aws_ami_copy.enc_ami: Refreshing state... [id=ami-024476c8388fd4b20]
aws_launch_template.lt: Refreshing state... [id=lt-05409ebe5aaf21e52]
aws_autoscaling_group.asg: Refreshing state... [id=rea-sinatra-app-asg]
aws_kms_alias.kms-alias: Destroying... [id=alias/rea-sinatra-app-kms-key]
aws_lb_listener.lb_listener: Destroying... [id=arn:aws:elasticloadbalancing:ap-southeast-2:AccountID:listener/app/rea-sinatra-app-lb/de873e23c1073d95/d8a7ee2f0d48307c]
aws_autoscaling_group.asg: Destroying... [id=rea-sinatra-app-asg]
aws_kms_alias.kms-alias: Destruction complete after 0s
aws_lb_listener.lb_listener: Destruction complete after 0s
aws_lb.lb: Destroying... [id=arn:aws:elasticloadbalancing:ap-southeast-2:AccountID:loadbalancer/app/rea-sinatra-app-lb/de873e23c1073d95]
aws_lb.lb: Destruction complete after 1s
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 10s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 20s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 30s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 40s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 50s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 1m0s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 1m10s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 1m20s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 1m30s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 1m40s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 1m50s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 2m0s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 2m10s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 2m20s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 2m30s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 2m40s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 2m50s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 3m0s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 3m10s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 3m20s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 3m30s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 3m40s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 3m50s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 4m0s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 4m10s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 4m20s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 4m30s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 4m40s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 4m50s elapsed]
aws_autoscaling_group.asg: Still destroying... [id=rea-sinatra-app-asg, 5m0s elapsed]
aws_autoscaling_group.asg: Destruction complete after 5m0s
aws_lb_target_group.tg: Destroying... [id=arn:aws:elasticloadbalancing:ap-southeast-2:AccountID:targetgroup/rea-sinatra-app-tg/a80aeae7d4307e95]
aws_launch_template.lt: Destroying... [id=lt-05409ebe5aaf21e52]
aws_launch_template.lt: Destruction complete after 1s
aws_ami_copy.enc_ami: Destroying... [id=ami-024476c8388fd4b20]
aws_security_group.instance_sg: Destroying... [id=sg-04bd95ecdf3d7b6ab]
aws_lb_target_group.tg: Destruction complete after 1s
aws_security_group.instance_sg: Destruction complete after 0s
aws_security_group.lb_sg: Destroying... [id=sg-09ee3f4cbcb338371]
aws_security_group.lb_sg: Destruction complete after 1s
aws_ami_copy.enc_ami: Destruction complete after 5s
aws_kms_key.kms_key: Destroying... [id=d866401a-392d-4e53-ab27-5fd391c038bc]
aws_kms_key.kms_key: Still destroying... [id=d866401a-392d-4e53-ab27-5fd391c038bc, 10s elapsed]
aws_kms_key.kms_key: Destruction complete after 20s

Destroy complete! Resources: 10 destroyed.
</code></pre>

# Website - Up and running

![REA Sinatra App](./rea-sinatra-app.png?raw=true "REA Sinatra App")