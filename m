Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JkVjRqyw"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="VV6R0Jgh"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43z1Q10J4fzDqcN
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 09:57:13 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9D3B422703;
 Mon, 11 Feb 2019 17:57:10 -0500 (EST)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Mon, 11 Feb 2019 17:57:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:in-reply-to:subject:date:references; s=fm2; bh=eFE
 AJdxBBa5BFBLFxE86/fh6v2iTDJ4XdPVtRwh4BYc=; b=JkVjRqywB1doUgoP2XK
 //mtskLLtNLK5TxSn42dfO9s/G/KtOx19DVQdhTGynbmDjiDLlHBFd3yLi+jyPJH
 4b7k2HnFNZDby2ZiUZCITU4UzREy/AC8Wj1IB7yA05tjDqSQO0sCTA9QqAmLkgkP
 TUi12h+Pi2FwaUZKXR0eNEnMkSESRCvdm9bjfYhD9XNNfhUb22gjwQlC2dEVAGHv
 r/et94s7lf05yYlHVwyFK7zYVWgAgmeOcs7AaQ30dGkhkt++6caEhDguAOf4KOK1
 TfdNnL4XmdPTAE3AL419T05M04NGrTQmxi7aQYOqXyf9aA3xMbookpir2pLwIEF8
 ANw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=eFEAJdxBBa5BFBLFxE86/fh6v2iTDJ4XdPVtRwh4B
 Yc=; b=VV6R0JghuwkyqlZZml+Y7emX2uE+tfvEgc94yjMUm/udVNq+ycBRpgfyA
 eu8yz9mjQr+11FFVycEM3JQvRpURjzMqDK3g1bgxyqt84YweMUlD2Oze1n4jizCK
 Frs54QoQvq+2ni0LjH9EdY3/2MEsEqwc7mLoX2OBK6tsoX7s9hwJQ3sSKj9z8oP/
 gexZYxElcYd41f0c02wsfC4X9p32inctQN+KWGb6PYQPABuArBflxKsjWeVt+WS4
 MtmtQXFXmocaPu5fhRwIt1lP2oX6U9peYoEtzgAMoBg6kgV9kDg9/xGqr4mN0xHZ
 dSHlqg2kUayjNSME6qkwLf4suhmAw==
X-ME-Sender: <xms:xf1hXA6s1Ejau-8TYD4WdKblJnyutGF2W76F3p7C8dBKevSeE9v8IA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledruddttddgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
 tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkhffvggfgtg
 fojgfuffhfsehtqhertdertdejnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicu
 oegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrghmpehmrghilhhfrhhomheprg
 hnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:xf1hXN7TwbaVFXipVCFhcb1DQ6E9Ts_8FT10yJlnZ1K0BM-TYS-yhw>
 <xmx:xf1hXBr6S0zRRHUkYnqz9ltV6AZFxD-V5Bje-hICbNR6oEmVsdfR_A>
 <xmx:xf1hXGO5uA0iwrpsoYmGqnOtpHaeL2CXCiKWfvEvmJD8oOKFVw84NQ>
 <xmx:xv1hXC827D61khP8WBkIiEGwcRAEg8qE3_tU88qJRgEk9ntLMk2owA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 9AA44942D4; Mon, 11 Feb 2019 17:57:09 -0500 (EST)
Message-Id: <1549925829.1673864.1655912104.34B09B10@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Aaron Williams <awilliams@marvell.com>, openbmc@lists.ozlabs.org
Cc: =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-950b8783
In-Reply-To: <2947580.vCq4SJ4yDf@awilliams-suse>
Subject: Re: Issues with SPI NOR flash
Date: Tue, 12 Feb 2019 09:27:09 +1030
References: <2947580.vCq4SJ4yDf@awilliams-suse>
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
X-List-Received-Date: Mon, 11 Feb 2019 22:57:13 -0000

Hi Aaron,

On Tue, 8 Jan 2019, at 21:52, Aaron Williams wrote:
> Hi all,
>=20
> I'm running into a problem with the SPI NOR connected to our host process=
or.=20
> We're using a Macronix MX25L25645GMI-08G connected to the spi1 device on =
an=20
> AST2500. This device is muxed between our host processor and the BMC. Whe=
n our=20
> host processor is powered off, the BMC has exclusive access to it.
>=20
> Anyway, the behavior is that I can read the SPI NOR without any difficult=
y,=20
> however, when I write to it the SPI nor appears to be filled with garbage=
. If=20
> I had to guess, I'd guess that the SPI driver is not waiting for the SPI =
NOR=20
> to complete the write operation before moving to the next block.
>=20
> Here is the relevant section from our device tree:
>=20
> &spi1 {
> 	status =3D "okay";
> 	flash@0 {
> 		status =3D "okay";
> 		compatible =3D "jedec,spi-nor", "spi-nor";
> 		label =3D "host";
> 		m25p,fast-read;
> 		spi-tx-bus-width =3D <1>;
> 		spi-rx-bus-width =3D <1>;
> 		spi-max-frequency =3D <50000000>;
> 		partitions {
> 			compatible =3D "fixed-partitions";
> 			#address-cells =3D <1>;
> 			#size-cells =3D <1>;
>=20
> 			bootloader@0 {
> 				reg =3D <0x0 0x1000000>;
> 				label =3D "host-
> bootloader";
> 			};
> 			kernel@1000000 {
> 				reg =3D <0x1000000=20
> 0x1000000>;
> 				label =3D "host-kernel";
> 			};
> 		};
> 	};
> };
>=20
> Note that our host is also running 4.19 and has no trouble writing to the=
 SPI=20
> NOR. The corruption seems worse when flashcp is used compared to just cp.=
 I=20
> noticed that flashcp writes in 4K blocks. The Macronix device has a 256 b=
yte=20
> page buffer. I have tried slowing down the bus to 5MHz and that made no=20
> difference. Note that we are currently using single bit mode for both the=
 host=20
> and BMC processors for this flash, though we plan to move to move to QPI =
on=20
> the host processor later.
>=20
> Before the write operation the host processor has not had any access to t=
he=20
> SPI NOR. The host is powered down and the BMC is rebooted to force a clea=
n=20
> state.
>=20

Did you find the problem? I've added C=C3=A9dric to Cc in case you haven't =
- he
should be able to answer questions about the flash stack.

Andrew
