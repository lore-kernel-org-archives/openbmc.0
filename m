Return-Path: <andrew@aj.id.au>
Received: from homiemail-a101.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3hJ73pkPzDq68
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 11:20:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=nHDnTDbS; 
 dkim-atps=neutral
Received: from homiemail-a101.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a101.g.dreamhost.com (Postfix) with ESMTP id 71B74117E06A;
 Mon,  9 May 2016 18:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=klmuNHu+rIGu7vNV10DAy
 O2ZmLc=; b=nHDnTDbSZTTBP1C4LLYN8jOpZj+4VMDzWHP2x3DhJrics5oUqzNKW
 c80GOu7P8IiXwX22TEdrSiaOtdZ24ZZ0MVIys/3Pb5SlJDz5UaQZx1iAGB+3UI+B
 bXBBrKzq3lK1pyGm1FyVG3y5T0Z30hu2Q631dEHBS6srQ6JHlD/1D0=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a101.g.dreamhost.com (Postfix) with ESMTPSA id 43647117E065;
 Mon,  9 May 2016 18:20:03 -0700 (PDT)
Message-ID: <1462843194.2744.4.camel@aj.id.au>
Subject: Re: [PATCH skeleton v2] [skeleton]: Fix hard-coded path name when
 creating sensor object
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Tue, 10 May 2016 10:49:54 +0930
In-Reply-To: <1462780867-13772-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462780867-13772-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1462780867-13772-2-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-PjwrYYe2LZEUt1ikQjnm"
X-Mailer: Evolution 3.18.5.2-0ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2016 01:20:09 -0000


--=-PjwrYYe2LZEUt1ikQjnm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-05-09 at 03:01 -0500, OpenBMC Patches wrote:
> From: Yi Li <adamliyi@msn.com>
>=20
> This patch fixes skeleton issue: https://github.com/openbmc/skeleton/issu=
es/33
> The non-poll sensors have system specific properties. Define the sensor p=
roperties
> in System files, and generate sensor object dynamically.
> ---
> =C2=A0bin/Barreleye.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 13 ++++=
+++++++++
> =C2=A0bin/Firestone.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 15 ++++=
+++++++++++
> =C2=A0bin/Garrison.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 14=
 ++++++++++++++
> =C2=A0bin/Palmetto.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 12=
 ++++++++++++
