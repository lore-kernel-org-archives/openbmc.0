Return-Path: <andrew@aj.id.au>
Received: from homiemail-a75.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 463E01A05EF
 for <openbmc@lists.ozlabs.org>; Fri, 19 Feb 2016 11:35:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=OU1LX3R+; 
 dkim-atps=neutral
Received: from homiemail-a75.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a75.g.dreamhost.com (Postfix) with ESMTP id 2C0C05EC07C;
 Thu, 18 Feb 2016 16:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=YAbr7PiHoJrzPPfjxP1BU
 PhQEqY=; b=OU1LX3R+LORb+gPnmUSxHmb56HG9ijClLbGA8amO7O2gnjgdZ1dNV
 WADWS87IFK4Moaxufs63GBMQwIiuCgKlbdJ6vBoKWocMM0ZvtRFOA+1hmd9YGuEN
 j+UHsKI9WznvGI3zUkDutsUtRN0lmsmBSauDRYEEcF3Jfz/8HyMLpI=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a75.g.dreamhost.com (Postfix) with ESMTPSA id 0340B5EC05C;
 Thu, 18 Feb 2016 16:35:17 -0800 (PST)
Message-ID: <1455842109.3022.105.camel@aj.id.au>
Subject: Re: [PATCH linux] mtd: spi-nor: aspeed-smc: Use io string accessors
 to fifo
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Milton Miller II <miltonm@us.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Fri, 19 Feb 2016 11:05:09 +1030
In-Reply-To: <201602182250.u1IMoSmd017252@d03av04.boulder.ibm.com>
References: <1455245970.24478.26.camel@aj.id.au>
 ,<1455162625-11142-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455162625-11142-2-git-send-email-openbmc-patches@stwcx.xyz>
 <201602182250.u1IMoSmd017252@d03av04.boulder.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-h9s/d2qNK2rahF77nieV"
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
X-List-Received-Date: Fri, 19 Feb 2016 00:35:22 -0000


