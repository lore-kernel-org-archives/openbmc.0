Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ddNk6y33zDqWj
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 22:56:38 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au
Cc: andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH v4 linuux dev-5.3 09/10] ARM: dts: aspeed: rainier: Add mac
 devices
Date: Wed, 25 Sep 2019 08:56:09 -0400
Message-Id: <20190925125610.12096-10-bradleyb@fuzziesquirrel.com>
In-Reply-To: <20190925125610.12096-1-bradleyb@fuzziesquirrel.com>
References: <20190925125610.12096-1-bradleyb@fuzziesquirrel.com>
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 25 Sep 2019 12:56:39 -0000

Rainier contains two network devices.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
v4: add Andrew's review
v3: new for v3
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot=
/dts/aspeed-bmc-ibm-rainier.dts
index 080cd51b2a41..fd9f3529f0c3 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -55,3 +55,17 @@
 	status =3D "okay";
 	memory-region =3D <&flash_memory>;
 };
+
+&mac2 {
+	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_rmii3_default>;
+	use-ncsi;
+};
+
+&mac3 {
+	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_rmii4_default>;
+	use-ncsi;
+};
--=20
2.21.0
