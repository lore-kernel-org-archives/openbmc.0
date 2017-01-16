Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v2Pwd19m0zDqGd
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2017 07:29:36 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1484598566505978.8675197104939;
 Mon, 16 Jan 2017 12:29:26 -0800 (PST)
Date: Mon, 16 Jan 2017 14:29:19 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jack Miller <jack@codezen.org>
Subject: Re: Mailbox daemon
Message-ID: <20170116202918.zvuiq43s76anf46u@asimov>
References: <CAN-ccARFNcQdi1EgySu5EhgpWw_ekeE+tnLaBYTpJvJi4uTp7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3rzwzzhkmu7bv75t"
Content-Disposition: inline
In-Reply-To: <CAN-ccARFNcQdi1EgySu5EhgpWw_ekeE+tnLaBYTpJvJi4uTp7A@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
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
X-List-Received-Date: Mon, 16 Jan 2017 20:29:37 -0000


--3rzwzzhkmu7bv75t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Cyril,

On Fri, Jan 06, 2017 at 11:47:50AM +1100, Cyril Bur wrote:
> I recently sent patches to linux to be able to use the mailbox drivers
> on the BMC so we can avoid having the host LPC bus mapped directly to
> the pnor.

Thanks for this work so far.

We had an internal discussion with the host firmware team and they
want to go this direction for P9 so that, among other reasons, it
reduces the duplication of the SFC drivers.  Right now we have the BMC
and two different host firmware implementations.  Unfortunately(?) they
would like this in very soon, but I believe you have been working with
them on this.

Knowing the [inefficient] layout of the Power firmware 'ffs'
partitioning scheme and some of the limitations of the host firmware
that uses it, I would also like us to no longer layout the real PNOR in
'ffs' format but instead use files in a BMC mapped file system.  This
allows us to, for example, use cramfs-xz for the read-only portions.  I
need to get someone on a design for this soon.

Considering that, I would also like this to work on P8 systems because
the majority development vehicle we have available are Barreleye and
Palmetto systems.  We can get this working on P9 systems first but we
should get the host-firmware pieces backported to P8 soon after.

> Obviously there needs to be a userspace component. I've been using a
> fairly simple daemon for testing: https://github.com/cyrilbur-ibm/mboxb
> ridge.  It will absolutely do for development. I'm hopeful to grow this
> into something that isn't quite so static. Being able to tell it that
> the flash is actually a file and not /dev/mtd would be great and at the
> moment its quite dumb and is much slower than it could be.
>=20
> Is it possible to get an openbmc repo for it?

I see it as very reasonable to have a reference application for the
mailbox protocol implementation.  I do wonder about the longevity of
usefulness and system-agnostic aspects in order to continue develop on
it beyond doing the dumb mapping.

Points to consider:
    *  Adding mapping of a single file is still, likely, system-agnostic
       as long as you either disallow writing or allow writing to the
       whole area.  Anything more requires knowing the layout (ex. ffs)
       which means the mailbox daemon becomes Power-specific.  We have
       been trying to prefix Power-specific implementations [repos] with
       'openpower-*'.  It does seem very worthwhile to have and maintain
       a system-agnostic implementation though that does the simple
       mapping so that other platforms have a smaller reference starting
       place.

    *  We will need errors on the production implementation to be handled
       and reported with the 'phosphor-logging' API, which currently only
       has a C++ implementation.  I suspect we will also want DBus
       objects created for 'xyz.openbmc_project.Software.*' interfaces,
       which we have a C++ library for easy of programming.  See
       https://gerrit.openbmc-project.xyz/#/c/1291/ for DBus APIs.

    *  Would we enhance this to have code for 'ffs' parsing and TOC
       generation, mapping to a real file system, handling code-update
       paths, etc. for the design I alluded to above?  Or is the code
       for the protocol minimal enough that we would start with a new
       daemon at that point?  Is there any aspect of the protocol itself
       that should be abstracted into a library?

Depending on the direction we would like to go after considering these
points, I can make a repository for it.

> I'm happy to look after
> it like I do for btbridge, hopefully we could do code review for it
> through email.

All openbmc-owned repositories, including btbridge, are currently Gerrit
managed.  It has been this way since September/October time-frame.  I
thought we were clear in communicating this around then, but Jeremy and
Joel approved that direction to make them all a common process.  There
has been changes to the btbridge repository since then, so I apologize
if you were suppose to review them and did not; I believe we had someone
=66rom the LTC review every change of significance.

>=20
> Thanks,
>=20
> Cyril

--=20
Patrick Williams

--3rzwzzhkmu7bv75t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYfS0eAAoJEKsDR8wtAMEZJj8QAJaXxRwGMWSr+sZDRXYaDnz6
yQLYRR/q/BAyoHnjiKSWXdGq2NylVmv7yoO9oAr8L8U75JScVOepyZu8to878Anq
6kxV1S4vUuxvQ0fF9st9HhX1eNWS/AZF6ozRJM5a+xyLELurlH7B5D1QpaL01kqh
JLvabwcWmi/jIeF6hj5o/Mq47PExkqfuR/Zxe4yb6e+uG57xdT+G5hBZ819hSklP
fNNqM3DLH6v9+hXVX5twrR95FIpv4eCg8Fnx+lj7CdmQ/YWqWnYpfOg8ustwe0cD
e2e+UJFCLWKlr/l4OeKK5rx2KCzM3RS7nGkSKjDKcyzXUVNuNT8c+6tFxc1PWBYG
YG/8KAQ48wzyfBIChAgmyPVi9T0G11S8TQ5ITAN4dLLH2QrJD8u2xNa5vBMHf/0I
zulMfCarkgBHVbomc04nZIFYKh8KxKX/q/fYW76IFslj13sf10Vlewd+dSkRb1+2
RnFkCkV7PSK5JOT7ztqZS8ObT+aML0TyZX9r3kkzlDx7prx/N8YX+yVXbMXxIAl6
hXiO73s5sa4JrqXRCoNZHKWiC1XC4VT9N2EstjlNRSVKc5Jnq6RMka5imeRY7Ll7
RnxTo8HmoOft1ACpEgOAAwzF2Q3dyY1t2xOoS8Fm+3HnzDO0a2CTirHQlGT7X30c
i4vb2/PAh9jVxXhhMUHE
=tZqZ
-----END PGP SIGNATURE-----

--3rzwzzhkmu7bv75t--