> =C2=A0bin/sensor_manager2.py | 35 +++++++++--------------------------
> =C2=A05 files changed, 63 insertions(+), 26 deletions(-)
>=20
> diff --git a/bin/Barreleye.py b/bin/Barreleye.py
> index 0cf55a1..401f6f2 100755
> --- a/bin/Barreleye.py
> +++ b/bin/Barreleye.py
> @@ -718,3 +718,16 @@ HWMON_CONFIG =3D {
> =C2=A0	},
> =C2=A0}
> =C2=A0
> +# Miscellaneous non-poll sensor with system specific properties.
> +# The sensor id is the same as those defined in ID_LOOKUP['SENSOR'].
> +MISC_SENSORS =3D {
> +	0x09 : { 'class' : 'BootCountSensor' },
> +	0x05 : { 'class' : 'BootProgressSensor' },
> +	0x08 : { 'class' : 'OccStatusSensor',
> +		'os_path' : '/sys/class/i2c-adapter/i2c-3/3-0050/online' },
> +	0x0A : { 'class' : 'OccStatusSensor',
> +		'os_path' : '/sys/class/i2c-adapter/i2c-3/3-0051/online' },
> +	0x32 : { 'class' : 'OperatingSystemStatusSensor' },
> +	0x33 : { 'class' : 'PowerCap',
> +		'os_path' : '/sys/class/hwmon/hwmon3/user_powercap' },
> +}
> diff --git a/bin/Firestone.py b/bin/Firestone.py
> index 91a6099..2cadf40 100755
> --- a/bin/Firestone.py
> +++ b/bin/Firestone.py
> @@ -608,3 +608,18 @@ HWMON_CONFIG =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> =C2=A0}
> +
> +
> +# Miscellaneous non-poll sensor with system specific properties.
> +# The sensor id is the same as those defined in ID_LOOKUP['SENSOR'].
> +MISC_SENSORS =3D {
> +	0x5f : { 'class' : 'BootCountSensor' },
> +	0x05 : { 'class' : 'BootProgressSensor' },
> +	0x08 : { 'class' : 'OccStatusSensor',
> +		'os_path' : '/sys/class/i2c-adapter/i2c-3/3-0050/online' },
> +	0x09 : { 'class' : 'OccStatusSensor',
> +		'os_path' : '/sys/class/i2c-adapter/i2c-3/3-0051/online' },
> +	0xb5 : { 'class' : 'OperatingSystemStatusSensor' },
> +	0xb3 : { 'class' : 'PowerCap',
> +		'os_path' : '/sys/class/hwmon/hwmon3/user_powercap' },
> +}
> diff --git a/bin/Garrison.py b/bin/Garrison.py
> index 5564162..3f09836 100755
> --- a/bin/Garrison.py
> +++ b/bin/Garrison.py
> @@ -608,3 +608,17 @@ HWMON_CONFIG =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> =C2=A0}
> +
> +# Miscellaneous non-poll sensor with system specific properties.
> +# The sensor id is the same as those defined in ID_LOOKUP['SENSOR'].
> +MISC_SENSORS =3D {
> +	0x5f : { 'class' : 'BootCountSensor' },
> +	0x05 : { 'class' : 'BootProgressSensor' },
> +	0x08 : { 'class' : 'OccStatusSensor',
> +		'os_path' : '/sys/class/i2c-adapter/i2c-3/3-0050/online' },
> +	0x09 : { 'class' : 'OccStatusSensor',
> +		'os_path' : '/sys/class/i2c-adapter/i2c-3/3-0051/online' },
> +	0xb5 : { 'class' : 'OperatingSystemStatusSensor' },
> +	0xb3 : { 'class' : 'PowerCap',
> +		'os_path' : '/sys/class/hwmon/hwmon3/user_powercap' },
> +}
> diff --git a/bin/Palmetto.py b/bin/Palmetto.py
> index 09fbe06..4c23068 100755
> --- a/bin/Palmetto.py
> +++ b/bin/Palmetto.py
> @@ -306,3 +306,15 @@ HWMON_CONFIG =3D {
> =C2=A0		}
> =C2=A0	}
> =C2=A0}
> +
> +# Miscellaneous non-poll sensor with system specific properties.
> +# The sensor id is the same as those defined in ID_LOOKUP['SENSOR'].
> +MISC_SENSORS =3D {
> +	0x09 : { 'class' : 'BootCountSensor' },
> +	0x05 : { 'class' : 'BootProgressSensor' },
> +	0x08 : { 'class' : 'OccStatusSensor',
> +		'os_path' : '/sys/class/i2c-adapter/i2c-3/3-0050/online' },
> +	0x32 : { 'class' : 'OperatingSystemStatusSensor' },
> +	0x33 : { 'class' : 'PowerCap',
> +		'os_path' : '/sys/class/hwmon/hwmon1/user_powercap' },
> +}
> diff --git a/bin/sensor_manager2.py b/bin/sensor_manager2.py
> index b5aac53..619e8e5 100755
> --- a/bin/sensor_manager2.py
> +++ b/bin/sensor_manager2.py
> @@ -9,6 +9,8 @@ import dbus.mainloop.glib
> =C2=A0import Openbmc
> =C2=A0import Sensors
> =C2=A0
> +System =3D __import__(sys.argv[1])
> +
> =C2=A0DBUS_NAME =3D 'org.openbmc.Sensors'
> =C2=A0OBJ_PATH =3D '/org/openbmc/sensors'
> =C2=A0
> @@ -50,32 +52,13 @@ if __name__ =3D=3D '__main__':
> =C2=A0
> =C2=A0	## instantiate non-polling sensors
> =C2=A0	## these don't need to be in seperate process
> -	## TODO: this should not be hardcoded
> -
> -	obj_path =3D OBJ_PATH+"/host/PowerCap"
> -	sensor_obj =3D Sensors.PowerCap(bus,obj_path)
> -	## hwmon3 is default for master OCC on Barreleye.
> -	## should rewrite sensor_manager to remove hardcode
> -	sensor_obj.sysfs_attr =3D "/sys/class/hwmon/hwmon3/user_powercap"
> -	root_sensor.add(obj_path,sensor_obj)
> -
> -	obj_path =3D OBJ_PATH+"/host/BootProgress"
> -	root_sensor.add(obj_path,Sensors.BootProgressSensor(bus,obj_path))
> -
> -	obj_path =3D OBJ_PATH+"/host/cpu0/OccStatus"
> -	sensor_obj =3D Sensors.OccStatusSensor(bus,obj_path)
> -	sensor_obj.sysfs_attr =3D "/sys/class/i2c-adapter/i2c-3/3-0050/online"
> -	root_sensor.add(obj_path,sensor_obj)
> -
> -	obj_path =3D OBJ_PATH+"/host/cpu1/OccStatus"
> -	sensor_obj =3D Sensors.OccStatusSensor(bus,obj_path)
> -	sensor_obj.sysfs_attr =3D "/sys/class/i2c-adapter/i2c-3/3-0051/online"
> -	root_sensor.add(obj_path,sensor_obj)
> -
> -	obj_path =3D OBJ_PATH+"/host/BootCount"
> -	root_sensor.add(obj_path,Sensors.BootCountSensor(bus,obj_path))
> -	obj_path =3D OBJ_PATH+"/host/OperatingSystemStatus"
> -	root_sensor.add(obj_path,Sensors.OperatingSystemStatusSensor(bus,obj_pa=
th))
> +	for (id, the_sensor) in System.MISC_SENSORS.items():
> +		sensor_class =3D the_sensor['class']
> +		obj_path =3D System.ID_LOOKUP['SENSOR'][id]
> +		sensor_obj =3D getattr(Sensors, sensor_class)(bus, obj_path)

