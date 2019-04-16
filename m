Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="ICnEugVW"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44k2Qw21z1zDqDB
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 20:58:16 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 4107041980;
 Tue, 16 Apr 2019 10:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:references:subject:subject
 :from:from:received:received:received; s=mta-01; t=1555412292;
 x=1557226693; bh=P9MfQrj1z+c4SiOzoPZPekCBHaXsU9FwM4B0/7js8cA=; b=
 ICnEugVW1zuWCyl1CRkvzwkDEwvQTDr0seQRgHOwsUTstVRHR5wct8plbQTpkJEA
 8ssi0g1KbV1WlFB2lR2+kV9QWPTAWlRZi5btisRCojYl8QxVJA2AdNqw6f08KinN
 kxwxWTYvhC0tj37JMtg9yZN9LUKg+eEJziDPCtnpPc0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pt7PbDk0JtFM; Tue, 16 Apr 2019 13:58:12 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0B08841943;
 Tue, 16 Apr 2019 13:58:12 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 16
 Apr 2019 13:58:11 +0300
From: Alexander Amelkin <a.amelkin@yadro.com>
Subject: [PATCHv2-modified dev-4.19 6/7] dts: Aspeed: Add devicetree for
 Aspeed sdhci
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Mailing List <openbmc@lists.ozlabs.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>
References: <cover.1555409110.git.a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <9e52bbea-b2e5-a496-3a29-1973bc1d09ed@yadro.com>
Date: Tue, 16 Apr 2019 13:58:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <cover.1555409110.git.a.amelkin@yadro.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0pMSvxgVWIAIxUJzSN4E1w1XO3lrM1rI0"
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
X-List-Received-Date: Tue, 16 Apr 2019 10:58:17 -0000

--0pMSvxgVWIAIxUJzSN4E1w1XO3lrM1rI0
Content-Type: multipart/mixed; boundary="yMw6DXir1XmdSguP3SEAN93fzVHWX8e1i";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Mailing List <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Message-ID: <9e52bbea-b2e5-a496-3a29-1973bc1d09ed@yadro.com>
Subject: [PATCHv2-modified dev-4.19 6/7] dts: Aspeed: Add devicetree for
 Aspeed sdhci
References: <cover.1555409110.git.a.amelkin@yadro.com>
In-Reply-To: <cover.1555409110.git.a.amelkin@yadro.com>

--yMw6DXir1XmdSguP3SEAN93fzVHWX8e1i
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

From: Ryan Chen <ryanchen.aspeed@gmail.com>

Add devicetree for Aspeed's sdhci

Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
---
 .../bindings/mmc/aspeed,aspeed-sdhci.txt           | 42 ++++++++++++++++=
++++++
 arch/arm/boot/dts/aspeed-ast2500-evb.dts           | 14 ++++++++
 arch/arm/boot/dts/aspeed-g4.dtsi                   | 20 +++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi                   | 20 +++++++++++
 4 files changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/aspeed,aspeed-s=
dhci.txt

diff --git a/Documentation/devicetree/bindings/mmc/aspeed,aspeed-sdhci.tx=
t b/Documentation/devicetree/bindings/mmc/aspeed,aspeed-sdhci.txt
new file mode 100644
index 0000000..64ca527
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/aspeed,aspeed-sdhci.txt
@@ -0,0 +1,42 @@
+Device Tree Bindings for the ASPEED SoC SDHCI Controller
+
+This file documents differences between the core properties in mmc.txt
+and the properties present in the ASPEED SDHCI
+
+Required properties:
+- compatible : should be "aspeed,ast2500-sdhci" or "aspeed,ast2400-sdhci=
"
+- clocks : phandle + clock specifier pair of the external clock
+- interrupts : interrupt number
+- interrupt-parent : interrupt controller for bus, should reference a
+                     aspeed,aspeed-sdhci-ic interrupt controller
+
+Example:
+
+sdhci {
+	compatible =3D "simple-bus";
+	#address-cells =3D <1>;
+	#size-cells =3D <1>;
+	ranges =3D <0 0x1e740000 0x1000>;
+
+	sdhci_ic: interrupt-controller@0 {
+		#interrupt-cells =3D <1>;
+		compatible =3D "aspeed,aspeed-sdhci-irq";
+		reg =3D <0x0 0x100>;
+		interrupts =3D <26>;
+		interrupt-controller;
+		clocks =3D <&syscon ASPEED_CLK_GATE_SDCLK>;
+		clock-names =3D "sdclk", "sd_extclk";
+	};
+
+	sdhci_slot0: sdhci_slot0@100 {
+		compatible =3D "aspeed,sdhci-ast2500";
+		reg =3D <0x100 0x100>;
+		interrupts =3D <0>;
+		interrupt-parent =3D <&sdhci_ic>;
+		slot =3D <0>;
+		sdhci,auto-cmd12;
+		clocks =3D <&syscon ASPEED_CLK_SDIO>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_sd1_default>;
+	};
+};
diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts=
/aspeed-ast2500-evb.dts
index 5dbb33c..5578ae0 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -97,6 +97,20 @@
 	};
 };
