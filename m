Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKNvQ3k3mzDqCd
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 06:35:46 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1494016539183918.9098242594789;
 Fri, 5 May 2017 13:35:39 -0700 (PDT)
Date: Fri, 5 May 2017 15:35:38 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Nancy Yuen <yuenn@google.com>
Cc: Rick Altherr <raltherr@google.com>,
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Patrick Venture <venture@google.com>
Subject: Re: phosphor-hwmon bottleneck potential
Message-ID: <20170505203538.GL25937@heinlein.lan>
References: <CAO=notxUh7si0kxbpyA-vK6aJaLQSi5NWCap7SeXDAgUNn8grQ@mail.gmail.com>
 <1493960865.3948.70.camel@fuzziesquirrel.com>
 <20170505163406.GB25937@heinlein.lan>
 <CAPLgG=k3mr01DnqWX5W4oCOQJ3njJCVBSe+EsLkpXCdj2Uwj7A@mail.gmail.com>
 <20170505174341.GE25937@heinlein.lan>
 <CAPLgG=m9S_4X=-Wvc8Uomhh7KBL5tBZn8A0Be9JTLZ=B-u+h5g@mail.gmail.com>
 <20170505180239.GF25937@heinlein.lan>
 <CAPLgG=mXE4qz5PVRFupp3=ogcS4oe0bQfYKaEwesttUhdvb4Xw@mail.gmail.com>
 <CADfYTpGfqgKP-HWg54mXnw7qc0wtPqfE=ZicZrCo_WsOJiQc7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pFej7zHSL6C5fFIz"
Content-Disposition: inline
In-Reply-To: <CADfYTpGfqgKP-HWg54mXnw7qc0wtPqfE=ZicZrCo_WsOJiQc7g@mail.gmail.com>
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
X-List-Received-Date: Fri, 05 May 2017 20:35:47 -0000


--pFej7zHSL6C5fFIz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 05, 2017 at 11:37:06AM -0700, Nancy Yuen wrote:
> 1. General design issue if time between reads of a sensor is dependent on
> the number of sensors in the system.

I don't see any general design issue with phosphor-hwmon or dbus being
talked about here.  There is one specific driver that has a pretty large
scaling factor no matter how you read sensor values out of it.  We've
talked elsewhere in the thread about a potential driver change to
improve it.  Most hwmon drivers do not have any issue.

> And drivers can fail, due to miss behaving code or hardware.

hwmon drivers should never block userspace forever.  If they do that is
a serious driver bug.  We could be defensive against it by enhancing
phosphor-hwmon to use non-blocking IO, assuming the kernel supports it,
but that seems like a lot of code for a non-existent problem.

Hardware failures are already handled by the hwmon drivers, reported
back to phosphor-hwmon as errnos on read, and dealt with.

> In this design, sensor report could be
> significantly delayed if one sensor/driver were bad or misbehaving.

You have no difference in the problem of one sensor reading not working
in any of these three potential designs:
    1. One big loop that reads each hwmon sysfs entry for the whole
       system in sequence.
    2. One big program with N threads that, with a stampeding herd,
       attempt to read all hwmon sysfs at the same instant.
    3. M processes with N hwmon sysfs reads in sequence.

In any of these designs, if the driver delays your read for 8 seconds
your data is delayed and stale.  I think our expectation is that a
fan-control algorithm is using dbus signals to keep track of the most
recent value and if it doesn't have up-to-date data by the time it wants
to make a decision it would deal with it in whatever way it sees fit.
Likely, either using old data or treating that sensor as in-error.

If you chose design #2 and then expanded on it by adding a thermal
control loop in yet another thread, you'd still have the exact same
problems to deal with.  It just is now all in one process using shm to
communicate the cached sensor values instead of using dbus between
processes.

--=20
Patrick Williams

--pFej7zHSL6C5fFIz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlkM4hoACgkQqwNHzC0A
wRk53g/9GXXAMUdIc5f6rwOiX2gkmXmW+l1PECPv0bc9EmxPDM9iQhIeLnzO84yK
q5BdSrViHr4VIBnLVuGM9qUfm8xiJhsz0y8qOqub9ipguB5Nj0qPVIs9FKb1wTEQ
8I1TLoF8DkB2tN5+TMWHTaDxBDYr2sy9QwzZUv1SasLh61v6eCZlotXzJxv1Qv6s
JcJg4IphXXShZy05jiL8noBLr9VDPY9GbkQUPWWzRUQkniz+YEjLcY8AQhMrhPAI
6yrIOIEeshGozvwMG7WDB32NaM5M/dBQ/ERqYChmLq9xdU/5MNBvpxnCL1/HnsRz
LUyUHhVq7pmiKNBlHDZgk8Q9xeIIDTjQ63ItWGv5UcE/xNgOzE70Br0Jsh2bfxdw
L+UhbYCd57ntTbqv3VYG/9zeZDjv+fqBtKXbZ+S67n9DF1oNQqaQ5SNfVJzPcPym
F77rS2Uvc/gwb2Aol4MVix914YYvypinWIku6u/9zMZzhBQ4NJO+3PD6GmIyDc6Y
vOY+IEqvtzME+ri0u/uNhn8r9GGtGosD0X/ToWno8VQ5yk1UCZLsSy5TLqJAZn0L
aeZozmntzl9mtGZTQK5BsTa2EwNhgfZED7txsHkBcuCBevt+X3IOf26Fg66M7lnA
VbEXqKqHspCsuIm3Cg2TZBwtQ0nN2yTLqQXmMg9RWoajPO6iYe4=
=2yvB
-----END PGP SIGNATURE-----

--pFej7zHSL6C5fFIz--
