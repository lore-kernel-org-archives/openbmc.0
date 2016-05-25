Return-Path: <andrew@aj.id.au>
Received: from homiemail-a39.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDwnb0jQ4zDqM1
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 12:14:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=O2efPhNj; 
 dkim-atps=neutral
Received: from homiemail-a39.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a39.g.dreamhost.com (Postfix) with ESMTP id 08BE6150074;
 Tue, 24 May 2016 19:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=6bzQzPYJ7MR8u2mztnQ2g
 X5Crr4=; b=O2efPhNjaEKMVVD4G+xNLKjGELgptUDH09tui5FQgbEUJxvDt16kw
 WHffnTZGuKdC4RjKwV2cMHRU94hl6XhzMo5bFaT+uGaB17Okxu/0YOkB3ZkITUFK
 C/kVf+8QzliTCiWGZksy1lLTFWANWtK9POudhDyRmp3dM38Ir0OPx8=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a39.g.dreamhost.com (Postfix) with ESMTPSA id D816515005C;
 Tue, 24 May 2016 19:14:07 -0700 (PDT)
Message-ID: <1464142437.20948.28.camel@aj.id.au>
Subject: Re: [PATCH qemu] hw/timer: Add clock value matching support to
 aspeed_timer
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>
Date: Wed, 25 May 2016 11:43:57 +0930
In-Reply-To: <CACPK8XdAJ5U-mrWgb99-SQdZTrn+WoZKV9qbPmOpXhyJ7YCDtg@mail.gmail.com>
References: <1463713461-5444-1-git-send-email-andrew@aj.id.au>
 <CACPK8XdAJ5U-mrWgb99-SQdZTrn+WoZKV9qbPmOpXhyJ7YCDtg@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-UxwGzuq5NBcr+VWQpOdh"
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
X-List-Received-Date: Wed, 25 May 2016 02:14:11 -0000


--=-UxwGzuq5NBcr+VWQpOdh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-05-23 at 17:00 +0930, Joel Stanley wrote:
> On Fri, May 20, 2016 at 12:34 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > Clock value matching allows Linux to boot with CONFIG_NO_HZ_IDLE=3Dy on
> > the palmetto-bmc machine. Two match registers are provided for each
> > timer.
> Thanks for implementing this.
>=20
> We also boot much faster now.

A double win!

>=20
> >=20
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0hw/timer/aspeed_timer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0| 132 +++++++++++++++++++++++++++++-----------
> > =C2=A0include/hw/timer/aspeed_timer.h |=C2=A0=C2=A0=C2=A05 +-
> > =C2=A02 files changed, 101 insertions(+), 36 deletions(-)
> >=20
> > diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> > index 51e8303cdaa3..e88234e7823f 100644
> > --- a/hw/timer/aspeed_timer.c
> > +++ b/hw/timer/aspeed_timer.c
> > @@ -9,13 +9,12 @@
> > =C2=A0 * the COPYING file in the top-level directory.
> > =C2=A0 */
> >=20
> > +#include=20
> > =C2=A0#include "qemu/osdep.h"
> > -#include "hw/ptimer.h"
> > =C2=A0#include "hw/sysbus.h"
> > =C2=A0#include "hw/timer/aspeed_timer.h"
> > =C2=A0#include "qemu-common.h"
> > =C2=A0#include "qemu/bitops.h"
> > -#include "qemu/main-loop.h"
> > =C2=A0#include "qemu/timer.h"
> > =C2=A0#include "trace.h"
> >=20
> > @@ -76,21 +75,96 @@ static inline bool timer_can_pulse(AspeedTimer *t)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return t->id >=3D TIMER_FIRST_CAP_PULSE;
> > =C2=A0}
> >=20
> > +static inline bool timer_external_clock(AspeedTimer *t)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0return timer_ctrl_status(t, op_external_clock)=
;
> > +}
> > +
> > +static inline double calculate_period(struct AspeedTimer *t)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0double rate;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0rate =3D timer_external_clock(t) ? TIMER_CLOCK=
_EXT_HZ : TIMER_CLOCK_APB_HZ;
> Would it make more sense return the rate from timer_external_clock
> (perhaps get_timer_clock?).

I'll look into it.

>=20
> >=20
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0return NANOSECONDS_PER_SECOND / rate;
> > +}
> > +
> > +static inline uint32_t calculate_ticks(struct AspeedTimer *t, uint64_t=
 now_ns)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0double ticks;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0ticks =3D floor((now_ns - t->start) / calculat=
e_period(t));
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0return t->reload - MIN(t->reload, (uint32_t) t=
icks);
> Ugh, Casty McCastface.

Hah!

>=20
> Perhaps make ticks the uint32_t:
>=20
> =C2=A0uint32_t ticks =3D (uint32_t)floor( ... );

I'll try clean up the casts.

>=20
> >=20
> > +}
> > +
> > +static inline uint64_t calculate_time(struct AspeedTimer *t, uint32_t =
ticks)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0double delta_ns;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0ticks =3D MIN(t->reload, ticks);
> > +=C2=A0=C2=A0=C2=A0=C2=A0delta_ns =3D floor((t->reload - ticks) * calcu=
late_period(t));
> As above.
>=20
> >=20
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0return t->start + (uint64_t) delta_ns;
> > +}
> > +
> > +static uint64_t calculate_next(struct AspeedTimer *t)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0uint64_t now;
> > +=C2=A0=C2=A0=C2=A0=C2=A0uint64_t next;
> > +=C2=A0=C2=A0=C2=A0=C2=A0int i;
> > +=C2=A0=C2=A0=C2=A0=C2=A0uint64_t seq[] =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MAX(t->match[0], t->ma=
tch[1]),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MIN(t->match[0], t->ma=
tch[1]),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00,
> > +=C2=A0=C2=A0=C2=A0=C2=A0};
> Perhaps a comment on why you chose to do it like this? I only
> understand because you explained it to me.

