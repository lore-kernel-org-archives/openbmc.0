Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="ENkqERAe"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44k2QV4CN8zDqDl
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 20:57:53 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3B3BA41980;
 Tue, 16 Apr 2019 10:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:references:subject:subject
 :from:from:received:received:received; s=mta-01; t=1555412269;
 x=1557226670; bh=6zrqy9i5RmWIDiN9QtXIsoVeVKt5LUZSV/D+Wge0c+g=; b=
 ENkqERAeSQgRUaCONUY6AXq0JRpgL3aWtX57/IzwEQd0AXAN6WroagbSJelwET9D
 qv2aiQtK93x4B4Lzxta00QxqHI5YakAUGWvMikvHJDkOFC2V7Thwzi3pbX5h/jTz
 9+2f3AtFNP6VEnPrBiKWAqTCsenJWUBPRENKfFh2BhU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YRlF46lrFTmB; Tue, 16 Apr 2019 13:57:49 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 15FA141943;
 Tue, 16 Apr 2019 13:57:49 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 16
 Apr 2019 13:57:48 +0300
From: Alexander Amelkin <a.amelkin@yadro.com>
Subject: [PATCHv2-modified dev-4.19 4/7] dts: Aspeed: Add Aspeed sdhci dts
 document
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Mailing List <openbmc@lists.ozlabs.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>
References: <cover.1555409110.git.a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <fb0e9958-777c-f1fb-fad1-a41cfa91cdeb@yadro.com>
Date: Tue, 16 Apr 2019 13:57:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <cover.1555409110.git.a.amelkin@yadro.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ZoJkwXCcWW3z5PgLyjecxLNGzeyS6vPW6"
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
X-List-Received-Date: Tue, 16 Apr 2019 10:57:55 -0000

--ZoJkwXCcWW3z5PgLyjecxLNGzeyS6vPW6
Content-Type: multipart/mixed; boundary="XMTZINzgUxduMExdwSpw9fiJXBOiccG2v";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Mailing List <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Message-ID: <fb0e9958-777c-f1fb-fad1-a41cfa91cdeb@yadro.com>
Subject: [PATCHv2-modified dev-4.19 4/7] dts: Aspeed: Add Aspeed sdhci dts
 document
References: <cover.1555409110.git.a.amelkin@yadro.com>
In-Reply-To: <cover.1555409110.git.a.amelkin@yadro.com>

--XMTZINzgUxduMExdwSpw9fiJXBOiccG2v
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

From: Ryan Chen <ryanchen.aspeed@gmail.com>

This add Aspeed sdhci irq driver's dts file and devicetree document

Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
---
 .../aspeed,aspeed-sdhci-ic.txt                     | 25 ++++++++++++++++=
++++++
 arch/arm/boot/dts/aspeed-g4.dtsi                   | 20 ++++++++++++++++=
+
 arch/arm/boot/dts/aspeed-g5.dtsi                   | 20 ++++++++++++++++=
+
 3 files changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/aspeed,aspeed-sdhci-ic.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspee=
d,aspeed-sdhci-ic.txt b/Documentation/devicetree/bindings/interrupt-contr=
oller/aspeed,aspeed-sdhci-ic.txt
new file mode 100644
index 0000000..87b042c
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,aspee=
d-sdhci-ic.txt
@@ -0,0 +1,25 @@
+Device tree configuration for the SDHCI Interrupt Controller on the AST2=
4XX and
+AST25XX SoCs.
+
+Required Properties:
+- #address-cells	: should be 1
+- #size-cells 		: should be 1
+- #interrupt-cells 	: should be 1
+- compatible 		: should be "aspeed,aspeed-sdhci-ic"
+- reg			: address start and range of controller
+- interrupts		: interrupt number
+- interrupt-controller	: denotes that the controller receives and fires
+			  new interrupts for child busses
+
+Example:
+
+sdhci_ic: interrupt-controller@0 {
+	#interrupt-cells =3D <1>;
+	#size-cells =3D <1>;
+	#interrupt-cells =3D <1>;
+	compatible =3D "aspeed,aspeed-sdhci-irq";
+	reg =3D <0x0 0x100>;
+	interrupts =3D <26>;
+	interrupt-controller;
+	clocks =3D <&syscon ASPEED_CLK_GATE_SDCLK>;
+};
\ No newline at end of file
diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
index 52c7515..f637a80 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -191,6 +191,13 @@
 				reg =3D <0x1e720000 0x8000>;	// 32K
 			};
