Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tT3y81y6hzDvv5
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 13:19:12 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1480472344369651.9748970530666;
 Tue, 29 Nov 2016 18:19:04 -0800 (PST)
Date: Tue, 29 Nov 2016 20:19:02 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Starting the phosphor-hwmon service from udev rules
Message-ID: <20161130021902.GT15757@heinlein.lan>
References: <32e4f53c-5bab-55ba-50f2-25ba891d4127@linux.vnet.ibm.com>
 <20161129024216.GS15757@heinlein.lan>
 <accb6902-8485-6f7f-c981-4930bb911b08@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nDmTXYS4kVhtHHfR"
Content-Disposition: inline
In-Reply-To: <accb6902-8485-6f7f-c981-4930bb911b08@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 30 Nov 2016 02:19:12 -0000


--nDmTXYS4kVhtHHfR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Matt,

We had a phone discussion last night with Joel, Andrew J, and Brad and I
was suppose to catch up with you today and never found time to.  (It was
half-impromptu and half-miscommunication on the desired topic.)

The net is that we came up with a third option for specifying these:

   1. Unique udev rules per device with corresponding environment file, and
      single systemd service,=20
   2. Single udev rule per driver, unique systemd service file (with
      corresponding environment file?) per device.

   3. Single udev rule per driver, single template systemd service file per
      application (ex. phosphor-hwmon@.service), unique environment file
      per device.

On Tue, Nov 29, 2016 at 10:30:12AM -0600, Matt Spinler wrote:

> So now I think the rule would look something like:
> SUBSYSTEM=3D=3D"hwmon", DEVPATH=3D=3D"*i2c-3/3-0077/*", ACTION =3D=3D "ad=
d",=20
> TAG+=3D"systemd",=20
> ENV{SYSTEMD_WANTS}+=3D"phosphor-hwmon-3-0077@/sys/class/hwmon/%k.service"

The 'SYSTEMD_WANTS' is useful if you want to trigger a specific
service.  If you leave that out, by default systemd triggers a @.device,
which other services can depend on.  sys-class-i2c-dev-i2c-3-0077.device
maybe in this case?

> and could use the Environment or EnvironmentFile directive in the=20
> generated device specific unit file to pick up threshold vars.

In obmc-console@.service we have an example of using 'BindsTo'.  I think
we could write the phosphor-hwmon@.service to 'BindTo=3Dsys-%i' and also
ConditionPathExists=3D/etc/conf.d/phosphor-hwmon-%i ,
EnvironmentFile=3D/etc/conf.d/phosphor-hwmon-%i ?

> Another issue I have is if the MRW should have the knowledge of if a=20
> device has a hwmon driver or not?  While it would make things a lot more=
=20
> simple if it did, I'm not sure if it's in its domain. If it doesn't,=20
> then it would either still generate rules and unit files for every I2C=20
> device and some just wouldn't get used, or we'd have to keep that=20
> knowledge in our tree somewhere.
> Thoughts on that?

Doesn't it have to?  It isn't just that there is an lm77 sensor out on
an i2c bus and therefore we create the environment file.  The
environment file needs to have a decent amount of information, such as
what is the "NiceName" of the sensor ("FrontAmbient" maybe).  When you
talk about one of the MAX fan controller chips we potentially have
multiple fans on that chip so it more than one "sensor" worth of
configuration as well.  I can't imagine how the MRW data wouldn't
effectively encode that we expect the device to have an hwmon driver
(not directly, but indirectly by the presence of this information).

--=20
Patrick Williams

--nDmTXYS4kVhtHHfR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYPjcUAAoJEKsDR8wtAMEZ3wsQAJenWBJ4QU1SfnyBAiG4KWPB
JeDzSsVSm6sW8Ph9I/ghY4tSU+GQy/lJx7ZPmZobA5/Go+Cti54hWGRkzxCxQ6MV
5ZA3RyqZjVxknQCg1c1myH1CTp/lPd/C72Fm3/bvY/R1T+pPNoWEZ0nkpVj6akaa
Qp1wmAyunid0lIRDkGfy/wO04ugd/0eceMDjDSF6fcZmC6K8ZESwoMpFRKmBC2nW
XdudSnvm9KRuRj2NBR2xYhinOg4bRLz9G7pTk3v4kBg+0979DMhwKNAb6dzn9e/I
OJN1pGJ4RQdfOGngMYheCgnllNc8qL5/s/Y7NByzmY2lN8oxWUb+F8LoyVA0Ikf3
KvWcWDMgfsn+mAJmasND8umAL102fjbUSqEYFb1LzVTMoZs0dnq3AH9bUP28K7zX
r7hGBt9fR0l4R0sT3sQo6/HOtSTpTDdX7I/YwylQTz39X7fFZDmke34DomWx+Yig
LlIQmcc3c11gH+GUO5FaLCIGEWfvEujvOtArV4/BEMcyeY0GK3yPLXs3JR/CUa9I
W8k5IMz8HrzWG0ltdumK6Y3pCF2aCzULCV5SOY8rzhVDaL0amlZwqM1ET+pOox95
TogX2t3bI/FJceIyutpK5Ho7efXsIQ3yCbjx3hcbZxWaPonE7eb06m6ZR7THAf9l
ME8qILbWD/bpwmrEx32I
=9SFX
-----END PGP SIGNATURE-----

--nDmTXYS4kVhtHHfR--
