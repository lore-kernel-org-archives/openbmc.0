Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rlnN936pFzDr2j
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2016 05:13:45 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1467918819125137.95939640984443;
 Thu, 7 Jul 2016 12:13:39 -0700 (PDT)
Date: Thu, 7 Jul 2016 14:13:36 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Rick Altherr <raltherr@google.com>
Cc: Vishwanatha Subbanna <vishwanath@in.ibm.com>,
 OpenBMC <openbmc@lists.ozlabs.org>
Subject: Re: Issues with setting the timeofday
Message-ID: <20160707191336.GF20922@asimov.austin.ibm.com>
References: <OFAF379D90.EBDC1ECC-ON65258094.0026E76B-65257FE9.004807C1@notes.na.collabserv.com>
 <CAPLgG=kcOH1h6NZ6-gV9dTaKzpjjZfqpQBjTzXd-r3t8e5VL5g@mail.gmail.com>
 <20160707182339.GE20922@asimov.austin.ibm.com>
 <CAPLgG=kbaOU3YEo44i33GFiOg6ciyxiyNoxe+bc-ckXdfzMTzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eN+VsUY52o/CFM+1"
Content-Disposition: inline
In-Reply-To: <CAPLgG=kbaOU3YEo44i33GFiOg6ciyxiyNoxe+bc-ckXdfzMTzw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Thu, 07 Jul 2016 19:13:46 -0000


--eN+VsUY52o/CFM+1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 07, 2016 at 11:32:51AM -0700, Rick Altherr wrote:
> I'm unfamiliar with Barreleye.  Does the host use the BMC as an RTC?  Are
> the commands in the first post being run on the host or on the BMC?

Rick, good questions.

On all the current Power systems, the Host does not have its own RTC.  The
skiboot code will create an RTC for the kernel by using IPMI commands down
to the BMC.  They use the standard get-sel-time / set-sel-time IPMI
command for this.  Other-BMC systems already operated this way, and since
the Host firmware support was already there for other-BMC systems, we
implemented this same behavior on openBMC.  There are also other IPMI
commands that we implemented to emulate other-BMC behavior so as to not
require Host firmware changes for openBMC.

The commands Vishwa has below here are ran from the BMC.  The commands
in the Github issue are also ran from the BMC, but you will see a call
to '/tmp/ipmitool' there.  That is a development version of the ipmitool
that will call into the dbus stack as if the Host sent an IPMI message
through the BT interface.  Thus, 'ipmitool -l dbus sel time set ...' and
'ipmitool -l dbus sel time get' are emulating the behavior of the host,
while 'date' is interacting with the BMC's kernel time subsystem.

> On Thu, Jul 7, 2016 at 11:23 AM, Patrick Williams <patrick@stwcx.xyz> wro=
te:
>=20
> > On Thu, Jul 07, 2016 at 09:52:36AM -0700, Rick Altherr wrote:
> > > If ntpd or systemd-timesyncd is running, this makes perfect sense.  L=
inux
> > > maintains current time in the kernel.  The hardware RTC is only used =
to
> > > load an initial time at boot and is written during shutdown.  When an=
 NTP
> > > daemon is running and an NTP server is reachable, it will adjust the
> > > kernel's current time to match NTP time.  I believe with timesyncd, it
> > > simply steps time instead of slewing like ntpd does.
> > >
> > > What are you trying to accomplish?  There is likely a way to do it if=
 you
> > > can describe what you want to have happen.
> >
> > It looks like maybe this is related to Github issue openbmc/openbmc#310.
> >
> >     https://github.com/openbmc/openbmc/issues/310
> >
> > > On Thu, Jul 7, 2016 at 6:06 AM, Vishwanatha Subbanna <
> > vishwanath@in.ibm.com>
> > > wrote:
> > >
> > > > hey Joel,
> > > >
> > > > Here is what I am seeing on one the Barreleye box that is running
> > > > "4.4.12-openbmc-20160606-1 : kernel". I can see that time gets set =
but
> > > > reverts immediately. Syncing what's in hwclock does not have any ef=
fect
> > > > too. Any thoughts ?
> > > >
> > > > root@barreleye:~# date -s '2016-12-25 12:34:56' ; hwclock -w
> > > > Sun Dec 25 12:34:56 UTC 2016
> > > >
> > > > root@barreleye:~# date
> > > > Thu Jul 7 13:07:37 UTC 2016
> > > >
> > > > root@barreleye:~# hwclock -r
> > > > Sun Dec 25 12:35:01 2016 0.000000 seconds
> > > >
> > > > root@barreleye:~# hwclock -s
> > > >
> > > > root@barreleye:~# date
> > > > Thu Jul 7 13:07:52 UTC 2016
> > > > root@barreleye:~#
> > > >
> > > > Thanks
> > > >
> > > >
> > > >
> > -----------------------------------------------------------------------=
--------------
> > > > Thanks and Regards,
> > > > Vishwanath.
> > > > Advisory Software Engineer,
> > > > Power Firmware Development,
> > > > Systems &Technology Lab,
> > > > MG2-6F-255 , Manyata Embassy Business Park,
> > > > Bangalore , KA , 560045
> > > > Ph: +91-80-46678255
> > > > E-mail: vishwanath@in.ibm.com
> > > >
> > > >
> > -----------------------------------------------------------------------=
-----------
> > > >
> > > > _______________________________________________
> > > > openbmc mailing list
> > > > openbmc@lists.ozlabs.org
> > > > https://lists.ozlabs.org/listinfo/openbmc
> > > >
> > > >
> >
> > > _______________________________________________
> > > openbmc mailing list
> > > openbmc@lists.ozlabs.org
> > > https://lists.ozlabs.org/listinfo/openbmc
> >
> >
> > --
> > Patrick Williams
> >

--=20
Patrick Williams

--eN+VsUY52o/CFM+1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXfqngAAoJEKsDR8wtAMEZ1LAP/0bMj40V6IgqnVEjNqiCF0X9
YSwMBoPkKEoM/6m+VdKl3XnS0hswx4K3qahEDd7qkBna3qU6WWv9uJbE5Qt5HY2W
SwTK+db8c1FE/wwiX6pLGNGs96RCiSF956iM6LznyMko//00o0I/AMfLjDNJ01oa
qInjD1Io3jRpqHr4lyAlEN80TMEjsc2y6YEgg3RtSrh6uArGrHAK/VOs1xzdcTAe
BPbKrDAoPNIAhDfQQyRkty/OUju2QKdHRAfLIRI18dt9SWH4panaLSTK0/bFWX13
WfsT4oUckf7NsKl2RfkmdHXirjWUxh7qXRIvCZhTOnhYcvwByhlimI/uQOxeehLX
mhYQ60HpkRxV2bNR0tenST8GveczIRIa05HDuntAEszA5F1jhFvU75dmi+8xlik/
a3GHNxz0qogTnOdu6X0bDv9FWhkvXkIcDHWLG7I36LnWl6rE9ehdTnU2qnXb/j71
R4pfWFZKS3c9eMNEvmgCU7KfMkpK2k8+LkU8djnRurpOvZxwBU3mxwPPhF/r5mVX
cVVsEl1FwFucY7wPCh55FJL/fK3MLmVIbenzgv93z7H9/5ZJ6at95rrpK3cEr/By
bh6Ho2GrQq6fVaotW1eMu1p1vEU2F7JNrjSTVJPDFVdiJfO+9UjftJM4omJHqycO
sDrZBz1piZK+dxk7273T
=Wm/l
-----END PGP SIGNATURE-----

--eN+VsUY52o/CFM+1--
