Return-Path: <andrew@aj.id.au>
Received: from homiemail-a15.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id EFA621A0118
 for <openbmc@lists.ozlabs.org>; Mon,  7 Mar 2016 12:41:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=x+YGUGU9; 
 dkim-atps=neutral
Received: from homiemail-a15.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTP id 258DE76C06B;
 Sun,  6 Mar 2016 17:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=VtAplLe84aRQnV0T9TjVW
 ocCmlc=; b=x+YGUGU9dUPqa9xDvknO8SIKvn8F4oAZL3EpQ9kVaFNDwJgKtb/EF
 FB8ZxKR1uJbjxztQPRT6J3GLqslaMRTkLr0QQW1Cq000cqydJ379xV5kDIeskTnm
 6wDZnWnmGlExNTwGGc5G/ctj0FK6xaGP14Kgsbn0zOmpq/C88dQVEo=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTPSA id 599AF76C065;
 Sun,  6 Mar 2016 17:41:33 -0800 (PST)
Message-ID: <1457314885.10265.64.camel@aj.id.au>
Subject: Re: [PATCH skeleton v5] skeleton: fixed hard-coding of master OCC
 hwmon sysfs path for PowerCap object
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Mon, 07 Mar 2016 12:11:25 +1030
In-Reply-To: <1457085043-32380-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457085043-32380-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457085043-32380-2-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-peVv02VE6PbJP1uA04nZ"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 07 Mar 2016 01:41:38 -0000


--=-peVv02VE6PbJP1uA04nZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yi Li,

On Fri, 2016-03-04 at 03:50 -0600, OpenBMC Patches wrote:
> From: Yi Li <adamliyi@msn.com>
>=20
> Currently master OCC hwmon sysfs path is hardcoded to '/sys/class/hwmon/h=
wmon3/'.
> This make the '/org/openbmc/sensors/host/PowerCap' interface cannot work =
when
> master OCC is initilized as hwmon device other than 'hwmon3'.
>=20
> 'usr_powercap' attribute should be searched when OCC is active.
> When skeleton creates 'PowerCap' objects, OCC may not be active.
> So do the search each time setting power cap. Raise an exception when
> there is no 'user_powercap' attribute.
> Fixes: openbmc/skeleton#42
>=20
> Also raise an exception when setting power cap fails. The exception
> will be returned to REST API caller. Need to specify the exception
> name to trigger a '400' return code.
> Fixes: openbmc/skeleton#43
>=20
> Add code to validate input user powercap value.
>=20
> Changed the logic of "reading powercap" using PowerCap.getValue().
> Previously PowerCap.getValue() returns current user set powercap value.
> Now PowerCap.getValue() returns actual system powercap reading from OCC.

Taking the commit message at face value it sounds like this should be
split into multiple commits.

