Return-Path: <andrew@aj.id.au>
Received: from homiemail-a22.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r5dRs2SBDzDq7s
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2016 15:18:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Elzac2pk; 
 dkim-atps=neutral
Received: from homiemail-a22.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a22.g.dreamhost.com (Postfix) with ESMTP id 8CFF511406A;
 Thu, 12 May 2016 22:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=YkmFwr5V64ZUdr0ULyydV
 spPT78=; b=Elzac2pkbQ8UxK90cVQzH/IcJmcD7j9qM49YWiMKTicMpx57XDKt0
 x3gpFzC3TWh7g3b9hdSlMv6fsRS3MBkoig7LMsmpQ6p9AAMR9ZKkldcoGPyT7gOS
 UADpFZ2Z+M+HRGWB08PpPYQdtxtxeZuV/8UfX5LQ7jN4L3cr6izD7Q=
Received: from keelia (ppp118-210-208-173.lns20.adl6.internode.on.net
 [118.210.208.173])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a22.g.dreamhost.com (Postfix) with ESMTPSA id 09C36114067;
 Thu, 12 May 2016 22:18:29 -0700 (PDT)
Message-ID: <1463116695.2703.53.camel@aj.id.au>
Subject: Re: qemu palmetto-bmc
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Date: Fri, 13 May 2016 14:48:15 +0930
In-Reply-To: <5734DA34.9050104@kaod.org>
References: <573399D6.6070107@kaod.org> <1463013049.2744.32.camel@aj.id.au>
 <5734DA34.9050104@kaod.org>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-mALsoLhhC6nmQ86floXV"
X-Mailer: Evolution 3.18.5.2-0ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 13 May 2016 05:18:33 -0000


--=-mALsoLhhC6nmQ86floXV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=C2=A0C=C3=A9dric,

On Thu, 2016-05-12 at 21:32 +0200, C=C3=A9dric Le Goater wrote:
> Hello,
>=20
> On 05/12/2016 02:30 AM, Andrew Jeffery wrote:
> >=20
> > Hi C=C3=A9dric!
> >=20
> > On Wed, 2016-05-11 at 22:45 +0200, C=C3=A9dric Le Goater wrote:
> > >=20
> > > Hello Andrew,
> >=20
> > >=20
> > > I spent some time today trying to find the good recipe between=C2=A0
> > > the kernel and qemu. I used all the latest with a custom dtb=C2=A0
> > > and failed to boot completely a guest :/
> > Hrm, that's no good. Admittedly I'm a little behind with the kernel,
> > I've mostly been testing with some patches on top of obmc/dev-4.3. I
> > had tried briefly with obmc/dev-4.4. It didn't work initially but that
> > was a configuration problem on my part (I have it working now).
> >=20
> >=20
> >=20
> > >=20
> > > Could you educate me a bit and tell me which branches I should
> > > be using ? and which command line eventually. I rather stay out
> > > yocto for the moment.
> > Yep. Current goodness is:
> >=20
> > qemu built from the aspeed-integration branch:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0https://github.com/amboar/qemu/commits/aspeed-i=
ntegration
> >=20
> > kernel built from the openbmc repo, configured with `make
> > aspeed_defconfig`:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0https://github.com/openbmc/linux/commits/dev-4.=
4
> >=20
> > CONFIG_RD_LZMA isn't set by aspeed_defconfig, which was tripping me up
> > initially. I tweaked that manually.


> > qemu can be invoked with something like:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0$ qemu-system-arm \
> > =C2=A0=C2=A0=C2=A0=C2=A0-M palmetto-bmc \
> > =C2=A0=C2=A0=C2=A0=C2=A0-m 256 \
> > =C2=A0=C2=A0=C2=A0=C2=A0-append "earlyprintk debug console=3DttyS4" \
> > =C2=A0=C2=A0=C2=A0=C2=A0-serial pty \
> > =C2=A0=C2=A0=C2=A0=C2=A0-nographic \
> > =C2=A0=C2=A0=C2=A0=C2=A0-s \
> > =C2=A0=C2=A0=C2=A0=C2=A0-S \
> > =C2=A0=C2=A0=C2=A0=C2=A0-kernel .../arch/arm/boot/zImage=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0-dtb .../arch/arm/boot/dts/aspeed-bmc-opp-palme=
tto.dtb \
> > =C2=A0=C2=A0=C2=A0=C2=A0-initrd ...
>=20
> Using the qemu aspeed-integration branch (minus the RAM zero patch),
> the latest kernels boots with rootfs :
>=20
> 	./obmc-phosphor-image-palmetto-20160512040959.rootfs.cpio.gz
>=20
> I had to deconfigure a couple of i2c devices which the kernel probes,=C2=
=A0
> and we don't have an aspeed i2c controller in qemu yet anyway. But the
> probe also hangs the guest which I suppose is a due to a timeout (clock)=
=C2=A0
> issue. Maybe because we don't have the support for non-zero match values.
> To be investigated.

