Return-Path: <prvs=5882d5dada=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=5882d5dada=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="QffokOpy"; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43DDjK2XnVzDr6T
 for <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 07:11:00 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 wBAK482v032718
 for <openbmc@lists.ozlabs.org>; Mon, 10 Dec 2018 12:10:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=9S7Huczn8dJSngKp1fJ/ZoCzFYxIA5gUIBVyYjRoTLU=;
 b=QffokOpyfi//hL2IyemcfdcwlDfvIq0yw8youxXiGgk8ozHdIb3a+NMgeAb+pZeJuHJk
 tf9L+bMva4W69EOkSj6d0lVEJo+lxr5La1gj0kI8gxVe/u/GtrWjRCU/Nr7nvGWgndHQ
 WPouJKSlCvn/rY25BDmyH/jfyCNV7aA7W68= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2p9vdprmnd-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 10 Dec 2018 12:10:58 -0800
Received: from mx-out.facebook.com (2620:10d:c081:10::13) by
 mail.thefacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3;
 Mon, 10 Dec 2018 12:08:24 -0800
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)
 id 7035E4BDB09B; Mon, 10 Dec 2018 12:08:15 -0800 (PST)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
CC: <vijaykhemka@fb.com>, "openbmc @ lists . ozlabs . org"
 <openbmc@lists.ozlabs.org>
Smtp-Origin-Cluster: prn2c23
Subject: [PATCH 1/2] ARM: dts: aspeed: Add KCS & lpc ctrl for Facebook
Date: Mon, 10 Dec 2018 12:07:51 -0800
Message-ID: <20181210200753.3018124-1-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-10_07:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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
X-List-Received-Date: Mon, 10 Dec 2018 20:11:02 -0000

Added kcs device and lpc ctrl device to enable LPC clock in Facebook
Tiogapass device tree.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 .../dts/aspeed-bmc-facebook-tiogapass.dts     | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
index d9d7f208788a..9544fa2c1822 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
@@ -21,6 +21,18 @@
 	memory@80000000 {
 		reg = <0x80000000 0x20000000>;
 	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		flash_memory: region@98000000 {
+			no-map;
+			reg = <0x98000000 0x04000000>; /* 64M */
+		};
+	};
+
 	iio-hwmon {
 		compatible = "iio-hwmon";
 		oemname0 = "MB_P3V3";
@@ -62,6 +74,12 @@
 	};
 };
 
+&lpc_ctrl {
+	status = "okay";
+	memory-region = <&flash_memory>;
+	flash = <&spi1>;
+};
+
 &uart1 {
 	// Host Console
 	status = "okay";
@@ -75,6 +93,18 @@
 	status = "okay";
 };
 
+&kcs2 {
+	// BMC KCS channel 2
+	status = "okay";
+	kcs_addr = <0xca8>;
+};
+
+&kcs3 {
+	// BMC KCS channel 3
+	status = "okay";
+	kcs_addr = <0xca2>;
+};
+
 &mac0 {
 	status = "okay";
 
-- 
2.17.1
