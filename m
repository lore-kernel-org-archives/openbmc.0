Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="NUrZvOXy"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44k2Pp270CzDqDh
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 20:57:17 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id B47A341980;
 Tue, 16 Apr 2019 10:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:references:subject:subject
 :from:from:received:received:received; s=mta-01; t=1555412231;
 x=1557226632; bh=fdvVlI8D3sm5s95ho7Ub+i4fzQGeH9XM5IzCASAyJq8=; b=
 NUrZvOXysRycVSoncgRPHQCJ61XIVsQGHYH5Db+Ez1ud4hhLb2OUVdGmSe3fH8Db
 qQHOruCJDU6POeZUMFVwNZV56CxVzWIx2JTc4rra0Za/sqRlMOsVJyEc3lqWBMa0
 2zPN0fejMkF0bCwvC/gnapXJc1V5hk0bUgXvkccgpqI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BpIhrzRHP-5s; Tue, 16 Apr 2019 13:57:11 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0048941943;
 Tue, 16 Apr 2019 13:57:10 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 16
 Apr 2019 13:57:10 +0300
From: Alexander Amelkin <a.amelkin@yadro.com>
Subject: [PATCHv2-modified dev-4.19 0/7] Add support for ASPEED SDHCI
 controller
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Mailing List <openbmc@lists.ozlabs.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>
References: <CACPK8XfNyXsS3tyS8jsh60n_fiv=gtqcmZ7c5VzDJqOHCESLDg@mail.gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <13436c7f-ced3-2bcb-b368-cc75accf2040@yadro.com>
Date: Tue, 16 Apr 2019 13:57:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XfNyXsS3tyS8jsh60n_fiv=gtqcmZ7c5VzDJqOHCESLDg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vYJAPC2di1pbpHFV1obmnNCcMkKSOJE6W"
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
X-List-Received-Date: Tue, 16 Apr 2019 10:57:19 -0000

--vYJAPC2di1pbpHFV1obmnNCcMkKSOJE6W
Content-Type: multipart/mixed; boundary="GCqIMp29NZAl9NRzZBOIv1r4b4n62CZct";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Mailing List <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Message-ID: <13436c7f-ced3-2bcb-b368-cc75accf2040@yadro.com>
Subject: [PATCHv2-modified dev-4.19 0/7] Add support for ASPEED SDHCI
 controller
References: <CACPK8XfNyXsS3tyS8jsh60n_fiv=gtqcmZ7c5VzDJqOHCESLDg@mail.gmail.com>
In-Reply-To: <CACPK8XfNyXsS3tyS8jsh60n_fiv=gtqcmZ7c5VzDJqOHCESLDg@mail.gmail.com>

--GCqIMp29NZAl9NRzZBOIv1r4b4n62CZct
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

11.04.2019 15:33, Joel Stanley wrote:
> Alexander, if you want to post the version that you tested to the
> openbmc list I can apply that.

Sure, Joel, that would be great!

This series of patches is based on the original patchwork submitted
by Ryan Chen here: https://patchwork.ozlabs.org/cover/942313/

The patch set has been updated by YADRO to cleanly apply and build
for dev-4.19 branch of OpenBMC linux kernel.

This patch works fine for us with our AST2400 BMC on VESNIN.

With best regards,
Alexander Amelkin,
Leading BMC Software Engineer,
YADRO, https://yadro.com

Original cover letter:
----------------------------
This series implements Aspeed SDIO driver. In Aspeed SDIO controller
with two slots and have a global register for interrupt status and other
general information.

For implements this, it will have have irq-aspeed-sdhci-ic.c for sdhci
each slot irq dispatch, and then go to sdhci driver handle (sdhci.c).

Another is sdhci-of-aspeed.c for specific function call.

Ryan Chen
----------------------------


