Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="TJAhQyGZ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WghGZqpU"; dkim-atps=neutral
X-Greylist: delayed 596 seconds by postgrey-1.36 at bilbo;
 Thu, 04 Apr 2019 11:44:48 AEDT
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZPNc2XGFzDqJV
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 11:44:48 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C727121FB7;
 Wed,  3 Apr 2019 20:34:46 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 03 Apr 2019 20:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=C6DlN
 gKXTVZ1z2Kouv/DHgfjV96M3UY6Chur3VquTkQ=; b=TJAhQyGZU1dtM9/p2ROk1
 P3sTRRkx4/xOs7gxbcH0NX2yUMDYWV9f2OhGOzzTjo09KzqxNpXvPU/xchP58O6d
 rkO77udAWGGrrNViwvJAURCpKXGXyVWadxROCX4h60kRMP5l9/CKTZWD06vDbnxV
 TUKHlSgsfV3SgXSneSc9v94UFLY+xdzoA7QWF7kCOr3/HeeRzhP1V9V+7xp1XIb8
 iVWzYyWXyAyWIk3SFxyTMJXfI6nmbY3sdItLd6xRlXCduJZUr+vx7UdWRWMaV9Dj
 Ugqi0Z8gspTn0aJs0W3ZP6M8IbB4AuLF2s18xIJ6VkwzLSd8yd+VZQciWvMD6FiA
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=C6DlNgKXTVZ1z2Kouv/DHgfjV96M3UY6Chur3VquT
 kQ=; b=WghGZqpUewnTb6a1N4UDsKDdmxiWgHR+WkCGDXfG9ATEAgygUmeuZmvGB
 xnoKcCfaSL5UK81g39U4TQuFmG7ttQ7Hah72d8Qkjn+DlNOXeEpohDaiB+ju0Yt2
 u4/QuRxVKPyv7+1nYR0B2/D4azbM3NZ9Du+tSDePB8BCixQNVxCsAg4nu8a6CN1W
 SA/Y52X9cbIUKJlncQDZfEl40sxyXN5P65yHNBBEg/kuQAFatTp3kHweL5X0ErIM
 QaEoGYUPcLMtOrSUrc35IiNclglGcDTCVFyMYgmvbYqMUxpiMZurqdXymoAFW17O
 vQgoih0iJpeewi6vuboB72v5WYFVg==
X-ME-Sender: <xms:JFGlXEgHQC3WAWkQ9D2xGwa5__qS9KNH467nro3fC7TPJbUVZHytXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrtdeggdefgeculddtuddrgedutddrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreer
 jeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjh
 drihgurdgruheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
 ugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:JFGlXJW22LJ8B9X93UfVGTFdhlPmDljN-UVzxfgIDB_lglWyBCmHQA>
 <xmx:JFGlXO2kqnCxVgzuNNs48yfNjcHvdfrqw5fRfL-byRwwG88JbIb2ZA>
 <xmx:JFGlXHHG5LHbVOcJoSUjCfBwvBvICTFQ6cDYPzeParPjhrYvy3YxcQ>
 <xmx:JlGlXEhYYpgYgLaN0pQT_dt7S_qVOMhVm05PvIgXMVI1CPlomz1uew>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0E67C7C411; Wed,  3 Apr 2019 20:34:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-329-gf4aae99-fmstable-20190329v1
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <afa93732-2a36-498f-8bf3-285192626a44@www.fastmail.com>
In-Reply-To: <599ff977-9e23-d1de-24c9-a5f0f1585495@kaod.org>
References: <962b866599ac4dfd866d7433b7ddb276@linux.vnet.ibm.com>
 <1554310751-52446-1-git-send-email-anoo@linux.ibm.com>
 <599ff977-9e23-d1de-24c9-a5f0f1585495@kaod.org>
Date: Wed, 03 Apr 2019 20:34:37 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Adriana Kobylak" <anoo@linux.ibm.com>, "Joel Stanley" <joel@jms.id.au>,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, "Adriana Kobylak" <anoo@us.ibm.com>
Subject: Re: [PATCH v2] ARM: dts: Aspeed: Witherspoon: Update BMC partitioning
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 04 Apr 2019 00:44:49 -0000



On Thu, 4 Apr 2019, at 04:09, C=C3=A9dric Le Goater wrote:
> On 4/3/19 6:59 PM, Adriana Kobylak wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
> >=20
> > Add simplified partitions for BMC and alternate flash. Include these=
 by
> > default in Witherspoon.
>=20
> at last ! :
>=20
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Piling on:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

>=20
> Thanks,
>=20
> C.
>=20
> >=20
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 37 +++++++++++++=
+++++++++--
> >  1 file changed, 35 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch=
/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > index 1cdc96d..82f63aa 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > @@ -194,14 +194,47 @@
> >  		label =3D "bmc";
> >  		m25p,fast-read;
> >  		spi-max-frequency =3D <50000000>;
> > -#include "openbmc-flash-layout.dtsi"
> > +		partitions {
> > +			#address-cells =3D < 1 >;
> > +			#size-cells =3D < 1 >;
> > +			compatible =3D "fixed-partitions";
> > +			u-boot@0 {
> > +				reg =3D < 0 0x60000 >;
> > +				label =3D "u-boot";
> > +			};
> > +			u-boot-env@60000 {
> > +				reg =3D < 0x60000 0x20000 >;
> > +				label =3D "u-boot-env";
> > +			};
> > +			obmc-ubi@80000 {
> > +				reg =3D < 0x80000 0x1F80000 >;
> > +				label =3D "obmc-ubi";
> > +			};
> > +		};
> >  	};
> > =20
> >  	flash@1 {
> >  		status =3D "okay";
> > -		label =3D "alt";
> > +		label =3D "alt-bmc";
> >  		m25p,fast-read;
> >  		spi-max-frequency =3D <50000000>;
> > +		partitions {
> > +			#address-cells =3D < 1 >;
> > +			#size-cells =3D < 1 >;
> > +			compatible =3D "fixed-partitions";
> > +			u-boot@0 {
> > +				reg =3D < 0 0x60000 >;
> > +				label =3D "alt-u-boot";
> > +			};
> > +			u-boot-env@60000 {
> > +				reg =3D < 0x60000 0x20000 >;
> > +				label =3D "alt-u-boot-env";
> > +			};
> > +			obmc-ubi@80000 {
> > +				reg =3D < 0x80000 0x1F80000 >;
> > +				label =3D "alt-obmc-ubi";
> > +			};
> > +		};
> >  	};
> >  };
> > =20
> >=20
>=20
>
