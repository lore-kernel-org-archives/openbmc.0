Return-Path: <adamliyi@msn.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=msn.com
 (client-ip=40.92.254.90; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=adamliyi@msn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=msn.com header.i=@msn.com header.b="UGkpLPeW"; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-oln040092254090.outbound.protection.outlook.com [40.92.254.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y3Gst5fr8zDsPN
 for <openbmc@lists.ozlabs.org>; Fri, 29 Sep 2017 13:16:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=msn.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=h0JEL2J93KJt+iBBHXbDl9D/P+FaSJBp8FQk6t0+VwE=;
 b=UGkpLPeW/kB2D0MyAhWCzc+8AdRJKvDHiLXwgo7XBQ4OjBXNHm0R/vRQT7sSS+a5qVgLbfcDam72nVbM99X2rY/cYKSwzLy9mfF4hV++7N8KQcZ9ly4DKBDBuhPA4knse5YDsf85AYR8eYDluLUkmvvBYFbpo7DyDIsRPCVw2zyz4eW2EdVQUAtxGceyKtCsEHnJiRQqPXFkmcTJ1znkPDaqwFKB4T/BkMm3HPS0nsW999F0DxhAEiaXIl6TxFsmcM4IGczZDagG1Ujr7bziv9SJ3i8q7V4GUZIYqG7cilnsapATZU5TxZFArC3PVN29hL5SheSuQqXjZuPtuONJCw==
Received: from SG2APC01FT003.eop-APC01.prod.protection.outlook.com
 (10.152.250.56) by SG2APC01HT075.eop-APC01.prod.protection.outlook.com
 (10.152.251.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.20.56.11; Fri, 29
 Sep 2017 03:15:56 +0000
Received: from HK2PR02MB1524.apcprd02.prod.outlook.com (10.152.250.55) by
 SG2APC01FT003.mail.protection.outlook.com (10.152.250.130) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.20.56.11 via
 Frontend Transport; Fri, 29 Sep 2017 03:15:56 +0000
Received: from HK2PR02MB1524.apcprd02.prod.outlook.com
 ([fe80::7da1:6be6:d32a:2393]) by HK2PR02MB1524.apcprd02.prod.outlook.com
 ([fe80::7da1:6be6:d32a:2393%13]) with mapi id 15.20.0077.016; Fri, 29 Sep
 2017 03:15:56 +0000
From: Yi Li <adamliyi@msn.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [PATCH] arm:dts: add max31785 to Garrison device tree
Thread-Topic: [PATCH] arm:dts: add max31785 to Garrison device tree
Thread-Index: AQHTONFDbUHzIQrd2kmC1eLrJlRoaA==
Date: Fri, 29 Sep 2017 03:15:56 +0000
Message-ID: <HK2PR02MB15240578C4FBBB5691498874D97E0@HK2PR02MB1524.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=msn.com;
x-incomingtopheadermarker: OriginalChecksum:08BBF81750583F8D9752FCCE9B7878C6327A2115C3DE991A505F43166761EC74;
 UpperCasedChecksum:EB09BBEFDDBB8AF2EE8841E432F95AF8173D7C80919733629D04F35945C8417E;
 SizeAsReceived:6890; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [zQCGvPRvYs0sFxH58Y+wxMt66/55lDTw]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SG2APC01HT075;
 6:aC7uIwODaHdEAf2Tr5/kjDyWX1qOkcVkfao95zS00wzd+VgfeocZXph9WDg6ycveso6r6nO4oTmbaD71ABaCmHghFJK8wgEjX4oZMbSfDk71pvAzkWVgCQQWXpMf0cOumob/r5WSVebuQZ5fEviwERWrqU3AQQYud3XNK0MJ5qmK4+vihuYN3QRyFKuCOxCiXzJomkq59smOUvjtqZXOs+m2CSziq4YsPZwF1cV6VNrBVtG4K3jbZl8ogral5Or3mbeSqgVg1/h8Fu97eLhHQSRd9II2L83FCC1FV7UC3p7pQJDQnqc3ZMzigvYPo+cG0Lg7zWQzKDrox2Tjku/P9Q==;
 5:fDzXr419D9EspTRKImu/pqSstnbk+MGMNxiH31/GF/Hu1UY6pe7NIwItWVYms3rRW7zku7+oT/3fOJeVrkHc4wiPX3Xhq3l/Fd/zdaRxZTcI4vxCLTzGl6Q+1fKGbdKE1VhfDcpWsJkaOt0JrquZzA==;
 24:Csv1DMZcyjrUnU51YS3krLrb380MlXGFLnKTOn1bChCzyD1+kh+S7FR8UpEdwb8uSNevnBENaMtQotSHlpcHOy4osc4RBVDD6XdH5RUNcUA=;
 7:yNWJguCT+fOZYceyCSulGIYinQIIWPMFMaTmCehZxZYkvT+ovB2iDr22ti3bjuLZl/NoMHKn1+YNUNqHt4eZ1AjGWT7HqEPIacdhw2IomQZsNQp619JrCCXd0+Aq6JMSsUK5cxEYfOlvR6OCZJbdcL5SSa0vBDq6kM4Yl6zgNHYKrUi54h1fp12SRJuKv+MdJZweQ6TSfLgBIvREaNYWzQA0kjRXh77N+/VGu8hDkqc=
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 578700d2-f490-463c-1d67-08d506e8660c
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(22001)(201702061074)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(2017031322404)(1601125374)(1603101448)(1701031045);
 SRVR:SG2APC01HT075; 
x-ms-traffictypediagnostic: SG2APC01HT075:
x-exchange-antispam-report-test: UriScan:(219297518888565);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(444000031);
 SRVR:SG2APC01HT075; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:SG2APC01HT075; 
x-forefront-prvs: 0445A82F82
x-forefront-antispam-report: SFV:NSPM; SFS:(7070007)(98901004); DIR:OUT;
 SFP:1901; SCL:1; SRVR:SG2APC01HT075; H:HK2PR02MB1524.apcprd02.prod.outlook.com;
 FPR:; SPF:None; LANG:; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4C0BEE5EB157924081880C7FFA9E781E@apcprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2017 03:15:56.1417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT075
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Sep 2017 03:16:04 -0000

Add max31785 device tree node to enable Fan Control on Garrison.

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts | 89 +++++++++++++++++++++++=
++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/=
dts/aspeed-bmc-opp-garrison.dts
index c67fe58..6b96e36 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
@@ -63,6 +63,95 @@
 	status =3D "okay";
 };
=20
+&i2c3 {
+	status =3D "okay";
+
+	// FIR (fan / SATA backplane)
+	max31785@52 {
+		compatible =3D "max,max31785";
+		reg =3D <0x52>;
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		fan@0 {
+			compatible =3D "pmbus-fan";
+			reg =3D <0>;
+			tach-pulses =3D <2>;
+			maxim,fan-rotor-input =3D "tach";
+			maxim,fan-pwm-freq =3D <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp =3D <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@1 {
+			compatible =3D "pmbus-fan";
+			reg =3D <1>;
+			tach-pulses =3D <2>;
+			maxim,fan-rotor-input =3D "tach";
+			maxim,fan-pwm-freq =3D <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp =3D <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@2 {
+			compatible =3D "pmbus-fan";
+			reg =3D <2>;
+			tach-pulses =3D <2>;
+			maxim,fan-rotor-input =3D "tach";
+			maxim,fan-pwm-freq =3D <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp =3D <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@3 {
+			compatible =3D "pmbus-fan";
+			reg =3D <3>;
+			tach-pulses =3D <2>;
+			maxim,fan-rotor-input =3D "tach";
+			maxim,fan-pwm-freq =3D <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp =3D <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@4 {
+			compatible =3D "pmbus-fan";
+			reg =3D <4>;
+			tach-pulses =3D <2>;
+			maxim,fan-rotor-input =3D "tach";
+			maxim,fan-pwm-freq =3D <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp =3D <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@5 {
+			compatible =3D "pmbus-fan";
+			reg =3D <5>;
+			tach-pulses =3D <2>;
+			maxim,fan-rotor-input =3D "tach";
+			maxim,fan-pwm-freq =3D <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp =3D <2>;
+			maxim,fan-fault-pin-mon;
+		};
+	};
+};
=20
 &i2c4 {
 	status =3D "okay";
--=20
1.9.1
