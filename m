Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vzg7D5nNHzDqHg
 for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2017 10:14:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hxsy7yHP"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="GVY6r/u+"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F09AB20ABD;
 Thu,  6 Apr 2017 20:14:29 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 06 Apr 2017 20:14:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=Gq5QXE21lI0+8CJ62DAF89tZh5yX/AOkxKFf4HtLD
 aM=; b=hxsy7yHPWUP9wjRWM2IXrKiiyFaGcPX2pRv5AQtiov4nkHiVSAmaTKO1R
 Y3hgVcUbRdl4ZbSxXg0J2LjnpmMd2bULA6XD9XhL75rE9UAKzEo0tEf0iF1BfPzH
 8FBI5eUWA8Hkt4D/Ilz/AwYI9rHjeiqlNbJ70HDMG81+JqZGFU5gpWWqYzoTQ4Ti
 NDIXggVqboOwZtZX5S+eFUnG/Pm4k8wTs2CpdJV9MWnLF4IsqdqUJSDeUuPGdReD
 Q6rDPVFdU5g7bnAblQDg0xsoH9HuN8npu0XNlA9owMG6tvvwd0ywAfzlhNx7TCx5
 ssaM8R5ydS41mS0lMM+QYTYtNiASA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Gq5QXE21lI0+8CJ62D
 AF89tZh5yX/AOkxKFf4HtLDaM=; b=GVY6r/u+WZ1Fca/uy0L0oz3CowI7pVMAe6
 3463CzgrC0rZKAiH5+aaKOBxDlxOQapO34vaQWFPZ9wwuCNd3RdWJ5gd+d1QcBUS
 kuih04mfiKrHW3OaUBvfhQALyGGn33Omufaib0QWHT41Mv4pkhthTvbnFjfjMaBK
 fRphsntNPiQJMNkDM3Rdya3zSVWBntl00UKj8BjPp4/NOCbyP1YyaMLKcQqF90mw
 Nn+kIzOk7GcguJuHF/UgdQ1wbBwcrWljWwtmzqv00zrKijxTWKV9gilYIOKd+3SQ
 Mo4rufVqyXlqQgU53AHt9lNx0mzedKEmGsP3XcqCRnuskopyrPOQ==
X-ME-Sender: <xms:5dnmWFpYXTne5887dgKPqp48J51tYb1SDKOk6YzL9A31Q0W2PUEgSQ>
X-Sasl-enc: ZL7VsMk9bx1eb2H0csnsPJ9AzlWImnZ8nCBob0FpjVFF 1491524068
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id B561824457;
 Thu,  6 Apr 2017 20:14:27 -0400 (EDT)
Message-ID: <1491524060.5817.8.camel@aj.id.au>
Subject: Re: Discussion on GPIO monitoring and design thoughts.
From: Andrew Jeffery <andrew@aj.id.au>
To: vishwa <vishwa@linux.vnet.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Fri, 07 Apr 2017 09:44:20 +0930
In-Reply-To: <3ca9e8a5-4135-8fa3-cbf5-62543a89a491@linux.vnet.ibm.com>
References: <3ca9e8a5-4135-8fa3-cbf5-62543a89a491@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-qPJqadywvtcUxHPsWRGg"
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
X-List-Received-Date: Fri, 07 Apr 2017 00:14:33 -0000


--=-qPJqadywvtcUxHPsWRGg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vishwa,

I have some queries below. Apologies if they appear curt, but I'm
trying to cut to the point in each case.

On Wed, 2017-04-05 at 13:56 +0530, vishwa wrote:
> We had a technical discussion on HOWTO and what is the right thing to do=
=C2=A0
> handling the GPIO assertion and here is the gist.
>=20
> 1) Use gpio-keys and utilize libevdev wrappers (=C2=A0
> https://www.freedesktop.org/software/libevdev/doc/latest/ ) to watch for=
=C2=A0
> data in /dev/input/event.

Okay, I'd like you to step back and detail what problem you're actually
trying to solve here. Going from wanting to handle GPIO interrupts to
using gpio-keys everywhere needs some explanation. We have at least two
other interfaces that would appear to be sufficient: GPIO chardev and
sysfs.

What you've described reads to me like a case of the X-Y problem. This
link is rather blunt, but it illustrates the issue:=C2=A0

http://mywiki.wooledge.org/XyProblem

>=20
> 2) Define a target with set of services that would be called into by the=
=C2=A0
> GPIO monitor application when the GPIO state changes to what is expected.
>=20
> =C2=A0 - 2.1) Another option was to just broadcast a signal that interest=
ed=C2=A0
> parties could catch and act

I assume this is on D-Bus?

