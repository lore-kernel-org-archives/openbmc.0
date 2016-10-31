Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6yH90NxlzDvJd
 for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2016 02:01:08 +1100 (AEDT)
Received: from localhost (32.97.110.51 [32.97.110.51]) by mx.zohomail.com
 with SMTPS id 1477926059158779.1609286553843;
 Mon, 31 Oct 2016 08:00:59 -0700 (PDT)
Date: Mon, 31 Oct 2016 10:00:56 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Opinions on CLI tools.
Message-ID: <20161031150038.zcvop7gbpu44ojsf@asimov>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6hc3rkzzf3fdvscv"
Content-Disposition: inline
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
X-List-Received-Date: Mon, 31 Oct 2016 15:01:09 -0000


--6hc3rkzzf3fdvscv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I decided we should solicit broader feedback before I merge this commit:
    https://gerrit.openbmc-project.xyz/#/c/900/2

Xo proposed adding a CLI tool, that appears to have been written and
maintained by someone at Google, and effectively is a wrapper around a
number of device driver calls.  Some of the facilities provided by this
tool would also be provided by "upstream" tools like i2c-tools or pdbg.

Last week the IBM team had a small discussion on strategies for CLI
tools.  In our legacy product, developers tended to make many many CLI
tools with little oversight and standards and these tools ended up
slipping into various "bring up", "debug" and "manufacturing" scripts,
effectively becoming "requirements".  For OpenBMC, we had proposed
landing on the other extreme of this, which is to say we should never
have a CLI tool as a wrapper around an existing tool or to replace
existing upstream functionality.  (We did have one small tool we
discussed which was to facilitate easier interaction with the DBus
interfaces, since otherwise would require a few invocations of 'busctl')

One of our (my) concerns about wrappers is that we end up segmenting our
own community from the broader Linux ecosystem.  Having available and
documenting broader tools like 'i2c-tools', 'systemctl', 'journalctl'
gives us larger mind-share with individuals outside OpenBMC that are
already familiar with those tools.

A key example we discussed was:
        obmcutil power-on
    vs
        systemctl start host0-power-on.target

The first is certainly "easier" for those that are totally newcomers.
The second is only slightly more difficult but gives insight into how
our state-management works.  With the second if someone already has
knowledge in systemd, from their own Linux experience, that allows them
to more likely probe into "what else is exposed via systemd targets?"
rather than just expecting everything to be documented with 'obmcutil
--help'.

With this proposed iotools package I think we have 3 options:

1.  Allow it in, as is, in the debugtools image.  Even though it does
replicate / wrap some tools, it does provide new abstractions on others.

2.  Add it to a .bbappend in only the meta-zaius tree.

3.  Patch the makefile (and discuss with upstream) to disable
functionality that is already implemented by other, more widely used,
tools like i2c-tools.

--=20
Patrick Williams

--6hc3rkzzf3fdvscv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYF1yoAAoJEKsDR8wtAMEZqT8P/0CVmB6Ql271ZIJZhQ3SHCHy
+Jqa3DY51oSYFDj6E7MiNOgOQF/6YRWx3ssgoKENhSp1l0FbNP7yLJHI7zp3TtO5
VUShYxTn746RffFGr7DP0ixw0VdSzK9rffe9e/KA2QARbPzGiTzzj05prX6Ckh0u
hkJbOsM2LC9eaJar2tMyn5FOpfe3wzsXDI4PrBXNTf3VuLME3f0wXPrWn/b5wCd/
xvJ0y1GB/dtDu+Fk4yavTX1nwAIN5TbXwXPn500wxJjuwvEOmlvBt7Y/KnXD870X
2B8JAcSQU5ACaj7bjmnV596qywp0KkBaEWdNel5DLK4gVkS3d9m21/UdLoKuyIYE
cGghbXEgv91CoMDzeHEK/qpQGc31fkEnNzKGgcHs0JVs6I+Y+sLHRUXYrYZtupLB
jMxDwIQ/qCSueMlSz0npBArCud2m1hD63/utKq+/nCzQrrQgpSGzRBJRbsBkXayf
Z5fNbRNhtFTA35V5WFer+UdbFrhGy3WbUZO2UNUgk1zn39EcToJHse7vPRWsMgKw
+/DFCnL7743taCaATE4Q4CMgIxyQIacQWmac/9Nw6/03zhRnL8uhHa1s4CBhRNun
wNZ4RdhU7S2psIKwgeEsQ6NzcjrW+jCkJTgfODmb8IfxDrY08mCltLA0B+zLU52k
VJDFosM2WbYyi2f1Crm/
=YY14
-----END PGP SIGNATURE-----

--6hc3rkzzf3fdvscv--
