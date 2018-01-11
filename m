Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="s9eCtagH"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="e85A09gw"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHZ184GCszF0WY
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 05:20:12 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E0D5A20C4D;
 Thu, 11 Jan 2018 13:20:09 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 11 Jan 2018 13:20:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=UKa0s+km+nQNp4cV5swqY4eGvM4SQvDQq5Wd3S87gno=; b=s9eCtagH
 187bgvV7fQ37FUVgLRTfsUFDLRRWBou3fcsn3SXllzSaKfECoaYb6gOkRW/WCWKA
 64hdjNLXXa5HNgY4Yb60zM3WAUofVHV8Jw+ThKO5mT91te/qDXTbIzzzDvVvfiUS
 L1XYnCo0v8/iU+y689AKMLq0wMlh6SkheQcylti/W0ztQCqVdmGeForN624M0YOw
 qDdAWDINKu++9yPmiVkAOuCWYHwCMnQrREYAwHag7T745cvkEMq+npg2VhKYMhxD
 Ofdb6TjXwOH0zeTpq7yoxn21cXhk8qjueG0NjY7yiH5GjOu38bhg9z/xL3GeR0cZ
 mLMPen/Tbqud8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=UKa0s+km+nQNp4cV5swqY4eGvM4SQ
 vDQq5Wd3S87gno=; b=e85A09gwe5KbAwMl7bAp3dRmEZA2dRADdftETQAzJZPg9
 y/cJx4qY4O+M6j6EbDXBGfVwLwQO7Iw4FgwXOgZF76MwWUkHugXeqO0O/WDjW1ok
 5iJeJAilCJBEhwcZrFxU86eVOpz9173YbjOOQuyjpp4GYvrjwVr/q9WeqFRs+KLB
 88GHejVceeAiikhBuVNADQQMn+y+zcUfNpciF7XqEuiUOrwRlbF72ikSlsHbamba
 bYe5AU2NC4q7rxbJ6U39U8JlSMl/JPueJD+6h1EefA6sumkV+TjhF5zxMLI89g/J
 Om/atSMDynUd4vH7BAqdsYbuN8wHc0Amq1qDwJlGg==
X-ME-Sender: <xms:2apXWs6Y6it-bNgaoq7x1miNbYzzDY0BYyGXbT83pLiQUPRDmhP_DQ>
Received: from dave (unknown [104.133.8.104])
 by mail.messagingengine.com (Postfix) with ESMTPA id 628AF246CC;
 Thu, 11 Jan 2018 13:20:09 -0500 (EST)
Message-ID: <1515694805.28370.10.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.13 v1 1/2] dt-binding: hwmon: document
 NPCM7xx sensors DT bindings
From: Andrew Jeffery <andrew@aj.id.au>
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org
Date: Thu, 11 Jan 2018 10:20:05 -0800
In-Reply-To: <1514382619-14336-2-git-send-email-tmaimon77@gmail.com>
References: <1514382619-14336-1-git-send-email-tmaimon77@gmail.com>
 <1514382619-14336-2-git-send-email-tmaimon77@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-yDiD1tM5AlF6LP9MrGKu"
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jan 2018 18:20:16 -0000


--=-yDiD1tM5AlF6LP9MrGKu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-12-27 at 15:50 +0200, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton
> NPCM7xx Pulse Width Modulation (PWM) and Fan
> Tachometer devices.
>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/npcm7xx-fan.txt          | 18 ++++++++++++=
++++++
>  .../devicetree/bindings/hwmon/npcm7xx-pwm.txt          | 16 ++++++++++++=
++++

The bindings look okay to me, but I feel they probably should be split
into individual patches. I suggest this based on wanting to split the
drivers out, as they are more complicated and thus more susceptible to
review comments. Decoupling them from eachother means they can be
reviewed and submitted independently.

Andrew