Ryan Chen (7):
  clk: Aspeed: Modify clk-aspeed.c driver probe sequence
  clk: Aspeed: Add sdhci reset and clock
  irqchip: Aspeed: Add Aspeed sdhci irq driver
  dts: Aspeed: Add Aspeed sdhci dts document
  mmc: Aspeed: Add driver for Aspeed sdhci
  dts: Aspeed: Add devicetree for Aspeed sdhci
  configs: Aspeed: enable mmc host in defconfig

 .../aspeed,aspeed-sdhci-ic.txt                     |  25 +++
 .../bindings/mmc/aspeed,aspeed-sdhci.txt           |  42 +++++
 arch/arm/boot/dts/aspeed-ast2500-evb.dts           |  14 ++
 arch/arm/boot/dts/aspeed-g4.dtsi                   |  40 +++++
 arch/arm/boot/dts/aspeed-g5.dtsi                   |  40 +++++
 arch/arm/configs/aspeed_g5_defconfig               |   6 +
 drivers/clk/clk-aspeed.c                           |  15 +-
 drivers/irqchip/Makefile                           |   2 +-
 drivers/irqchip/irq-aspeed-sdhci-ic.c              | 147 +++++++++++++++=
++
 drivers/mmc/host/Kconfig                           |  12 ++
 drivers/mmc/host/Makefile                          |   1 +
 drivers/mmc/host/sdhci-of-aspeed.c                 | 178 +++++++++++++++=
++++++
 include/dt-bindings/clock/aspeed-clock.h           |   2 +-
 include/linux/mmc/sdhci-aspeed-data.h              |  28 ++++
 14 files changed, 548 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/aspeed,aspeed-sdhci-ic.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/aspeed,aspeed-s=
dhci.txt
 create mode 100644 drivers/irqchip/irq-aspeed-sdhci-ic.c
 create mode 100644 drivers/mmc/host/sdhci-of-aspeed.c
 create mode 100644 include/linux/mmc/sdhci-aspeed-data.h

--=20
2.7.4



--GCqIMp29NZAl9NRzZBOIv1r4b4n62CZct--

--vYJAPC2di1pbpHFV1obmnNCcMkKSOJE6W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJctbUFAAoJEOiTWHtbdBeNrR0P/3RIZTpcTtbwqIcUFgZa90+1
9XL/CVIkEyKP1nhHrkyIOlmtiOfQks0dP5WBbBUBt9sAY98l0CV1BSlAwuzVtMtr
OB6nQIwV68wx1DW/CzKYoRSnVHupN/zqBbYNr2J7/gLeT27i0vCQoYfqNTnnvVDr
vVzPZnhSjPB+pENTM7b3k9YxpkWk6cL66qJ3ka3xeFAN672RBIUaolUV0oM/wEU5
0+OiTuUEKNJjQWlhv+W11Pfaboa+U1CNHUuf2ovfiuaG6VIenJ4AX0Lg1RqpRRRw
sEaqi76cSFU58yhrdly2mjituSh0KN9aA0bi4By2cx5y2bG/uFY5FXmLrgbnOr6G
5NXi/le5QLiW1jSxzEtGdIRUkkenk0l41ofRLc7Ky+M8I0r3G82SbyI0QNQSzigu
2n5gJyYVBHQwEXafczWiRGt07fZupJmD+Vrt7i+pnLMhm5YNepIfdrg8mtFOxUkc
XdFSGrk7dI0P00tyOs2oEhyeLigMjARhABAK5VDcFr95zAuDfyOBJ+zsQYA/11OJ
vDt/WUfSjbxW4pQKt3BaMC1Rwz1HMgDmuSzc6JSILeuZ5wrSVQXXptgVQR/4g5MU
902QaqvlHvh1pBX1k3hDJYCgn9xre8tCD3Ked5rDdPNOVYnYGIHF050wVxrCbnB2
LX+lYm3/2S3+AUKHWIR0
=MS0q
-----END PGP SIGNATURE-----

--vYJAPC2di1pbpHFV1obmnNCcMkKSOJE6W--