=20
+			sdhci: sdhci@1e740000 {
+				compatible =3D "simple-bus";
+				#address-cells =3D <1>;
+				#size-cells =3D <1>;
+				ranges =3D <0 0x1e740000 0x1000>;
+			};
+
 			gpio: gpio@1e780000 {
 				#gpio-cells =3D <2>;
 				gpio-controller;
@@ -406,6 +413,19 @@
 	};
 };
=20
+&sdhci {
+
+	sdhci_ic: interrupt-controller@0 {
+		#interrupt-cells =3D <1>;
+		compatible =3D "aspeed,aspeed-sdhci-irq";
+		reg =3D <0x0 0x100>;
+		interrupts =3D <26>;
+		interrupt-controller;
+		clocks =3D <&syscon ASPEED_CLK_GATE_SDCLK>;
+	};
+
+};
+
 &i2c {
 	i2c_ic: interrupt-controller@0 {
 		#interrupt-cells =3D <1>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
index d8a9d20..53292f4 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -257,6 +257,13 @@
 				reg =3D <0x1e720000 0x9000>;	// 36K
 			};
=20
+			sdhci: sdhci@1e740000 {
+				compatible =3D "simple-bus";
+				#address-cells =3D <1>;
+				#size-cells =3D <1>;
+				ranges =3D <0 0x1e740000 0x1000>;
+			};
+
 			gpio: gpio@1e780000 {
 				#gpio-cells =3D <2>;
 				gpio-controller;
@@ -510,6 +517,19 @@
 	};
 };
=20
+&sdhci {
+
+	sdhci_ic: interrupt-controller@0 {
+		#interrupt-cells =3D <1>;
+		compatible =3D "aspeed,aspeed-sdhci-irq";
+		reg =3D <0x0 0x100>;
+		interrupts =3D <26>;
+		interrupt-controller;
+		clocks =3D <&syscon ASPEED_CLK_GATE_SDCLK>;
+	};
+
+};
+
 &i2c {
 	i2c_ic: interrupt-controller@0 {
 		#interrupt-cells =3D <1>;
--=20
2.7.4



--XMTZINzgUxduMExdwSpw9fiJXBOiccG2v--

--ZoJkwXCcWW3z5PgLyjecxLNGzeyS6vPW6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJctbUsAAoJEOiTWHtbdBeN1VEP/irXEfEpsgNIvHEjwMycnaYZ
Tk5E8BiFFoOddiy5ax2NHQifefWGG83mnq4r7JG1fJ4rL7O467zvtCBqCwP6FYyC
Vu03xKd/evsUdWeQ2gHhfSXYlXJg0tTX4zD3HrRtNfagAMewkjzXNCwRB3nAYsGt
DQ85op3Sk6Hlo1oeDhmNpb12t71G09AZXYunAL679IVPbkHGW/lvMbL5QHLl/KZa
Wbj0W8fklJzqpzbp7Mjd7g7gC1fKmHluujY+xRdxhFvVsZHmLqPh636fPf1oIiak
XCSZDBseO3hXSUWRVanu2mAA2pcFql9zs/V8QgJw171gymFItEfjfyF4fKGU6aMQ
Cw4rYpZlI4cIfyrGrijk8HocyRMVUkUYTf/OC1CBeNOKmaPXhp6D+ijsljOv6S0P
U/lL7qye6qd95mKpZmag1bvWkNjjLzaaVk9DXjZY3lSgJgDOFhUQif+N9uLROJu+
RoTPcOgmrVjqqpDKiTQSMe8kWot/axOMn88RZQ0B5/3hFfQ0EKrdujhJ89OMk81j
2VUpehO54sUZAdxx6BS1Ur0DA+ILF8d5o7hrZehhf29nuT4oGd0Hqezd86F8UySF
nGfNmiBQifM/8ioxl+bx+d/S/oOc1d28Qjsd0o2aT5KHgTrKqyoF1McQX4tIsoAF
iLuylxcAcQLp3Gf8cHM6
=7qHi
-----END PGP SIGNATURE-----

--ZoJkwXCcWW3z5PgLyjecxLNGzeyS6vPW6--