>  2 files changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/npcm7xx-fan.t=
xt
>  create mode 100644 Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.t=
xt
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/npcm7xx-fan.txt b/Do=
cumentation/devicetree/bindings/hwmon/npcm7xx-fan.txt
> new file mode 100644
> index 000000000000..cb456632a99f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/npcm7xx-fan.txt
> @@ -0,0 +1,18 @@
> +Nuvoton NPCM7xx fan tachometer (Fan) controller device driver
> +
> +The NPCM7xx fan tachometer controller supports upto 16 Fan inputs.
> +
> +Required properties:
> +- compatible      : "nuvoton,npcm750-fan" for Poleg NPCM750.
> +- reg             : Offset and length of the register set for the device=
.
> +- clocks          : phandle of fan reference clock.
> +- interrupts      : Contain the fan interrupts with flags for
> +                    falling edge.
> +
> +fan: fan@0 {
> +	compatible =3D "nuvoton,npcm750-fan";
> +	reg =3D <0xf0180000 0x8000>;
> +	interrupts =3D <0 96 4>, <0 97 4>, <0 98 4>, <0 99 4>,
> +		<0 100 4>, <0 101 4>, <0 102 4>, <0 103 4>;
> +	clocks =3D <&clk NPCM7XX_CLK_APB4>;
> +};
> diff --git a/Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt b/Do=
cumentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt
> new file mode 100644
> index 000000000000..8b54a59c272a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt
> @@ -0,0 +1,16 @@
> +Nuvoton NPCM7xx Pulse-width modulation (PWM) controller device driver
> +
> +The NPCM7xx PWM controller supports upto 8 PWM outputs.
> +Each PWM output module have watchdog.
> +
> +Required properties:
> +- compatible      : "nuvoton,npcm750-pwm" for Poleg NPCM750.
> +- reg             : Offset and length of the registers set for the devic=
e.
> +- clocks          : phandle of pwm reference clock.
> +
> +pwm:pwm@f0103000 {
> +	compatible =3D "nuvoton,npcm750-pwm";
> +	reg =3D <0xf0103000 0x1000
> +				0xf0104000 0x1000>;
> +	clocks =3D <&clk NPCM7XX_CLK_APB3>;
> +};
--=-yDiD1tM5AlF6LP9MrGKu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJaV6rVAAoJEJ0dnzgO5LT5YZIP/0JN+3qvUY5c87YOONT0CMDT
UnOwMJAkrFH6gLSp55FgmfoUy25tjMTfGhTgY11G4SDuOCNP9pjGWWn023BA6M9J
xxYBV+lZ1yGxB7hZ9+HweFdVarnIc22la1VQe3b6ascBs5P1kBnszpXV96wacaJu
HZeKWklr6Dzw43L/kroyyLgwJVR7qqX0ALX8SDF2Lr27/wU74Nd6NER5rdohsujg
t34RoK41pSChPQBCkr45s3zG60yJMnNeACLhra82NJ8UR3yNJFsQVHLLYMfEb5As
AqGZPHF8fBwOr5jHQYLGTbJ2lFl2O5ayoqTahlIhsTZF8dTTPvzBB/kJgwE8iUi2
W9M1Mb61/QBF+elpaKj3LjsEcLanRBRV/GTby8YxQRRpbqTJsPBYEwE3BeAarCen
SsOn7td+3tHR3JYPlrv/f7tikA3yC+2nXbV7EUKEO9aS9QlDS2O8DjhoyY4AceuX
GWH8Wg43JjjBnRMyYWvohSJUd5vusXddYnH875Hvo2LHOAh5Og+fFMwAOMTFIEO2
vODQ27m94f8AW0FgjClPlvCEZV8+dh7jVfr2IIOsJPApUA8T0K3p+lriqKyPkd9D
hwX0GsPTtONvs0cWoWLLruXU6IBncpK+C0gjcEzLfuz1bQQSorKBlCh274yhOmr+
/2iGohbw3VHLzBUAodTo
=NFj4
-----END PGP SIGNATURE-----

--=-yDiD1tM5AlF6LP9MrGKu--