>  but then it was not chosen because there=C2=A0
> would be no guarantee that the signal would ever be delivered / caught=C2=
=A0
> by needed parties.

Isn't this what systemd is for?

Isn't this what you gain by decoupling the monitoring from the
handling? For instance if we're talking in abstract terms, the current
system policy might be to not care about the state change.

>=20
> =C2=A0 - 2.2 ) Also going the signal way demands a service that just need=
s to=C2=A0
> watch for that.

Is that the case? Can't we have one service handling multiple signals?
Whether that's a good idea is another question.

>=20
> *) The services that are part of the target will then own complete=C2=A0
> handling of the condition instead of the application that monitored the=
=C2=A0
> GPIO.

Why are we decoupling the handler services from the GPIO? What is the
advantage?

The disadvantage is the behaviour of the system is much harder to
understand. If we go this route, what tooling will be in place to debug
failures of interactions between components?

I would argue that this is already a significant hurdle in
understanding integration failures on the BMC, and I would prefer not
to add to the problems.

>=20
> ---------
>=20
> Here is an example of application that handles the GPIO assertion that=C2=
=A0
> happens when host does a checkstop.
>=20
> 1) Application's arguments need /dev/input/event<$number> and the=C2=A0
> expected GPIO state as indicated by linux,code in :
>=20
> http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/in=
put/gpio-keys.txt

There is a downside in that you will be creating a kernel ABI by
mapping GPIO events to a keycode. This choice appears to me to be
arbitrary, and from the kernel's perspective we don't know how
userspace is going to treat the value so we lose the flexibility to
change it if it's not. This isn't a show-stopper, but it sure feels
like a wart that doesn't need to exist.

>=20
> 2) Call this app after reaching `Host-Running` state thus avoiding any=C2=
=A0
> checks to see current state.
>=20
> 2) App will then use libevdev wrappers to watch for the state

It bothers me that we'd be invoking libevdev to catch an interrupt on a
GPIO. It seems unnecessarily complex in general.

>=20
> 3) On seeing the expected state change, app calls into the configured=C2=
=A0
> target.
>=20
> 4) Configured target right now has 2 services.
>=20
> =C2=A0=C2=A0=C2=A0- 4.1 ) Service that Creates an errorlog indicating the=
 checkstop
> =C2=A0=C2=A0=C2=A0- 4.2 ) Service that will start the Quiesce target
>=20
> --------
>=20
> This design direction helps decouple applications that monitor and=C2=A0
> analyze the conditions.

Sure. But you need to describe the advantage of decoupling these
concepts. Why do we need the abstraction? I need something more than
"decoupling is good", because as described above it can lead to a lot
of overhead trying to track down bugs. Sometimes it's a balancing act,
and we need to understand what we're trading off.

Cheers,

Andrew
--=-qPJqadywvtcUxHPsWRGg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJY5tncAAoJEJ0dnzgO5LT5mkcP/2RULL7mkiqhMzIJ3jZE+7PC
mZzkhL2f0MOkpQF6q5Vtpvf+2+mF72tagRTyvH+Atcjlw0b6vVu7vxhYz+5G9+Nc
njwb40/nB98HwCotV20Za667y4g7AGgMXzg3VZWIfnzDo0FgbGP8mwMpBQg73Pgv
ph86wPmwkxE0La9FY/jUXQUf/px89Xie+WVyv9m1VsfDSCB1hfW3E/WJ/XcMAxcb
FIsbmYYKO2k+9jA8IIUMRiDsntw35buwYGDP5zMsLGOzzCY6UAGEiLrf7Oh9416W
KBCd0rYTDEl+PYLNiLWEvV+GsHttadLJuKlsDFlBuUjNDrRDX+DGFBWlBgcC6ARC
K27AlBscj8AdSztABgYXcsihppMctQL+Y+7o5JYr6RxH8/xXIedAPymxzCtFj5GR
kBT8fB9xzE8KZNs4eb1R7tiPDcDSYyMhkzr8lo7Ezf4kw5OYFS2e0RzW03cQheXl
RkJ0GTUi05in61YJG23OGQPXVPQKi02AwELWtZa9Ak36dYektEg8h8IqAFWDfb20
Gx9C/i1URd27zfs9b7zUh19kmIfgaDljk/XgI5OcctklCLOwBIe7qjtTAJcuOg3y
niRlkIGkteL25XpaHm/KhgXSRCzWCFiQEh7EHRrdyFitfhviJkJETADe/d7lSLp5
e0m90am/BSTIAaVFEX7E
=/0l9
-----END PGP SIGNATURE-----

--=-qPJqadywvtcUxHPsWRGg--
