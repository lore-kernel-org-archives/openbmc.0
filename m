Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="DGBOMPGV"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44QjZf5nM6zDqVy
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 23:26:49 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id D17E941208;
 Fri, 22 Mar 2019 12:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1553257603; x=
 1555072004; bh=hnWaDoS0/GeFpkUDH2B36Cn1jbH/WxjMUgU5oJetU3g=; b=D
 GBOMPGVEyIHU93ctWLyJ+AuPbaazhLjuVNBqIACwE1RVrD3okfbzFmgLVJhiAzIe
 dnklpiUi5Q4nM0IDQ4QJ8W6qo8yiD/3rZK/j2PQfeT4FvGSI6rIreaKVWWR1v6WQ
 ONbEccKkmlb3qj3gII6ZzXE9NBjhIEwpuehhhcMylY=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p5uJWnTvloKR; Fri, 22 Mar 2019 15:26:43 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 57609411FD;
 Fri, 22 Mar 2019 15:26:43 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 22
 Mar 2019 15:26:43 +0300
Subject: Re: [PATCHv2 linux dev-4.17 0/7] mmc/host: Add Aspeed SDIO driver
To: Ryan Chen <ryan_chen@aspeedtech.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
References: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
 <ef432789-cbfe-9adf-2562-296abc261582@yadro.com>
 <00a601d4c5bf$c01a9520$404fbf60$@aspeedtech.com>
 <a534e022-46c2-646c-9ea6-a1a2fd6ea7dd@yadro.com>
 <480daa1f8e784aad881ecb0daad62272@TWMBX02.aspeed.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <d21990db-e81a-030c-1cee-4f29ce29c76b@yadro.com>
Date: Fri, 22 Mar 2019 15:26:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <480daa1f8e784aad881ecb0daad62272@TWMBX02.aspeed.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3j65Sm6gvToSuzspRLGUO4Gtc1sLNMkkG"
X-Originating-IP: [172.17.14.197]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
X-List-Received-Date: Fri, 22 Mar 2019 12:26:51 -0000

--3j65Sm6gvToSuzspRLGUO4Gtc1sLNMkkG
Content-Type: multipart/mixed; boundary="p2DVvE4kKNA7DB9uj0oVAL4ELuTDmSkwF";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <d21990db-e81a-030c-1cee-4f29ce29c76b@yadro.com>
Subject: Re: [PATCHv2 linux dev-4.17 0/7] mmc/host: Add Aspeed SDIO driver
References: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
 <ef432789-cbfe-9adf-2562-296abc261582@yadro.com>
 <00a601d4c5bf$c01a9520$404fbf60$@aspeedtech.com>
 <a534e022-46c2-646c-9ea6-a1a2fd6ea7dd@yadro.com>
 <480daa1f8e784aad881ecb0daad62272@TWMBX02.aspeed.com>
In-Reply-To: <480daa1f8e784aad881ecb0daad62272@TWMBX02.aspeed.com>

--p2DVvE4kKNA7DB9uj0oVAL4ELuTDmSkwF
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Thanks Ryan.

After fixing a typo in your patch (ASPEED_CLK_GATE_SDCLKLK instead of ASP=
EED_CLK_GATE_SDCLK) and building the driver,
we've found a minor hardware issue in our design that prevented the drive=
r from working with our board.
We've fixed it and it works for us now. Anyway, it would be great to see =
the driver upstreamed.

Alexander.

13.03.2019 3:29, Ryan Chen wrote:
> Hello Alexander,
> 		The original version is patch on v4.17.4, it can build with the patch=
=2E Does there have any message?=20
> 		Currently I am ongoing on new version SOC chip also with new adhci, a=
nd will apply patch at June.=20
> Ryan
>
>>> How is it going? We've tried the original version of your patch and i=
t didn't apply for us due to a typo. We've fixed the typo, but it still d=
oesn't work. >>We're not sure yet why. Have you verified that old patch o=
n any real hardware? When do you think you'll be able to come up with the=
 new version of >>the patch?
>>> Thank you.
>>> Alexander.
> 16.02.2019 9:20, Ryan Chen wrote:
>> Hello,
>> 	I got some feedback from maintainer. I will modify for new architectu=
re, hopeful, I will apply new patch at March. =20
>>
>> Rayn
>>
>> -----Original Message-----
>> From: openbmc=20
>> [mailto:openbmc-bounces+ryan_chen=3Daspeedtech.com@lists.ozlabs.org] O=
n=20
>> Behalf Of Alexander Amelkin
>> Sent: Friday, February 15, 2019 6:36 PM
>> To: openbmc@lists.ozlabs.org
>> Subject: Re: [PATCHv2 linux dev-4.17 0/7] mmc/host: Add Aspeed SDIO=20
>> driver
>>
>> Guys, what's the fate of this patch set?
>> Is going to be merged into openbmc linux?
>> We have an SD card slot on our BMC card and so would like to know whet=
her or not to await arrival of SDIO support from upstream or import this =
patch set locally.
>>
>> Thank you.
>>
>> 17.07.2018 10:26, Ryan Chen wrote:
>>> This series implements Aspeed SDIO driver. In Aspeed SDIO controller =

