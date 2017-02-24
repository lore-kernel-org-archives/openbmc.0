Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTzvh0JnQzDqH6
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 16:20:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LVd70UlO"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="US4fQrNl"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CABA320922;
 Fri, 24 Feb 2017 00:20:29 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 24 Feb 2017 00:20:29 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=MoUYqYx0VVn7s27TnXRzLOobYlA=; b=LVd70U
 lO+BxTFZOe7T4bui102j8OijtoUsAyC26lG+0egqlCjytVuNelu4dD1zyWJ+R4AR
 xoofDa+mpPjrlUGt7bwSxPlfB+5dQPK7BHF4vGDZf03aSZ65H79vLXZY0425GnOh
 NNN6Xicv2NeurWUxwMF4Yna6nf5YhqxfgQJHg=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=MoUYqYx0VVn7s2
 7TnXRzLOobYlA=; b=US4fQrNlw6/LGT1Jp+KxLkaYae8atdG21NZs/ssz7qbhNQ
 FQwS6ES5eVx9vzhegrDLVQwrIEbfbO7+El3HQbWd94t7qPlpFWiCkiWIOOPPidyN
 D1ud/M8wRlkDP2bhHu3B2d9QhCStzvmlRJw9waopK1LcRd6fVBbEZLTW+HwXk=
X-ME-Sender: <xms:ncKvWNKWNHzRvxiw7utaRrRHpz1e_zIRI0Dg7vrnXEMkMv66j7LQ2g>
X-Sasl-enc: lB9GwdNO4HQchdEgjZcw726YN+vUFQjuQ3YhD95vcw2U 1487913629
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1F1677E12B;
 Fri, 24 Feb 2017 00:20:27 -0500 (EST)
Message-ID: <1487913621.755.0.camel@aj.id.au>
Subject: Re: Target name refactoring
From: Andrew Jeffery <andrew@aj.id.au>
To: Andrew Geissler <geissonator@gmail.com>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 24 Feb 2017 15:50:21 +1030
In-Reply-To: <CALLMt=pAbfD-wUdi2QA=q3Tt_Kv7GXasmDMLY3kJA+83Vh+Vow@mail.gmail.com>
References: <CALLMt=r62pSsVx+5DRsyxRThX0WahOO8wk5ENcc+t7ZfyoPoVw@mail.gmail.com>
 <CACPK8XfDvDi_fUEzFo2vBHU2O=djucY1t27gqY-=RgoJQo3LWQ@mail.gmail.com>
 <CALLMt=pAbfD-wUdi2QA=q3Tt_Kv7GXasmDMLY3kJA+83Vh+Vow@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-qaLqXNvsBvNOPvLip8kT"
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
X-List-Received-Date: Fri, 24 Feb 2017 05:20:33 -0000


--=-qaLqXNvsBvNOPvLip8kT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-02-23 at 22:05 -0600, Andrew Geissler wrote:
> > On Tue, Feb 21, 2017 at 9:00 PM, Joel Stanley <joel@jms.id.au> wrote:
> > On Tue, Feb 21, 2017 at 8:50 AM, Andrew Geissler <geissonator@gmail.com=
> wrote:
> > > Some design decisions came out of my last set of changes in the
> > > OpenBMC state area.=C2=A0=C2=A0There was a proposal to rename our tar=
gets
> > > responsible for booting and powering on/off the system.
> > >=20
> > > Currently we have this:
> > > - PowerOn: obmc-power-chassis-on.target=C2=A0=C2=A0=C2=A0=C2=A0obmc-c=
hassis-start.target
> > > - PowerOff: obmc-power-chassis-off.target=C2=A0=C2=A0=C2=A0=C2=A0obmc=
-chassis-stop.target
> > > =C2=A0 obmc-stop-host.target
> > >=20
> > > The obmc-power-chassis-*.targets are responsible for doing whatever i=
s
> > > required to apply pgood to the chassis.
> > > The obmc-chassis-*.targets are responsible for starting and stopping
> > > all host related services
> > > The obmc-stop-host.target is where we have the soft power off service
> > > (notify host of shutdown, wait for host to shutdown gracefully)
> > >=20
> > > Refactoring Proposal:
> > > - First the chassis-start and chassis-stop target names don=E2=80=99t=
 make
