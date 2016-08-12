Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s9n5L6YtHzDr1m
 for <openbmc@lists.ozlabs.org>; Sat, 13 Aug 2016 00:17:10 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1471011424634706.3074881139943;
 Fri, 12 Aug 2016 07:17:04 -0700 (PDT)
Date: Fri, 12 Aug 2016 09:17:02 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: tomjose <tomjose@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Discussion on openbmc issue #430
Message-ID: <20160812141702.mx6fhszbltr2ogfa@asimov>
References: <57ADD588.7080000@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="abq554g54sekhyyv"
Content-Disposition: inline
In-Reply-To: <57ADD588.7080000@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 12 Aug 2016 14:17:11 -0000


--abq554g54sekhyyv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Tom,

Thanks for sending this out to the broader community.

Few comments below...

On Fri, Aug 12, 2016 at 07:26:24PM +0530, tomjose wrote:
> *Registering Callback Routines:-*
> -----------------------------------------------
> 1) Open the IPMI library path(/usr/lib/phosphor-host-ipmid)

I would prefer we have a new directory '/usr/lib/phosphor-net-ipmid' for
the RMCP libraries.  We can create symlinks between the two repos as
appropriate.

The reason for this is two-fold:
   1) I suspect there will be some of the OEM commands that we will want
      to expose in-band only.
   2) There are commands that may want similarly excluded from the
      in-band path due to security concerns (even though we have the
      white-list support).

We might want to have a '/usr/lib/ipmid-providers' as the default
install location for all providers and then symlink into both
phosphor-net and phosphor-host as appropriate.

> 2) Scan for libraries that end with .so

Keep in mind you'll need to deal with versioned .so's as well.  We had
to add that support to host-ipmid recently.

> 3) Do a dlopen that would register the handlers for the callback routines.
> The data that is currently registered for each command: Net Function,=20
> Command and Functor.

There are a few providers that register for dbus callbacks so they can
monitor signals.  We'll need to discuss a little more I think on what
the expectation is here.  Maybe the way we are doing dbus callbacks
isn't appropriate to begin with, or maybe the callbacks are for host
alerts and not needed in the network path?

> *SessionLess Commands :-
> *-------------------------------------*
> *
> This would mention whether the command can be executed without a=20
> session. For example
> Get Channel Capabilities can be executed without a session.

How do we identify session-less commands?  Should this be an enhancement
to the registration API?

> *Minimum Privilege Required to Execute the command :-
> *------------------------------------------------------------------------=
---------*
>=20
> *This field would mention the minimum privilege of the session required=
=20
> to execute the
> command. Before executing any command on a session, the command would be=
=20
> executed
> only if the command privilege level is less than or equal to session=20
> privilege level.
> The privilege levels are Administrator, Operator, User and Callback and O=
EM

Are these privilege levels something intrinsic in IPMI or something you
came up with?

We plan to integrate the ipmi server into the same BMC user list as the
REST interface.  I think we need to identify these roles and then allow
unix-group membership to determine which commands can be ran.

We have a feature to be implemented for the REST interface to define
group membership requirements for dbus / REST calls as well.

How should providers specify these?

--=20
Patrick Williams

--abq554g54sekhyyv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXrdpeAAoJEKsDR8wtAMEZelQP/0zQrrzHEbEHGvdXDJScDCxG
4yi0sx3xoG95pCPj3alnwLzOXmg9MZV2/0l6aA9taAgTKFZwUrTfARlfVkzTHnfu
p+lik+ru8UMIwcz33aYC9Hf3a3agpQoajx306r8NurdxGX9AdjguXHVzDlcK7Zve
VMF2V5c7v3xe3VFqzzjcvgqH1Itd6gxP4t3ZUgU0pvunnN3DH6i9TSUYLCftZycm
qtDicfKGXR0ysuoZb3Po7NE7yC4XrA+EA7RBCbnwnKJfla4UHxiTcA4bf26+9xwy
kQso/Ngv07wTGD/FtFxb3VK1rxTJ6ZrWv2gL9YWyotKs2bcJ599yTv9mybvcaQMD
zXidHAq+cLAOHJybYQ1rgrG+R8WmczGfrn+jwwkTKGSpwbsTXkNFpzvPy3pzNFMQ
bYRJOCixukXi/zmwnGymQKqNEsW/c7zeBlY367xTN38dmYfXKKm5z+2hXSv4nXhG
/n5Jza0K+CpBTNIc9b/A53trZc4T1T0+kc//bzqK3MHtwhknyFZSTNCHm/JUc1p6
OGqKLHkAPceBpdQybolXjsMpalUZeyzSBOxkx4T1sF/2vP3D7/rHnT+KqIwYfs4M
D1bjMzbrppYsQhLzA6i8Mw6hx3oePFhsYoGJi6XsS/wkoKA4IjRM7C3sq5+5oY2W
5m8XkE6rfdajhVgdqGh7
=NuG3
-----END PGP SIGNATURE-----

--abq554g54sekhyyv--
