provider "aws" {
	access_key = "AKIA4SWOYCBKZHUWPQAZ"
	secret_key = "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"
	region = "ap-south-1"
}

resource "aws_instance" "ec2-1" {
	ami = "ami-0b44050b2d893d5f7"
	instance_type = "t2.micro"
}

resource "aws_instance" "ec2-2" {
	ami = "ami-0b44050b2d893d5f7"
	instance_type = "t2.micro"
}

resource "aws_s3_bucket" "bucket-1" {
	bucket = "test-bucket-1"
	acl = "private"
	
	tags {
		Name = "Terraform bucket"
		Environment = "Dev-Env"
	}
	
}

resource "aws_ebs_volume" "ebs-volume-1" {
	availability_zone = "ap-south-1"
	size = 8
	type = "gp2"
	tags {
		Name = "volume data"
	}
}

resource "aws_volume_attachment" "ebs-volume-1-attach" {
	device_name = "/dev/xvdh"
	volume_id = "${aws_ebs_volume.ebs-volume-1.id}"
	instance_id = "${aws_instance.ec2-1.id}"
}


resource "aws_ebs_volume" "ebs-volume-2" {
	availability_zone = "ap-south-1"
	size = 10
	type = "gp2"
	tags {
		Name = "volume data"
	}
}

resource "aws_volume_attachment" "ebs-volume-2-attach" {
	device_name = "/dev/xvdh"
	volume_id = "${aws_ebs_volume.ebs-volume-2.id}"
	instance_id = "${aws_instance.ec2-2.id}"
}


