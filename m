Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6Tfs61qSzDq5b
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 12:32:05 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1492482720358520.0472113563019;
 Mon, 17 Apr 2017 19:32:00 -0700 (PDT)
Date: Mon, 17 Apr 2017 21:31:59 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Patrick Venture <venture@google.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: thermald for OpenBMC
Message-ID: <20170418023159.GA25774@heinlein.lan>
References: <CAO=notwmuHO91eentG60W012rnQXtAybuTPqo+_EbY426eOwSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <CAO=notwmuHO91eentG60W012rnQXtAybuTPqo+_EbY426eOwSA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
X-List-Received-Date: Tue, 18 Apr 2017 02:32:06 -0000


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Patrick,

On Mon, Apr 17, 2017 at 01:21:29PM -0700, Patrick Venture wrote:
> I'm working on a thermal control loop that'll operate within the openbmc
> framework(s) and wanted to provide a somewhat high level overview for
> thoughts.

We should connect you with Matt Spinler (mspinler) and Matt Barth
(msbarth) on IRC.  They have been working on implementing the "IBM fan
control algorithm" but I suspect there is a significant amount of
overlap.  Our intention was that you'd be able to reuse our
implementation and insert a different (low-level detailed) algorithm.

> The general design is to have a daemon that reads fans and temperatures
> from dbus (reaching out to phosphor-hwmon) as well as being able to recei=
ve
> temperatures and other sensor information over an OEM IPMI command.

Sounds good.  This is how it is suppose to work.

For the IPMI commands, the expectation would be that either the IPMI
provider or an application fed by the IPMI provider for these OEM
commands would implement the same xyz.openbmc_project.Sensor.Value
interface as the phosphor-hwmon.  This way the thermal algorithm really
doesn't need to know where the data comes from.

> The system will support zones defined (yes, probably in YAML).  A zone wi=
ll
> have at least one exclusion fan, and at least one thermal sensor.  The
> thermal sensor can be shared.  There will be defaults provided in this
> configuration to act as fallbacks.

There is some code available to define zones via YAML.  Matt Spinler can
point you at these.

> The thermal loop will be margin based and attempt to drive the fans to
> maintain the temperature within operating temperature of the zones.  Each
> zone will be independently managed.

These sounds very similar to what their intended design is as well.  For
a zone there is a lower-threshold and an upper-threshold.  When the
temperature is above the upper-threshold, the fan speed is increased and
the fans are decreased when the temperature is below the
lower-threshold.  Again, the Matts can give you details on what the "IBM
fan control algorithm" design is.

> Because not all thermal sensors can necessarily be ready by the BMC, we
> need a method of getting that information from the host.  From a previous
> project, we have the notion of sending thermal margins for slow and quick
> (heat change) devices to a controller.

Is this the Host->BMC via IPMI you mentioned earlier or does the BMC
need to actively query the host in some cases?  Hopefully it is always
one direction.

--=20
Patrick Williams

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlj1ep0ACgkQqwNHzC0A
wRkLAA//dD7+mIw5nqrMTdqNIkMZTpAu/S/vxstMxtpFgaMC1/I8BTOYKdkXlklt
hCRjGanBw+ksD6GSVsjs+wJLIqsB4xzGulUWmzjwpniQROu67Y5t0XL3EMbsO41r
NFF2Zlk91luouh3hXtzrrinB+8jfnFXRpYLoBJJKVN9jCc8JLbYOK/YpQ0yiYwtm
pOTtYj9+9CHrDd+twhyj8ri0NNO6OWbc12tbySvIbIur/ajmb2J5PquRUl4G4w35
doiOxn3BhjcRr0BQt+M1zxas2YFC/V6RwLii3MLURMIQxZ80gDPVvR2rmwgSJvg2
VbHiauB6y4B5sEvGWIWNsGr5X4jcjr2SBNfvQOagmdUa2uXxRh3z6Rh1Q+aC8/Z5
+vIQVPyL3ehZf62EVKlmFY1CWQjE0AiL0GcDbv2qMI1LAqYxHMVw2a5/LkNTasP8
Ztno7JnyQtEY2X/shwxCUAKjhTaUv0cSAVA1/dqtClAuC1t142znalNEPzFFbgkI
+hhmCUlu4jEm2cfn7Jik/I5NpW1Jfaq2FOlOKXe2In7cxam/Uj0H20dFcNqAq5FZ
8WuWZB7LDqNcAQY1YAYeu/4Oc0S+bBymygiqJ6lX1PaMnMcn44W3a6jr9L1ErNsM
0C5/8NRLpsW8IuDbA9sx86a7MFO62I6SDk6LMqLMsO8Sz7FaScI=
=0tHM
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
