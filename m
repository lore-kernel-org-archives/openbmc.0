Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xjyZD3Xj4zDqYf
 for <openbmc@lists.ozlabs.org>; Fri,  1 Sep 2017 09:02:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JznPUxwx"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gsPt/TWd"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3742A20B61;
 Thu, 31 Aug 2017 19:02:26 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 31 Aug 2017 19:02:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=67FDt8jmXmd8OOwfqvsnnYQcCDQaKiZAdBZ7h6rpl
 o8=; b=JznPUxwxxffaiqkJdYSg5SDHfw1Sx3XszOfHLPmUHdA34o96kMV44Swc1
 MYOodtJb8r/92InEOz3DoZeskYycWmWUMp86AtpnhVqBYNUDzEN0JMPtanUeKvZV
 Kbx6Msu01HPCtvpV6tDp15mBcq2vkETk3toA+oGRToald4mPTHv/dHs5msZyrHMa
 IjVO1IkdHaKRwOn5U1FS2IQ6wl0mYCy88OYAIJ4mdnNUXG+NObEL4mDym6aysm+w
 znmj0EWNqwMMvHobI6z5UxQbS5jahOG8PfSwAXwDO7hLG/I4E9ec9Fj9trmepojg
 AlanEeyGciwY2+FDpEIAjMyQOErbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=67FDt8jmXmd8OOwfqv
 snnYQcCDQaKiZAdBZ7h6rplo8=; b=gsPt/TWdlhl2odeS9O+2Al3hJVqKBxpRzW
 WRPx44+Gk0+bOsF8GZLuPAofikM65DOdWRre0DCgswo3z2aPDzmRRm0n1EcCyQ26
 lpYs5rqL84FAHEPxzppiQc0EVzcTGanHtpk4MefJ/SNCE+KVdYnomjXo+hc7NfTQ
 ofqyqm6Fe0s0akBwStnoi3iopxsQlNRt7sn9pHHXEIRY9hzL3yU8gNbekGskSWaT
 HMiVFvoLpwmwYD4YBDSOt1rEXnaEHCWEKhWCdZwjxgSxNXXIGEJS2wyJAgm0xeVe
 tuJWsto6xS807JcIi/dbQIE2AlMpFo5gly0wSB1n8MQmNNcXkRYA==
X-ME-Sender: <xms:gpWoWTmpU7DETm9mwfh2dT6HsDVQFFbQP6htGzr8c5gPnLO6y50nqg>
X-Sasl-enc: hIpWRw3IF3ZiO3URlXvvL43Ag3zIpE5CftROlHgx6x7y 1504220545
Received: from keelia (ppp14-2-65-251.bras21.adl6.internode.on.net
 [14.2.65.251])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6503324640;
 Thu, 31 Aug 2017 19:02:22 -0400 (EDT)
Message-ID: <1504220536.5933.32.camel@aj.id.au>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: gpio: Add optional
 retain-state-shutdown property
From: Andrew Jeffery <andrew@aj.id.au>
To: Rob Herring <robh@kernel.org>
Cc: linux-leds@vger.kernel.org, rpurdie@rpsys.net,
 jacek.anaszewski@gmail.com,  pavel@ucw.cz, mark.rutland@arm.com,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org, joel@jms.id.au,
 openbmc@lists.ozlabs.org
Date: Fri, 01 Sep 2017 08:32:16 +0930
In-Reply-To: <20170831212840.ecr2p4nra52xvzrz@rob-hp-laptop>
References: <20170828001711.19662-1-andrew@aj.id.au>
 <20170828001711.19662-2-andrew@aj.id.au>
 <20170831212840.ecr2p4nra52xvzrz@rob-hp-laptop>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-eP7A03YBeSElujE3UVdG"
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
X-List-Received-Date: Thu, 31 Aug 2017 23:02:31 -0000


--=-eP7A03YBeSElujE3UVdG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Thu, 2017-08-31 at 16:28 -0500, Rob Herring wrote:
> On Mon, Aug 28, 2017 at 09:47:10AM +0930, Andrew Jeffery wrote:
> > On Baseboard Management Controller (BMC) systems it's sometimes
> > necessary for a LED to retain its state across a BMC reset (which is
> > independent of the host system state). Add a devicetree property to
> > describe this behaviour. The property would typically be used in
> > conjunction with 'default-state =3D "keep"'.
>=C2=A0
> A bit quick on the applying of this...
>=C2=A0
> I don't understand how this works. The BMC usecase is interesting but=C2=
=A0
> that's fairly irrelevant to the binding. How do you know the GPIO state=
=C2=A0
> thru a reset?

