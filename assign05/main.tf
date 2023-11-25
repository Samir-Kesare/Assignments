module "vpc" {
    source = "./module_vpc"
    vpc_cidr = var.vpc_cidr
    vpc_name = var.vpc_name
}
module "subnet" {
    source = "./module_subnet"
    vpc_id = module.vpc.vpc_id
    pub_sub_cidr = var.pub_sub_cidr
    pri_sub_cidr = var.pri_sub_cidr
    availability_zones = var.availability_zones
}
module "igw" {
    source = "./module_igw"
    igw_name = var.igw_name
    vpc_id = module.vpc.vpc_id
}
module "elastic_ip" {
    source = "./module_elastic_ip"
}
module "nat" {
    source = "./module_nat"
    elastic_ip = module.elastic_ip.elastic_ip_id
    subnet_id = module.subnet.pub_sub_ids[0]
    nat_name = var.nat_name
}
module "rt" {
    source= "./module_rt"
    vpc_id = module.vpc.vpc_id
    aws_internet_gateway_id = module.igw.aws_internet_gateway_id
    pub_route_table_name = var.pub_route_table_name
    pri_route_table_name = var.pri_route_table_name
    pub_subnet_id = module.subnet.pub_sub_ids
    pri_subnet_id = module.subnet.pri_sub_ids
    nat_gateway_id = module.nat.nat_gateway_id
}
module "security_group" {
    source = "./module_security_group" 
    pub_sg_name = var.pub_sg_name
    pri_sg_name = var.pri_sg_name
    ingress_ports = var.ingress_ports
    vpc_id = module.vpc.vpc_id
}
module "instance" {
    source = "./module_instance"
    ami_id = data.aws_ami.ubuntu.id
    # key_pair = module.key_pair.key_pair_id
    key_pair_name = module.key_pair.key_pair_name
    pub_instance_type = var.pub_instance_type
    pri_instance_type = var.pri_instance_type
    vpc_pubsecurity_group_id = [module.security_group.vpc_pubsecurity_group_id]
    vpc_prisecurity_group_id = [module.security_group.vpc_prisecurity_group_id]
    pub_instance_name = var.pub_instance_name
    pri_instance_name = var.pri_instance_name
    subnet_pub_sub_ids = module.subnet.pub_sub_ids[0]
    subnet_pri_sub_ids = module.subnet.pri_sub_ids[0]
}
module "key_pair" {
    source = "./module_key_pair"
    key_pair_name = var.key_pair_name
    # public_key = var.public_key
}


