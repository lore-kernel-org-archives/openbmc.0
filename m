Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNkjP1jYRzDw7k
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 12:08:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="FmVkShjz"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="pYCGt13F"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1D9862068A;
 Tue, 22 Nov 2016 20:08:06 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 22 Nov 2016 20:08:06 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=pFyS6ArmcT5hgOQ34hs21Z6eiv8=; b=FmVkSh
 jzDIcEIVN7zR1M7OC6noL0ZaSxUd4DCKf0hoDMUi1F+wZBKS9F/XEKXr7hSCDWyF
 aZeYMBhEe11TxSuCh4HizQcJA5/LI2dwfVfySj4YmZO465Ve7cj4cBQ20C684e8H
 E3XZ3ub1q+au9d2j0gW+OCR18r8UowKjvnl3g=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=pFyS6ArmcT5hgO
 Q34hs21Z6eiv8=; b=pYCGt13FcNKIzYIjgtgmL72kCaGh+TTGzxbftwtuRa9CtP
 RvP+biHPEw6+fpMCqXciehV3lruf46bHRIbt/ZXibUMWKzmzxnBkYzUmjbJpDMNL
 1iP41HB3x3to3DfhU7A3TRFNu69LlDjJExvyWzk3BFoBY1lu4S5I9mX6wVw1k=
X-ME-Sender: <xms:9us0WPUOELXpT097YSwdJfiwgJd0TR4jnw8oTp3FgQorIajkJUcEYw>
X-Sasl-enc: sVUaC6DYQEEPNGtlin39Qiv3Uh6APSacBOmRLoJdIK/5 1479863285
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id DF45824313;
 Tue, 22 Nov 2016 20:08:03 -0500 (EST)
Message-ID: <1479863279.2503.42.camel@aj.id.au>
Subject: Re: BMC and Host State Management Refactor
From: Andrew Jeffery <andrew@aj.id.au>
To: Andrew Geissler <geissonator@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, jdking@us.ibm.com, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Wed, 23 Nov 2016 11:37:59 +1030
In-Reply-To: <CALLMt=rNQSyYX6m--TKns1Hf1frFVmCfE+M77RVcADD8QyfuPg@mail.gmail.com>
References: <CALLMt=oZ7neAge4of5KwzEQbA9nZ_ayuaYwFyUPGqN14Oq-5fA@mail.gmail.com>
 <CACPK8XebH8SnRGkxqSHS=QN1PYyWL2vt-NBw-sNA6d8qL6ZCEw@mail.gmail.com>
 <CALLMt=pUaq39-YtUQgOcwPOzzhFM8pOB2LgML02uifpKCT3_5Q@mail.gmail.com>
 <1479786054.2503.23.camel@aj.id.au>
 <CALLMt=rNQSyYX6m--TKns1Hf1frFVmCfE+M77RVcADD8QyfuPg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-R8DHBKnoafIdnHv+B5tE"
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
X-List-Received-Date: Wed, 23 Nov 2016 01:08:10 -0000


--=-R8DHBKnoafIdnHv+B5tE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-22 at 11:23 -0600, Andrew Geissler wrote:
> > On Mon, Nov 21, 2016 at 9:40 PM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> > On Mon, 2016-11-21 at 20:28 -0600, Andrew Geissler wrote:
> > > > > > > > On Sun, Nov 20, 2016 at 11:55 PM, Joel Stanley <joel@jms.id=
.au> wrote:
> > > > Hi Andrew and Josh,
> > > >=20
> > > > On Sat, Nov 19, 2016 at 7:01 AM, Andrew Geissler <geissonator@gmail=
.com> wrote:
> > > > > Josh and I are working two stories this sprint that deal with
> > > > > refactoring the bmc and host state management code out of skeleto=
n
> > > > > (#772/#783).=C2=A0=C2=A0Here=E2=80=99s the proposal on this work.
> > > >=20
> > > > Thanks for sending out your plan, this is great. I have a few comme=
nts
> > > > that came up as I was reading.
> > > >=20
> > > > > The overall design for both state management objects is that they=
 will
> > > > > provide a set of properties on which to operate.
> > > > > - DesiredState
> > > > > - CurrentState
> > > > >=20
> > > > > CurrentState will be a read only property.
> > > >=20
> > > > You've chosen to make the desired and current states be separate,
> > > > which works. Another option would be to have them be the same list =
of
> > > > states, so you know that when current=3D=3Ddesired you're not waiti=
ng on
> > > > anything to happen. What do you think?
> > > >=20
> > >=20
> > > Hmmm, I'm thinking from a DBUS/REST api perspective here.=C2=A0=C2=A0=
2 seems
> > > more intuitive, but also I don't think I understand your proposal
> > > fully :)
> >=20
> > I think you might be misinterpreting. I don't think Joel was suggesting
> > you eliminate one of the DesiredState or CurrentState "variables",
> > rather that the /types/ of the CurrentState and DesiredState variables
> > be equal. That is, that the same set of states can be assigned to both.
> >=20
>=20
> I see now.=C2=A0=C2=A0I'm still not seeing any huge advantages on either
> proposal over my original.=C2=A0

The advantage I see in Joel's proposal is that we have fewer types
involved in the problem. The alternative (as mentioned below) is you
rename DesiredState to Transition, in which case I think what you are
suggesting is okay. Transitions and states are distinct and well
defined concepts.

I don't like the idea of "desiring" a state that doesn't exist. Joel's
initial question suggests he thinks along these lines as well.

> =C2=A0I think I'm just going to stick with it
> for now since there are times where the valid states associated with
> each (Desired vs. Current) are different

Can you expand on this to make it clear what you are arguing for?

>  and I think having the two as
> I've defined is a bit more user friendly.

In what way?

Cheers,

Andrew
--=-R8DHBKnoafIdnHv+B5tE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYNOvwAAoJEJ0dnzgO5LT5OnMQAIbsrBAQ3Q/aKVAmOFZVW7Cq
adtNZAc9QqU7ONivaxpXk+aeX9NpHHjXu/rENjtoXPb8FJK6jQhM71GcHkQ5lAf/
BEv4wAWqUc0tVUhQbP1LhPAg61/rmfL0Szyxeb672OgOzU/n9yrR2Yy+nUBP2ssU
SzcyezgUrbtLUqWQY0V06aQaFOnv/8zSsNqFJLuli/XAHvUYBiNGSOXm08eFfJTw
0EDm5mnwofYUa0/J9Jh+PWU2AI0S0CFCD4t1m3zzCOIc+GhC8xFJzjwneYWlTpv0
zSng5jIgiz2+g1YQPwVJ8t4FWoMU7n1URhU8+X9SiEC7XdjEGxi+W6sMQvZkwEME
Cou6SLy0d/AYL3qyFB63njPGNOurylgv0huyFoAs1ZGhaQFUVokB3x3kgjMwuhUQ
Ec19f5xbVMoLwUq3jBlOdzDjCmgqMGsitctcwohKI166/dFnbn0PjK22TMOruwnd
csLMaFnVxAZfZdjyJ3P2FiuaxsyfT+0NT4Abx8diVPRA0YwJkYKXcwXNaBxej59u
jJBhTG1ryCzFagZ4zT1xq/gKz5Rkx/qEaCgTUZHMqy5EhwEvpdt+NGjGFiOja6wF
nZoLlBbS1fFXxed0UzYpfptJWYYXo8dXdk/WgLLt9IaIF8HjuSkKShrA4/UfeWnX
OzMAAkz5jyq07lg3ZER+
=a3AX
-----END PGP SIGNATURE-----

--=-R8DHBKnoafIdnHv+B5tE--
