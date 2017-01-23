Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v6HSD2WFtzDqHj
 for <openbmc@lists.ozlabs.org>; Mon, 23 Jan 2017 14:51:55 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1485143506817805.7282612562994;
 Sun, 22 Jan 2017 19:51:46 -0800 (PST)
Date: Sun, 22 Jan 2017 21:51:45 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: RFC: Inventory functional state tracking
Message-ID: <20170123035145.GF5120@heinlein.lan>
References: <94DF8B09-DBBB-4388-8070-57B933450886@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xaMk4Io5JJdpkLEb"
Content-Disposition: inline
In-Reply-To: <94DF8B09-DBBB-4388-8070-57B933450886@fuzziesquirrel.com>
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
X-List-Received-Date: Mon, 23 Jan 2017 03:51:56 -0000


--xaMk4Io5JJdpkLEb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 22, 2017 at 09:31:54PM -0500, Brad Bishop wrote:
> Looking for ideas on tracking inventory item functional state.  If this i=
nterests you, please read on.
>=20
> One approach would be to add a functional state DBus interface to invento=
ry objects.  I was hoping to
> keep dynamic/state information out of the inventory namespace as much as =
possible, but the inventory manager
> could probably be made to set properties on an interface when specific co=
nditions are met.
>=20
> Another approach would be a new class of sensor applications that do what=
ever is required to monitor the functional
> state of one or more inventory items.  For functional status of inventory=
 coming from the host this would
> probably be host-ipmid.  These applications would provide sensor objects =
in a sensors/fault
> namespace, possibly with a xyz.openbmc_project.Sensors.Fault interface.  =
The fault sensor objects would be associated
> back to their inventory item via an association object.

I'm not a fan of calling something a Sensor unless it really is.  That
is what IPMI does and it ends up being a catch-all for everything else.

Something under xyz.openbmc_project.State seems more appropriate to me
but following the rest of your concept the same.

>=20
> Please poke holes..ask questions.

What process would end up managing functional states?  The same process
that handles the inventory for an element or some other process?

--=20
Patrick Williams

--xaMk4Io5JJdpkLEb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYhX3PAAoJEKsDR8wtAMEZ3fQQAKBgr1Osrtruw8WPpt/vkK6Y
RzhMkpONcRtp/NdKQMy5WsltT8yMmJCrUpFd2QbO3ATyUsyUYKJBdZxED5e8SqbN
pspVmMG/SZLhPjJSJW8EfKL7V+s++z+RPK2bZGDularVcMyHh0IHRE7q5QyiReGM
mbWsLkw4EyRNSqT7iT8SY8ZRBtbfRQjPwxcx21c1CqzmXk5Jue59bA9itDL/touf
FovKRDsEbpmFya+8ym56faYCi5YWoFS5seuyqSJNDAjhoC1Ys6wDiU3TdY3naEPF
++9DfEytCEbpipSkrZPKQ2EhadUkSys9hrYuPAKkcnMPpg/9adFvR9TTU/5Ul3E6
XluCWL83tb8N8BHhpBFj+z6m8gWl/aSiBjvT0p3C2oqI99UI/wsHNfSLE5tpH/2+
6UB/YvYeAMroYUve9aWV4cdE3HvBJ5hRF0wSCt8+ETHu5245+VZQrS38wyegJ/2l
ZWj0iFW+LwmVUgzmgMnh0ebVkwNxP7hl8UDNK7hKMcSDSe7gx6tqWhrnRwnFTmpt
CFvRJ6cav3IKqb1R9JrwwSA+GrW4Yk4zej2Y4cw3kkBuUdxTSMcKzNMkaw+arhWQ
JAvMAjjUZMCv3Z9ePHCB+GgAyB2nH6LlkYnG7wpHxCPNDmORT84HCDXrt1gJsPpp
yaKQrizGlHBJVVuH264r
=CryJ
-----END PGP SIGNATURE-----

--xaMk4Io5JJdpkLEb--
