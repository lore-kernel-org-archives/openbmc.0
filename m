Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xFNql324JzDqxn
 for <openbmc@lists.ozlabs.org>; Sun, 23 Jul 2017 09:18:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="H4QgAeFd"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="dP4vFLU8"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F1C69208AD;
 Sat, 22 Jul 2017 19:18:55 -0400 (EDT)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Sat, 22 Jul 2017 19:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=nxUEiGRQbKm7XBX5YV5PMReP6htki
 pXLu7tTNb1y/Ng=; b=H4QgAeFdIO3aSwMgH6jEp6HzokDdeeTMCxfk0tf6dUIO9
 DP9zgtQNMh6Z8mkmRiJ7lKep/2IDGQO5BX3E+BFcEvHkG7bYjtsCfLBJBxka87V/
 vTNDQPgVnaaqF8n0v9cM+nBwz4Ak/RSrmSk4oGDihpXEHWpkUCbM91n67H6lKEJb
 C8oAORGLwx+ZGLv+tTwK1QrrzvB5GPx6X3ncBZ/iDfb4KTtmK1wC/nWbWYxUNQI4
 QLwdu4kUT6TqFAuj6VE8O+z6wRDNgHxORJX2HarGcHkqEKWFzpjp0KN/rWYij3aM
 k+1obmKyTk0s/3tYl26jeiogIXclQrrdWXufcUrsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nxUEiG
 RQbKm7XBX5YV5PMReP6htkipXLu7tTNb1y/Ng=; b=dP4vFLU8qXRIxpBfx0zFOI
 BFsXK7lQ0zSVrBvG0cIQR+OPfP9Hi+x5Yw/pCMo0ACmXTcEfkj+XEnU2SA++VS0V
 njFg0WkjKH86gHFbKNCWz/E3OMUao4KkKbn8HCz/RhOWBJ9Al6Qz0M71rrlV+vSv
 f7fLg4fdE0cj6pqnsKS+4lkNUkZXAJJ5c3Q5PHAbGBh5plxnWkCkMXobfx+Vd6nt
 PIFnklR/XwQZJL3HWTYzCWTHBWl0LG+Idrt5i7M74YwbCpb+2C4yvKT1fYtA2SLI
 HvUPP6IuqiTGSNOQNSD29ctmTyhcZ+1p1u5cngGoMpHgT2+rrchrWBV+dUMmTX1Q
 ==
X-ME-Sender: <xms:X91zWcDek24JFPBa3ejY8Vyc581oUjsAXWrQIMjSoQcm8GAV9nwGfw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id D5DC894770; Sat, 22 Jul 2017 19:18:55 -0400 (EDT)
Message-Id: <1500765535.3132573.1049426776.498A1460@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?David=20M=C3=BCller=20=28ELSOFT=20AG=29?=
 <d.mueller@elsoft.ch>, OpenBMC <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-095ee039
Subject: Re: How to define pins as open-collector?
Date: Sun, 23 Jul 2017 08:48:55 +0930
In-Reply-To: <0077221b-4d1d-26b5-ccf6-ede3b474443c@elsoft.ch>
References: <0077221b-4d1d-26b5-ccf6-ede3b474443c@elsoft.ch>
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
X-List-Received-Date: Sat, 22 Jul 2017 23:19:01 -0000

Hi David,

On Sat, Jul 22, 2017, at 18:02, David M=C3=BCller (ELSOFT AG) wrote:
> Hello
>=20
> On our design we have several signals between the BMC and the rest of
> the system which are driven by more than one source, therefore the
> correspondig pins have to be defined as open-collector.
>=20
> How can I define a pin as open-collector in the OpenBMC board wiring
> conf file?

If you're trying to do this via the python machine config file then it
looks like you're out of luck, as the GPIO sysfs interface doesn't
support configuring a pin in single-ended mode. Open-collector needs the
single-ended and active-low properties configured on the pin. The sysfs
interface does support setting active low, but it's not quite enough.

For GPIOs requested by kernel drivers it's specified  through the
devicetree via the bindings:

https://github.com/openbmc/linux/blob/dev-4.10/Documentation/devicetree/bin=
dings/gpio/gpio.txt

There is a helper header you can include in the dts files that defines
the GPIO_OPEN_DRAIN flags macro, which will configure the pin as you
need.

https://github.com/openbmc/linux/blob/dev-4.10/include/dt-bindings/gpio/gpi=
o.h

Hope that helps.

Andrew
