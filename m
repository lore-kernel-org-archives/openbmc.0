Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w1Zxt4ZmTzDqBJ
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 13:13:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="qiGe4rtz"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="fgyW5IIs"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 32B53208EA;
 Sun,  9 Apr 2017 23:13:03 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 09 Apr 2017 23:13:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=Edgj7WGv7c4YhBnJT7sKh1khKDdiqtWxKBeDaqyUV
 2Q=; b=qiGe4rtzAKMQYwnsfblNfOs7g6T+LNc4pzmdj0rVEdZSnkXNvGe6CM7pf
 0ZHWo5QeiWlxbVGn9ls53WwwsrdSYopYg8J+gFIDAKorfSLic9j/F5ecoYXyXjEu
 1YWfXhxmSFNqqc4QAobfi1vb4DAd4c3ANM7qkamjtHvMVqSWKXq2q8D5k5ssaDTM
 Hbt6VoLnw7x4V+0YR4h4sZ22vQX4XC/7rJjzFY+HuRxNahxcJuN0l6yhEalS27Cx
 qoZMmYW1fE2nPlZH2EEv5x3xfwINpt8D7c68bie89Q93Gqo+L1UGKRyJRZUMiwSW
 2sVBvI23VC+D05bGg/zeO8JB91Ldw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Edgj7WGv7c4YhBnJT7
 sKh1khKDdiqtWxKBeDaqyUV2Q=; b=fgyW5IIsxtPuaPGCDLW8iYqA7BFZ605B/l
 xCbqD4rj3sHanDfTZWNpoCDvbWkfr5AfppMTAYf271MjsuS64sbRCCoDV+SBjEre
 sD8vlCnT501Z4SlWEHi6z3zrajavfJZ8D0c150wLD+QnuWzLY1CX5IsWSQD6ZOqv
 43NL2xM96CiZkV5RRt9bZ8tzj2XnJkkO3GG2UsTPFnEGlWjPNGMXCzowsjWkKu33
 5wIBcCLM6a4PMhYndN4PUIGwXfz/cMp6DGzbrEjF0BCifKle1yD+ukm0p6kERmZX
 fPCct5A59INtXyGax6SLng12eKxA2O+q7O9vzjP5l2gNcqk4eYbQ==
X-ME-Sender: <xms:P_jqWATQe7ch-AGIXL9by-2Vo6_7PKEREw4FLfbV_QTxlFtEn64i4w>
X-Sasl-enc: /ICMrAJSrvVYA7ybsJht09GvQNRUfUGLtXAkev3Q8N0C 1491793982
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 64DF6241D0;
 Sun,  9 Apr 2017 23:13:01 -0400 (EDT)
Message-ID: <1491793973.3829.2.camel@aj.id.au>
Subject: Re: Discussion on GPIO monitoring and design thoughts.
From: Andrew Jeffery <andrew@aj.id.au>
To: vishwa <vishwa@linux.vnet.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Date: Mon, 10 Apr 2017 12:42:53 +0930
In-Reply-To: <7459b361-8c6f-aeb8-e434-f3725549adf3@linux.vnet.ibm.com>
References: <3ca9e8a5-4135-8fa3-cbf5-62543a89a491@linux.vnet.ibm.com>
 <1491524060.5817.8.camel@aj.id.au>
 <7459b361-8c6f-aeb8-e434-f3725549adf3@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-plOR4tq2XwP4bAs/55kM"
X-Mailer: Evolution 3.22.3-0ubuntu0.1 
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
X-List-Received-Date: Mon, 10 Apr 2017 03:13:07 -0000


--=-plOR4tq2XwP4bAs/55kM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-04-07 at 12:11 +0530, vishwa wrote:
> > On Wed, 2017-04-05 at 13:56 +0530, vishwa wrote:
> > > We had a technical discussion on HOWTO and what is the right thing to=
 do=C2=A0
> > > handling the GPIO assertion and here is the gist.
> > >=20
> > > 1) Use gpio-keys and utilize libevdev wrappers (=C2=A0
> > > https://www.freedesktop.org/software/libevdev/doc/latest/ ) to watch =
for=C2=A0
> > > data in /dev/input/event.
> >=20
> > Okay, I'd like you to step back and detail what problem you're actually
> > trying to solve here. Going from wanting to handle GPIO interrupts to
> > using gpio-keys everywhere needs some explanation. We have at least two
> > other interfaces that would appear to be sufficient: GPIO chardev and
> > sysfs.
> =C2=A0
> Sure. I realize I should have put the use-case here than at the end.
>=20
> Problem: When the host check-stops, we need a way to detect that.=C2=A0
> The existing mechanism will assert a configured GPIO when that happens.
> Firmware code needs a way of knowing that it has happened and that is why=
 this application.
>=20
> I was told that /sysfs is being deprecated and that we use the chardev. W=
e had 2 options then.
>=20
> 1/. Use the gpio-keys=C2=A0
> 2/. Use libgpio ( the support is not in yet in 4.7 per the discussion )
>=20
> Brad Bishop recommended that gpio-keys be used over libgpio due to the de=
bouncing support built into gpio-keys implementation.
> Since I am not an expert in this area, I suggest you please talk to Brad =
if you see there are better ideas.

I've since had a chat with Brad and Vishwa. There's currently no
perfect fit solution to the problem, so given:

1. We're only dealing with input GPIOs
2. gpio-keys enables the description of debounce periods (through
devicetree)
3. At least *some* GPIOs need debouncing

I'm okay if we proceed this way.

Considering the current state of the kernel and alternatives to the
above, if 1. weren't the case then we would have a weird split between
/dev/input and either the GPIO chardev interface or sysfs, so given 1.
we've at least got consistency. Similarly for 2. and 3. we will
probably run into issues if we split input GPIOs between gpio-keys and
the alternative interfaces, as we may in the future find we need to
enable debouncing on a GPIO which would trigger user-space breaking
migration from one approach to the other.

We do have the downside of assigning keycodes to GPIOs. This could be
an arbitrary (e.g. linear, as-needed) assignment, or we could do
something like set the keycode to the GPIO line's index (e.g. GPIOA0 =3D
0, GPIOZ7 =3D 215, etc). This would at least give some meaning to the
values and so we hopefully have no reason to change them in the future.
I don't think there are any limitations to the keycode value we can use
(e.g. max 255), so even if the Aspeed chips expand the number of
available GPIOs in the future we should be okay.

