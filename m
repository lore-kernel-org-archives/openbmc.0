Return-Path: <andrew@aj.id.au>
Received: from homiemail-a11.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 096871A0311
 for <openbmc@lists.ozlabs.org>; Mon,  7 Mar 2016 14:11:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=JkywGTdw; 
 dkim-atps=neutral
Received: from homiemail-a11.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a11.g.dreamhost.com (Postfix) with ESMTP id DFB1F6E06C;
 Sun,  6 Mar 2016 19:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=dFs1knY/aXSFEN2oa84Nt
 aT/ugs=; b=JkywGTdwXtOpFLn5Zyvwspvwcrbinyr2waTz4URmiR4On1LRzt5ks
 wH5rMQLWploVEqlR2e2BP4JLU15Hb2sZq7FUsfQ0AqrQCBVHW18hhhN91orFax/K
 skI87UJ6V0fPoa0/iybKuSUs0Fpq/9yeJzu1roO3LppMxwqfHvFBXI=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a11.g.dreamhost.com (Postfix) with ESMTPSA id E97FA6E05B;
 Sun,  6 Mar 2016 19:10:57 -0800 (PST)
Message-ID: <1457320246.10265.82.camel@aj.id.au>
Subject: Re: [PATCH openbmc 30/32] init: Add a hook to download files
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Joel Stanley <joel@jms.id.au>, OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Mon, 07 Mar 2016 13:40:46 +1030
In-Reply-To: <CACPK8XdiUZw01zdhAkYs=EfN73aTDiWu0KTvSQs13NoeMa2Fow@mail.gmail.com>
References: <1457181023-23569-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457181023-23569-31-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8XdiUZw01zdhAkYs=EfN73aTDiWu0KTvSQs13NoeMa2Fow@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-lNuOxoUkwQlL/pR5tOsm"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Mar 2016 03:11:00 -0000


--=-lNuOxoUkwQlL/pR5tOsm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-03-07 at 11:03 +1030, Joel Stanley wrote:
> On Sat, Mar 5, 2016 at 11:00 PM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
> > From: "Milton D. Miller II" <miltonm@us.ibm.com>
> >
> > Add a hook to run a shell command line that is stored in a u-boot
> > environment variable.  Only execute this command if the previously
> > established options file has a keyword trigger.  Do not even consider
> > the option if a build option flag is not set to y.
>=20
> This patch should not be merged. It creates a worrying backdoor into
> our system where the boot process will run arbitrary commands from
> untrusted u-boot variables.

+1

>=20
> If we need to set state in u-boot in order to trigger an update, then
> I can imagine we might allow a flag to be set that says "do_update=3D1",
> and the system can pick up on this and grab updates from it's
> configured update source.

+1

However, how should we define the update source? Is burning it into the
current boot environment too restrictive? Can we make it less
restrictive but not go as far as arbitrary command execution? I take it
there's something driving the inclusion of a automated network-fetch
-and-update-at-init feature for it to be included at all? We can
already update the partitions during shutdown, and if we boot from the
flash to trigger this process then we won't be running an updated
kernel or initrd until the following reboot, right? I guess it does
avoid multiple reboots to, say, resolve a kernel bug and then update
the remaining partitions (i.e. update the kernel/initrd at shutdown,
update the remainder at init), but I don't think that's worth executing
arbitrary untrusted commands if it's the only use-case.

Andrew
--=-lNuOxoUkwQlL/pR5tOsm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJW3PE2AAoJEJ0dnzgO5LT5064P/A04HdGIlcvY8X80cJh1n+XN
qq6e4zlVsUkk1R1aBPJde1dYTwwqXxmDyhLg8GhagMNRcUZDxRhOd3t6tzf0GVlM
kc1ApO6J05NtSuEclJVCd4UiZFeMXpY2HyKYtiH0cRpLTmVcJSgZ9L75+1FITTJG
iZ6GwbDC3YKbPdRQaNcqcwAPT44DmRfV5sayxPLnxS+qDX8Tco6ROOYUk2joC3Lo
SmWpkBUrZm0B4RXcY/hSRHyThSLMWzrAJJIkQYYQzn4R7O2V7HJk7GqHVxf/Dnlc
HZCMG+DsoEcjzb+tUIry6342+HCoDnrp4WlKmtRkmaxaOnHDhw/7yTL7UTxddbpn
VwKIj5oQnaXAuTB6RzDIzd09bzVp5gpcG/pHSBcQvy1P2Hi2D/1n12Ff3Mv5ip/j
seIWj8FPKEBptH2htbuDDkF7LEuKh7fsD/oFYWMhCKFMa8xzxlcfH8Y92Z+P0OKa
L3tDzohuVmTfSVtukvQSL8GTMaBHy47kYWyQTMyUQH2pz5UCpRJzwFvfCWePqs+R
m2Wyb8ICT4Sm08yL3D7bCHkcxbmhsHhsWuX/XDW84HGP+16eIHV1LRDnnQBrLpzA
CSTUhRiN3WRrBDcz8KPIadv6HvoJ27KyNeWn0saDtpa3yeDBpuEkdhvd/b2byPM3
po5B4jMK+FVvWHO7QKoU
=ckQL
-----END PGP SIGNATURE-----

--=-lNuOxoUkwQlL/pR5tOsm--
