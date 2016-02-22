Return-Path: <andrew@aj.id.au>
Received: from homiemail-a19.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id EA3231A0350
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 12:32:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=bV5oRxwX; 
 dkim-atps=neutral
Received: from homiemail-a19.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTP id B8CD5604076;
 Sun, 21 Feb 2016 17:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=h1gM6ed3hk+JxFfyx6HNO
 Wd8obE=; b=bV5oRxwXBy982TTjCJfY/C2UeTBqf8Dmz7/pOvDfdoxMbCBoIb6pB
 T8OqGkrvTdWNK8RgdPlb1R0R1Gsjt385cnwBx9qG/8bh3NnRUn0sFf2FqE/FyKn5
 2SLT4DPyvPWgl1UicALT6dfG9YsujlHjvBb/md7d+SsPzQgrSnN2ko=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTPSA id 04BD8604061;
 Sun, 21 Feb 2016 17:32:10 -0800 (PST)
Message-ID: <1456104727.3064.29.camel@aj.id.au>
Subject: Re: [PATCH skeleton] skeleton: fixed hard-coding for master OCC
 hwmon sysfs path
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Mon, 22 Feb 2016 12:02:07 +1030
In-Reply-To: <1455909058-21748-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455909058-21748-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455909058-21748-2-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-PwIRfdEuKNgjH86k+1w6"
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
X-List-Received-Date: Mon, 22 Feb 2016 01:32:13 -0000


--=-PwIRfdEuKNgjH86k+1w6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yi Li,

On Fri, 2016-02-19 at 13:10 -0600, OpenBMC Patches wrote:
> From: Yi Li <adamliyi@msn.com>
>=20
> Currently master OCC hwmon sysfs path is hardcoded to '/sys/class/hwmon/h=
wmon3/'.
> This make the '/org/openbmc/sensors/host/PowerCap' interface cannot work =
when
> master OCC is initilized as hwmon device other than 'hwmon3'.
>=20
> This would fix the issue: https://github.com/openbmc/skeleton/issues/42
>=20
> Signed-off-by: Yi Li <adamliyi@msn.com>
> ---
>  bin/sensor_manager2.py | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/bin/sensor_manager2.py b/bin/sensor_manager2.py
> index b5aac53..4fc9dc2 100755
> --- a/bin/sensor_manager2.py
> +++ b/bin/sensor_manager2.py
> @@ -2,6 +2,7 @@
> =20
>  import sys
>  import os
> +import glob
>  import gobject
>  import dbus
>  import dbus.service
> @@ -54,9 +55,13 @@ if __name__ =3D=3D '__main__':
> =20
>  > 	> obj_path =3D OBJ_PATH+"/host/PowerCap"
>  > 	> sensor_obj =3D Sensors.PowerCap(bus,obj_path)
> -> 	> ## hwmon3 is default for master OCC on Barreleye.
> -> 	> ## should rewrite sensor_manager to remove hardcode
> -> 	> sensor_obj.sysfs_attr =3D "/sys/class/hwmon/hwmon3/user_powercap"
> +> 	> ## scan hwmon sysfs for master occ's user_powercap attribute
> +> 	> for pcap_file in glob.glob('/sys/class/hwmon/*/user_powercap'):
> +> 	> 	> occ_i2c_dev =3D os.path.dirname(pcap_file)+'/device'
> +> 	> 	> occ_i2c_dev =3D os.path.realpath(occ_i2c_dev).split('/').pop()
> +> 	> 	> # master OCC address
> +> 	> 	> if occ_i2c_dev =3D=3D '3-0050':
> +> 	> 	> 	> sensor_obj.sysfs_attr =3D pcap_file

Have you tested the code in the for loop? Because running the body in a
Python shell doesn't give me confidence the if-condition will ever be
satisfied:

    andrew@keelia    :~$ python
    Python 2.7.10 (default, Oct 14 2015, 16:09:02)=20
    [GCC 5.2.1 20151010] on linux2
    Type "help", "copyright", "credits" or "license" for more information.
    >>> import os
    >>> pcap_file =3D     "/sys/class/hwmon/hwmon3/user_powercap"
>>> os.path.dirname(pcap_file)+"/device"
'/sys/class/hwmon/hwmon3/device'
>>> os.path.realpath(_).split('/')
['', 'sys', 'class', 'hwmon', 'hwmon3', 'device']
>>> _.pop()
'device'
>>>=20

I can't see how occ_i2c_dev will ever take the value '3-0050'? Are we
missing additional globbing and/or reading of files?

>  	root_sensor.add(obj_path,sensor_obj)

Have you given consideration to what should be done if the if-condition
in the for loop above never fires? Is it still valid to add sensor_obj?

Andrew

> =20
>  > 	> obj_path =3D OBJ_PATH+"/host/BootProgress"
--=-PwIRfdEuKNgjH86k+1w6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJWymUXAAoJEJ0dnzgO5LT5PLAP/Aizci/+oi/5VvYJZeqijrZL
Z/HPLXsTsqjOUAS0oLL5V/hj0Xn3pZUO+wpogbhSYzQU93TcF39beoNRFx7E7G5P
V6QR8Yyn++RI9mmpVUknEj0cn4TWBREj4XeIG6md+mmZX83aCH0Id3jZmWNz1l+c
kvzXQGAvQX+MLJ7i+9DdiNzHoBVxL8rCk+1WNftTEwb8C3SlAvM7k0FqHsdya4d6
xkbbIqAa6zI+XOkhi9oZs7sC3+D29Ia5hF/pJK7cYWsIDwVoq0rbgsyYTG7TuFbk
Mei1ftJENR5Kl7fylMnQN8lJsuWc6w1LFne2f+6XABvMQG4v7Tgu3SmbNCwXKbx7
taVRIeSal42KJnxOm3z35HMYNaxHrwOn6sl6VJ3HCl18Ph9oDXxEJVOrnbofabJ5
z82h8qZfHrpzlkU7Dnt8BEThVHSo6aFxY0VqbPCWW8fhmCDXatrV1Qn6Xd/6qHk0
RQr9BWKgHFPxIM5Rkz682T/WDCQY1sl/pFszJ9ag/T3UdJoMz1F+9mVVhuI46D2D
O61/5rF3j6G5LYC+RzoKL4CIQf+7++17SDEJUQOomtOTx0vxOR6/FHAOnXvEEpAb
oPS7Y6uLhMv0qOSFCgkc4jDigd9p6JfKo2ZuDbqdeFboCEnIfWHubcE2EhhlsrQj
MAmL+c447i5UkGmazMoO
=szK/
-----END PGP SIGNATURE-----

--=-PwIRfdEuKNgjH86k+1w6--
