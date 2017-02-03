Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vF6h00r1czDqBZ
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 17:40:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="YTXd8aBx"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="O1kGYsn5"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AA94E209B0;
 Fri,  3 Feb 2017 01:40:45 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 03 Feb 2017 01:40:45 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=HfT2tpVwqt78gZ4kbSRH2WduVdk=; b=YTXd8a
 BxXdwJkh9Na9SSo+impLcpdUD5WmCS0G3C9KLKuDs8v96Pch1Zd7MVt9D1edvQuw
 g9vQw4gAwdPROLv3OoZ0o12dP6jFaKMQoOZwTG8b7H4kdqYAgz9bh5JQ8FBU5W7h
 3hJRsVpHToZ+rYEqsD6M+PKRjGymIsv13TlFk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=HfT2tpVwqt78gZ
 4kbSRH2WduVdk=; b=O1kGYsn50dQ1wh7cPhI8pQUIkBQNA1ZxaCizgXMFSBgkfG
 lfzi0RPUxEhXUxC0HXy2g297WRnYywcAHFiBk2cttsBwalFaKnlULKofv3x7nhI9
 41fwYjMPFX+pr8Bn8Oxt1Eikvc+hJ0BDKXeVnq4f+23QP85dia2fdjE9y9VAg=
X-ME-Sender: <xms:7SWUWGwr43Phd7LTr08-Yfn4CdKJM7O0dtU9027-aWfEAZR3nBJb3w>
X-Sasl-enc: o+xukQ/0p1pMkEWgTQKKAL3oLe/DSXvzInXklch4u86J 1486104044
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id E5A487E033;
 Fri,  3 Feb 2017 01:40:43 -0500 (EST)
Message-ID: <1486104037.7271.10.camel@aj.id.au>
Subject: Re: How to deal with failing services in the boot targets
From: Andrew Jeffery <andrew@aj.id.au>
To: Andrew Geissler <geissonator@gmail.com>
Cc: Xo Wang <xow@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 03 Feb 2017 17:10:37 +1030
In-Reply-To: <CALLMt=qq97zpRTxomzzucenceiZBEJqgbXANoeU_3Kd1S0313A@mail.gmail.com>
References: <CAPH-5w4WA8aVbKA0ptR7ubtpCUuGxZ2RQpuS0W4m1csen-kU-w@mail.gmail.com>
 <1485479779.4137.13.camel@aj.id.au>
 <CALLMt=qq97zpRTxomzzucenceiZBEJqgbXANoeU_3Kd1S0313A@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ibXOc7YyMZ0Nb6Pr8c0S"
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
X-List-Received-Date: Fri, 03 Feb 2017 06:40:49 -0000


