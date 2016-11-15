Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tJ4B32fBZzDvZ2
 for <openbmc@lists.ozlabs.org>; Tue, 15 Nov 2016 21:58:19 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1479207489147502.8579300471441;
 Tue, 15 Nov 2016 02:58:09 -0800 (PST)
Date: Tue, 15 Nov 2016 04:58:07 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: tomjose <tomjose@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Discussion on IPMI provider libraries
Message-ID: <20161115105807.GJ15757@heinlein.lan>
References: <58208518.50202@linux.vnet.ibm.com>
 <CAFd5g45JxpeYZiq3inm0JkKeyQjk7T_4uARLY=Anf9EHXymhBQ@mail.gmail.com>
 <5821A449.3020807@linux.vnet.ibm.com>
 <CAFd5g46QM8PyrGSFjL2Otq_dLOmCcdELL_-nQh1Th09kPMbYFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EVh9lyqKgK19OcEf"
Content-Disposition: inline
In-Reply-To: <CAFd5g46QM8PyrGSFjL2Otq_dLOmCcdELL_-nQh1Th09kPMbYFQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 15 Nov 2016 10:58:20 -0000


--EVh9lyqKgK19OcEf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2016 at 03:59:08PM -0800, Brendan Higgins wrote:
> > The privilege provided by each command is a registration parameter and =
it
> > is consumed only by net-ipmid.
>=20
>=20
> That's fine, but in that case it should not go in the callback; it should
> be maintained and enforced by net-ipmid when it looks up a handler.

Neither net-ipmid nor host-ipmid intrinsically know all of the IPMI
commands that will or may be registered.  This is especially true for
OEM commands where the privilege level is determined by the command.

Are the privilege levels defined by the IPMI spec?  If so, I don't see
anything incorrect about each provider having it.  If not, it is
something that we have defined at build time, correct?  Would it be
acceptable to have multiple symlink locations for net-ipmid providers?
ie. /usr/lib/phosphor-net-ipmid/user/ ,
/usr/lib/phosphor-net-ipmid/admin/ , etc.  I suspect we would need to
break libraries up more because currently a single library provides
commands at different privilege levels.

--=20
Patrick Williams

--EVh9lyqKgK19OcEf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYKuo8AAoJEKsDR8wtAMEZyNAQAKOzs5UybhCJeHWZ26Mrx5Y5
HQrnay/oMdfdO3kgDki5iLfrHxLS49PbGlNBAPmM+nRQxgU+IShZiff3Ts5OW6iC
xxzswTkd8UV87uMKbgDUqV9b6dcSDEGPc7hylshlSDS3mM1C9Yh6Oz5k7w0yqsx3
swusyGJRoB3nGWYyamDwMXOjvs8ttmvABi2zLKVSWY+xDyeS94gM0XaflN0psJEN
qdMLnzvm0SOiIIl5zcGhX87eIkvoT1iw21vDGfQyxC82lFH+a95KPau7CSNVBdYM
zHfyTCGKxMAn37bK1o0ldf+MPAsKQAXC24xfD24g6Q87vpIXPzm91PNpCB51IBvy
knXsxokhR7Nh6VKRi/q5KdE1obwmoQUby5DopfbAaDfgkfuNLMKdpyPScyeftlHL
XrVZgP7hp77ZOuobPcMqF98bwdFEqiMQrETjUb0DYUCiHJ3/yuWZAnzF9FfPYXRd
7YHY6YJhBncZ9rV44AbkdN9w4BbKWf4P4n5pTnNhk9d6EXAY5lv+JvBCtVRdTb5C
i6fBdXkd3ZTtBQW7e3zEPKHaBP/KU4ZVCqsjeVJ4Ee01CusXiCydU8Wa5AT8ZUaM
ulTsxv/sAbZPrLH/z7A2hbewts5e7m9apoZFJEk3B7qODTmElRBwLFF+jk986Zbg
3nsshgFaockBORCcz9OE
=QKVR
-----END PGP SIGNATURE-----

--EVh9lyqKgK19OcEf--
