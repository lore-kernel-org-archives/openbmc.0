Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgWpV3GTHzDqYw
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 09:49:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cCzjN+al"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="fnFFbjS0"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E1BC420A6F;
 Sun, 27 Aug 2017 19:49:34 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 27 Aug 2017 19:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=j+t1gOEQJACqlFC3xq5L+ATLMNWfpds9hFuvqDgIA
 ww=; b=cCzjN+alzCXTYOAFZvB2Qf/opKRP9K4CwWktW/2Dk0yjsb/Y4uL+jQl0i
 bq+cL12hd6QNXVUel644bfiNPEH/JOqkKReWKoa6bAd95SrUzVvt9pAIek+OKP0A
 FfUx8G2xQ5lbMrqC/xdJvfsnvJGkcdOEpfkIQmM6pFBEF6SHPQaBjLsj0jcAVmcr
 GFks4/lzVrHk6+lKglPiTKfSpw4SE7bCdNXcsTffCkJd/RQbUChYaZyxUX9wiUVn
 WfDQBJd2PgeztVCRS/EmC6N90Dqpl/fvbKaF1jMhQXdfaJ0jzC89vfZ8viU7T+Oh
 /xyBtyovi78zq282poxo3WWXDv6Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=j+t1gOEQJACqlFC3xq
 5L+ATLMNWfpds9hFuvqDgIAww=; b=fnFFbjS0RKsuX/jC/wS0n+9dkP7oDrrbAk
 2NJdVZyAY3cc7QJV+QJKlWZrmUTPVsjtqPB24LilvTUsj/GwcpOThqNehOOFX1iq
 A0WE5Ae0DSqWVwneFGpnp7l9XJgO7rrkAvblxn8c/WnlEQmySz+G4vx22zfYPWJl
 f9forPTWPqBM7HlAx+ypezpvzHqHaJpheFhb4oXHAnKRsZQ4ZCCx74PeihHHvKVP
 HP9E5X/sHSVFJEjFVJqrckvzfBHU41aTglyOJFitIqiQJopSGFat93F/3rmR9wg8
 ZJnaR39G7+RXG1EDsERZKpSWW+aorWiGQRSSiS4XunDcop9iT6Hg==
X-ME-Sender: <xms:jlqjWYJYUMwrl9rs-zB0CwTkYkX6bvT5GIQLDzQVUA8FFz_GTzYzaA>
X-Sasl-enc: qslP0ZOlljJIjC4tHtwNnnl7UnjSSe8NKNhgEmBSDoKG 1503877774
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6C99D24605;
 Sun, 27 Aug 2017 19:49:33 -0400 (EDT)
Message-ID: <1503877767.32695.8.camel@aj.id.au>
Subject: Re: Power Restore Policy
From: Andrew Jeffery <andrew@aj.id.au>
To: Andrew Geissler <geissonator@gmail.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Mon, 28 Aug 2017 09:19:27 +0930
In-Reply-To: <CALLMt=rD633fC_qLVzUZAtQwuU_EoQZ+1yD9okrd1tngp1cpzg@mail.gmail.com>
References: <CALLMt=rD633fC_qLVzUZAtQwuU_EoQZ+1yD9okrd1tngp1cpzg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-RPPR8BwOu2q07tRBThIJ"
X-Mailer: Evolution 3.22.6-1ubuntu1 
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
X-List-Received-Date: Sun, 27 Aug 2017 23:49:40 -0000


--=-RPPR8BwOu2q07tRBThIJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Fri, 2017-08-25 at 14:32 -0500, Andrew Geissler wrote:
> The BMC has the concept of a Power Restore Policy.=C2=A0=C2=A0It=E2=80=99=
s defined
> within https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xy=
z/openbmc_project/Control/Power/RestorePolicy.interface.yaml
>=C2=A0
> The point of this policy is to define the host boot behavior by the
> BMC if it is rebooted.=C2=A0=C2=A0The policies are:
> o AlwaysOn
> o AlwaysOff
> o Restore
>=C2=A0
> What complicates things a bit is the scenario where the BMC is
> rebooted, but the host is booted.=C2=A0=C2=A0Rule number one in bmc manag=
ement
> firmware is don=E2=80=99t mess with the host if it=E2=80=99s up and runni=
ng.=C2=A0=C2=A0So
> basically, if the host is up and running, and the bmc is rebooted, the
> bmc should do no actions other then to get it=E2=80=99s chassis and host =
state
> objects to reflect that of the chassis and host (on and running).
>=C2=A0
> If the host is not running, then here=E2=80=99s what the policies mean:
>=C2=A0
> o AlwaysOn -> Power on
> o AlwaysOff -> Leave system in off state
> o Restore -> Read last requested host state and re-request it
>=C2=A0
> OBMC has an application, somewhat misnamed, discover_system_state
> which enforces the AlwaysOn logic.

