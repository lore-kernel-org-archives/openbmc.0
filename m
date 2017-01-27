Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v8kGz3LFlzDq8x
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jan 2017 14:07:22 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1485486428493463.1770425403562;
 Thu, 26 Jan 2017 19:07:08 -0800 (PST)
Date: Thu, 26 Jan 2017 21:07:06 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Chris Austen <austenc@us.ibm.com>
Cc: Adriana Kobylak <anoo@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: OpenBMC Image Management
Message-ID: <20170127030706.GB5504@heinlein.lan>
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
 <OF3E869A3E.DB3E43DE-ON862580B3.008284D7-862580B3.0082FDDB@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Content-Disposition: inline
In-Reply-To: <OF3E869A3E.DB3E43DE-ON862580B3.008284D7-862580B3.0082FDDB@notes.na.collabserv.com>
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
X-List-Received-Date: Fri, 27 Jan 2017 03:07:24 -0000


--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2017 at 05:50:46PM -0600, Chris Austen wrote:
> "openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org> wrote on
> 01/25/2017 04:15:27 PM:
>=20
> Are there any security goals that need to be considered?
>=20

There are a few different aspects to security that I can think of:

1. Is there a way to identify and reject an invalid image (Define
"invalid") before it is applied onto the system?

2. Is there a way to identify an applied image has been tampered with?

3. Is there a way for an image to expose a security flaw in the code
itself (such as by "fuzzing") to cause unintended effects?

A few statements to answer your question:

    * If there is a fundamental flaw in any of these regards with our desig=
n,
      we would like to know about it and will fix it.

    * #1 is typically solved through image signing and a one-time=20
      verification at the time an image is applied.  Issue
      openbmc/openbmc#356 is meant to implement this and would be a
      later feature on top of Adriana's proposed work.

    * #2 is typically solved through "Secureboot" or similar
      functionality. =20
        * The Power9 processor can implement Secureboot itself, so the IBM
          team currently has no plans to implement additional per-use
          verification of the Host firmware contents [in PNOR] by the BMC.
        * IBM also does not currently plan to include BMC Secureboot for
          the Witherspoon machine's initial delivery.
        * Rick Altherr from Google has been contributing support for
          U-Boot "FIT" images, which provide something like Secureboot
          verification for the kernel and initramfs images.
        * The project would certainly be interested in further
          development here, but hopefully like most of our features, it
          can be selectively enabled or disabled for different machines.
          In particular, given that Power9 is itself performing
          verification of images, verification of the PNOR by the BMC
          should be a choice by the vendor weighing boot-speed and
          security.
        * Adriana is not intending on doing anything explicit to enable
          or impede enablement of this.  If there is something in the
          design or implementation that would significantly impede
          enablement, or if there is a relatively minor improvement that
          can be done to aid future enablement, we are very interested
          in this feedback.

    * We don't intend to have purposeful flaws in the area of #3 (does
      anyone?).  No one has committed to doing explicit penetration
      testing here, but we certainly will accept vulnerability reports
      and, even better, fixes.

--=20
Patrick Williams

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYirlXAAoJEKsDR8wtAMEZOdAP/A260i0lDB6ZPc6CkAozoIMF
TVuEyfBwQPpsGIQCNkdjFtTplAyAKfD1JpFSEUXA0Lcu3zOzHK+7kNFyVMvr8jRB
okEwLxnua6WVBwRQa5hyitaZ2WXHjp0h7+DNWOh95abFg7dVcaMm9++LwzkdTIAP
V4X8oX4QyB0HtSUGcKeogik/H91HKwn5LRcOr57/6mx2h4phVfeV72ERPyzf2R3O
R7Ik9vuqLj+ZHgBiJ2jTgxZm3u/qzhy0FimVyc0vmh4jMUVGe7qnDVUkWOzrpmWL
N22AN0HmGEx4OsYKbjX89+JlARDqWKsXEonuV16PLVRw3fILghe/gESKKdmMcSIK
NeVPV0i9BucJzKsRlxn4ZIt5YZ0OyJ5tpOWQuqeEyqlbm/gu37CsXNoiNLVCccIV
lanLMKNOQNwZyEBPLuzeM0HdlpxVuj1sk/dO0q0IOB57rxbSvc+ikEyX0/TxWR1H
1RozMzg7XD8esUIncaf73nZcsabFXuJb6xev0rNwg5rBIFFpcbRRrS6+AtbpSjiO
QalpNPZoRwRo5Uap0GOpFdA2gd0c21+4Qk+vlVKKnN2baUgV+NeK145RbFLA4jmV
TqFz/PP5KTRJAMsbcoUaNrS7Ur7L9WRmYRXy5uXKN1p1bpqt6k9XgEvf4I6rp2Wz
iDKGK/zmHU87nB0xJJub
=iZ3/
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--
