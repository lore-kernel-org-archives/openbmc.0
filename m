Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="rfcYV1kt"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44JYqq6j72zDq67
 for <openbmc@lists.ozlabs.org>; Tue, 12 Mar 2019 23:16:55 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id C060441A0C;
 Tue, 12 Mar 2019 12:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1552393010; x=
 1554207411; bh=/bRIGmYVZYnCa9F4rcLzj+xXC94tQqzcE5OrSjsyaHM=; b=r
 fcYV1ktAdgA/fjTQgW2fcIz3JpXyFYalFM5RaTY4jBLCWWcrOYnokeEpYBT1fGmQ
 Q5Wf47DCdI4t/Dk8q2UTQfaHwdaLQ79ZOriOvfI7E3aoBGnryp+99jIer1gDGRUV
 ywB3pzH6UEZTBiClVB27ptoGgaob2but3eJ3kUnjkM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c5BsCgF06q03; Tue, 12 Mar 2019 15:16:50 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 6CDB041A37;
 Tue, 12 Mar 2019 15:16:42 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 12
 Mar 2019 15:16:41 +0300
Subject: Re: [PATCHv2 linux dev-4.17 0/7] mmc/host: Add Aspeed SDIO driver
To: Ryan Chen <ryan_chen@aspeedtech.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
References: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
 <ef432789-cbfe-9adf-2562-296abc261582@yadro.com>
 <00a601d4c5bf$c01a9520$404fbf60$@aspeedtech.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <a534e022-46c2-646c-9ea6-a1a2fd6ea7dd@yadro.com>
Date: Tue, 12 Mar 2019 15:16:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <00a601d4c5bf$c01a9520$404fbf60$@aspeedtech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YMxA8GPNUp5fi7eTiXkY2ij51k9ukTUCB"
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
X-List-Received-Date: Tue, 12 Mar 2019 12:16:57 -0000

--YMxA8GPNUp5fi7eTiXkY2ij51k9ukTUCB
Content-Type: multipart/mixed; boundary="5pH5DqrWWbH5jgQUmBliesqMdKNPeqptS";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <a534e022-46c2-646c-9ea6-a1a2fd6ea7dd@yadro.com>
Subject: Re: [PATCHv2 linux dev-4.17 0/7] mmc/host: Add Aspeed SDIO driver
References: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
 <ef432789-cbfe-9adf-2562-296abc261582@yadro.com>
 <00a601d4c5bf$c01a9520$404fbf60$@aspeedtech.com>
In-Reply-To: <00a601d4c5bf$c01a9520$404fbf60$@aspeedtech.com>

--5pH5DqrWWbH5jgQUmBliesqMdKNPeqptS
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi, Ryan!

How is it going? We've tried the original version of your patch and it di=
dn't apply for us due to a typo. We've fixed the typo, but it still doesn=
't work. We're not sure yet why. Have you verified that old patch on any =
real hardware? When do you think you'll be able to come up with the new v=
ersion of the patch?

Thank you.

Alexander.

