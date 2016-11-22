Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNB8G6ZXczDvnV
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 14:41:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="caU6RQqI"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="AUC1ANtx"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A5A3C20A89;
 Mon, 21 Nov 2016 22:41:00 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 21 Nov 2016 22:41:00 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=qWKdo8fwtXyWd8jVqiAUJvMI364=; b=caU6RQ
 qIuf1Vt6mpENPi6LjvwcW1FrBUPaHDF9apV5Gfs/j2rG79qA9QA+UCR3jLQYT5HL
 IqLNM4jAeHzOY3o6C0S51CBlTDnAUWD5MFkvh+EVGD454Vh0D0sD07ntdGM9od4z
 REifEggA1daFdpxQqQWVWKo5wt276zbPoDXhk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=qWKdo8fwtXyWd8
 jVqiAUJvMI364=; b=AUC1ANtx88u1Y1d0yCvSc/JcNbJPDGtl4ezsKyMrwTk1HK
 0jFZ3Vxo2P3+EwU4EPwgcXIiDZbz0tUjEiso2t40DEb29yLc270UhcjDRbFXwyUl
 cTzNHQBi6z0PfhRAdZpqvuVr8tKuMlY0d9Y1lzukO6WpojuUE+qY29EpJN1oM=
X-ME-Sender: <xms:TL4zWM7exlUN03BIuQ3xGWNpA4mfwc3bmUjKP0toaCsEugLy1nkTLA>
X-Sasl-enc: rSRJZT5RQdBJTJUrqgGG+U7UyxtU5XMm0sAUjNzuO9TJ 1479786059
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id C1DE97E2DF;
 Mon, 21 Nov 2016 22:40:58 -0500 (EST)
Message-ID: <1479786054.2503.23.camel@aj.id.au>
Subject: Re: BMC and Host State Management Refactor
From: Andrew Jeffery <andrew@aj.id.au>
To: Andrew Geissler <geissonator@gmail.com>, Joel Stanley <joel@jms.id.au>
Cc: jdking@us.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Tue, 22 Nov 2016 14:10:54 +1030
In-Reply-To: <CALLMt=pUaq39-YtUQgOcwPOzzhFM8pOB2LgML02uifpKCT3_5Q@mail.gmail.com>
References: <CALLMt=oZ7neAge4of5KwzEQbA9nZ_ayuaYwFyUPGqN14Oq-5fA@mail.gmail.com>
 <CACPK8XebH8SnRGkxqSHS=QN1PYyWL2vt-NBw-sNA6d8qL6ZCEw@mail.gmail.com>
 <CALLMt=pUaq39-YtUQgOcwPOzzhFM8pOB2LgML02uifpKCT3_5Q@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-VQhKt5guB7+mZ2KpoWGc"
X-Mailer: Evolution 3.22.1-0ubuntu2 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 22 Nov 2016 03:41:03 -0000


--=-VQhKt5guB7+mZ2KpoWGc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-11-21 at 20:28 -0600, Andrew Geissler wrote:
> > On Sun, Nov 20, 2016 at 11:55 PM, Joel Stanley <joel@jms.id.au> wrote:
> > Hi Andrew and Josh,
> >=20
> > On Sat, Nov 19, 2016 at 7:01 AM, Andrew Geissler <geissonator@gmail.com=
> wrote:
> > > Josh and I are working two stories this sprint that deal with
> > > refactoring the bmc and host state management code out of skeleton
> > > (#772/#783).=C2=A0=C2=A0Here=E2=80=99s the proposal on this work.
> >=20
> > Thanks for sending out your plan, this is great. I have a few comments
> > that came up as I was reading.
> >=20
> > > The overall design for both state management objects is that they wil=
l
> > > provide a set of properties on which to operate.
> > > - DesiredState
> > > - CurrentState
> > >=20
> > > CurrentState will be a read only property.
> >=20
> > You've chosen to make the desired and current states be separate,
> > which works. Another option would be to have them be the same list of
> > states, so you know that when current=3D=3Ddesired you're not waiting o=
n
> > anything to happen. What do you think?
> >=20
>=20
> Hmmm, I'm thinking from a DBUS/REST api perspective here.=C2=A0=C2=A02 se=
ems
> more intuitive, but also I don't think I understand your proposal
> fully :)=C2=A0