>=20
> Signed-off-by: Yi Li <adamliyi@msn.com>
> ---
>  bin/Sensors.py         | 84 ++++++++++++++++++++++++++++++++++++++++++++=
------
>  bin/sensor_manager2.py |  3 --
>  2 files changed, 75 insertions(+), 12 deletions(-)
>=20
> diff --git a/bin/Sensors.py b/bin/Sensors.py
> index f951eeb..6f5bc33 100755
> --- a/bin/Sensors.py
> +++ b/bin/Sensors.py
> @@ -1,13 +1,13 @@
>  #!/usr/bin/python -u
> =20
>  import sys
> -import subprocess
>  #from gi.repository import GObject
>  import gobject
>  import dbus
>  import dbus.service
>  import dbus.mainloop.glib
>  import os
> +import glob
>  import Openbmc
> =20
>  ## Abstract class, must subclass
> @@ -137,21 +137,87 @@ class PowerCap(VirtualSensor):
>  > 	> def __init__(self, bus, name):
>  > 	> 	> VirtualSensor.__init__(self, bus, name)
>  > 	> 	> SensorValue.setValue(self, 0)
> -> 	> 	> self.sysfs_attr =3D "/sys/class/hwmon/hwmon3/user_powercap"
>  > 	> ##override setValue method
>  > 	> @dbus.service.method(SensorValue.IFACE_NAME,
>  > 	> 	> in_signature=3D'v', out_signature=3D'')
>  > 	> def setValue(self, value):
>  > 	> 	> try:
> -> 	> 	> 	> cmd_str =3D "echo "+str(value)+" > "+self.sysfs_attr
> -> 	> 	> 	> ret =3D subprocess.check_output(cmd_str, shell=3DTrue)
> -> 	> 	> except subprocess.CalledProcessError as powerexc:
> -> 	> 	> 	> print "Set PowerCap Error", powerexc.returncode,
> -> 	> 	> 	> powerexc.output
> -> 	> 	> 	> return
> +> 	> 	> 	> value =3D int(value)
> +> 	> 	> except ValueError:
> +> 	> 	> 	> raise dbus.exceptions.DBusException(
> +> 	> 	> 	> 	> "Set an integer value",
> +> 	> 	> 	> 	> name=3D'org.freedesktop.DBus.Python.TypeError')
> +
> +> 	> 	> # master occ hwmon path is created dymanically
> +> 	> 	> # when occ is active scan hwmon sysfs directory for update
> +> 	> 	> for pcap_file in glob.glob('/sys/class/hwmon/*/user_powercap'):
> +> 	> 	> 	> occ_i2c_dev =3D os.path.dirname(pcap_file)+'/device'

Apologies for not raising some of these issues when I responded to your
initial patch. But:

os.path.join() gives us a way to avoid using string concatenation for
path building. Maybe we could do something like:

    for pcap_file in glob.glob('/sys/class/hwmon/*/user_powercap'):
     pcap_dir =3D os.path.dirname(pcap_file)
     occ_i2c_dev =3D os.path.join(pcap_dir, "device")

> +			occ_i2c_dev =3D os.path.realpath(
> +> 	> 	> 	> 	> 	> occ_i2c_dev).split('/').pop()

Again I think we could be taking better advantage of the os.path
methods - it has a basename() which I believe will provide what you
want:

     occ_i2c_dev =3D os.path.basename(os.path.realpath(occ_i2c_dev))

> +			if occ_i2c_dev =3D=3D '3-0050':
> +> 	> 	> 	> 	> setcap_file =3D pcap_file
> +> 	> 	> 	> 	> break
> +> 	> 	> else:

So I learnt something new here - loops can have else cases[1]. It hurt
my brain a little but again [1] documents this approach as a good use
-case for the feature. Without knowing of the feature I probably
would've done something like:

    from os import path as p # reduce verbosity for purpose of example

    def upc_to_dev(user_powercap):
        return p.realpath(p.join(p.dirname(user_powercap), 'device'))

    def setValue(self, value):
        ...
        upc_pattern =3D         '/sys/class/hwmon/*/user_powercap'
setcap_files =3D [ x for x in glob.glob(upc_pattern)
                   if p.basename(upc_to_dev(x)) =3D=3D '3-0050' ]

if not setcap_files:
    raise dbusexceptions.DBusException(...)

setcap_file =3D setcap_files[0]

Does that improve the readability? Reduce it (e.g. use of list
comprehension)? Maybe I'm just bikeshedding here, but the for/else
concept was quite a surprise to me.

[1] http://python-notes.curiousefficiency.org/en/latest/python_concepts/bre=
ak_else.html

> +			raise dbus.exceptions.DBusException(
> +> 	> 	> 	> 	> "Cannot find user_powercap hwmon attribute, "+
> +> 	> 	> 	> 	> "check occ status.",
> +> 	> 	> 	> 	> name=3D'org.freedesktop.DBus.Python.TypeError')
> +
> +> 	> 	> # verify the user set value is in the range [min_cap, max_cap]