--=-h9s/d2qNK2rahF77nieV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-02-18 at 22:50 +0000, Milton Miller II wrote:
> Around 02/11/2016 08:59PM in some timezone,  Andrew Jeffery wrote:
> > Hi Milton,
> >=20
> > Excuse the unnecessary quote markers that might appear through the
> > patch, my mail client (Evolution) seems to have a mind of its own
> > sometimes. Starting to shave that yak. Anyway.
>=20
> It can't be worse than me manually quoting in smart cloud notes client.
>=20
> >=20
> > As an aside I've tested an earlier version of the code and confirmed
> > the approach works (i.e. no JFFS2 corruption on re-mount).
>=20
> Yea.
>=20
>=20
> > On Wed, 2016-02-10 at 21:50 -0600, OpenBMC Patches wrote:
> > > From: "Milton D. Miller II" <miltonm@us.ibm.com>
> > >=20
> > > Make and use new routines to access the fifo when in user mode.
> > > Instead of using memcpy_fromio, base the new routines on the io
> > >  port string accessors.
> > >=20
> ...
> > typo: unsigned
> fixed
>=20
>=20
> > > +static void *ins_align(unsigned long io, void *buf, size_t len)
> > > +{
> > > +> > > > 	> > > > BUILD_BUG_ON(0 & len & ~3);
> >=20
> > Should just be BUG_ON()? Given that you disabled it with '0 &', do we
> > want it at all?
>=20
> It should definitively not be a driver BUG that crashes the whole system.=
  If=20
> you need I can search for Linus' quote about the use of BUG in drivers.

Sure - but if we needed to use a bug macro then it needs to be one that
triggers at runtime, as you've used a formal parameter whose value
won't be known at compile time right? That's what I was (poorly) trying
to express.

Unless the optimiser gets involved and reasons about actual parameters
from callers? Anyway, this is largely a distraction.

>=20
> It can be killed.

SGTM

>=20
> > > + */
> > > +
> > > +static void aspeed_smc_from_fifo(void *buf, const void __iomem *iop,=
 size_t len)
> > > +{
> > > +> > > > 	> > > > unsigned long io =3D (__force unsigned long)iop;
> > > +
> ...
> > > +> > > > 	> > > > > > > 	> > > > buf =3D ins_align(io, buf, len & 1);
> > > +> > > > 	> > > > } else {
> > > +> > > > 	> > > > > > > 	> > > > size_t l =3D (4 - (unsigned long)buf=
) & 3;
> > > +
> > > +> > > > 	> > > > > > > 	> > > > l =3D min(l, len);
> > > +> > > > 	> > > > > > > 	> > > > buf =3D ins_align(io, buf, l);
> > > +> > > > 	> > > > > > > 	> > > > len -=3D l;
> > > +
> > > +> > > > 	> > > > > > > 	> > > > if (len >=3D 4) {
> > > +> > > > 	> > > > > > > 	> > > > > > > 	> > > > insl(io, buf, len >> =
2);
> > > +> > > > 	> > > > > > > 	> > > > > > > 	> > > > buf +=3D len & ~3;
> > > +> > > > 	> > > > > > > 	> > > > }
> > > +> > > > 	> > > > > > > 	> > > > buf =3D ins_align(io, buf, len & 3);
> > > +> > > > 	> > > > }
> >=20
> > So I've tried deduplicating this function - the code in the latter two
> > cases is largely the same bar the magic numbers and insw vs insl. I've
> > come up with the code below (note that I haven't actually probed the
> > modifications), but I'm not convinced it's much of a win in terms of
> > clarity:
> >=20
> > /* Is this available somewhere else? Rusty doesn't think so.
> >  * Probably needs a better name (first set value) */
> > #define FS_VAL(x) ((x) & ~((x) - 1))
>=20
> That is a horrible name!  What is this magic file system value about?

Yes, I admitted that in the comment!

>=20
> >=20
> > static void aspeed_smc_from_fifo(void *buf, const void __iomem *iop, si=
ze_t len)
> > {
> > 	> > unsigned long io =3D (__force unsigned long)iop;
> >         u8 align =3D FS_VAL((io & 7) | 4); /* align is one of 1, 2 or 4=
 */
>=20
> I see masking & 7 and comment about being 1, 2, or 4 and think:
>=20
> That's not true, the port bit doesn't always have bit 4 on when
> the others are off.
>=20
> Only after a long pause coming back do I see the | 4, and then I have
> to go back to a macro above to figure out is it before or after the
> fancy math.

Yeah, adding further magic to what was there already was a dicey idea.
The code was more something to spark discussion of alternatives than a
genuine proposal.

>=20
>=20
> >         u8 mask =3D align - 1;
> >         size_t to_align =3D align - ((unsigned long)buf) & mask);
> >=20
> > 	> > if (align =3D=3D 1) {
> > 	> > 	> > insb(io, buf, len);
> >                 return;
> > 	> > }
> >         to_align =3D min(to_align, len);
> >         buf =3D ins_align(io, buf, to_align);
> >         len -=3D to_align;
> > 	> > if (len >=3D align) {
> > 	> > 	> > size_t nr_blocks =3D len / align;
> > 	> > 	> > if (align =3D=3D 2) {
> > 	> > 	> > 	> > insw(io, buf, nr_blocks);
> > 	> > 	> > } else {
> > 	> > 	> > 	> > insl(io, buf, nr_blocks);
> > 	> > 	> > }
> > 	> > 	> > buf +=3D (nr_blocks * align);
> > 	> > }
> >         buf =3D ins_align(io, buf, len & mask);
> >=20
> > Is it worth it? A similar approach can be taken for
> > aspeed_smc_to_fifo() if so.
>=20
> So I think this approach hides what is supposed to happen
> in the case we are actually using.
>=20
> I decided on a different approach to the remove the duplication:

Cool, as mentioned above I mainly posted my hack to trigger thoughts
about alternatives, so I'm happy it's done that :)