--=-ibXOc7YyMZ0Nb6Pr8c0S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-02-01 at 14:42 -0600, Andrew Geissler wrote:
> Finally got around to doing some testing on this, here's what I got.
>=20
> > My story this sprint, https://github.com/openbmc/openbmc/issues/1033,
> is focused on handling errors when things go wrong.=C2=A0=C2=A0Specifical=
ly,
> when required services fail to execute properly during a systemd
> target execution (power on, power off).=C2=A0=C2=A0When a fail happens, t=
he obmc
> software needs to notify the users of the system and provide
> mechanisms for either the system to automatically retry the failed
> operation (i.e. reboot the system) or to stay in a quiesced state so
> that error data can be collected and the fail can be investigated.
>=20
> Michael is working on a story that ties in with this function this
> > sprint, https://github.com/openbmc/openbmc/issues/942, in which we=E2=
=80=99ll
> allow system users to enable or disable the auto reboot function on
> errors (service failure, host checkstop failure, host watchdog
> failure).=C2=A0=C2=A0He will utilize the new target I=E2=80=99ll be creat=
ing in my story
> for this.
>=20
> So we have two main fail scenarios:
>=20
> 1. A service within a target fails
> - If the service is a oneshot type, and you put that it is required
> (not wanted) by the target then the target will fail if the service
> fails
> =C2=A0 - You can simply define a behavior for when the target fails using
> the =E2=80=9COnFailure=E2=80=9D option (i.e. go to a new failure target i=
f any
> required service fails)
>=20
> - If the service is not a oneshot, then you can not have it fail the
> target (the target only knows that it started successfully)
> =C2=A0 - You have to define a behavior for when the service fails (OnFail=
ure) option.
> =C2=A0 - The service can not have "RemainAfterExit=3Dyes=E2=80=9D otherwi=
se the
> OnFailure action does not occur until the service is stopped (instead
> of when it fails)
>=20
> 2. A failure outside of a normal systemd target/service (host watchdog
> expires, host checkstop detected)
> - The service which detects this failure is responsible for logging
> the appropriate error, and instructing systemd to go to the
> appropriate target
>=20
> The current proposal is that we create a new quiesce target.=C2=A0=C2=A0T=
his is
> the target that the target/services put for their =E2=80=9COnFailure=3D=
=E2=80=9C
> instruction and where the services in fail #2 above detect a problem
> will instruct systemd to go to.=C2=A0=C2=A0We=E2=80=99ll then have code t=
hat monitors
> for the entry into this new quiesce target and handles the halt vs
> automatic reboot functionality.
>=20
> The above info sets up some general guidelines for our targets and
> services (and some refactoring for my story this sprint)
>=20
> - All targets should have an =E2=80=9COnFailure=3Dobmc-quiesce-system@.ta=
rget=E2=80=9D
> - All services which are required for a target to achieve it=E2=80=99s
> function should be RequiredBy that target (not WantedBy)
> - All services should first try to be Type=3Doneshot so that we can just
> rely on the target fail path
> - If a service can not be =E2=80=9CType=3Doneshot=E2=80=9D, then it needs=
 to have a
> =E2=80=9COnFailure=3Dobmc-quiesce-system@.target=E2=80=9D and a "RemainAf=
terExit=3Dno=E2=80=9D
> - If a service can not be any of these then it=E2=80=99s up to the servic=
e
> application to call systemd with the obmc-quiesce-system@.target on
> failures
>=20
> Thoughts/Questions?

I think this is a sensible set of suggestions. We need to document them
somewhere obvious so a) we can point people at them and b) reviewers
can refer to them when reviewing patches adding/updating systemd unit
files and targets.

Thanks for considering the problem.

Andrew
--=-ibXOc7YyMZ0Nb6Pr8c0S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYlCXlAAoJEJ0dnzgO5LT59XIQAKL7vKuC/9JkCQ3qCBB0gULd
6eF/Yvpa3s98601nwpVZf0FG0TMUyyx3S4q6SMoiyOgQxvM1gH7R/0GU/j3wtkPm
T1xr9qzILHST8Z/Gw7GjnUE74ajh9c9Y41NyIT9EFYO7QZm99/Y0EVa0bg3awI2G
ahXutpUsnX+wmD7JKWYmDIJU2mZEa1bK09Z1RuZCKUXB13/GAFtVp1AoAch4GinQ
5F1GR8a/g3KzpoIycZ5vLALakmgBNyqr128f/RztDhE0aHzRx7+aw/vqBVEQertE
9ALcFHgYUmacQDdcmuzKTwQ3TEFBoW95Dx4KXe0d+75RTGyKMbSYJtDfI6bJnzwx
foNH7emB7VCxmczG5gEaPGyYVtjKhAK60FmvkOpxF2f58r+qujSAIka8IZuTdTd2
mM6Woc1OP1X3wPVA89ByshFK+GO1o70rdkeZL9Mk9bFX9qiPJ7Pfxa/JUt4d3urE
4R0nYXofgRrWR9bNlWfpdq/iFLk4Tu8OzfRjIznevcIyx1weSHsCzZhlvXMilZoB
ASboAI/yFXt4AGtRrC+1uBHqaa5kqkGa2pfLYYvfGPyi3aIq9OAJB0EhITGZtRtI
tCdBZ46yllOHSi3hojKbJcOBFwBm+loonOMiwgbzYOS7Dj202C+QTHzJsy3Mrvd+
Shi2zGsgbCyfnJTq0E6z
=c/MD
-----END PGP SIGNATURE-----

--=-ibXOc7YyMZ0Nb6Pr8c0S--
