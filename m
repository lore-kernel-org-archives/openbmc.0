Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="Hc0bUAB5"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44k2QD0YpyzDqF1
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 20:57:40 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 21C4141980;
 Tue, 16 Apr 2019 10:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:references:subject:subject
 :from:from:received:received:received; s=mta-01; t=1555412256;
 x=1557226657; bh=mwEx01U7czGsOG0ZovxYOzR6G7ZBTZFEwBYLqX81MaQ=; b=
 Hc0bUAB5u53e6TCBzMgWlYJ0vAc3FrM+Rwr1/0sIUe4O2I8rMDImKa0+YQT09pjc
 9siYQg6gOf6Y502g/wiSK4grrZdf+9uKmKVdE3ja7csMsSn0WQstkrs8pmyoDciv
 wpDbp1pBs/nWw5jWGbv0wNDaVqpJnFoEFfmhfQUXpNE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yuqLb2VDv9uX; Tue, 16 Apr 2019 13:57:36 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 161D241943;
 Tue, 16 Apr 2019 13:57:36 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 16
 Apr 2019 13:57:35 +0300
From: Alexander Amelkin <a.amelkin@yadro.com>
Subject: [PATCHv2-modified dev-4.19 2/7] clk: Aspeed: Add sdhci reset and clock
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Mailing List <openbmc@lists.ozlabs.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>
References: <cover.1555409110.git.a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <0021cf73-afee-ee0f-74d6-1a2f3034c5fe@yadro.com>
Date: Tue, 16 Apr 2019 13:57:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <cover.1555409110.git.a.amelkin@yadro.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6xf2RU8KCqchI7Mz8lYBD29eEHDGwxycJ"
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
X-List-Received-Date: Tue, 16 Apr 2019 10:57:41 -0000

--6xf2RU8KCqchI7Mz8lYBD29eEHDGwxycJ
Content-Type: multipart/mixed; boundary="VYr1k10nvU4RBgPX6FGkKciSWTeZUHDXE";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Mailing List <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Message-ID: <0021cf73-afee-ee0f-74d6-1a2f3034c5fe@yadro.com>
Subject: [PATCHv2-modified dev-4.19 2/7] clk: Aspeed: Add sdhci reset and
 clock
References: <cover.1555409110.git.a.amelkin@yadro.com>
In-Reply-To: <cover.1555409110.git.a.amelkin@yadro.com>

--VYr1k10nvU4RBgPX6FGkKciSWTeZUHDXE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

From: Ryan Chen <ryanchen.aspeed@gmail.com>

1.Add Aspeed sdhci reset for SCU04 bit 16
2.Aspeed sdhci have two clock one is for controller clock,
another is for SD card clock. so when enable sdhci need enable
both.

Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
---
 drivers/clk/clk-aspeed.c                 | 8 +++++++-
 include/dt-bindings/clock/aspeed-clock.h | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index 9cddd40..387d82a 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -20,6 +20,7 @@
=20
 #define ASPEED_RESET_CTRL	0x04
 #define ASPEED_CLK_SELECTION	0x08
+#define  ASPEED_SDIO_CLK_EN BIT(15)
 #define ASPEED_CLK_STOP_CTRL	0x0c
 #define ASPEED_MPLL_PARAM	0x20
 #define ASPEED_HPLL_PARAM	0x24
@@ -260,6 +261,11 @@ static int aspeed_clk_enable(struct clk_hw *hw)
 	enval =3D (gate->flags & CLK_GATE_SET_TO_DISABLE) ? 0 : clk;
 	regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, enval);
=20
+	/* sd ext clk */
+	if (gate->reset_idx =3D=3D 16) {
+		regmap_update_bits(gate->map, ASPEED_CLK_SELECTION, ASPEED_SDIO_CLK_EN=
, ASPEED_SDIO_CLK_EN);
+	}
+
 	if (gate->reset_idx >=3D 0) {
 		/* A delay of 10ms is specified by the ASPEED docs */
 		mdelay(10);
@@ -317,7 +323,7 @@ static const u8 aspeed_resets[] =3D {
 	[ASPEED_RESET_PECI]	=3D 10,
 	[ASPEED_RESET_I2C]	=3D  2,
 	[ASPEED_RESET_AHB]	=3D  1,
-
+	[ASPEED_RESET_SDHCI]	=3D 16,
 	/*
 	 * SCUD4 resets start at an offset to separate them from
 	 * the SCU04 resets.
diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindin=
gs/clock/aspeed-clock.h
index f437386..0fd6cba 100644
--- a/include/dt-bindings/clock/aspeed-clock.h
+++ b/include/dt-bindings/clock/aspeed-clock.h
@@ -50,5 +50,5 @@
 #define ASPEED_RESET_I2C		7
 #define ASPEED_RESET_AHB		8
 #define ASPEED_RESET_CRT1		9
-
+#define ASPEED_RESET_SDHCI		10
 #endif
--=20
2.7.4



--VYr1k10nvU4RBgPX6FGkKciSWTeZUHDXE--

--6xf2RU8KCqchI7Mz8lYBD29eEHDGwxycJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJctbUfAAoJEOiTWHtbdBeNfykP/0Buj9ppQglAULvjoT/N0cEW
IxApVwqlux36YRq3OzC0HHNqq+asYJtEaEh0Qb4drwJLqWJGSPd6uVQRVJAy7t2+
Xv++zqWDp6K4YOSCYjnfzKWGEcxStM0tCgz10xIoT7Lc+oocYhkW1bfDfJlRRD2O
qU+9pGsCqO3+oZFjGPpOaGGfeKyuEyEohkwmnaMVF4pr8JrNG+G1u0ogYcIhdttR
uivNhPwdyD51D/tpmmg5oXHKi3XHa8AKMOaQc1wDmU6xgmOtn/IygTghEB3w7TTm
1AksFwQdxU8lb/FSdnTG6ks4vCCUW6LCg4piF9c9E04sNczMV5rQgkfSQ70Q9CaH
n8oKvtg+cT9tNFQUmupXXd18EAPZ9g5a39Pgsa/tCOPiYg3LhGuH4jT/VP9xdXg8
Iz8BeZyxkmhd+p9wkdRO5qLUQtByiUPGVJYh358lsiMtpUGAb3KRYAYNOj28FfCz
lIXkaiMxaeBArfkec2VlS9jBVIZ8cTkmbp8r7TG+bEEpzdzIIvqRjdfYyQEtl4uF
eOb23qBz9/nJJphqh+Jd3QmYG0kgOPkXTznl4nIDJAZS2A+9TR46TZ5EzEv8ovZs
L7DSuV3Z7mMv6520a40q7eP6TgTXGAMtW5ftkXqzlFBWeUz9t7pcMzUAH2R7dzWF
eX1spla8mLDl2g5pypc3
=uBHX
-----END PGP SIGNATURE-----

--6xf2RU8KCqchI7Mz8lYBD29eEHDGwxycJ--