I think you might be misinterpreting. I don't think Joel was suggesting
you eliminate one of the DesiredState or CurrentState "variables",
rather that the /types/ of the CurrentState and DesiredState variables
be equal. That is, that the same set of states can be assigned to both.

> =C2=A0What would this look like from an implementation perspective
> and DBUS/REST interfaces?

No different, just the set of possible states would be consistent
between the two variables.

Alternatively you could define transitions on the states and rename
DesiredState to Transition, or something similar. This might better
align with what you're proposing (a state machine).

>=20
> > >=20
> > > The host control will have these additional properties:
> > > - DesiredPowerState
> > > - CurrentPowerState
> > >=20
> > > Valid states to request for OpenBMC (DesiredState)
> > > - READY, REBOOT
> > > Valid states to be in for OpenBMC (CurrentState)
> > > - NOT_READY, READY (note this proposal removes BASE_APPS and BMC_STAR=
TING).

What does it mean to request a READY state? When can you do this? Can
you request it whilst the BMC is in NOT_READY? Requesting READY in
READY doesn't seem productive.

If there are restrictions on combinations of source and target state it
might be better to make use of the transition concept to spell it out
(i.e. describe a formal state machine).

> >=20
> > Does this need to consider states where the device is updating? That
> > is, it is not attempting to be ready to control the host, but it is
> > turned on and able to accept new firmware?
> >=20
>=20
> I think READY implies available for code update?=C2=A0=C2=A0But good poin=
t on
> code updates, when a code update is being performed, a FW_UPDATE state
> seems reasonable.
>=20
> > >=20
> > > READY implies all services started and running successfully (i.e. we
> > > reached obmc-standby.target)
> > >=20
> > >=20
> > > Valid states to request for Host (DesiredState)
> > > - OFF, ON, REBOOT
> >=20
> > This might need to distinguish between soft-off/soft-reboot and
> > printer-on-fire OFF requests.
> >=20
>=20
> Yeah, the focus of this story was to keep similar function as what's
> in place now, but refactor into c++ and the new sdbusplus interfaces.
> We do probably need more work done with things like you say here.
> We've tended to call the printer-on-fire off's EMERGENCY_ type event
> requests.=C2=A0=C2=A0At a minimum, I'll be sure these are tracked in futu=
re
> stories.
>=20
> > > Validate states to be in for Host (CurrentState)
> > > - OFF, BOOTING, BOOTED
> >=20
> > STANDBY, BOOTING, RUNNING?
> >=20
> > The bikeshed should be blue.
> >=20
>=20
> Agree

Okay so the bikeshed is blue, but what about the state names?? ;)

Andrew
--=-VQhKt5guB7+mZ2KpoWGc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYM75GAAoJEJ0dnzgO5LT5sTQP/RR2p+1/SGk/oIx6seulfNaE
C60JwdJN1PwsNJgxwvZWrI1dCV+Qb4w6sZzeoND8VpBukyvJvvjdHeEebzn5wM48
1pN3yJG3BQu8OJQVIrdrE958K6htQropj6riecCV1weblGpUyY7xLXoc/l4UgYhS
ErGr/nlWhRipl4itx5atnIzEDRUMGzHNViq4prRKvareR5IjByKAeezb8HK0mnjZ
hez6IVOHRx9PIIiVKcCY7za7Z4CspVxY0LXySzHgehida6veqENKdevtgDfHMDDA
R5n1DsaI6K3RfJi8PGWBhCcZJxx69pKw9NnnKQ65517YYN+ovwxNS/Or6FjPNVnV
PQaa8r2aRyC7C7pGktmgm/UlzIOCryDl/1SHZF5DED4sTpNcChL1zHWMcMwUrb43
fLQsUAbE/rUTW0b/llEFpQYs3FXpF8Cxw2CJgnpihJ4tdml6dFFi2mS72oyHTg8/
mJ4UgYLRWnWpeC4vfdsOtNbwKisMLJfpTjB16ZTjM13lT6tkhRY3JTJR37b6o5Yh
vOvXmU0hX62R18THRlsDa9NOWBjjLKSXK3eQ5pLOKd2acw7haW7QOFHPNNmuRiP5
OgP2ql1inPRnxGjsJ7Eu7IBXjyOwwwOkHYjpcMc2iZC6A8KAckIBKrDr6x7MN/7j
QqOkPgABOddafZ49mihb
=t0Ul
-----END PGP SIGNATURE-----

--=-VQhKt5guB7+mZ2KpoWGc--
