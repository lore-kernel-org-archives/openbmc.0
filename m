Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rlmGW32fMzDr1l
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2016 04:23:47 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1467915821657984.3565443321222;
 Thu, 7 Jul 2016 11:23:41 -0700 (PDT)
Date: Thu, 7 Jul 2016 13:23:39 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Rick Altherr <raltherr@google.com>
Cc: Vishwanatha Subbanna <vishwanath@in.ibm.com>,
 OpenBMC <openbmc@lists.ozlabs.org>
Subject: Re: Issues with setting the timeofday
Message-ID: <20160707182339.GE20922@asimov.austin.ibm.com>
References: <OFAF379D90.EBDC1ECC-ON65258094.0026E76B-65257FE9.004807C1@notes.na.collabserv.com>
 <CAPLgG=kcOH1h6NZ6-gV9dTaKzpjjZfqpQBjTzXd-r3t8e5VL5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nlttjmhgc7EeTk3T"
Content-Disposition: inline
In-Reply-To: <CAPLgG=kcOH1h6NZ6-gV9dTaKzpjjZfqpQBjTzXd-r3t8e5VL5g@mail.gmail.com>
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
X-List-Received-Date: Thu, 07 Jul 2016 18:23:48 -0000


--nlttjmhgc7EeTk3T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 07, 2016 at 09:52:36AM -0700, Rick Altherr wrote:
> If ntpd or systemd-timesyncd is running, this makes perfect sense.  Linux
> maintains current time in the kernel.  The hardware RTC is only used to
> load an initial time at boot and is written during shutdown.  When an NTP
> daemon is running and an NTP server is reachable, it will adjust the
> kernel's current time to match NTP time.  I believe with timesyncd, it
> simply steps time instead of slewing like ntpd does.
>=20
> What are you trying to accomplish?  There is likely a way to do it if you
> can describe what you want to have happen.

It looks like maybe this is related to Github issue openbmc/openbmc#310.

    https://github.com/openbmc/openbmc/issues/310

> On Thu, Jul 7, 2016 at 6:06 AM, Vishwanatha Subbanna <vishwanath@in.ibm.c=
om>
> wrote:
>=20
> > hey Joel,
> >
> > Here is what I am seeing on one the Barreleye box that is running
> > "4.4.12-openbmc-20160606-1 : kernel". I can see that time gets set but
> > reverts immediately. Syncing what's in hwclock does not have any effect
> > too. Any thoughts ?
> >
> > root@barreleye:~# date -s '2016-12-25 12:34:56' ; hwclock -w
> > Sun Dec 25 12:34:56 UTC 2016
> >
> > root@barreleye:~# date
> > Thu Jul 7 13:07:37 UTC 2016
> >
> > root@barreleye:~# hwclock -r
> > Sun Dec 25 12:35:01 2016 0.000000 seconds
> >
> > root@barreleye:~# hwclock -s
> >
> > root@barreleye:~# date
> > Thu Jul 7 13:07:52 UTC 2016
> > root@barreleye:~#
> >
> > Thanks
> >
> >
> > -----------------------------------------------------------------------=
--------------
> > Thanks and Regards,
> > Vishwanath.
> > Advisory Software Engineer,
> > Power Firmware Development,
> > Systems &Technology Lab,
> > MG2-6F-255 , Manyata Embassy Business Park,
> > Bangalore , KA , 560045
> > Ph: +91-80-46678255
> > E-mail: vishwanath@in.ibm.com
> >
> > -----------------------------------------------------------------------=
-----------
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
> >
> >

> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc


--=20
Patrick Williams

--nlttjmhgc7EeTk3T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXfp4rAAoJEKsDR8wtAMEZFMwP/2rIcvF2KV9svnqBd3vQ8slc
s202WM9Ynz2an5dEYwmPcHIvun3mlmScgB0/MiNPbtfEOIm4H3eCJ2uIqEtqiWrI
Byld09Prqj4ulxuanLePrg2fJeUO/NF5+wDnTHvYevPsBlKX6KPv/k/MADzzkrKt
Bui8c4fr3xuBQJh6FzjQs10tavgPqmUL0HwWds7GgeZyZtCzCyt4cM3Bhw60JQnK
aGi6qVH1B/JoPO6Es+Qn/H5Vg7B+93A+8Q9BMAAb24mzTr5o74CY1C/r4bfS4rO4
C5E0yydyTxieliQZUs7/qOWdUDnfLA/G98RUeBfmBa5qPGTHKJ4ZDFqT1vzuaoeC
yE52AQzcEBJvBdQWU6oznlg99i2thxiwe/pwsE7M+xAgdLgpqurne+zbmu17bH7A
jWmkIaOt8vcT5iOIMT6iB0gVsJRxUjJhOA/i7BfFI5hX2IZ7RtDpDTTzkJM63t8k
8zGKH8ErgwwSLA4TPpwMy5Zz48XPksA2tIOm8m07H7+yD+D0Ez5g3eF+tIQekjaP
fqvN286am/7XERdvNCAeKrq8nguo4Wi1J+3pmZRbSqj/SnFKyJSRzDqMbibQNfHG
ykBtx87ykzrNSw8o7B2jL4vCoSZ4+vNzug59U5cj5vGJAd8qkIumwiUibBVatFzs
W8J6Mkt+shNZdPQ3bqdc
=S5Ux
-----END PGP SIGNATURE-----

--nlttjmhgc7EeTk3T--
