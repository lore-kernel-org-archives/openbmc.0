Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="WeVhmkBX"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WsuCMUNA"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwd566pvHzDrWb
 for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2017 17:32:42 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7884720CA4;
 Mon, 18 Sep 2017 03:32:40 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 18 Sep 2017 03:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=oQmK5DxnKxtjC1DprSKm55ohrp8Nru4tmb5oHjS1M
 MA=; b=WeVhmkBXsYfIJozUMQk2GWDM6n/OqEj/uYc3WuNqc7fjUpfBv6gbFiPq6
 8bU3KOWA4zCGmxaTjDd7TMhbtJifaxk2zThNxaLPSjhRGaiijCt+d4uzM9Ec/yoJ
 NgDB8PTTkqjOW5WlwPiCjwFheyQZeii0tVA12WshwX080GXMdVumbgGqul6uehgd
 NAyIsQFcf0HTWgvVsFDxiB1YyWzVqQErgB7xNSFoyXjEeMJKr6BV3geykaHNayD6
 NjR67Mh2pie3Evl4Vth/keP470Butrel4cDuo3KNgwMiTiCQnugMSeIl5DKnRacf
 XQM6suk2QamxWYz4d49Ds8GIyMOTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=oQmK5DxnKxtjC1DprS
 Km55ohrp8Nru4tmb5oHjS1MMA=; b=WsuCMUNAh8YWRZt3iw2WcrBQtXJL7AvaKQ
 9hWQNUmwnGJ4WOvVjnyUvb2kIURRp/7UgCMiza6VVjhZyjNxfpSmSNA8ldqjPZEx
 Q8XA9bAUZBXVI4OlrKono0SQrXv6Mck/bwhMDbG3FoZ2V9otOGw7gwWgUuLhVIjF
 ugVaxU6Vz2p/cPgneFPy1lckkMYvPngHj7pNxxJzm8/5jluLhEDRYSTKMbFT7pNf
 GqU92UB8PrmlwQ0lHTAJPd3+Fw/Yp+aywbz86wP11Loc9UR1W1A9XEPZzIIPNm1a
 emUvAFxOzWGvX9Ps4k4SVpVFoxn9Baw75IHZJa/mNvu8hLiyoo/w==
X-ME-Sender: <xms:mHa_WWA1Z-LjBAIZh-3vPvs-1esayGZRMVHuowKMBRXmHJtsH957Gg>
X-Sasl-enc: g0LWmi7F4E8yeIb8bOHzwmqDBiIUM5o389dKc+aFjXDc 1505719959
Received: from keelia16 (ppp14-2-0-125.bras21.adl4.internode.on.net
 [14.2.0.125])
 by mail.messagingengine.com (Postfix) with ESMTPA id B57807E183;
 Mon, 18 Sep 2017 03:32:38 -0400 (EDT)
Message-ID: <1505719954.4080.20.camel@aj.id.au>
Subject: Re: GPIO Centralized Control Daemon
From: Andrew Jeffery <andrew@aj.id.au>
To: Patrick Venture <venture@google.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Mon, 18 Sep 2017 17:02:34 +0930
In-Reply-To: <CAO=notwfcPJiEjtQ_n1jxFQpwtPwtvPisOZpiV64DbVHrk0qfQ@mail.gmail.com>
References: <CAO=notyfYfT51+q_-8a7S5VrhJtuVbXaSav78mbCmGe6OnvjLA@mail.gmail.com>
 <1505599960.32310.1.camel@fuzziesquirrel.com>
 <CAO=notykPK7VkRgynx-Tsyu0fuR25O4wZ-0voX4GiVhbmXfyaA@mail.gmail.com>
 <1505665582.29751.1.camel@fuzziesquirrel.com>
 <CAO=notzg_QhapqfOx2w75A9Z7K4S3etp7i4a1LSS-qkWb5BMHw@mail.gmail.com>
 <1505669634.29751.4.camel@fuzziesquirrel.com>
 <CAO=notzxdXfK9_x-LwbOkwawcLLqUTuLZ8kbHGnMUxN6rCQ6WA@mail.gmail.com>
 <1505684302.29751.6.camel@fuzziesquirrel.com>
 <CAO=notwfcPJiEjtQ_n1jxFQpwtPwtvPisOZpiV64DbVHrk0qfQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-9Pso9a+6CJ16tpx018mL"
