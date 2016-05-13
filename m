Return-Path: <andrew@aj.id.au>
Received: from homiemail-a15.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r5Ynr3sCyzDqK7
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2016 12:33:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=vWBxZEq4; 
 dkim-atps=neutral
Received: from homiemail-a15.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTP id 49A2676C069;
 Thu, 12 May 2016 19:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=XYf5fhBa8DYp6mNm+KCqO
 Cmr3z0=; b=vWBxZEq4MxLTHBasHP/RFv5arvjS0cGzAt/VSZ41MkC0HJOMAz5+N
 qgTch9K+zkEcqpVeLO1pnr3+KFjZyVvLiGghphE9Hk2bIovKsQobkGZs7rfhgBx8
 RzoZBhOjmBioE57WjxGgojgH2fHWsIoDsFe6LfA0vROeXXgudyVoLk=
Received: from keelia (ppp118-210-208-173.lns20.adl6.internode.on.net
 [118.210.208.173])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTPSA id 245BD76C058;
 Thu, 12 May 2016 19:33:47 -0700 (PDT)
Message-ID: <1463106815.2703.42.camel@aj.id.au>
Subject: Re: [PATCH linux] Add debounce for power button, pull down gpioQ7
 to unlock identify LED
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Joel Stanley <joel@jms.id.au>, OpenBMC Patches
 <openbmc-patches@stwcx.xyz>,  ken.th.liu@foxconn.com, Adriana Kobylak
 <anoo@us.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 13 May 2016 12:03:35 +0930
In-Reply-To: <CACPK8Xfwb3TJeUHWZYY6LRHUK+eyjPfo5B2Hq=jcJ4p2UUFd2A@mail.gmail.com>
References: <1461908454-24209-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1461908454-24209-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8XdBaCC5npZ8UvfxEaeLuDL72n3p98-sx_XnpwbaRqYuHQ@mail.gmail.com>
 <CACPK8Xfwb3TJeUHWZYY6LRHUK+eyjPfo5B2Hq=jcJ4p2UUFd2A@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ItzhDQeInc3b5fmD3Lap"
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
X-List-Received-Date: Fri, 13 May 2016 02:33:53 -0000


--=-ItzhDQeInc3b5fmD3Lap
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-05-12 at 16:40 +0930, Joel Stanley wrote:
>=20
> ping
>=20
> On Mon, May 2, 2016 at 11:12 AM, Joel Stanley <joel@jms.id.au> wrote:
> >=20
> >=20
> > On Fri, Apr 29, 2016 at 3:10 PM, OpenBMC Patches
> > <openbmc-patches@stwcx.xyz> wrote:
> > >=20
> > >=20
> > > From: Ken <ken.sk.lai@mail.foxconn.com>
> > >=20
> > We need to include a description of why this change is being made.
> > What does it fix? Why does the previous behaviour need to be
> > modified?

+1

> > >=20
> > > ---
> > > =C2=A0arch/arm/mach-aspeed/aspeed.c | 8 ++++++--
> > > =C2=A01 file changed, 6 insertions(+), 2 deletions(-)
> > > =C2=A0mode change 100644 =3D> 100755 arch/arm/mach-aspeed/aspeed.c
> > >=20
> > > diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-
> > > aspeed/aspeed.c
> > > old mode 100644
> > > new mode 100755
> > > index 594a781..fa5d467
> > > --- a/arch/arm/mach-aspeed/aspeed.c
> > > +++ b/arch/arm/mach-aspeed/aspeed.c
> > > @@ -138,9 +138,10 @@ static void __init do_barreleye_setup(void)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* GPIO setup */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(0x9E82FCE7, AS=
T_IO(AST_BASE_GPIO | 0x00));
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(0x0370E677, AS=
T_IO(AST_BASE_GPIO | 0x04));
> > > -
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(0x00001080, AST_IO(=
AST_BASE_GPIO | 0x84));
> > We have a GPIO driver that handles setting this register.

Agreed - superficially it looks like we should be doing this in e.g.
bin/Barreleye.py in the skeleton repo.

So looking there, R4 was previously described:

=C2=A0=C2=A0=C2=A0=C2=A0GPIO_CONFIG['HEART_BEAT']=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=3D { 'gpio_pin': 'R4', 'direction':
'out' }

