Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKN0Z6LHyzDqCd
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 05:55:10 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 14940141060301003.466886328573;
 Fri, 5 May 2017 12:55:06 -0700 (PDT)
Date: Fri, 5 May 2017 14:55:05 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Robi Buranyi <rburanyi@google.com>
Cc: Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: Re: phosphor-hwmon bottleneck potential
Message-ID: <20170505195505.GJ25937@heinlein.lan>
References: <CAO=notxUh7si0kxbpyA-vK6aJaLQSi5NWCap7SeXDAgUNn8grQ@mail.gmail.com>
 <1493960865.3948.70.camel@fuzziesquirrel.com>
 <20170505163406.GB25937@heinlein.lan>
 <CAPLgG=k3mr01DnqWX5W4oCOQJ3njJCVBSe+EsLkpXCdj2Uwj7A@mail.gmail.com>
 <20170505174341.GE25937@heinlein.lan>
 <CAPLgG=m9S_4X=-Wvc8Uomhh7KBL5tBZn8A0Be9JTLZ=B-u+h5g@mail.gmail.com>
 <20170505180239.GF25937@heinlein.lan>
 <CAPLgG=mXE4qz5PVRFupp3=ogcS4oe0bQfYKaEwesttUhdvb4Xw@mail.gmail.com>
 <CADfYTpGfqgKP-HWg54mXnw7qc0wtPqfE=ZicZrCo_WsOJiQc7g@mail.gmail.com>
 <CANF=oU7xrGxz+Lfp+GT7QHOqYmKP7h+uMbraK0PjkTOdugTydw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tKy6e3LXpfmanBFM"
Content-Disposition: inline
In-Reply-To: <CANF=oU7xrGxz+Lfp+GT7QHOqYmKP7h+uMbraK0PjkTOdugTydw@mail.gmail.com>
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
X-List-Received-Date: Fri, 05 May 2017 19:55:11 -0000


--tKy6e3LXpfmanBFM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 05, 2017 at 11:50:52AM -0700, Robi Buranyi wrote:
> We could change the driver(s) to periodically poll the sensors like every
> second, and store the latest value. Then the sysfs read shall always retu=
rn
> the last completed measurement data. We should do this for both the
> tachometers reading and the temperature sensors. There shall be some logic
> implemented for aging (when sensor read constantly fails)

This could certainly be done for the Aspeed PWM driver in question and
by my reading this might be the best approach.  Due to the way that
hardware works it seems like you'd an interval between samples of at
least 1 second in order to be accurate to roughly 100 RPMs.  I don't
know what accuracy you are striving for, but blocking an application on
a syscall for 1 second doesn't sound like a great implementation.

We could check with Guenter Roeck, the HWMON maintainer, to see if he
has any recommendations on the best way to handle this driver.

Changing HWMON on the whole to do this (the '(s)' part of your 'driver(s)'
statement) seems pretty out of scope and not likely to be accepted by
upstream.  Most HWMON drivers do simple IO in the read syscall, like a
few i2c operations to read a register out in a device so there isn't
problem with a long occurring block.

--=20
Patrick Williams

--tKy6e3LXpfmanBFM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlkM2JcACgkQqwNHzC0A
wRkd8w//ZmrwidJjXc+3BCTyp1ZMdRRK/A7e6ixZlWYHz+TjTmH+WnuKlXR8vv3L
bLy1NFN8XKBssg8nRuXxVdREmkqu5oz65CFC1ozTmN8nUR7I+nAANkqHHYMQ+0ya
qjKPZrvFNJvFoE3+rpRc4RW59ycUBZbmryNJIEx5AXi/hs1kWfw2KsbvyonULO97
uVjyiq8db5Wx56CfEJviXQ2hQyk+NOgLQOqV1qnisKlAxr104z3apHKjz1eZr/r4
/RgrhRIu7SOBwNRJWrxnWqpywgOIahFbEBuKaxj1zu/aT+Jf4HL4WLyi8UnOQmYh
njZxA2P5wjAH+c2kVEOsqPtnIWdh1qc7rtxn8EuWliYIZdaM+IFVsyzJ/5mk1BzO
q4DyY+9XkdPJW8bWMDc0at2x+4AqxBk7l6vrX+i7fkO2EJk51EoNV5Ar9a6RVYl8
stOjbiH9dfFezD2If9jDQR/3TZZkHVFSMxl/KQRi1ZFpIxNhr5V+g7rea19AkV2L
BMRiDQj+HsV+VhXk/nti1u+NlSM+St2HllBwI6F3aZcTd+gfD8gjHYVIantJLwcu
L2KiinYLO4+X7eMIeNiyqyzU8NLrBqxshKg30Z5cHf7hNkVoAxsPXfNkLRHAAVm1
HP/KE95pYu4KY2uF4Z14KjmFs3QzI3YB8cv9Yex47wX439ZtJzk=
=aori
-----END PGP SIGNATURE-----

--tKy6e3LXpfmanBFM--