>>> with two slots and have a global register for interrupt status and=20
>>> other general information.
>>>
>>> v2
>>> Change irqchip driver(irq-aspeed-sdhci-ic.c) to aspeed sdhci core=20
>>> driver aspeed-sdhci-core.c
>>>
>>> v0
>>> For implements this, it will have have irq-aspeed-sdhci-ic.c for=20
>>> sdhci each slot irq dispatch, and then go to sdhci driver handle (sdh=
ci.c).
>>>
>>> Another is sdhci-of-aspeed.c for specific function call.
>>>
>>>
>>> Ryan Chen
>>>
>>>
>>> Ryan Chen (7):
>>>   clk: Aspeed: Modify clk-aspeed.c driver probe sequence
>>>   clk: Aspeed: Add sdhci reset and clock
>>>   mmc: Aspeed: Add Aspeed sdhci core driver
>>>   mmc: Aspeed: Add driver for Aspeed sdhci
>>>   dts: Aspeed: Add devicetree for Aspeed sdhci
>>>   Documentation: mmc: add aspeed sdhci binding document
>>>   configs: Aspeed: enable mmc host in defconfig
>>>
>>>  .../bindings/mmc/aspeed,aspeed-sdhci.txt           |  54 +++++++
>>>  arch/arm/boot/dts/aspeed-ast2500-evb.dts           |  14 ++
>>>  arch/arm/boot/dts/aspeed-g4.dtsi                   |  40 +++++
>>>  arch/arm/boot/dts/aspeed-g5.dtsi                   |  40 +++++
>>>  arch/arm/configs/aspeed_g5_defconfig               |   6 +
>>>  drivers/clk/clk-aspeed.c                           |  51 +++---
>>>  drivers/irqchip/Makefile                           |   2 +-
>>>  drivers/mmc/host/Kconfig                           |  12 ++
>>>  drivers/mmc/host/Makefile                          |   1 +
>>>  drivers/mmc/host/aspeed-sdhci-core.c               | 147 +++++++++++=
++++++
>>>  drivers/mmc/host/sdhci-of-aspeed.c                 | 178 +++++++++++=
++++++++++
>>>  include/dt-bindings/clock/aspeed-clock.h           |   2 +-
>>>  include/linux/mmc/sdhci-aspeed-data.h              |  28 ++++
>>>  13 files changed, 553 insertions(+), 22 deletions(-)  create mode
>>> 100644 Documentation/devicetree/bindings/mmc/aspeed,aspeed-sdhci.txt
>>>  create mode 100644 drivers/mmc/host/aspeed-sdhci-core.c
>>>  create mode 100644 drivers/mmc/host/sdhci-of-aspeed.c
>>>  create mode 100644 include/linux/mmc/sdhci-aspeed-data.h
>>>


--p2DVvE4kKNA7DB9uj0oVAL4ELuTDmSkwF--

--3j65Sm6gvToSuzspRLGUO4Gtc1sLNMkkG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJclNSCAAoJEOiTWHtbdBeNk7QP/0dv/IxM5WEW2juVndvSyBLl
DoybNi4S6BtprAo64Pn504bfK3kpDjCCrIH/IfaVXNbSvtEzMHCoXDTaWS+YufwD
oCGRfFxEUBGxspEcKdlLkowUvhDA0o/2SrO3mbU5EtxLPNEP5rx9OU3wrRdIwN2/
EzSWjVwQQTlKSWXozZGbnlcTLu3sNGTjiordBtUme0lLtsNbUPhHdaAg8xNCtwOz
PwnOxRBs8Rrb2d0q2mL8cAKQS3o8cWQySutOio+H6Kte3OtNDbI7cTmJWxazXhsD
CRYkRp6lY4xbAGeoFOrNmJcWa++59DUhwS64MZr5Wcfq5I+N0BvqF4Jg62wP6B4f
n1McD8Pyhiq6yGuW8BfpPzM2rZo8vJMufyoGAB1hGai+dnq6H4zh+MJl9FSq9qSV
+lY+9yLKH+/W0nd0vIIi79VjmyNsJOwpUA3GMiPYJwChVvA/OLjylnU/JjwEujIH
SiknQ+P8m7e1Tq9XiAxyvRPTO/9VwG6CEfKOmeIPV12TiTzhHQZEg2gx0ldTadZU
8CF6ix7URzOOjHz9VepUVclRsKdyWX4LPnv0tLDqcAvbQ6tQbdE9gG8LNZc5d5WP
xZ9B23/KTclyVnFNbMmIxzOV+FUXAqUOmtgjnlyq7fq5iKiEvWX8a6Rx7PwF9FiI
kzf16f4RXMHuGgQqJPvi
=/w2a
-----END PGP SIGNATURE-----

--3j65Sm6gvToSuzspRLGUO4Gtc1sLNMkkG--