The answer to that is a property of the system design in my opinion.

> You're doing a core reset, but not reseting the GPIO=C2=A0
> controller?

Well, in my specific case, the GPIO controller in question isn't on the SoC=
,
it's off-chip behind an I2C bus. Powering off a BMC doesn't necessarily mea=
n
removing power from its peripherals, so in this case the their state is
maintained.

Alternatively, and again in my specific (Aspeed) case, the on-SoC GPIO
controller can be selectively reset with respect to the rest of the SoC, or
individual GPIO lines can be marked as reset-tolerant. This gives the same
capability and is what you've suggested above.

>=C2=A0
> When you use 'default-state =3D "keep"' but not this property? Seems like=
=C2=A0 the
> same thing to me.

Is that not also true of retain-state-suspend?

The existing behaviour of leds-gpio was to turn the managed LEDs off in the
remove() path. To me this was unexpected behaviour, but it is what it is. M=
y
first pass at the patch (before I sent it out) was to do as you suggest and
only turn it off in the absence of 'default-state =3D "keep"'.=C2=A0=C2=A0H=
owever there
were quite a number of users of that configuration, and this could be an
unexpected change of behaviour. Given retain-state-suspend was already defi=
ned,
it seemed that the non-breaking way to get the behaviour I desired was to
introduce retain-state-shutdown.

Sure, this is dealing with problems in the driver and not describing hardwa=
re,
but at this point the behaviour is already in place and people might be rel=
ying
on it.

> Presumably the bootloader would just distinguish=C2=A0 between a
> warm and cold reset to decide whether to re-init the state.
>=C2=A0
> Finally, if we do have this property, why is it GPIO specific. You could=
=C2=A0
> just as easily have a LED controller IC and want to do the same thing.

I don't think we're precluded from making it more general even if it's
submitted as specific to leds-gpio? I don't have anything against making it
more generic. I was tossing up about doing so, but went for the specific ca=
se
first because we could make it more generic without problems. Going the oth=
er
way is harder.

Cheers,

Andrew
--=-eP7A03YBeSElujE3UVdG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZqJV4AAoJEJ0dnzgO5LT5mF4P/0egTA7vdWrGTQhuNK+zv017
ms8+ioro5fatH1hywcEUCTciyq+lIBtzMIswqcTa9WazyP0COh3k5kK30vYNrz6Q
44HOTFDKYUieohf9SMsuakcHhzYyB/+fgM60zGQ7Nbe8COtEFPutLUUjT3GvSiFt
Y/iSaP6r5/xcK0ZvcV8YKhq1ZUgN77yiSIk2r5rBwlMYFY1pj5Ue7IKvsSjlRMTs
CWe0YrGqu+KrytzzmlJToBnko2qUSumxmBKWPOD5etFPGuK3B7WfBRPGmucBr7mS
OtE6GR3iAiYYXZ+xUUFX/XWq9SohhM1V4Fl9/181HMiZnccTNfiji8xKW8+lRnOQ
e+K3k9ErwIU3ZG8FIixjjwMEwQN2URiHTQytVSaoNd8jhoI+P30Gc9wKdKQhniaH
xA/zku7+dtRBqcASWLBTUm464ZQOq214lrCVVWiOqW8ZQzZ+msc3ZfkFh/Flq9Lc
K0LxsD8E1wgOXLR//NYon0xsMtj7CHI+W9S5Z+CC5Rc9PMkHCmJPkW8VWIPvPWUp
vC687X/iN2mXSpwMZXEn6mXeB6xXrQS4qFPB7iCs89saiC9074pO5/KuTKBy3YkJ
JWjr5X85+2w6/oRS5GkFt1KPD+ynlQ0Q/75HwuZscFh2OnM/0ulcY2mHQH8TwEnf
3mcJgnsjTmZIRf7g7ZhW
=PgUn
-----END PGP SIGNATURE-----

--=-eP7A03YBeSElujE3UVdG--
