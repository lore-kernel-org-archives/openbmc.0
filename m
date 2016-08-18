Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sFYQN28s2zDr5Y
 for <openbmc@lists.ozlabs.org>; Fri, 19 Aug 2016 03:44:58 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1471542291874345.16895305315245;
 Thu, 18 Aug 2016 10:44:51 -0700 (PDT)
Date: Thu, 18 Aug 2016 12:44:50 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: tomjose <tomjose@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Discussion on openbmc issue #430
Message-ID: <20160818174450.etqga6oqo5f5z5qr@asimov>
References: <57ADD588.7080000@linux.vnet.ibm.com>
 <20160812141702.mx6fhszbltr2ogfa@asimov>
 <57B2FA9E.6080405@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cmkodddgfzwfdeq2"
Content-Disposition: inline
In-Reply-To: <57B2FA9E.6080405@linux.vnet.ibm.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
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
X-List-Received-Date: Thu, 18 Aug 2016 17:45:03 -0000


--cmkodddgfzwfdeq2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2016 at 05:05:58PM +0530, tomjose wrote:
>=20
> Thanks Patrick for your feedack. I have mentioned my responses inline.
>=20
> On Friday 12 August 2016 07:47 PM, Patrick Williams wrote:
> > Tom,
> >
> > Thanks for sending this out to the broader community.
> >
> > Few comments below...
> >
> > On Fri, Aug 12, 2016 at 07:26:24PM +0530, tomjose wrote:
> >> *Registering Callback Routines:-*
> >> -----------------------------------------------
> >> 1) Open the IPMI library path(/usr/lib/phosphor-host-ipmid)
> > I would prefer we have a new directory '/usr/lib/phosphor-net-ipmid' for
> > the RMCP libraries.  We can create symlinks between the two repos as
> > appropriate.
> >
> > The reason for this is two-fold:
> >     1) I suspect there will be some of the OEM commands that we will wa=
nt
> >        to expose in-band only.
> >     2) There are commands that may want similarly excluded from the
> >        in-band path due to security concerns (even though we have the
> >        white-list support).
> >
> > We might want to have a '/usr/lib/ipmid-providers' as the default
> > install location for all providers and then symlink into both
> > phosphor-net and phosphor-host as appropriate.
> In the proposal, i had mentioned there is a provision to add channel=20
> restrictions to each command.
> There are 3 variants available: execute on any channel, execute in-band=
=20
> only and execute on lan only.
> The channel restriction would be evaluated before each command is execute=
d.
> I hope this would meet the same requirements.

I would rather not codify that in the provider itself.  By using
symlinks we allow the system engineers to specify different behavior for
their system without having to modify code.  ie. through .bbappend
changes to the recipe.

> >> *SessionLess Commands :-
> >> *-------------------------------------*
> >> *
> >> This would mention whether the command can be executed without a
> >> session. For example
> >> Get Channel Capabilities can be executed without a session.
> > How do we identify session-less commands?  Should this be an enhancement
> > to the registration API?
> The session less commands are mentioned in the IPMI specification.
> Examples are Get Channel Authentication Capabilites, Activate Session=20
> command etc.

I meant how are they identified by the provider?  You could want to
implement an OEM command that is session-less.  We need that identified
by the provider when they do registration?

> The privilege levels attributed to each command is mentioned in the=20
> specification.
> It is mentioned in the specification Table G-1,(Command Number=20
> Assignments and
> Privilege Levels). The providers should provide these as registration=20
> parameters
> when the callbacks are registered.

Ok.  Those can be default groups.  Isn't there also a mechanism to
create custom groups with IPMI?  Since we plan to map IPMI users back to
PAM users, do we also need to map roles back to PAM groups?

--=20
Patrick Williams

--cmkodddgfzwfdeq2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXtfQSAAoJEKsDR8wtAMEZEIUQAI+40PnV3I7SaDAJ2ujew4tV
raw/gB5zzOZ4t/0feUmhVIE5lek9heErCc4lEym/NIXgLdJzYeyiXRor3uF/OlOC
6SsG30oLHhRbzHWnFsdX6UNMG91RwAY6FSDP5Ve2H8dB4ttch4avAk0EvItgc56L
wtxqgciJ9UvFhoOVtGzSxf/iLtCi4yJuwtd6v4ntowPNmkgwv2IbKPn+ctrJd4sA
3KACccKu63vbXh94OuwwzQxFezjXcoW5YDSiTZc/ycpwsdOfna4t4krdRVNi08JS
a3ecYC/F8BmYgPVtDtX8ItZmxeYmlhIjpe0x/U67aI0/9PYy8e0OGZwuOqCGD3vx
OQYHolOG3Ba/RYEb7jD6G06P/vUN48wWnQ00JZTxhNWAHj4tc120a6t44FQIOEC7
m7Y772NzTbwvrq11X5oejlflXILvFZuEtnc6WmZdVt/J8lDNRH9ef2IqsSq1AYod
rG8BiRo/D+D3W0zRVwJiv9jppUSRDpR85jD926Z2DySuwH3n+W/tha1YzTH3I2vx
725RBdKP3LmzSU8NB/y0e47p9uqRSSVjn5SWwqqS2c5R52ohf1wLBxj+VoorLbBz
cXSIvrUAe3pvmqq7UNoPxGCHESu0D0fH+6+iPoNpeEzIA38uipAM5RdCpqSqc/2z
k5AI6/louKdnxwsMHoR4
=DnM/
-----END PGP SIGNATURE-----

--cmkodddgfzwfdeq2--