> > > sense anymore with the new bmc, chassis, and host state break down=E2=
=80=99s
> > > so:
> > > =C2=A0 - Rename obmc-chassis-start.target to obmc-start-host.target
> > > =C2=A0 - Rename obmc-chassis-stop.target to obmc-stop-host.target
> > > =C2=A0 - Rename the current obmc-stop-host.target to obmc-shutdown-ho=
st.target
> >=20
> > Can I suggest putting the host before the action?
> >=20
> > obmc-host-stop
> > obmc-host-start
> > obmc-host-shutdown
> >=20
>=20
> I believe Brad has a naming convention he's shooting for where the
> verb comes second.=C2=A0=C2=A0I'm somewhat agnostic on this but we just w=
ant to
> be consistent.=C2=A0=C2=A0With your proposal I'd probably have to rename =
the
> chassis one's from obmc-power-chassis-on to obmc-chassis-power-on.
>=20
> Thoughts Brad?

Whatever the case, ack from me on your general proposal, so long as the
names are consistent.

Andrew

>=20
> > >=20
> > > The target relationships are then the following:
> > >=20
> > > obmc-host-start.target requires obmc-power-chassis-on.target
> > > obmc-shutdown-host.target requires obmc-stop-host.target requires
> > > obmc-power-chassis-off.target
> >=20
> > obmc-host-start requires obmc-chassis-poweron
> >=20
> > obmc-host-shutdown requires obmc-host-stop requires obmc-chassis-powero=
ff
> >=20
> > I think the rest of your proposal sounds good, from what I understand.
> >=20
> > Cheers,
> >=20
> > Joel
> >=20
> > >=20
> > > When a system goes to the quiesce target, the host state manager will
> > > call the obmc-stop-host.target.=C2=A0=C2=A0Otherwise, the host state =
service
> > > will call the obmc-shutdown-host.target when power off is requested.
> > >=20
> > > Thoughts/Comments?
> > > Andrew
--=-qaLqXNvsBvNOPvLip8kT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYr8KVAAoJEJ0dnzgO5LT5yWMP/Rr1ZhMrAxvdKA6/MACaLfzV
XjeCusb/bxSRhA5PsrImSjbwRPMdYc+qJENZlTZLb5WaxRVjKAdJFbuSDKjwDGr9
YRPiCyRoXkYtIAbWnPpZnPhxAAWmfpWN+FWEaqw7gGQqHR2g8zDKcwoaqNBjc+/C
IY8K6FrBqC4cbw8sOYCEt9vbHh5BsHMn6RGARceKAgnjSIeK/5QOVfzrNSnJdr7e
Son+aqF7bY5Uz39OvojkrVESbMCcflCNXagbuqS9+tHk0jbQFvUEisLoTEMNYkyg
zaRBlgt2oW4d086JscRFf9LSiW0huz9p5x3fIsHMsoDuGO0xpykUG47K9YPpuOVF
3CIjjidurejK0Ii8JBv5mKbLBt0dbZbbeHGvsrxTTgEZ3iXNq8O8D8BuE4nYkUr1
8BencZzTVr+YH3H8F4K+chKhlvtcJ5vOQHE6KWOhlc0zqCl3ZJyu3Qn5wnhiEzeq
JX7sT+hsVpHnjFW03wCuvxNS9FThYnAcjdM/HENcX4IXWSLt0HyNg+i23OlPF5eB
v9VMkcC8MvHxA7jO7gC25snLYLmohiP1I604rhm1gnVOK6wR7yalQrrVEg4j7x0K
upVrMPXiN+C1K3lccqKdsTikupWJeKlAYq+EWND2vF/8ttSoRQ8Ov+klvQPNYN0b
srxrBHLHqCQFBG8o3eUJ
=NUNB
-----END PGP SIGNATURE-----

--=-qaLqXNvsBvNOPvLip8kT--
