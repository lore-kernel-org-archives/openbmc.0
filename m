Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tSSST4yY5zDvhn
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 13:39:53 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1480387186798655.3948461875635;
 Mon, 28 Nov 2016 18:39:46 -0800 (PST)
Date: Mon, 28 Nov 2016 20:39:34 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Starting the phosphor-hwmon service from udev rules
Message-ID: <20161129023934.GR15757@heinlein.lan>
References: <32e4f53c-5bab-55ba-50f2-25ba891d4127@linux.vnet.ibm.com>
 <CACPK8Xe9j1knVThhduju-OCipgX_UEZMe4bL+Hf9xJMSWVfq5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Hw0FrjWlp+qkNlJP"
Content-Disposition: inline
In-Reply-To: <CACPK8Xe9j1knVThhduju-OCipgX_UEZMe4bL+Hf9xJMSWVfq5A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2016 02:39:54 -0000


--Hw0FrjWlp+qkNlJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2016 at 11:58:32AM +1030, Joel Stanley wrote:

> What are the functions of the 'phosphor-hwmon' service?

phosphor-hwmon is an implementation of these dbus interfaces, which
sources its information from the Linux hwmon interfaces:

https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc=
_project/Sensor

> I would consider naming it phosphor-hardware-monitor or similar, in
> case you decide it should monitor things other than Linux 'hwmon'
> devices.

An alternative source of data should be in a separate application /
repository.  The non-hwmon-specific should be mostly contained in the
generated dbus bindings, so there is no or very little overlap between
different implementations.

> > It has lines like:
> >
> > SUBSYSTEM=3D=3D"hwmon", DEVPATH=3D=3D"*i2c-3/3-0077/*", ACTION =3D=3D "=
add",
> > TAG+=3D"systemd",
> > ENV{SYSTEMD_WANTS}+=3D"phosphor-hwmon@/sys/class/hwmon/%k.service",
> > ENV{ENVFILE}+=3D"/etc/hwmon.d/hwmon-bmp280-3-77.conf"
>=20
> Do we need to match only on the path? Can it match on the device driver i=
nstead?

The driver name is insufficient to differentiate between two different
sensors of the same device type.  For instance, the front and rear
ambient may both be LMxx-class devices, but have different dbus paths
and potentially different thresholds.

> > where the .conf file will contain any threshold values, maybe like CRIT=
=3D50.
> > The command line in the unit file would then somehow make a udevadm cal=
l to
> > pull out the ENVFILE so it can get passed into the executable along wit=
h the
> > device path.
> >
> > Is this the recommended way to go about doing this?  Or instead of havi=
ng a
> > separate udev rule for each device, but 1 service file, is it better to=
 have
> > 1 udev rule but separate service files?
>=20
> It appears you plan on re-implementing the functionality of the
> lm-sensors package. While the upstream project has dissappeared from
> the net, the source code and documentation is still available. I would
> consider firstly trying to re-use existing daemons and configuration
> that we already have access to. If that does not work, then reading
> and re-using the source code to adopt the same design would save you
> time and effort.

Can you give more details on which aspects you feel there is overlap?

In any case, your questions and critiques should all be directed at Brad
who is implementing phosphor-hwmon and not Matt who asked specifically
about how to launch the application from MRW-based information?

--=20
Patrick Williams

--Hw0FrjWlp+qkNlJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYPOpjAAoJEKsDR8wtAMEZoeAP/RPGfK1eb9jjlykZAz5OmFQu
cgDoeFf3p8YX8R+SY38Y+Jf/uQBWOjaS67vZkL7M5qquMBJajZKNksDXG4kpfj76
fa//d/kneIiaznKF+AjYCk5pDMrf7Bw6FScWikZArnmU1vxLYnnBBi/Xx0vdgCIh
YXIQgJlDVF9UDPxKyOEajEYzbWTUHVNVK+kVgY6OQW1E8ai4JyEzFF+E0VSieEvd
qr5OIokbqGvaLjBiHfYa52LA1xPQuYpi4+a2tB9vPI+uJWhXD6c1unVsg9d5N9I+
7X4T6XXcnPcmdAkIgvmFwc/sl8xsDxOnt825msEFTxlaqN0Eb5wL1CQSoeY7YpPW
N3RQGBIQgbSAHgmONx4HguHol6h0BhInUrs8gXwjZZ1umz3I/EDBDYckY7VZtRlC
0EjTbTDWsfUJwodBj3+ofpEosKevGj2pYa/hH1U0pOS3VJF0B8o1cxStQb5qEdrh
NvpC7cNmNBxdQVt7DixirhBDlXThyey7lsk3OZvHgvM6DwP43XzJ631ILj3m2bHG
fWi27SXjgwDJAwFBnH503triY+FrYdiCuwhjKji7FzMYvrW/k1dydxN9hyC7tomQ
GMTathfFYPA5FP+663kJqQH2nXvwKcQ5azqz4oxEG8yW4/feSH89jmRtI+q2WoIJ
5pkiHSaFzM5AT1XjkQ+H
=2NhB
-----END PGP SIGNATURE-----

--Hw0FrjWlp+qkNlJP--
