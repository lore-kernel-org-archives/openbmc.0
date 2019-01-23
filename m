Return-Path: <prvs=69266c3e89=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=69266c3e89=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Puf/wGkU"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lLXr3qsTzDqHZ
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 10:07:40 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0NMxvbE005216
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 15:07:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=mw2Se00uQPELWHjBZyhQPnW3g6bdq8Gqz6xg7vQx+UQ=;
 b=Puf/wGkUlgCL02rBFrfdRU2MGYaU5EjRSygEwYmhdCmyYpMOm+pAqSDhzGR/pwfAWzWv
 tnBSxHAtMy0tx66AG18hV/UR122jqXllWSXJR2WYjbN9DGF5tIseW4vZ1TQUnz1VzD1z
 9iTI6d8f4Q1xT7Q2WSAqCjX/Q0qS01bIiho= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2q714ng3hs-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 15:07:37 -0800
Received: from mx-out.facebook.com (2620:10d:c081:10::13) by
 mail.thefacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3;
 Wed, 23 Jan 2019 15:07:36 -0800
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)
 id 44BA7861B078; Wed, 23 Jan 2019 15:07:36 -0800 (PST)
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
Subject: [PATCH 1/2] ARM: dts: aspeed: Add peci and lpc for Facebook
Date: Wed, 23 Jan 2019 15:07:32 -0800
Message-ID: <20190123230733.1821501-1-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-23_11:, , signatures=0
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
X-List-Received-Date: Wed, 23 Jan 2019 23:07:41 -0000

Added lpc control for enabling lpc clock, peci for cpu sensors and lpc
snoop devices to Facebook Tiogapass device tree.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 .../arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
index 73e58a821613..d60dbb019f82 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
@@ -54,6 +54,16 @@
 	};
 };
 
+&lpc_snoop {
+	status = "okay";
+	snoop-ports = <0x80>;
+};
+
+&lpc_ctrl {
+	// Enable lpc clock
+	status = "okay";
+};
+
 &uart1 {
 	// Host Console
 	status = "okay";
@@ -67,6 +77,10 @@
 	status = "okay";
 };
 
+&peci0 {
+	status = "okay";
+};
+
 &kcs2 {
 	// BMC KCS channel 2
 	status = "okay";
-- 
2.17.1
