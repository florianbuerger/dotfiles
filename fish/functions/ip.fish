# Defined in /var/folders/zq/7m7jgrrs0_v68d1ptj918f9c0000gn/T//fish.puNCNM/ip.fish @ line 1
function ip
	set -l ip_address (ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}')
  echo "$ip_address"
end