Out of curiousity, why do you think it is misnamed? Is it the ambiguity of
'system' with respect to BMC vs host? Or something else? Is there a better
name?

>=C2=A0The Restore logic was put into
> phosphor-host-state-manager but I don=E2=80=99t believe this is the corre=
ct
> place for it.

Naive question as I'm not intimately familiar with the details: why not (on
reflection, this is probably answered below)?

>=C2=A0It does it when it reads it=E2=80=99s

Mate.

Can you rephrase that for clarity?

> persisted value for the
> last requested state when it starts.=C2=A0=C2=A0I=E2=80=99d like to move =
the Restore
> logic in with the discover_system_state application.
>=C2=A0
> The reasons are the following:
> o discover_system_state=E2=80=99s service can easily be configured to not=
 run
> when the host is already running

Is this also part of your suggestion to rename the service? Because to me, =
from
the name, it seems crucial to run it precisely because we want to know the
system's (host's) state. But it seems we know the state before running the
service? What does the actual discovery?

> o phosphor-host-state-manager has to be started always and early, so
> that it can monitor for any state change requests (like in the case
> where the bmc is rebooted while the host is still up).

This isn't a state change for the host though, if it remains up?

I guess the idea is to start phosphor-host-state-manager seeded with the
discovered state, and then let a service (started after
phosphor-host-state-manager) poke phosphor-host-state-manager to enforce th=
e
policy?

> o Having all the policy in a single application is more testable and obvi=
ous

Sounds ideal on the surface of things.

>=C2=A0
> https://github.com/openbmc/openbmc/issues/2210 is tracking this.
>=C2=A0
> Thoughts or questions?

Yeah - well a comment more than anything: From reading your email and then
reading #2210, it was not at all clear in the email that the *host reboot* =
case
is what you're trying to resolve. It seemed like you were just trying to cl=
ean
up a case of misplaced code ("[have] all policy in a single application").

Andrew

>=C2=A0
> Andrew
--=-RPPR8BwOu2q07tRBThIJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZo1qHAAoJEJ0dnzgO5LT5IwAP/2vXqPAq3N9hRKm/z4u4Hm5Z
lvJ5Asxzy68aZL/fF72V5QLBg3cDW1jVAib60b0tZAgbMBgOP3W23DNXXjgqpvbw
cfBsSd+jUlNzaj6M3Kuuv0HNT7R1HHi0DSXPnHxMZUyjXU8aOJFXvUi3eqqm1Dwu
1sCmkHovPHYbxHgOstMZC6dqT4LzqCc+mcuCyX6AqtJ9eVFnPAIjWukMUfWuUR/R
FIzJDVs+BGYvY6CsnBFvfwPkYEpzcUMt7cP0MAZ96vDPS+l0ERiL7rQwZ4W7zmS9
wVY5d9wBs7eYHVvfcDiD67G8NcbWOywFVST8ULPy3ifZjSIa08tCHUlWzV8MnNob
Fe2EXlV1UnU9gP0KZjGcGcm3BV0EVw3Ft1fHxFB9a1X5FaDmjHyxuL7E8Ty3KcYo
zoegNFZ6ZKXo50d8owDhyrpXG+HAFEL61bso/f6TR8UdXGeXTb7yK5YhGlclMb2D
U7Vqmydlu0kaLN3W7XsizvE7f9U81lWcGxg5VVcBDp1zZFSDF7e2qOy6rgkeKB1k
M4p6EFpXsljxSlOHXGo/x5FvSXF2PNZZzaOoK3GBKhmOZM0BW9wnzTPvHdjWn/nH
+x481dui8FqARx9zvWUZr7BSqgkf2DrghBGzK/CLrjHtvVg2WSf+OXdelXHWUTEg
Aq7VVt/MABktrrNhgUy4
=Frfg
-----END PGP SIGNATURE-----

--=-RPPR8BwOu2q07tRBThIJ--