Can you please extract this out to a helper? Something like

def get_powercap_range(cap_file):
    ...
    return min_cap, max_cap

> +		try:
> +> 	> 	> 	> caps_file =3D open(os.path.dirname(setcap_file) +
> +> 	> 	> 	> 	> 	> '/caps_min_powercap', 'r')

Searching for 'close' gives no hits - we're leaking this resource?
Maybe we should be using contexts:

    try:
        with open(.../caps_min_powercap) as f_min:
            with open(.../caps_max_powercap) as f_max:
               return int(f_min.readline()), int(f_max.readline())
    except IOError:
        raise dbus.exceptions.DBusException(...)


Separately, os.path.join() again here, instead of string concat.

> +			min_cap =3D caps_file.readline()
> +> 	> 	> 	> caps_file =3D open(os.path.dirname(setcap_file) +
> +> 	> 	> 	> 	> 	> '/caps_max_powercap', 'r')
> +> 	> 	> 	> max_cap =3D caps_file.readline()
> +> 	> 	> except IOError:
> +> 	> 	> 	> raise dbus.exceptions.DBusException(
> +> 	> 	> 	> 	> "Cannot get caps_min or caps_max",
> +> 	> 	> 	> 	> name=3D'org.freedesktop.DBus.Error.InvalidArgs')
> +
> +		if value !=3D 0 and (value < int(min_cap)
> +> 	> 	> 	> 	> or value > int(max_cap)):

This can just be:

    min_cap, max_cap =3D get_powercap_range(setcaps_file)
    if min_cap < value < max_cap:

for the condition, with

       try:
            with open(setcap_file, 'w') as f:
                f.write(str(value))
        except IOError:
           raise dbus.exceptions.DBusException(...)
        else:
            print "Set PowerCap: ", value
            SensorValue.setValue(self, value)
    else:
       raise dbus.exceptions.DBusException(...)

as the if/else bodies.

> +			raise dbus.exceptions.DBusException(
> +> 	> 	> 	> 	> "Set a value in the range [%d, %d]"
> +> 	> 	> 	> 	> % (int(min_cap), int(max_cap)),
> +> 	> 	> 	> 	> name=3D'org.freedesktop.DBus.Error.InvalidArgs')
> +
> +> 	> 	> try:
> +> 	> 	> 	> open(setcap_file, 'w').write(str(value));

Using the context as above prevents leaking the open file resource.

> +		except IOError:
> +> 	> 	> 	> raise dbus.exceptions.DBusException(
> +> 	> 	> 	> 	> "Cannot set PowerCap",
> +> 	> 	> 	> 	> name=3D'org.freedesktop.DBus.Python.TypeError')
>  > 	> 	> print "Set PowerCap: ", value
>  > 	> 	> SensorValue.setValue(self, value)
> -> 	> =09
> +> 	> @dbus.service.method(SensorValue.IFACE_NAME,
> +> 	> 	> in_signature=3D'', out_signature=3D'v')
> +> 	> def getValue(self):
> +> 	> 	> # Read current powercap sensor. OCC will set system powercap
> +> 	> 	> # based on its algorithm

This is a copy/paste of the 'find-the-device' logic. Can we please
extract it to a helper method? This is partly resolved in my
alternative above.

> +		for pcap_file in glob.glob(
> +> 	> 	> 	> 	> '/sys/class/hwmon/*/caps_curr_powercap'):
> +> 	> 	> 	> occ_i2c_dev =3D os.path.dirname(pcap_file)+'/device'
> +> 	> 	> 	> occ_i2c_dev =3D os.path.realpath(
> +> 	> 	> 	> 	> 	> occ_i2c_dev).split('/').pop()
> +> 	> 	> 	> if occ_i2c_dev =3D=3D '3-0050':
> +> 	> 	> 	> 	> curr_cap_file =3D pcap_file
> +> 	> 	> 	> 	> break
> +> 	> 	> else:
> +> 	> 	> 	> raise dbus.exceptions.DBusException(
> +> 	> 	> 	> 	> "Cannot find caps_curr_powercap" +
> +> 	> 	> 	> 	> "hwmon attribute, " + "check occ status.",
> +> 	> 	> 	> 	> name=3D'org.freedesktop.DBus.Python.TypeError')
> +
> +> 	> 	> try:
> +> 	> 	> 	> cap_val =3D open(curr_cap_file, 'r').read()