Agh, yeah, forgot to mention that I'd disabled i2c in the devicetree in
my original reply. So the 4.3 kernel doesn't need it disabled, as the
i2c bus probes eventually time out. We boot to a getty on 4.3. On a
4.4-based kernel however, a number of things appear to not be timing
out as you noted (i2c driver probe, the MACB NIC driver probe,
something during init (if we get that far) that prevents a getty being
spawned).

Trying to track down the 4.3 vs 4.4 issues now.

>=20
> The boot reaches the end of systemd startup but without a getty on=C2=A0
> ttyS4. This is for tomorrow. I have a working environment I can play=C2=
=A0
> with now.=C2=A0

Sounds like some progress. For the record, if you're running with the
"Remap RAM to 0" commit from the aspeed-integration branch you have to
run with _at most_ 256M of RAM, otherwise the aliased region will
overlap the MMIO address space.

With a few hacks to the runqemu script from the pull-req against the
openbmc repo, qemu boots the system to a getty on ttyS4 (but it's with
a obmc/dev-4.3-based kernel). Not that it affects you as you're
avoiding the yocto stuff, but I'll update the pull-req against openbmc
to limit the amount of RAM to a maximum of 256M.

>=20
> >=20
> > >=20
> > > I also spend some time with uboot on qemu but I fail to get a=C2=A0
> > > console with the latest 'aspeed-integration' branch ... Might be=C2=
=A0
> > > the DRAM work around patch. uboot does jump out the lowlevel_init
> > > routine but then it then fails when running the init functions.=C2=A0
> > > It looks like a relocation issue. Investigation in progress.
> > Yeah, I wasn't getting a console either due to that strange branch
> > target value. I'll try to keep you across any progress I make.
> As for u-boot, it boots with the same qemu if you link it where qemu
> maps the kernel, 0x40010000. I had to run the link command manually
> bc the u-boot Makefiles seem to be broken. I will send you a short=C2=A0
> patch when I am sure of the diagnostic on the Makefile.=C2=A0

Okay, sounds good!

>=20
> uboot expects to start at 0x0 when it is pulled from the flash module,=C2=
=A0
> it then relocates itself but under qemu things are a little different=C2=
=A0
> as the platform implementation is not complete. We miss a flash=C2=A0
> controller.=C2=A0=C2=A0=C2=A0

Yep, modelling either the flash controller or the NIC is certainly up
there on the list of things to do for qemu.

Andrew
>=20
--=-mALsoLhhC6nmQ86floXV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXNWOXAAoJEJ0dnzgO5LT5jnAP/2jEH/UDS2vnMw9TC3T2SJzI
Uv1pKKm2fq10P3FmnE1LeyLmBGiOKBzZJ73tyu1tYpaNub7zXxssrT24njZad1xA
90NsrjzBeN4AYjBmPkFR10aSK0+FtVnZME5wCwzgYiXHMNxvervF/22mTFcIEoXK
kWQTbi3DT4FZF1S7w/vlsTmm400OcJMgnnY7pw66JugaCFWxfQdmg3bTxCYnON1r
oijgfcJ35NPTikSj8ZmqrEZ0jCPViEDNA6+Z0anJqApu67dz2hP8unGyp43mS36o
2N0fma3/ZpeVuYcauYRk5QTOKz97ZCDiS6YBnubX12jOyUnXTFr74SBdsw/tkScp
KskFvuBb3KL1rqZqcX3k7gkBZyJCX3NmUZLkbkd1yu+XCAnf8LIRnoVsjRWddyg1
eGhcGjM8/rOEKwR10zjQEr8nwkErE5fRscHHzUEVfQmbnri9kOjJWQmNrf4WFvTh
jJNZ/0gLKnjUuBmC5TBG7IPjBG/mwMTqFsdEIOiyD4xBbCKo+pbskEaDa4RNFewU
Wdj4fj6BSgE9TQfN6jNmr4DM+gzWOelcg3U2/UpOSCfKERo9xS4YmWkG6VCYkPG6
/idlGZbCwqamBl/u1ClQXbKjxfnQDkz6lF4ngfb4NH5FuJHhp3ZMhFWoHCUZopa4
UYOGaH4y5EKAqcXV6Jrk
=zEcD
-----END PGP SIGNATURE-----

--=-mALsoLhhC6nmQ86floXV--
