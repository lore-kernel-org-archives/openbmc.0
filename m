Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="g7J5s6VE"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="R8DPXSer"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dBPG2ysGzDqMd;
 Mon, 14 Jan 2019 09:39:46 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BD6D628A59;
 Sun, 13 Jan 2019 17:39:43 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Sun, 13 Jan 2019 17:39:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:subject:references:in-reply-to:date; s=fm1; bh=1Aq
 xfHCXzG8QusTyedU+zAqb2TmJJlUJlTMkSL/MNVQ=; b=g7J5s6VEh05GGxCNYuD
 Z/dkx7QeAA+w21+eMjfNWe5zoU//Zy4FYn8tz75B/BRqQ/gXACMvOcZrbHzV3mOF
 6tn952bmvXzoBK6Rxjz8Kas+tJqS8huey62AT8pHZXK+9ypvYYmh3voOFvyaLt75
 rah3TluI/bImsQcSdDtCooVehGWyPr1K14cwk1waPBF90vep8CM2gK6h3hdFKXj3
 4yyl8v1bnj/QMZvzWeDKlf64y7PKesHmQy0npR97ZFw5x/Aqo3lvZgoeaem9nPpK
 Nz1NYDwxeNMn5Owt6sjfBnHL5nmgd2hrD5W/PVzDDxLK5pfYP6UuADdVls0XG5DH
 Vyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=1AqxfHCXzG8QusTyedU+zAqb2TmJJlUJlTMkSL/MN
 VQ=; b=R8DPXSerWmcZ9of+Z8tTvwkp6j6v8B3cNO2rzSTC/ZRMgSmV0t9BRkbxB
 XV9aHurUENiuU6yXl1r7Q/L+qF7CcLaP1qm0PKMMLAqz7KcRCZeh5FlQ9iz2IYUK
 3/JVP+ZHzxr/ZoXtaM6+ZuTZetzABP+2W5qPoldcXxiYNIZCXbOzYI5a6slgvHR+
 aUlcK0nmrZgkGtiL6JWgMtTmY5XMoP5akxouFhxSR9bKOYl8UZaH3ebEigUSz76/
 9PKd4guqPm72DX4K5VzHkG2iXWhsRW7Ul1Dw66af1o+zVtcxuaO2Hcu2ookCvZWN
 MtqkCmkgBBBBcNFqdk6oswrkIRDEg==
X-ME-Sender: <xms:LL47XB5qSbzVNlPh645KTvUSim5yxr_KCHf8BySmmGi2YVLFYbsmOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrgedtgddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
 tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkffhvfgggfgtof
 fufhgjffesthhqredtredtjeenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceo
 rghnughrvgifsegrjhdrihgurdgruheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:LL47XPortDmDTGHjPTZEqpAd9RFDJhFRLKoZE-NRpd7mCCmpLfd_RA>
 <xmx:LL47XBWFdvWk_21yCu3iW3nTjpqLaZIDWLgPDE6XJWIqNZHMkwez_Q>
 <xmx:LL47XCAeAiquHg_VgAvGImOETlspkqgi-_Jlzs7OYTpGvTjU0ayQkw>
 <xmx:L747XBs5p78guqnEe3y0tv9RObT5qNSSx3zZLpfiHvunTFoXKAZaIw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id C46969E564; Sun, 13 Jan 2019 17:39:40 -0500 (EST)
Message-Id: <1547419180.2315773.1633559160.3F7D29CF@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Vijay Khemka <vijaykhemka@fb.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-36e4bfd3
Subject: Re: [Potential Spoof] Re: [Potential Spoof] Re: [PATCH v2 4/4] ARM:
 dts: aspeed: Add lpc ctrl for Facebook
References: <5972B57A-23D5-43F4-9476-229379B96C7C@fb.com>
In-Reply-To: <5972B57A-23D5-43F4-9476-229379B96C7C@fb.com>
Date: Mon, 14 Jan 2019 09:09:40 +1030
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 13 Jan 2019 22:39:47 -0000

Hi Vijay,

Sorry for providing an opinion so late, however:

On Sat, 12 Jan 2019, at 11:03, Vijay Khemka wrote:
> Joel,
> Please merge these patches as it is required by facebook platform.
>=20
> Regards
> -Vijay
>=20
> =EF=BB=BFOn 1/7/19, 11:25 AM, "Linux-aspeed on behalf of Vijay Khemka" <l=
inux-
> aspeed-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of=20
> vijaykhemka@fb.com> wrote:
>=20
>     Please merge these patches in upstream kernel.
>=20=20=20=20=20
>     Regards
>     -Vijay
>=20=20=20=20=20
>     On 12/20/18, 10:06 AM, "Linux-aspeed on behalf of Vijay Khemka"=20
> <linux-aspeed-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of=
=20
> vijaykhemka@fb.com> wrote:
>=20=20=20=20=20
>         Joel, Can you please take care of these patches merge.
>=20=20=20=20=20=20=20=20=20
>         On 12/17/18, 12:04 PM, "Vijay Khemka" <vijaykhemka@fb.com> wrote:
>=20=20=20=20=20=20=20=20=20
>             Added lpc ctrl device to enable LPC clock in Facebook
>             Tiogapass device tree.
>=20=20=20=20=20=20=20=20=20=20=20=20=20
>             Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
>             ---
>              .../boot/dts/aspeed-bmc-facebook-tiogapass.dts  | 17 ++++++
> +++++++++++
>              1 file changed, 17 insertions(+)
>=20=20=20=20=20=20=20=20=20=20=20=20=20
>             diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-
> tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
>             index 73e58a821613..ef7875b54562 100644
>             --- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
>             +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
>             @@ -22,6 +22,17 @@
>              		reg =3D <0x80000000 0x20000000>;
>              	};
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>             +	reserved-memory {
>             +		#address-cells =3D <1>;
>             +		#size-cells =3D <1>;
>             +		ranges;
>             +
>             +		flash_memory: region@98000000 {
>             +			no-map;
>             +			reg =3D <0x98000000 0x00001000>; /* 4K */
>             +		};
>             +	};
>             +
>              	iio-hwmon {
>              		compatible =3D "iio-hwmon";
>              		io-channels =3D <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
>             @@ -54,6 +65,12 @@
>              	};
>              };
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>             +&lpc_ctrl {
>             +	status =3D "okay";
>             +	memory-region =3D <&flash_memory>;
>             +	flash =3D <&spi1>;
>             +};
>             +
>              &uart1 {
>              	// Host Console
>              	status =3D "okay";
>             --=20
>             2.17.1

I understand you just want to make your system work, but this is a
broken way to do it. And that's not your fault - we should really fix
the driver. I think the memory-region phandle should be optional
and the driver should simply limit the options available to the ioctl
to just the flash region if the memory node is not present (i.e. return
an error if the memory region is requested but not described in the
devicetree).

Andrew