Again, file isn't closed, probably best use contexts?

> +		except IOError:
> +> 	> 	> 	> raise dbus.exceptions.DBusException(
> +> 	> 	> 	> 	> "Cannot read current powercap",
> +> 	> 	> 	> 	> name=3D'org.freedesktop.DBus.Python.TypeError')
> +> 	> 	> return cap_val

This is fine as a str? Should it be an int?

> +
>  class BootProgressSensor(VirtualSensor):
>  > 	> def __init__(self,bus,name):
>  > 	> 	> VirtualSensor.__init__(self,bus,name)
> diff --git a/bin/sensor_manager2.py b/bin/sensor_manager2.py
> index b5aac53..926bfea 100755
> --- a/bin/sensor_manager2.py
> +++ b/bin/sensor_manager2.py
> @@ -54,9 +54,6 @@ if __name__ =3D=3D '__main__':
> =20
>  > 	> obj_path =3D OBJ_PATH+"/host/PowerCap"
>  > 	> sensor_obj =3D Sensors.PowerCap(bus,obj_path)
> -> 	> ## hwmon3 is default for master OCC on Barreleye.
> -> 	> ## should rewrite sensor_manager to remove hardcode
> -> 	> sensor_obj.sysfs_attr =3D "/sys/class/hwmon/hwmon3/user_powercap"
>  > 	> root_sensor.add(obj_path,sensor_obj)
> =20
>  > 	> obj_path =3D OBJ_PATH+"/host/BootProgress"

Cheers,

Andrew
--=-peVv02VE6PbJP1uA04nZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJW3NxGAAoJEJ0dnzgO5LT5gnIP/1/qL0XChfDP/7AZeHMWU6gy
8yQlQXEV4KEgXDLmJaCzFmGNpwg4DwU+4/rGUa4V1oimsGPSQ7eKFukxS1wzgJaR
taf4Bh8Ulfo1RuUw9oxrrArEM83nQNo0FFcg4ZCDkrXgGID2PXwB1yzb4s4XbvDv
IDQ8Yp+c7l32XLQQn/gSVeAnLrCSWIYWGwT28ntviW2tgjEUl9TI5ax39740ukF8
VlZPRIc6dSk+uaT90wN0W5a3XGoTmK4rKHjmGbc1KwqLeQwqm/IQld6j/V6MNPYM
udy3rduZBRVzrJAj8F5LFRv0NzTytjtwsD1D3ZTHcG28SmkVGCL3WrE183/Gwe87
3whM7iB8uE4quTMm9Pu7Lj2sZhqDf6mgZh9yhuu9erw1Rgra4VbyEALgNA+jTwAG
jvlee3q9CU57KQhsthPJePUeBJNghy9ESfYgO0hgML7Y+CT8dCEZ8On9IZWHIF95
qM7Zpf2E/993EmgM83pn4i7LoVB+roOKrpkyf300P8egalfwlm2Ymr9mVHcPozOl
HN7/60ie/VkJ9X6Xd5OxkXG9hWwflcYf6X9bmaStR41JUD4LRitkJjz3LyehBh9M
q3m7W7AVUUoI5o8ZQilJVUdT7Yr1YA//NYCQld+gqOUYIGlIaEXEexIsO7n2Am9a
pxF3pd41bLGFd3RthFgq
=jXgR
-----END PGP SIGNATURE-----

--=-peVv02VE6PbJP1uA04nZ--
