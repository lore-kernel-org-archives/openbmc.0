Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Mb+RsrlJ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="k8r0ARFJ"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yMp8c3KjFzDqmr;
 Thu, 26 Oct 2017 11:41:04 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E7D0920ACE;
 Wed, 25 Oct 2017 20:41:01 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 25 Oct 2017 20:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=QJNXDLq7D7LPG2LQ3oAg3j6Y34aJkyvWx9XQfPX/97Y=; b=Mb+RsrlJ
 LqTnJOaAmk7TOMthHPZRWXlzSC86EZmbgBkpcfyl/Lp2n1yBHhktUyhHNYpglZKf
 ik8l2RlaSeVlVS0+POTgkARQlw6ptUfb3vFzjgE3MXRsp4wxWwLKaV5dOaK27i31
 MnfYo8lw9IVAURxc2FaQFeni0WP+plXw+12TbTCKLwED3D8lXp7hchW0ssHQa31V
 UE7Pyf8czjalFQDVoBXV0bu1MHYmOVFRh9YOZVbRSuSwyO5rXDLKwmwfrK7607A1
 oir6p71x8thF5tI7juRA619/WcmUScO3MEy8HJ18r9JC1NTSiK70sANQ+jg/uj8g
 +fJc68Fdbkdi8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=QJNXDLq7D7LPG2LQ3oAg3j6Y34aJk
 yvWx9XQfPX/97Y=; b=k8r0ARFJZSRWSR+NTAhx1vy34EtOYFZY+cjkScBAKxgul
 MG+Bl0E3dyCTQYFJOsw8zBwmw0D+JBJxe9Lc8YQaMUnZaYg0zYlmbrg4DVsDKKfU
 cauCrZ8Hy3CAVV5b9Y4Nij5lSpkR2kNlld7AO5KUzKHxLCMTB4QCA8gi2LwblwAj
 p0kcAmLKpSNKJ64ShAitWDqe3jTGkLM/FkN7bc7PJYW+A/l/dGN5Vk6BL4ccWQwl
 IlEONVkUR6GXRRoEyKr6qtDsznr2h1jmLLeGg9rrwRYUZkqDeAdyx3I8IAc3BxcG
 xvVjxDTeXWBh49vIouvWvNxcg9zx1BS0Mj8otEQhQ==
X-ME-Sender: <xms:HS_xWZCGP2iQ1L6QjAXajHwoJ5mKtGvzm_LPmpfqjU5WpalX_mgZ4w>
Received: from keelia40 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5FEE47F9BA;
 Wed, 25 Oct 2017 20:40:57 -0400 (EDT)
Message-ID: <1508978453.13477.7.camel@aj.id.au>
Subject: Re: [PATCH 1/2] gpio: gpiolib: Expand sleep tolerance to include
 controller reset
From: Andrew Jeffery <andrew@aj.id.au>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
 robh+dt@kernel.org,  mark.rutland@arm.com, frowand.list@gmail.com,
 joel@jms.id.au,  ckeepax@opensource.wolfsonmicro.com, ldewangan@nvidia.com,
 ryan_chen@aspeedtech.com, bgolaszewski@baylibre.com, mwelling@emacinc.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
Date: Thu, 26 Oct 2017 11:10:53 +1030
In-Reply-To: <20171025083201.wdudlzgphypyhmwc@localhost.localdomain>
References: <20171025050417.27992-1-andrew@aj.id.au>
 <20171025050417.27992-2-andrew@aj.id.au>
 <20171025083201.wdudlzgphypyhmwc@localhost.localdomain>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-gRK8or06tBXp9hQzQC25"
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
X-List-Received-Date: Thu, 26 Oct 2017 00:41:05 -0000


