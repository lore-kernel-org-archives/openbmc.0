Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNK6X0b6GzDrM7
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 15:55:47 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1501739738178756.2720329452734;
 Wed, 2 Aug 2017 22:55:38 -0700 (PDT)
Date: Thu, 3 Aug 2017 00:55:35 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Benjamin Herrenschmidt <benh@au1.ibm.com>
Cc: Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 Maxim Sloyko <maxims@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Image Management
Message-ID: <20170803055535.GG14987@asimov>
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
 <CAFR_W8pDQxg9sGmOVOhfJUAo1MqO0LOALrm9uuUDU2Dp836Y8g@mail.gmail.com>
 <9DAA22C7-7A31-47F1-8F14-B0227892DA57@linux.vnet.ibm.com>
 <1501719295.2664.14.camel@au1.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oOB74oR0WcNeq9Zb"
Content-Disposition: inline
In-Reply-To: <1501719295.2664.14.camel@au1.ibm.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
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
X-List-Received-Date: Thu, 03 Aug 2017 05:55:48 -0000


--oOB74oR0WcNeq9Zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2017 at 10:14:55AM +1000, Benjamin Herrenschmidt wrote:
> On Wed, 2017-08-02 at 12:15 -0500, Adriana Kobylak wrote:
> > General:
> > * Move to UBI volume management (on the BMC and PNOR chips), which
> > provides dynamic partitioning and wear-leveling. In a limited flash
> > space environment there might be the need to re-allocate partition
> > space and resizing in a static partitioning implementation can be
> > very painful.
> > * Use CRAMFS for read-only partitions, and UBIFS for read-write
> > partitions.
>=20
> I still don't understand what is the point of using UBI on a 32M or 64M
> NOR flash. Other than wasting space and time.

Ben,

"Still don't"?  You've never actually asked any questions even though
this was first proposed publicly on the mailing list on Jan 26th:

    https://lists.ozlabs.org/pipermail/openbmc/2017-January/006298.html

No one questioned UBI in that original thread, or really since then,
until now.  Kernel changes were proposed and merged back in early Feb
and again there was no discussion or questions:

    https://lists.ozlabs.org/pipermail/openbmc/2017-February/006457.html

But ok, I'll bite.  There are two main reasons we went this path:

    *  UBIFS is, to the best of my knowledge, a better file system than
       JFFS2 in pretty much every metric.

    *  Dynamic volumes are easier to deal with than static volumes,
       which Adriana spelled out above.

Is your real question why do we have a file system instead of a raw FFS
image?  That could have been implemented with static volumes instead of
UBI, and someone still could go implement code to do that instead if
they are interested.  A few advantages of a file system over raw FFS are:

    * Measurably faster boot and update performance.
    * Ability to support a true "factory reset" operation, unlike the
      competitive BMC implementations of raw FFS.
    * Easier and more obvious removal of development patches from a
      machine.

>=20
> Ben.
>=20

--=20
Patrick Williams

--oOB74oR0WcNeq9Zb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlmCutUACgkQqwNHzC0A
wRkjAA/9Gukxamk4RzAC1q8Xdu4/Sl+uuXCbc9rk8Wy+NuhYFtJIV+TEPtYOVO4P
V9Yw5bUISud4qrMj3v6vh+FfIoBnGiIh7R55W83tVLwfGRLgfKZkJSipAdeFI6SU
fumoiYibprE3h85HzLFOH+/HV/NlXTe1srL744DI6tZwydx01bMihJrzJAIc1U+w
i4u2TnmeOI9Tpan7yPsIbRdb8nO3n+HjjMlnhEMApAl0C/WZ8AVxMagLpYks628C
5QyUJY+QrOkyhtoMDLr/jjz2bbxo5e/omz5Dlb7sYaMmjUrEo+uQwG+gtRqXYjkq
wZjFs+ry4t9ajBqhdI0QLEOCBJccNcTFvdGJsJ7ww9awkwZtkXq2I73GfLkgwMSU
bdf0Fq4AATVCnQXVQNNiv7ad5BLYyo9McIcYCNLcmP6d0JpVhI6r5v2rBFXOlcGo
RRi82QP5VsQDTFDpO7wOvaWZsScM/KR4d5zhg/MBt5bl0UqruQWMZsoO6WRDpEhP
PW5XPNHBn3Wqg6EAupnQ8D0JnhSJ3CDTGOMFTjWfhvzf4hrJUVxmI2PFuMhGVAOW
B2gE3JLXNUkY122jy9LcjBIYQQgkK0kskne5F7fq9vs1R4v+kSFnEDKacVI8HspZ
2AWdiWgtrdp8Ry45dF5YPNJSNhPUJl9+IggdhoHznwUpHxfVL0E=
=EvD7
-----END PGP SIGNATURE-----

--oOB74oR0WcNeq9Zb--