What if we instead populate the 'class' key of the dictionary with the
actual function objects rather than strings? In the case of typos this
would give the benefit of raising an exception when populating the
dictionary (i.e. where the error exists), rather than when we go to
instantiate the class and find that the attribute doesn't exist.

Other than that, the mechanics look okay to me. I don't know about the
sensor definitions.


> +		if 'os_path' in the_sensor:
> +			sensor_obj.sysfs_attr =3D the_sensor['os_path']
> +		root_sensor.add(obj_path, sensor_obj)
> =C2=A0
> =C2=A0	mainloop =3D gobject.MainLoop()
> =C2=A0	print "Starting sensor manager"
--=-PjwrYYe2LZEUt1ikQjnm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXMTc6AAoJEJ0dnzgO5LT5TSoQAKNcaKFPFSAd40Sh54AEHV88
xZlmFSV8cpYDxfVtYhHS5JiDNXj5IwWuYEe/p5ZTNu35wDLo+xf8myVeDdDlLIcX
8V+oThBws05iK+yLnQFpQAMFI4V3KR4rGLUriWNaSwgqo03cYKwkLHRdGpjIEzyx
t9fOfvEi4aR8qzsTIkRaXS7HCleVwcp6OwnbijJE1cBwHsoDIeD4l4J1y1536Y9o
zKoIIdVspifT7163qD/LSyKJ69a9Mx+As29GN9lKoFoDC0Jl/2qI8wcC0lFsnoca
kwpj9JBy3s4YbPCH7MnKjRAytiRU1H3+qF4YyR7LPmHd0EFUPul5scDCHUomoVhE
2jUO4icx0KzSWtCeJxMSuDcJ8Wjj9sdLqWxUQpzM8cKIeU14S9aXxAebczgyR4Dk
hIRQVTQd7lVwRsMptM+4+SXcPlnRWXjv1xtsg4b+JGN+A7sKJ5dsUIsIHxgUjGIF
Bq0BQpK1xtgWMlDbZHhecl7HDliTsyVBtaSJ2cWTaL0yoKm3RECpm2AaEGi0oZXJ
US+vAA+zMOUsox1hpF8RfcOddEHNemlUNRv9RN6v9GjcGaBPVyTzLjygSQngMobR
sJ79jAfrdHha6EQjFVneiyaCuwn9AB7YzyO5Acr5RrwZBxK0JZ/HfOJHLGYj5bR8
pfoiqYGizgFKykPvoWxt
=+tS2
-----END PGP SIGNATURE-----

--=-PjwrYYe2LZEUt1ikQjnm--