16.02.2019 9:20, Ryan Chen wrote:
> Hello,
> 	I got some feedback from maintainer. I will modify for new architectur=
e, hopeful, I will apply new patch at March. =20
>
> Rayn
>
> -----Original Message-----
> From: openbmc [mailto:openbmc-bounces+ryan_chen=3Daspeedtech.com@lists.=
ozlabs.org] On Behalf Of Alexander Amelkin
> Sent: Friday, February 15, 2019 6:36 PM
> To: openbmc@lists.ozlabs.org
> Subject: Re: [PATCHv2 linux dev-4.17 0/7] mmc/host: Add Aspeed SDIO dri=
ver
>
> Guys, what's the fate of this patch set?
> Is going to be merged into openbmc linux?
> We have an SD card slot on our BMC card and so would like to know wheth=
er or not to await arrival of SDIO support from upstream or import this p=
atch set locally.
>
> Thank you.
>
> 17.07.2018 10:26, Ryan Chen wrote:
>> This series implements Aspeed SDIO driver. In Aspeed SDIO controller=20
>> with two slots and have a global register for interrupt status and=20
>> other general information.
>>
>> v2
>> Change irqchip driver(irq-aspeed-sdhci-ic.c) to aspeed sdhci core=20
>> driver aspeed-sdhci-core.c
>>
>> v0
>> For implements this, it will have have irq-aspeed-sdhci-ic.c for sdhci=
=20
>> each slot irq dispatch, and then go to sdhci driver handle (sdhci.c).
>>
>> Another is sdhci-of-aspeed.c for specific function call.
>>
>>
>> Ryan Chen
>>
>>
>> Ryan Chen (7):
>>   clk: Aspeed: Modify clk-aspeed.c driver probe sequence
>>   clk: Aspeed: Add sdhci reset and clock
>>   mmc: Aspeed: Add Aspeed sdhci core driver
>>   mmc: Aspeed: Add driver for Aspeed sdhci
>>   dts: Aspeed: Add devicetree for Aspeed sdhci
>>   Documentation: mmc: add aspeed sdhci binding document
>>   configs: Aspeed: enable mmc host in defconfig
>>
>>  .../bindings/mmc/aspeed,aspeed-sdhci.txt           |  54 +++++++
>>  arch/arm/boot/dts/aspeed-ast2500-evb.dts           |  14 ++
>>  arch/arm/boot/dts/aspeed-g4.dtsi                   |  40 +++++
>>  arch/arm/boot/dts/aspeed-g5.dtsi                   |  40 +++++
>>  arch/arm/configs/aspeed_g5_defconfig               |   6 +
>>  drivers/clk/clk-aspeed.c                           |  51 +++---
>>  drivers/irqchip/Makefile                           |   2 +-
>>  drivers/mmc/host/Kconfig                           |  12 ++
>>  drivers/mmc/host/Makefile                          |   1 +
>>  drivers/mmc/host/aspeed-sdhci-core.c               | 147 ++++++++++++=
+++++
>>  drivers/mmc/host/sdhci-of-aspeed.c                 | 178 ++++++++++++=
+++++++++
>>  include/dt-bindings/clock/aspeed-clock.h           |   2 +-
>>  include/linux/mmc/sdhci-aspeed-data.h              |  28 ++++
>>  13 files changed, 553 insertions(+), 22 deletions(-)  create mode=20
>> 100644 Documentation/devicetree/bindings/mmc/aspeed,aspeed-sdhci.txt
>>  create mode 100644 drivers/mmc/host/aspeed-sdhci-core.c
>>  create mode 100644 drivers/mmc/host/sdhci-of-aspeed.c
>>  create mode 100644 include/linux/mmc/sdhci-aspeed-data.h
>>


--5pH5DqrWWbH5jgQUmBliesqMdKNPeqptS--

--YMxA8GPNUp5fi7eTiXkY2ij51k9ukTUCB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJch6MpAAoJEOiTWHtbdBeNhd0P/idXsV1ftIwYFLnp/u8z92C3
H8aWpTt0yfyQGgkBRJxOdtAeAH/GFTULkSs/ycW4eU1yVFiSg04pAETFe46OFZgI
bpcOHoMozbFNpT0RMN9NpOOicW8Rd7R+wNGZe77P1QmNOlHNwKHSDO7MhTGHWpdE
n+dHYywLdBkgk1SwLnAl/sea6j9qxIZcxk/rkD+DlMsMaq96kFQ79GrInKYAfueg
kEL8MfkMboY/NNgP8b/HUoHPjh3zaqj5wTQMpoKmWHKxI6BoD2nSst0TCH+vjL4y
VCgJk3Ev7bbdSinJAW0LdvXbSSLP7jv9yfP98KG8uOXgw6bDOtw4q5xSI5fKLaHz
Td86DOHjHjFMo3/5JJuOzaBnNyDL5xMxR1K1f2bkLjFV3kdC356j98aCS7DZ3AGE
Wk+HZBXUdLFlK8s8AcAtquz2120ZuoyNOhoTO3SZbz/rHLM1Ru+eMXgpQahqrW9+
URoZdSN3R01krSGHXp3J1w7yCWkFzJkdoLqfDOfcSaBn9GnT7ZQMsNTmSBpsB3xw
nvW3Y2858Do/eqmBPLimdGiUR/OWXpXNCGXuplUqSbxKx7hNW+VqLZcuMzqw/4sC
YcY7jMFLebDeTr6cCyY8WNto6FQRjTAokMFfteEDC4IIm1E7MnpRk4ZwNFU9NQ1R
f57onWCHm5SobtSMQgju
=9lUK
-----END PGP SIGNATURE-----

--YMxA8GPNUp5fi7eTiXkY2ij51k9ukTUCB--
