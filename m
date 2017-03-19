Return-Path: <trini@konsulko.com>
Received: from mail-qt0-x235.google.com (mail-qt0-x235.google.com
 [IPv6:2607:f8b0:400d:c0d::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vmPxC2Ml7zDqY7
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 03:41:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.b="Foq2RMTz";
 dkim-atps=neutral
Received: by mail-qt0-x235.google.com with SMTP id x35so92286050qtc.2
 for <openbmc@lists.ozlabs.org>; Sun, 19 Mar 2017 09:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KmRtK+cH1IHuWJKDKoTuUOsW2duIqWJIquVxXt62lVY=;
 b=Foq2RMTzDuvGi7nKZY8QtzoR4m0SoV7sJEK6/eHX2LH45S+0GX+9a85AyHAzl/puZy
 0ycvhqAPiC7idlGGXMh10N5VVs+NZy/As5V1ZxrOlDDe+BAQGlePPuNSrWVoswXKBxdT
 Jml2AdK4w0Y4lmtZ+MiPfx8nJOOAbQVY8zWXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KmRtK+cH1IHuWJKDKoTuUOsW2duIqWJIquVxXt62lVY=;
 b=sMsz5zxdeJjRcFFHSaXlSM1tMTncOZH0Q6foH/AOEPD+Q/Y/BG05KX8q2ohjTxYuTr
 fllC7Ue+QnxsL4mTFzwm8Yx6ePLlByU4kW3aQ3Pyu/BcAYVFLbDyHAJp+APGR7Q0P1v3
 sxFhQL+94BoiuXkdwCu46PUffc3E85ABc13CNSZFQa7yyHPMjg9YcrQXEYxqQ7g+L8oZ
 LWwAYwmAWsPn56FNqVplunvM6qeO1/yNt+nRiRoBM6pxSpIj6vV8gGfcRnxp/QgCMNnH
 kJlm8q470Ga/rZ0WDJA3yGmhw+RPfojdrL93jFi+qRe6iaTg33ROJFi/+//Hi9fX2b7s
 FpXg==
X-Gm-Message-State: AFeK/H06o/OKhVqRu3esBnkxNZZfGOhlSnuRUqVZfTv8bPagqQPjGINSfjEhAWi7j52etg==
X-Received: by 10.200.4.168 with SMTP id s40mr25289381qtg.283.1489941707706;
 Sun, 19 Mar 2017 09:41:47 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
 [75.180.228.133])
 by smtp.gmail.com with ESMTPSA id f56sm10581114qta.14.2017.03.19.09.41.46
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Sun, 19 Mar 2017 09:41:46 -0700 (PDT)
Date: Sun, 19 Mar 2017 12:42:17 -0400
From: Tom Rini <trini@konsulko.com>
To: Maxim Sloyko <maxims@google.com>
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 openbmc@lists.ozlabs.org
Subject: Re: [U-Boot] [PATCH 13/17] aspeed: Add support for Clocks needed by
 MACs
Message-ID: <20170319164217.GN19897@bill-the-cat>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-14-maxims@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="2wfF2MdYkZlaSnkI"
Content-Disposition: inline
In-Reply-To: <20170316213624.140344-14-maxims@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Mon, 20 Mar 2017 13:51:35 +1100
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
X-List-Received-Date: Sun, 19 Mar 2017 16:41:52 -0000


--2wfF2MdYkZlaSnkI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 16, 2017 at 02:36:20PM -0700, Maxim Sloyko wrote:
> Add support for clocks needed by MACs to ast2500 clock driver.
> The clocks are D2-PLL, which is used by both MACs and PCLK_MAC1 and
> PCLK_MAC2 for MAC1 and MAC2 respectively.
>=20
> The rate of D2-PLL is hardcoded to 250MHz -- the value used in Aspeed
> SDK. It is not entirely clear from the datasheet how this clock is used
> by MACs, so not clear if the rate would ever need to be different. So,
> for now, hardcoding it is probably safer.
>=20
> The rate of PCLK_MAC{1,2} is chosen based on MAC speed selected through
> hardware strapping.
>=20
> So, the network driver would only need to enable these clocks, no need
> to configure the rate.
>=20
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>=20
>  arch/arm/dts/ast2500-u-boot.dtsi               |   8 +
>  arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  62 +++++-
>  drivers/clk/aspeed/clk_ast2500.c               | 265 +++++++++++++++++++=
+++---
>  include/dt-bindings/clock/ast2500-scu.h        |   2 +
>  4 files changed, 304 insertions(+), 33 deletions(-)
>=20
> diff --git a/arch/arm/dts/ast2500-u-boot.dtsi b/arch/arm/dts/ast2500-u-bo=
ot.dtsi
> index faeeec1be4..f826646095 100644
> --- a/arch/arm/dts/ast2500-u-boot.dtsi
> +++ b/arch/arm/dts/ast2500-u-boot.dtsi
> @@ -61,3 +61,11 @@
>  		};
>  	};
>  };
> +
> +&mac0 {
> +	clocks =3D <&scu PCLK_MAC1>, <&scu PLL_D2PLL>;
> +};
> +
> +&mac1 {
> +	clocks =3D <&scu PCLK_MAC2>, <&scu PLL_D2PLL>;
> +};

Why is this here and not in the main dts file?  The -u-boot.dtsi is for
stuff that's not appropriate in the upstream dts file.  Thanks!

--=20
Tom

--2wfF2MdYkZlaSnkI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYzrTpAAoJEIf59jXTHXZSBD0P/0zjqdUb5eQHAI3J1B6EcXwu
raFK5UYoMeQAR7nm3BIwpiXky4QTH7ae46RPispQZDT62PuiHzj3gFfAt/fY0E8H
+egmYO097FrZkKENdy20t18AZ39GOQ/OmERE/XlAwOCJNQ+/ypPYiUkduDiyRiYo
QqmLmVJtKVtLrtjm1Lx2gHsNpLyRTSO7Q2BTemseFWkCif5LVdLdpYtD3zTFI4qx
HUoOWAGWuB7XViJCYmPs8EkLcOWhjxlEoQa//9vhV1tef1UnyitR9IHDa3h97UmD
AUky5lpU7rFFRPKwz+i2dgdNaj/ypTWR4MVYRYceXt/i2/EDwmWVlzbrYkJ9QBOy
f9dYYOeuLGBfXaPIFavIe6WwPbdyDboi9IrqVqGToLk5w0ooBGmquChl9P5KURSW
7Ab2SD5AtbOlI+eShX8rGiG2OA/AUUEYAf2iM9HnutAtFtraGTnhfYvkdTcGnG6d
JERvZRdItBMpTxCA5eid7+hFh0Gg3tX1OmdynpMaQIZO97wuWvt41HW+NJe5vlJJ
V5AD1X0toqEfn0omO9G3XuMRHbwyq7osnyaJ/YoQ++BMtBztrQ8FxTuEHx7fslFU
xCKwtE/n3emP02X4CGqU9Z+ABOlWr5xw/D4oILijQ5UmrJR5vUIq3SS07DVenH/M
kEB6JKTtlaOtAtRA45cb
=PXT4
-----END PGP SIGNATURE-----

--2wfF2MdYkZlaSnkI--
