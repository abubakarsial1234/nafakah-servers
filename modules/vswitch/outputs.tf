output "vswitch_id" {
  value = data.alicloud_vswitches.vswitch.vswitches[0].id
}