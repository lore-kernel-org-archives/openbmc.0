Return-Path: <bjwyman@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xh4Fc1ZlVzDq5k
 for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2017 07:11:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UGBgCATL"; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id p67so1337670qkd.2
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 14:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SOTBAEGBKjuq7sVhSjtYZzP1sjRdFpIARiQXNGkfQbQ=;
 b=UGBgCATLsSAPUAh+1srOrw5ZrYH7NOXR2Hybvry+f1s2pH7mn+SRtKPYC3f9bQf01I
 icluFh1TMhSqw87AA58VbINookhemFZEI1vRmvuceSoYcAQ4KhJRosQcZYtqI1w0Efih
 kLG7Vs0jjZIiVE1zgXMi/YK0+XMdCpXSOzdBS3wojsm5jofiFM5C+Pj2R872c1+ik+TA
 WFCNV6b8uiejtF1TxPOV0wxXJSJIeFZ1LycyXsATRzQnHFGssXimFWGnhl8UgdhaIzV3
 aQjvuMpZ1rsJ+jJMVafCKQn4du40b7aYTE3RpjV9gbmZu+VTzHcEj0MyVrcm+eXKKwPd
 9Vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SOTBAEGBKjuq7sVhSjtYZzP1sjRdFpIARiQXNGkfQbQ=;
 b=ioBuSLk01YW0jYHoft5h0xXygaDDL++oNt4zbrgwZTi+4T7ZN1+vQ7HOLccIu1Hs5f
 00Af+QJc/wSs69o11gAVlhJyIgBL62nnN6Ny3U4sGctDYwnhirL6GYOir/nk5svsu1X9
 fA+9HX72CgKqtLN1928nW0/uR/Su/JjCEqLBU1CVv0JDNux0nnoc5xjLUBxT9SVZbMbK
 ZnYGryQxiniEm1OGA/8MBe3zmnKJvx0C+DZF2QCZX3KabWhI/Z7Q3WBfcxewvgOjJF9f
 Sk16e65w+MTh0zVcLtDZsdvo0f6ub4Yddj1DtXG8IUTtYlgG0fLBmwGyaA5URA2IpGL+
 E/UA==
X-Gm-Message-State: AHYfb5hydB9jtdIw1R1mU6H/xPIqjHmJAE531z9CkfZ/+ieyX9zAHuYz
 l2F6XHNPInMXACVh0iy2SH7PGfPCKA==
X-Received: by 10.55.74.22 with SMTP id x22mr2591353qka.341.1503954677244;
 Mon, 28 Aug 2017 14:11:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.82.232 with HTTP; Mon, 28 Aug 2017 14:11:16 -0700 (PDT)
In-Reply-To: <20170825065244.488-1-andrew@aj.id.au>
References: <20170825065244.488-1-andrew@aj.id.au>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Mon, 28 Aug 2017 16:11:16 -0500
Message-ID: <CAK_vbW3gssQkZWTWk-_o-tCFP=SXyVEwNJ3LK5M_E=73RGJzOQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 0/5] Retain front LED state on Witherspoon
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 vishwa@linux.vnet.ibm.com, geissonator@gmail.com, 
 Eddie James <eajames@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 28 Aug 2017 21:11:58 -0000
X-List-Received-Date: Mon, 28 Aug 2017 21:11:58 -0000
X-List-Received-Date: Mon, 28 Aug 2017 21:11:58 -0000
X-List-Received-Date: Mon, 28 Aug 2017 21:11:58 -0000
X-List-Received-Date: Mon, 28 Aug 2017 21:11:58 -0000
X-List-Received-Date: Mon, 28 Aug 2017 21:11:58 -0000
X-List-Received-Date: Mon, 28 Aug 2017 21:11:58 -0000

On Fri, Aug 25, 2017 at 1:52 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hello,
>
> This series fixes witherspoon to retain its front LED state across BMC re=
sets.
> It was noted in issue 2156[1] that the front LEDs came on solid during a =
BMC
> boot. This appears to be the result of several bugs which are addressed i=
n the
> following patches.
>
> The changes to leds-gpio have been sent upstream:
>
>   https://lkml.org/lkml/2017/8/25/44
>
> The pca955x patch depends on changes we appear to only have in the dev-4.=
10
> tree (i.e. they haven't been applied upstream). There's some discussion a=
t [2]
> but I'm not aware of a follow-up patch from C=C3=A9dric. Certainly applyi=
ng my patch
> to upstream lead to signifiant conflicts, so I haven't yet tried to send =
it on
> its way.
>
> C=C3=A9dric: I know you're undecided on how I've approached the pca955x p=
atch - I
> figured we could argue about it on the list in case anyone else had helpf=
ul
> insights to settle the dispute :)
>
> The final two patches clean up the leds nodes in the Witherspoon devicetr=
ee and
> add the new retain-state-shutdown property to the necessary LEDs. I do wo=
nder
> if we want to retain the state on the rear LEDs as well, but that require=
s more
> features to be added to the Aspeed GPIO controller.
>
> The patches have been tested on a Witherspoon system, albeit remotely. I =
can't
> put eyes on the LEDs in question so it would be good for someone who has =
the
> ability to do so. I used the test outlined by Vishwa at [3].
>
> Please review!
>
> Andrew
>
> [1] https://github.com/openbmc/openbmc/issues/2156
> [2] http://patchwork.ozlabs.org/patch/760006/
> [3] https://github.com/openbmc/openbmc/issues/2156#issuecomment-324101828
>
> Andrew Jeffery (5):
>   dt-bindings: leds: gpio: Add optional retain-state-shutdown property
>   leds: gpio: Allow LED to retain state at shutdown
>   leds: pca955x: Don't invert requested value in
>     pca955x_gpio_set_value()
>   aspeed: witherspoon: Tidy and unify LED nodes
>   aspeed: witherspoon: leds: Retain state across BMC resets
>
>  .../devicetree/bindings/leds/leds-gpio.txt         |  3 ++
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   | 32 ++++++++++++----=
------
>  drivers/leds/leds-gpio.c                           |  7 ++++-
>  drivers/leds/leds-pca955x.c                        |  7 +++--
>  include/linux/leds.h                               |  3 ++
>  5 files changed, 34 insertions(+), 18 deletions(-)
>
> --
> 2.11.0
>

Tested-by: Brandon Wyman <bjwyman@gmail.com>