But was removed by Adriana in skeleton's "9c75104b=C2=A0Implement new LED
driver" commit. Presumably this should've taken care of the
configuration of R4.

The register write is also configuring GPIOQ7 as output, but I can't
find mention of it in the skeleton history. Given the title of the
pull-req and the configuration of the Habanero and Palmetto it sounds
like this is BMC_IDBTN_IN_OUT_N. Should this also be handled by the
'new LED driver'? It seems like we could avoid configuring it in the
board-file.

> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* SCU setup */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(0x01C00000, AS=
T_IO(AST_BASE_SCU | 0x88));
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(0x010FFFFF, AST_IO(=
AST_BASE_SCU | 0xA8));
> > Can you explain each of these you're setting each of these bits?
> >=20
> > >=20
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Do read/modif=
y/write on power gpio to prevent
> > > resetting power on
> > > @@ -150,7 +151,10 @@ static void __init do_barreleye_setup(void)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg |=3D 0xCFC8F7FD;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(reg, AST_IO(AS=
T_BASE_GPIO | 0x20));
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(0xC738F20A, AS=
T_IO(AST_BASE_GPIO | 0x24));
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(0x0031FFAF, AST_IO(=
AST_BASE_GPIO | 0x80));
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(0x0031FF2F, AST_IO(=
AST_BASE_GPIO | 0x80));

So here we're bringing Q7 low. Can we deal with it as mentioned above?

>=20
> >=20
> > >=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(0x00000001, AST_IO(=
AST_BASE_GPIO | 0x48));
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(0x00000001, AST_IO(=
AST_BASE_GPIO | 0x4C));
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(0x00075300, AST_IO(=
AST_BASE_GPIO | 0x58));
> > As above; we have a GPIO driver that handles setting this register.
> > Changing these states needs to be done from userspace. See
> > https://github.com/openbmc/skeleton/blob/master/bin/Barreleye.py#L5
> > 31

Right, so these registers configure debounce. I'm not sure why we
chose timer 3, but regardless, my understanding is that debounce cannot
be configured from userspace via sysfs. This leaves us with doing it
via the pinctrl driver which isn't yet ready (along with some changes
to gpio-aspeed), sticking the hacks here in the board-file, or
spreading the hacks to the gpio-aspeed driver. From those options, this
approach looks to me to be the least bad in at least it keeps the
board-related hacks in one file.

Cheers,

Andrew
--=-ItzhDQeInc3b5fmD3Lap
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXNTz/AAoJEJ0dnzgO5LT5lWkQALF92VW01PtvhMsCUoOjN1Hk
irIPGsW/mlopSyTqj13BKkBwF635OxMYE1t5OHmT/5zknbJShf2+Lx+diA8IFbfV
DdwO8DasOgNJgLQth+GsBKEC8zdm0Sf2lvnBgFolTWpQXQNURwRBp8CyDQsiXBod
Q6/JqO4+iQ/mGBT9BfOhfucD297LDbEQNvaDsoaWtJKqZc08/5RVEc6098z16Mwk
Se3I6i+GqmE1x4DZx6Nvx3AHw//Vs8HDR34YQ/RgsDBKlr+JAXDhbtUPAH5nyj7z
xmqNkWmx2HLLlWIcwGZjKLfNuRXVQYXXY3S5LTZPvMctXg36LG4Ye0ud/3LM+qcZ
MTRdPLw7rw2HXqni5Eict1/EgRJTm7Rudlc1ir0HQjbmFxK4tK4zGjV33hbIs36+
oVtYFbUHhMBRp4LDZv/s2FO+hrqmutq76lh1fIdKwk3KBW3ezmj4JfQiplL6Nv74
sTnqLdDgZDyBXzjpC7q0wOtEGVvBYFHxk3CaXmFZ+NXzhN+9b/A8DA/MjYnbUsEi
aTVy2K/tnAgwvJaKGuRdUyFWfXi8b11ya/6Ao+wadn16tAcUN94lyhWmREul9NKg
p5LZhYQjAttFRMUJGtCk8xNze4GV5oahoFTOKOW42hPKEzcQgtEhoL406ffQS4+9
DWPcSdN8tWOUl54Th43N
=/xgE
-----END PGP SIGNATURE-----

--=-ItzhDQeInc3b5fmD3Lap--