--=-gRK8or06tBXp9hQzQC25
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-10-25 at 09:32 +0100, Charles Keepax wrote:
> On Wed, Oct 25, 2017 at 03:34:16PM +1030, Andrew Jeffery wrote:
> Reset tolerance is added to gpiolib with the introduction of a new
> pinconf parameter propagating the request to hardware. The existing
> persistence support for sleep is augmented to include reset tolerance
> if the GPIO driver provides it. Persistence continues to be enabled by
> default; in-kernel consumers can opt out, but userspace (currently) does
> not have a choice.
>=C2=A0
> The *_SLEEP_MAY_LOSE_VALUE and *_SLEEP_MAINTAIN_VALUE symbols are
> renamed, dropping the SLEEP prefix to reflect that the concept is no
> longer sleep-specific.=C2=A0=C2=A0I feel that renaming to just *_MAY_LOSE=
_VALUE
> could initially be misinterpreted, so I've further changed the symbols
> to *_TRANSITORY and *_PERSISTENT to address this.
>=C2=A0
> The sysfs interface is modified only to keep consistency with the
> chardev interface in enforcing persistence for userspace exports.
>=C2=A0
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> I'm not wedded to the names 'transitory' and 'persistent', so feel free t=
o
> paint the bikeshed some other colour.
>=C2=A0
>=C2=A0
> I am happy enough with the names.
>=C2=A0
> =C2=A0drivers/gpio/gpiolib-of.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A06 ++--
> =C2=A0drivers/gpio/gpiolib-sysfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 14 +++++---
> =C2=A0drivers/gpio/gpiolib.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 58 +++++++=
+++++++++++++++++++++++---
> =C2=A0drivers/gpio/gpiolib.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=
=A02 +-
> =C2=A0include/dt-bindings/gpio/gpio.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A06 ++--
> =C2=A0include/linux/gpio/consumer.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A08 +++++
> =C2=A0include/linux/gpio/machine.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A04 +--
> =C2=A0include/linux/of_gpio.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A02 =
+-
> =C2=A0include/linux/pinctrl/pinconf-generic.h |=C2=A0=C2=A02 ++
> =C2=A09 files changed, 84 insertions(+), 18 deletions(-)
> @@ -2424,6 +2428,46 @@ int gpiod_set_debounce(struct gpio_desc *desc, uns=
igned debounce)
> =C2=A0EXPORT_SYMBOL_GPL(gpiod_set_debounce);
> =C2=A0
> =C2=A0/**
> + * gpiod_set_transitory - Lose or retain GPIO state on suspend or reset
> + * @desc: descriptor of the GPIO for which to configure persistence
> + * @transitory: True to lose state on suspend or reset, false for persis=
tence
> + *
> + * Returns:
> + * 0 on success, otherwise a negative error code.
> + */
> +int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
> +{
> +	struct gpio_chip *chip;
> +	unsigned long packed;
> +	int gpio;
> +	int rc;
> +
> +	/* Handle FLAG_TRANSITORY first for suspend case */
> +	if (transitory)
> +		set_bit(FLAG_TRANSITORY, &desc->flags);
> +	else
> +		clear_bit(FLAG_TRANSITORY, &desc->flags);
> +
> +	/* Configure reset persistence if the controller supports it */
> +	chip =3D desc->gdev->chip;
> +	if (!chip->set_config)
> +		return 0;
> +
> +	packed =3D pinconf_to_config_packed(PIN_CONFIG_RESET_TOLERANT,
> +					=C2=A0=C2=A0!transitory);
> +	gpio =3D gpio_chip_hwgpio(desc);
> +	rc =3D chip->set_config(chip, gpio, packed);
> +	if (rc =3D=3D -ENOTSUPP) {
> +		dev_dbg(&desc->gdev->dev, "Reset tolerance not supported for GPIO %d\n=
",
> +				gpio);
> +		return 0;
> +	}
> +
> +	return rc;
>=C2=A0
> This means that if we have a set_config we are directly
> equating PERSISTENT to RESET_TOLERANT, which seems wrong to
> me. I might have a GPIO on a controller with pinconf that
> doesn't have anything to do with RESET_TOLERANT. Should the
> PIN_CONFIG_RESET_TOLERANT, really just be PIN_CONFIG_PERSISTENT?
> And then its upto the driver what persistence means for that
> chip?

Right, maybe I'm tying the design in a bit too closely with the Aspeed hard=
ware
again. I'm coming out in favour of changing it based on my thoughts below.

However, I want to understand whether there are alternatives to reset toler=
ance
as a property. The obvious one is sleep persistence as implemented in the
Arizona driver, but it didn't take the set_config() route with its initial
implementation.

The set_config() approach was largely driven by the sysfs patch in
the RFC series, because I wanted a way to propagate the desired property
to hardware without affecting (or again calling through the handlers for) t=
he
export state or direction. It seemed to come out neat enough in general so =
I
kept it.

Were you thinking of using set_config() to control the Arizona's behaviour =
and
do something other than the calls to gpiochip_line_is_persistent() in
arizona_gpio_direction_{in,out}() (as in, keep the state inside the device
driver rather than querying gpiolib where the state is currently stored)? T=
hat
would seem neat in that it gives us one method of setting both persistence
types (and in this case I should rename the pinconf parameter). With that w=
e
could probably get rid of gpiochip_line_is_persistent(). A small downside i=
s
some duplicated state (we probably still want to keep FLAG_TRANSITORY in
gpiolib).

Would it be reasonable for other drivers to implement sleep persistence in =
the
same manner as the Arizona driver currently does? If that's the case, I don=
't
think there is a third tolerance option in addition to sleep and reset, and=
 so
we might not need to rename the pinconf parameter.

Finally, we could implement reset persistence in the same manner as the
Arizona's sleep persistence (with gpiochip_line_is_persistent()) given the
sysfs patch has been thrown away.

So to summarise, having rambled a bit, I see the situation as:

1. Rename the pinconf parameter, and patch the Arizona driver to use
=C2=A0=C2=A0=C2=A0set_config() and hold sleep persistence state internally.
2. Drop the pinconf parameter and do something similar to the Arizona's sle=
ep
=C2=A0=C2=A0=C2=A0persistence for reset persistence in the Aspeed driver.
3. Keep things as proposed are and live with two approaches to persistence

Point 3 seems like the least desirable. I'm leaning towards 1. I could prob=
ably
live with 2. after experimenting with it and confirming it's workable for m=
e.

If you think 1. is the way to go are you happy for me to send a patch to th=
e
Arizona driver implementing the change?

Thanks for the feedback!

Andrew
--=-gRK8or06tBXp9hQzQC25
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ8S8VAAoJEJ0dnzgO5LT53kcP/A7cRmmjb9RB2ejvb1rBJHdu
ZmavXgkJ5czHv+a0JCE3h1LNCR61dSSNtXkVFjdYimX3J9ndEqzbMvoxlC0Kmgfd
zlyc+NM9ZlBHva8AlY3AY5kt5PgnKwgybHf8OViWc/1GSjuuXLHtfJH+WcXTS9Dy
Sc+5qoFSlYk0Ybxn3BJ0jufYRAle7nzE8Fel9VITS4oLMGZS8JkE4ZBIrrASMRpu
d2cXdkE7w7oyNNEyaSQdYCassmKMMb++qeAiOD+Q0D1zUxvFqcbCxTRKa4OVfwc0
HXnA9ur6ySyr2dxmGaPlCOnMrxCAOi6EP3uzaAr9j0JsF4nZDimBJVZVMlTeZoak
6O1fcAJw/nB3KVgSZfo6D5PTuC0s6GvE9RHGLiOeGBEX7bHsUqhkaLnlMa9Uw9IS
4M/3nUJ0oob4bcXeAwbqCU1kAHane/GxEgqwViE2YinPP2BoagllXRTYtkF83Al7
8efC/MSTgMpJRC24iDuH3hmCFuDJ+FHQzknEXD9PAsLkSNQOWzGkabQ+tioJeLS2
5IiQ1U2jUkAOfUIoNaPzE2o+M8SPMRT6pEF5w9f1sKYHcNssQpIJow6QIJRLUp6P
lVZa5GCsDthA102BySFRcMG/N7QyvROo51hsFonxPC9+7pzwJg7cjB6cbJPbputD
yzrhTyNs6QVY02Jefzij
=g0+D
-----END PGP SIGNATURE-----

--=-gRK8or06tBXp9hQzQC25--
