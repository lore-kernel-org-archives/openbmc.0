Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJsns3qJvzDrSh
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 01:14:25 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1501254847340528.2513132030205;
 Fri, 28 Jul 2017 08:14:07 -0700 (PDT)
Date: Fri, 28 Jul 2017 10:14:05 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, openbmc@lists.ozlabs.org,
 "Edward A. James" <eajames@us.ibm.com>, cbostic@linux.vnet.ibm.com
Subject: Re: [PATCH linux dev-4.10] drivers/fsi: Remove scan from master
 registration
Message-ID: <20170728151405.GB14987@asimov>
References: <1501180508-4009-1-git-send-email-eajames@linux.vnet.ibm.com>
 <0a2cb633-ae2a-7dd2-fe7d-cf565be4d8c2@ozlabs.org>
 <9d456a46-bf10-a977-1f38-a84995b08764@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline
In-Reply-To: <9d456a46-bf10-a977-1f38-a84995b08764@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 28 Jul 2017 15:14:26 -0000


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2017 at 09:57:23AM -0500, Eddie James wrote:
> 2) FSI operations while the host is booting can cause FSI failures.=20
> Since we don't know the state of the host while booting the BMC, it's=20
> generally not safe to do FSI ops as we may disrupt the host.

=46rom my perspective this is especially bad because it would only surface
in specific timing conditions.  The FSI bus is, by the system
architecture, under the control of the Host for a period during the
boot.  Both FSP in the past and BMC now are required to stay clear of
the FSI bus when the Host owns it.  If we do not, it can, in the best
case, cause unexpected FSI errors for the Host resulting in extra parts
being "guarded" and, in the worst case, cause silent corruption of
chip initialization registers leading to an unknown data integrity
problem at some future point.

When the BMC reboots, the kernel cannot know the ownership state of the
FSI bus, so we should assume it is un-owned and not do any activity
until userspace has had time to "assess the situation".

--=20
Patrick Williams

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAll7VLoACgkQqwNHzC0A
wRnuPQ/+PH/K59HTA14/IjIl+sVF/+TlXxcaZHrLwtwssxaZSKktlnDbgX7sSr3B
+J45VK7h7nEOUaCKSZ61zJP6pAwlMgBv7sNDda70/+6pGf83cCK1XSA5v8Cvp9Db
B+1GKLrfcY/R67+nFzi5ylh56K2Z+SAt93VvRYHA+HWp6n219xTVtuMMi5E9ybGi
qySphjlmDmRaW/rv/8zWibKbPR7uwgnmCX8pWirDdJ8Z5eUO07TJVcsS4PEtKNrj
BJXuzCKvxCmf1kM/aFIZQcrje0XXDGK0NGPOTqnKieM/qux10GiFYd4/AyDG6Kxx
Dr2Ecqbq3HZv4r6n/HdV1afn+uSdqYr2NaFUT2nbnmlQZoqVtIOTV5haqM2LngZN
Y8WQLdTqt0UeIjyGk+owsNJbhDZ+8JZIeEUoOKnfvzgxlkpEspfuR+eFOyrmfJiq
dxyJDXPJVfsyGs1exJBu6cPoMuYRl5LmnJLytVW1cPkk0SNw5hoYsUu4sP4FhCSI
7GgI0GcCNtLh8qC4F+1Z+AGmay7CAtQ0SiUhqdbmQQavze+xVX8i/pCO1Kykt/Uo
lU9DIgH0yNzQIO9VnyjkppFtfEwO3KirM7fXoe/y65vEomsBU+krjdqNOJWiJ1+c
XBCG+2X1QG01B8LjsE50alqik/JMYreXvVntrJeJwtax1kRyuBs=
=PRL9
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
