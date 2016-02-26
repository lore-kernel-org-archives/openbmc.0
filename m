Return-Path: <brad@bwbmail.net>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1E8951A04B8
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 23:52:02 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Subject: Re: [PATCH skeleton v3] skeleton: fixed hard-coding of master OCC
 hwmon sysfs path for PowerCap object
From: Brad Bishop <brad@bwbmail.net>
In-Reply-To: <1456488645-11725-2-git-send-email-openbmc-patches@stwcx.xyz>
Date: Fri, 26 Feb 2016 07:52:10 -0500
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B7312321-087F-4E7A-8450-D8489ABEA3C6@bwbmail.net>
References: <1456488645-11725-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456488645-11725-2-git-send-email-openbmc-patches@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Feb 2016 12:52:04 -0000


> On Feb 26, 2016, at 7:10 AM, OpenBMC Patches =
<openbmc-patches@stwcx.xyz> wrote:
>=20
> From: Yi Li <adamliyi@msn.com>
>=20
> Currently master OCC hwmon sysfs path is hardcoded to =
'/sys/class/hwmon/hwmon3/'.
> This make the '/org/openbmc/sensors/host/PowerCap' interface cannot =
work when
> master OCC is initilized as hwmon device other than 'hwmon3'.
>=20
> 'usr_powercap' attribute should be searched when OCC is active.
> When skeleton creates 'PowerCap' objects, OCC may not be active.
> So do the search each time setting power cap. Raise an exception when
> there is no 'user_powercap' attribute.
>=20
> This would fix the issue: =
https://github.com/openbmc/skeleton/issues/42
>=20
> Also raise an exception when setting power cap fails. The exception
> will be returned to REST API caller. Need to specify the exception
> name to trigger a '400' return code.
> This would fix the issue:
> https://github.com/openbmc/skeleton/issues/43
>=20
> Signed-off-by: Yi Li <adamliyi@msn.com>
> ---
> bin/Sensors.py         | 23 +++++++++++++++++++----
> bin/sensor_manager2.py |  3 ---
> 2 files changed, 19 insertions(+), 7 deletions(-)
>=20
> diff --git a/bin/Sensors.py b/bin/Sensors.py
> index f951eeb..a337a4c 100755
> --- a/bin/Sensors.py
> +++ b/bin/Sensors.py
> @@ -8,6 +8,7 @@ import dbus
> import dbus.service
> import dbus.mainloop.glib
> import os
> +import glob
> import Openbmc
>=20
> ## Abstract class, must subclass
> @@ -137,17 +138,31 @@ class PowerCap(VirtualSensor):
> 	def __init__(self, bus, name):
> 		VirtualSensor.__init__(self, bus, name)
> 		SensorValue.setValue(self, 0)
> -		self.sysfs_attr =3D =
"/sys/class/hwmon/hwmon3/user_powercap"
> 	##override setValue method
> 	@dbus.service.method(SensorValue.IFACE_NAME,
> 		in_signature=3D'v', out_signature=3D'')
> 	def setValue(self, value):
> +		# master occ hwmon path is created dymanically when occ =
is active
> +		# scan hwmon sysfs directory for update
> +		for pcap_file in =
glob.glob('/sys/class/hwmon/*/user_powercap'):
> +			occ_i2c_dev =3D =
os.path.dirname(pcap_file)+'/device'
> +			occ_i2c_dev =3D =
os.path.realpath(occ_i2c_dev).split('/').pop()
> +			if occ_i2c_dev =3D=3D '3-0050':
> +				self.sysfs_attr =3D pcap_file
> +				break
> +		else:
> +			raise dbus.exceptions.DBusException(
> +				"Cannot find user_powercap hwmon =
attribute, "+
> +				"check occ status.",
> +				=
name=3D'org.freedesktop.DBus.Python.TypeError=E2=80=99)

You don=E2=80=99t need a return statement after throwing an exception.

> +			return
> 		try:
> -			cmd_str =3D "echo "+str(value)+" > =
"+self.sysfs_attr
> +			cmd_str =3D 'echo '+str(value)+' > =
'+self.sysfs_attr
> 			ret =3D subprocess.check_output(cmd_str, =
shell=3DTrue)
> 		except subprocess.CalledProcessError as powerexc:
> -			print "Set PowerCap Error", powerexc.returncode,
> -			powerexc.output

Would be nice to know if this was a real error or just user-error.  =
Since this is external, user input, it probably makes sense to do all =
sorts of validation up front before passing it down lower in the stack =
rather than just relying on the called process to do it.

> +			raise dbus.exceptions.DBusException(
> +				"Set PowerCap error: check value range",
> +				=
name=3D'org.freedesktop.DBus.Error.InvalidArgs')
> 			return
> 		print "Set PowerCap: ", value
> 		SensorValue.setValue(self, value)
> diff --git a/bin/sensor_manager2.py b/bin/sensor_manager2.py
> index b5aac53..926bfea 100755
> --- a/bin/sensor_manager2.py
> +++ b/bin/sensor_manager2.py
> @@ -54,9 +54,6 @@ if __name__ =3D=3D '__main__':
>=20
> 	obj_path =3D OBJ_PATH+"/host/PowerCap"
> 	sensor_obj =3D Sensors.PowerCap(bus,obj_path)
> -	## hwmon3 is default for master OCC on Barreleye.
> -	## should rewrite sensor_manager to remove hardcode
> -	sensor_obj.sysfs_attr =3D =
"/sys/class/hwmon/hwmon3/user_powercap"
> 	root_sensor.add(obj_path,sensor_obj)
>=20
> 	obj_path =3D OBJ_PATH+"/host/BootProgress"
> --=20
> 2.7.1
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