>=20
> Don't add code that will not be used.
>=20
> We always pass a 4 byte aligned port.  Rather than bug,=20
> just call insb if the io port is not aligned. =20
>=20
> Then remove the ins_align and outs_align function and=20
> bring them inline, but expand top and bottom call sites=20
> to order the byte vs (half)word transfers to remove
> the get/put_unaligned pessimisation since we are testing=20
> the alignemnt and can choose the order by context.
>=20
> I then removed the updates to buf and len that were dead
> in the tail code.
>=20
> With 2 one-line comments and no white space it fits in=20
> 80x25 which means you can see all the code after the=20
> preliminary 0 length and unaligned checks on one screen.
>=20
>=20
> >=20
> > As for whether there's a better approach short of fixing mmiocpy(), I
> > don't know, so no further suggestions really (i.e. I guess we just live
> > with the IO_SPACE_LIMIT jiggery-pokery).
> >=20
>=20
> When I started to go back and comment the assembly I figured out the
> memcpy has 2 places it can stutter:
>=20
> It first aligns source to a word boundary with byte copies.  After that=
=20
> it works on aligning the destination.  It will do an extra load at this
> point if the destination is not aligned to the source.  Then it sometimes=
=20
> aligns to cache lines (depends on core if it helps), then transfers
> blocks, back to words, then if there are upto 3 bytes it backs up and
> switches back to bytes (reading bytes a second time here).
>=20
> So there are two places to fix, one stutters output and one input.
>=20
> I thought about switching read/write to engine mode.  I probably still
> will sometime.  The stutters will cause it to stop and resend the=20
> address slowing down the access.  Hmm, that might cause double write=20
> attempt at the stutter...

Ugh

>=20
> Anyways, see what you think of the current code.

Will do, thanks for the detailed response!

Andrew

>=20
> Thanks,
> milton
>=20
--=-h9s/d2qNK2rahF77nieV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJWxmM9AAoJEJ0dnzgO5LT5GHcP/jtR4nQ6asyM92lZyyr/vsIM
M2TbIu0H2t7YolAQd7pOKhGrVXaXbsnB92vfHit6IKtpncZDOd2i6E19ASYpr7sK
lWseMO7NPMBN9E0lwMMWsz1THl+vIBjlc6ecjKQ44zSdzlKR+oknpA5951uyX9Kl
4yFQgqUGkgXsqNwWTM755oh0sMivplpV35grja90KCS0sOWvmRwVRuhyD2oyW5wH
6SJ4+gSOZo6FZpoFzNMG9zWP65CClun6uzstQMSorY6ZxQpAtmcRzxL5Ie4TEWE0
nWGOw0gAGxNHKgtgi6oGnA9raVq5ajxNt5HTVJw9lMrgO7AJoPvwPZSAdBuWWShZ
xeEYxBDv45hyr2yAk5xSAsRMeUt8urW5IFcbjQUZQxuZOSO0v+UFEPI8Lhv5ZI5a
OTwPVbgXE2tFPzW6tf3f6BN3ix0Kc0PIqRkId6ASphHZKCZWKy9SzHxed/nldA3o
EwcdaBeCn5UYG3bQy4ytiTE3fQjL5CILgjZwSZTSDI49FM77c30quabve5JA/faF
lJikzNZl8E/7CFlnQH47OgH/TR+dwTkJistP6JtJA4VDedDMLKaCkMyg2Ztx2exV
46N79rXysszqYRrizQxgLzbfqy29oJOkSurnaUNCmvTzSHGUYY4PsheGjbi7E2zW
VhEGduhVWYe6Tj6oCPn9
=bnUg
-----END PGP SIGNATURE-----

--=-h9s/d2qNK2rahF77nieV--