As to why we can't configure debounce periods via say the chardev
interface, this is something I will ask upstream about.

> >=20
> > > *) The services that are part of the target will then own complete=C2=
=A0
> > > handling of the condition instead of the application that monitored t=
he=C2=A0
> > > GPIO.
> >=20
> > Why are we decoupling the handler services from the GPIO? What is the
> > advantage?
> >=20
> > The disadvantage is the behaviour of the system is much harder to
> > understand. If we go this route, what tooling will be in place to debug
> > failures of interactions between components?
> >=20
> > I would argue that this is already a significant hurdle in
> > understanding integration failures on the BMC, and I would prefer not
> > to add to the problems.
> >=20
> =C2=A0
> I am not following the argument here. Why is the behavior harder to under=
stand when you have defined systemd targets doing what they are
> required to do. Its the job of applications that get into that target to =
do the right thing of collecting what is necessary to understand
> one specific problem.

I apologise, I had a misunderstand stemming from your description in
2.1. Sorry for that - you weren't planning on doing what I thought.

> > > ---------
> > >=20
> > > Here is an example of application that handles the GPIO assertion tha=
t=C2=A0
> > > happens when host does a checkstop.
> > >=20
> > > 1) Application's arguments need /dev/input/event<$number> and the=C2=
=A0
> > > expected GPIO state as indicated by linux,code in :
> > >=20
> > > http://lxr.free-electrons.com/source/Documentation/devicetree/binding=
s/input/gpio-keys.txt
> >=20
> > There is a downside in that you will be creating a kernel ABI by
> > mapping GPIO events to a keycode. This choice appears to me to be
> > arbitrary, and from the kernel's perspective we don't know how
> > userspace is going to treat the value so we lose the flexibility to
> > change it if it's not. This isn't a show-stopper, but it sure feels
> > like a wart that doesn't need to exist.
> >=20
> =C2=A0
> Is it not expected that the binding always pass the input_event struct ?.=
 What kind of changes are you thinking ?
>=20
> Are you saying for instance you will change these values and applications=
 may go crazy ?
>=20
> > #define KEY_UP			103
> #define KEY_DOWN		108

As you pointed out we need to specify these values in your gpio-keys
subnode via the linux,code property. We mustn't assume anything about
how userspace behaves, e.g. it may very well care about these values
and could react negatively if the value were changed.

You mention above /dev/input/event<$number> - were you planning on
having one or multiple gpio-keys entries in the devicetree? If
multiple, what was your planned strategy for grouping the keys into
gpio-keys nodes?

One approach would be to have one gpio-keys node for each GPIO line.
This would enable userspace not to care about what value was assigned
to linux,code at the cost of knowing *which* /dev/input/event* file to
open. I'm not suggesting this is a good idea (I don't think it is), but
it is possible. It also doesn't change the fact that userspace may
still care about the value regardless. Further, knowing which device to
open may still be a problem anyway if someone plugs in say a USB
keyboard. We probably need more investigation here.

Cheers,

Andrew
--=-plOR4tq2XwP4bAs/55kM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJY6vg1AAoJEJ0dnzgO5LT5QVgQAJePU7UMxFkHxb0ph07N1psP
D4Ay33cCfDpg7HWEwGtCs7Bk1me77D/j3KJZhm75uYf4T6GsYHqwewMGu8YjkKhl
4LZJSL6ZPA3es3wgKsrjw0OFZSKAy0OHRccjhk2EAguU13Jk08gwaUULQ6Eztque
WnN6D75NiA80wH6qrNnCC/ZI3rb2fAlsA3D2zsbJXnD1DNSB93JkbZemrWL9cKRO
FsqUS3250l17v6fR7IJ6NcEAqmScCN0W4EvupZpol2ZXmI0QflAuaPBiF7FjGyuw
H+IFuzVilEJAk3cHUE9zQDYjy+iD3WcF7qj5+p5zvSRK/Zr8NyGCiOGv42pHUJe5
x0tS3+8XUYkprKJvMtaDBmT8TBQPHjwU3kybNtXYw3rTg4NrXrQlkwyPkoNWM6ST
ss+V++f5GlD7Ve8Q8op5eCoNuaYJ6IKUfoae+uKH/CFaWoOU6WNygGBUyS9t3mbb
HYzC1YQkXnOObcjpB+gRfknIZ6aqryoPd/3KSaisV+aTivKAb1jfvxQ63Hn6+Dmf
t/x6NYNd1Ctd6GoupX5xXDOV5H1aFis/UxLk5/SSlrDiH+llNb2OG+vmn6bax2fc
1+8sBt0kipBW+CYH6OZJ8iSDTCpjh2boyYIPD6evYofUP9CSWBGX4+uHGdO2HHv9
/SHSZg+AzDGwApKlOezx
=y/HZ
-----END PGP SIGNATURE-----

--=-plOR4tq2XwP4bAs/55kM--