=20
+&sdhci_slot0 {
+	status =3D "okay";
+
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_sd1_default>;
+};
+
+&sdhci_slot1 {
+	status =3D "okay";
+
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_sd2_default>;
+};
+
 /*
  * Enable port A as device (via the virtual hub) and port B as
  * host by default on the eval board. This can be easily changed
diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
index f637a80..c9e7664 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -424,6 +424,26 @@
 		clocks =3D <&syscon ASPEED_CLK_GATE_SDCLK>;
 	};
=20
+	sdhci_slot0: sdhci_slot0@100 {
+		compatible =3D "aspeed,sdhci-ast2400";
+		reg =3D <0x100 0x100>;
+		interrupts =3D <0>;
+		interrupt-parent =3D <&sdhci_ic>;
+		sdhci,auto-cmd12;
+		clocks =3D <&syscon ASPEED_CLK_SDIO>;
+		status =3D "disabled";
+	};
+
+	sdhci_slot1: sdhci_slot1@200 {
+		compatible =3D "aspeed,sdhci-ast2400";
+		reg =3D <0x200 0x100>;
+		interrupts =3D <1>;
+		interrupt-parent =3D <&sdhci_ic>;
+		sdhci,auto-cmd12;
+		clocks =3D <&syscon ASPEED_CLK_SDIO>;
+		status =3D "disabled";
+	};
+
 };
=20
 &i2c {
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
index 53292f4..3b9dbc9 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -528,6 +528,26 @@
 		clocks =3D <&syscon ASPEED_CLK_GATE_SDCLK>;
 	};
=20
+	sdhci_slot0: sdhci_slot0@100 {
+		compatible =3D "aspeed,sdhci-ast2500";
+		reg =3D <0x100 0x100>;
+		interrupts =3D <0>;
+		interrupt-parent =3D <&sdhci_ic>;
+		sdhci,auto-cmd12;
+		clocks =3D <&syscon ASPEED_CLK_SDIO>;
+		status =3D "disabled";
+	};
+
+	sdhci_slot1: sdhci_slot1@200 {
+		compatible =3D "aspeed,sdhci-ast2500";
+		reg =3D <0x200 0x100>;
+		interrupts =3D <1>;
+		interrupt-parent =3D <&sdhci_ic>;
+		sdhci,auto-cmd12;
+		clocks =3D <&syscon ASPEED_CLK_SDIO>;
+		status =3D "disabled";
+	};
+
 };
=20
 &i2c {
--=20
2.7.4



--yMw6DXir1XmdSguP3SEAN93fzVHWX8e1i--

--0pMSvxgVWIAIxUJzSN4E1w1XO3lrM1rI0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJctbVDAAoJEOiTWHtbdBeNxToQAJaNzVqa2ooOJlK+HqZ/RGPe
0WWRqS6aj1UyyMmqF0pbvqMC5F61r/L4Y53IRGr4/BYjAMAMEM8sObFMkN9dZYoD
SyXP1Kv6YqXFXEekZcwsUTEbwaQwVT7lAiz//qLucat2qASJrr5w5AtCOlnihAiR
3oxvpnSFD6M01M8z5oRbIXN8Z0gOyAvhTf5ozwh7DkoR+vi2rrhNAiLvvM7Jws1L
ZidiDxTZFh06iC/ThzsvhNER2Xu+7bO2rixmCmrNR3HaFxQK1JZAgkueFyfNrv4k
6z+l55zpgIE0rfoEsL+DpKVbviulj/+fiIbbdOJFkKM2yNDyOEpD1jrKJdyASIJk
hYOURd6kYTiJlqMhxIhfV2Oy6O4Y0o5TVwPw80UXk5ABAC1w+Bh27+e56Ok08I+u
M5cbESo9o6JFxHEur/OpcFN/I433DYC2rUvAyZGaQJRSNhZOYo0nDlIb3ItOz0LZ
W+/B3Tjm8HHkWmxntpkx1zw1Cv9SuOM6I0+rorToIy6DppHh2BAyOVfDYl7uQabi
JDhwsnrm5np4VtR5MtsNZSTNAmSqC9EgVY6wMp2ceGm+XIVIuyGXjK5gVDcGxX5j
U+qXQ8xGVwW8Marv2LBQQ0s7Rn/uxVsXyh0u46DDLlMXV2IVlDcfxRXruK8XoqdQ
4p5DwVVImUvjX/cOzZGM
=YMBA
-----END PGP SIGNATURE-----

--0pMSvxgVWIAIxUJzSN4E1w1XO3lrM1rI0--