Fair point. I'll add some words.

>=20
> >=20
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < ARRAY_SIZE(seq); i++) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0next =3D calculate_tim=
e(t, seq[i]);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (now < next) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return next;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > +=C2=A0=C2=A0=C2=A0=C2=A0}
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint64_t reload_ns;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reload_ns =3D (uint64_=
t) floor(t->reload * calculate_period(t));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0t->start =3D now - ((n=
ow - t->start) % reload_ns);
> > +=C2=A0=C2=A0=C2=A0=C2=A0}
> Why is this scoped like this?

Because reload_ns wasn't relevant for the loop above, so to make it's
useful lifetime explicit I scoped it to where I needed it.

>=20
> >=20
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0return calculate_next(t);
> > +}
> > +
> > =C2=A0static void aspeed_timer_expire(void *opaque)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedTimer *t =3D opaque;
> > +=C2=A0=C2=A0=C2=A0=C2=A0bool interrupt =3D false;
> > +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t ticks;
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0/* Only support interrupts on match values of =
zero for the moment - this is
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* sufficient to boot an aspeed_defconfig=
 Linux kernel.
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* TODO: matching on arbitrary values (se=
e e.g. hw/timer/a9gtimer.c)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> > -=C2=A0=C2=A0=C2=A0=C2=A0bool match =3D !(t->match[0] && t->match[1]);
> > -=C2=A0=C2=A0=C2=A0=C2=A0bool interrupt =3D timer_overflow_interrupt(t)=
 || match;
> > -=C2=A0=C2=A0=C2=A0=C2=A0if (timer_enabled(t) && interrupt) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0if (!timer_enabled(t)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> > +=C2=A0=C2=A0=C2=A0=C2=A0}
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0ticks =3D calculate_ticks(t, qemu_clock_get_ns=
(QEMU_CLOCK_VIRTUAL));
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0interrupt =3D !ticks && timer_overflow_interru=
pt(t);
> I think it's clearer to say
>=20
> if (!ticks && timer_overflow_interrupt)
> =C2=A0=C2=A0=C2=A0interrupt =3D true;
>=20
>=20
> >=20
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0if (!interrupt) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0interrupt =3D ticks <=
=3D MIN(t->match[0], t->match[1]);
> > +=C2=A0=C2=A0=C2=A0=C2=A0}
> if (!interrupt && ticks <=3D=C2=A0=C2=A0MIN(t->match[0], t->match[1]))
> =C2=A0=C2=A0=C2=A0=C2=A0interrupt =3D true;
>=20
> >=20
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0if (!interrupt) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0interrupt =3D ticks <=
=3D MAX(t->match[0], t->match[1]);
> > +=C2=A0=C2=A0=C2=A0=C2=A0}
> As above. And the advantage of structuring it like this is these
> else..else if statements can be represented as such.

Okay, I'll look at restructuring it.

Thanks for the review.

Andrew

>=20
> >=20
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0if (interrupt) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0t->level =3D !t->=
level;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qemu_set_irq(t->i=
rq, t->level);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0timer_mod(&t->timer, calculate_next(t));
> > =C2=A0}
--=-UxwGzuq5NBcr+VWQpOdh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXRQplAAoJEJ0dnzgO5LT58kUP/1A52vhRDNBvAssgjIgoNYyT
6xmqalONwSxI6hPUp+fxlx202YhwrpgfaARStffjhs48jJ0j1w4Bw1aTSxWomLWF
dG7yFpEZ/uGWOBlcTIWe4olLWd2g+/2ImYIQR30idUSWuVRiOLRT7mJTYMeqG3oO
LNhNyIufWGm+5hufofasVtniR6U+eBRaYXISiuOMBRfn+L2u+mamWUMqmGxHZUu3
UtuUCPV7XVmxbDjCckC+Jrizj/+I2kKsQTBunaGgJpgNRwMlqqouAx03g1dXxMNT
qRswGD4e90qHld3TxSIm8sOOw8vWloHi57hB8eSkeHEYlWEWDIpFz7acZRiW/Kng
dJSS9zpup0GaWN/9B+xLdBq6A6K/n3X79RCkrbsybSrkGUUMeXnYg8hWK6xR2iAp
VjmyejcOddCbZLRBD53fxSkoQoM21/nJdyojy0ST7bi8yEwGfzytUq0/wzNfvYgy
3WoPxZHGM2lZRWzfcCQk+mbEL/Itld/WMHK6EbX9oaIDLZP3Yy476w4Z49SFDYYI
0UAS3dDVP9qMYN/7z1jF3blrprl+AW0hqwD6B5KwQxLwaOIDEXSfpr6ljwcQ2svs
/0ytAlpJV3OhqsPLUjeBJrQMO7cL5pJu+l0DRphE8bfrtsUkwNLkcPh5khD1JBRZ
NHr1mLl+iy/MrW08oNJG
=gdEy
-----END PGP SIGNATURE-----

--=-UxwGzuq5NBcr+VWQpOdh--
