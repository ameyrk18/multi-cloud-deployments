/*
dynamically get the environment name which will be used
in the cluster name
*/
locals {
  env = element(split("/", path.cwd), length(split("/", path.cwd)) - 2 )
}