X-Mailer: Evolution 3.22.6-1ubuntu1 
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
X-List-Received-Date: Mon, 18 Sep 2017 07:32:43 -0000


--=-9Pso9a+6CJ16tpx018mL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2017-09-17 at 14:49 -0700, Patrick Venture wrote:
> > > Those are particulars of a board that now get factored into the
> > > value.=C2=A0 I'm not suggesting something beyond the norms of hwmon.=
=C2=A0 It
> > > would be convenient however, if the ADC driver could be programmed to
> > > know that some sensor is gated by a GPIO and handled flipping,
> >=20
> > Can you reach out to Guenter or the relevant maintainer (is this an IIO
> > device?) for ideas here?=C2=A0 I hadn't mentioned it but in the back of=
 my
> > head this whole time I've been wondering about a completely in-kernel
> > solution.
>=20
> I'll reach out and see if this should go into the adc driver or the
> iio-hwmon.=C2=A0 Since those are the paths that are involved.=C2=A0 The s=
ensor
> itself it plugged into the aspeed adc, and then controlled by a
> gpio.=C2=A0 My initial thought is the adc should be configured to know if
> such things are required for its sensors, so that iio-hwmon wouldn't
> need to know.

My gut feeling is the other way around. There should be some higher-
level driver (i.e. still in the kernel, not in userspace) coordinating
the GPIO and the ADC such that we sample values at the appropriate time
after the GPIO has been set. The ADC driver should be well defined in
terms of the function the ADC hardware provides - gluing in random
GPIOs makes the ADC driver do things the ADC hardware itself does not
do.

I'm not across how the iio-hwmon bridge works so I don't know how
trivial it would be to re-export the sampled ADC values from this
higher-level driver as another IIO channel, but that's probably the
approach I would look at to glue it into hwmon.

That's all just off-the-cuff opinion though, so take it with a grain of
salt. Certainly talking to the IIO and hwmon maintainers is the right
approach.

Cheers,

Andrew
--=-9Pso9a+6CJ16tpx018mL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZv3aSAAoJEJ0dnzgO5LT5p7sQAIzy+ONxgXYnCfpI8zjyjvja
FpUtFBaa018zQXurUNEY2cAExKkJXIqZZBMXBWSZnHgtZGq9/LNUz+0l76R4pReh
F236JEzo0heHl25DfgATapjUZ7UvFoVzinDwVvhLnE3E/clDVPvppW/qo1H2bi81
sUMbMm6Y8hh2NuflK7ZHHa3hHuSLE3z546z+UItfZP3xqHxXOt/gxLx2xqL6Vs+M
aycIxX4aEy9k7sLCY+PXOmw2wN4bCgJcVQowN+dZABGiNl3+GSLjjMidrIpHF2Mr
De5Bdk+sjy1uGzdtpLSPqIp05DwDjd6WKiTUeuWj7AN+d8ThnjZfeVE857WzstfV
VeKgX0/uoCNz+d85nZ72FhHUuUL0jjjjY4iB2gjK3LjeuUDfgHqgRd/EMx7xLo1c
pNz9hRgnYtsplrJaAUHQRdH7GVMVcvFO+nezQ+aVBEVtVQY+wHSfrJS275pNGPYZ
sxvjnAyubIjTphS4kS5TEADS49M8IkWmCi1uQ2Azir5n++nVKhUyHnXXzHPD1j0f
DRBxtTCSl0UBq3cwGgT95AhE+6v4+kOvcaJ86ucxLNnJX5o6qsjOOP0RsX3xttCk
90SR19ddMAoJkk8rZTGfINq0HYCu+N3vA7aYUv5udVAn1EXeX0NOB4SSmHy+N/bw
VaYM1DplQtVivOfOAUXL
=JAVK
-----END PGP SIGNATURE-----

--=-9Pso9a+6CJ16tpx018mL--
