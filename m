Return-Path: <prvs=5882d5dada=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5882d5dada=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="m3Dro82y"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43DDfs4wSYzDqTk
 for <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 07:08:53 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id wBAK8V7c028452
 for <openbmc@lists.ozlabs.org>; Mon, 10 Dec 2018 12:08:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=facebook; bh=vDMHH7kVNxyVk8Fng38m06gHInfn+XQCbFE45M2pZ6c=;
 b=m3Dro82yeILDIBzaAZ3qVFp98m8l+28ybr8IbeMkGoosEwyeLRWZvDZkDLhc7tSJ7DUr
 Et2LSy/ici9eqe4xGK9zjPVfCNgw/QorOz/tHTEGhgnmyNzYbyhSRtHJgvNzMPCpRaUw
 bU1M6RFFHfn01YnWjF1j7yxpmCrGbVDZR2g= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by m0001303.ppops.net with ESMTP id 2p9upn0pj3-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 10 Dec 2018 12:08:50 -0800
Received: from mx-out.facebook.com (2620:10d:c0a1:3::13) by
 mail.thefacebook.com (2620:10d:c021:18::175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3;
 Mon, 10 Dec 2018 12:08:16 -0800
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)
 id AC6CF4BDB09D; Mon, 10 Dec 2018 12:08:15 -0800 (PST)
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
Subject: [PATCH] ARM: dts: aspeed: Add KCS support for LPC BMC
Date: Mon, 10 Dec 2018 12:07:52 -0800
Message-ID: <20181210200753.3018124-2-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181210200753.3018124-1-vijaykhemka@fb.com>
References: <20181210200753.3018124-1-vijaykhemka@fb.com>
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-10_06:, , signatures=0
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
X-List-Received-Date: Mon, 10 Dec 2018 20:08:54 -0000

Added kcs device support for lpc BMC.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index d107459fc0f8..1bd48655bacb 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -330,8 +330,35 @@
 				ranges = <0x0 0x1e789000 0x1000>;
 
 				lpc_bmc: lpc-bmc@0 {
-					compatible = "aspeed,ast2500-lpc-bmc";
+					compatible = "aspeed,ast2500-lpc-bmc, "simple-mfd", "syscon"";
 					reg = <0x0 0x80>;
+					reg-io-width = <4>;
+
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges = <0x0 0x0 0x80>;
+
+					kcs1: kcs1@0 {
+						compatible = "aspeed,ast2500-kcs-bmc";
+						reg = <0x0 0x80>;
+						interrupts = <8>;
+						kcs_chan = <1>;
+						status = "disabled";
+					};
+					kcs2: kcs2@0 {
+						compatible = "aspeed,ast2500-kcs-bmc";
+						reg = <0x0 0x80>;
+						interrupts = <8>;
+						kcs_chan = <2>;
+						status = "disabled";
+					};
+					kcs3: kcs3@0 {
+						compatible = "aspeed,ast2500-kcs-bmc";
+						reg = <0x0 0x80>;
+						interrupts = <8>;
+						kcs_chan = <3>;
+						status = "disabled";
+					};
 				};
 
 				lpc_host: lpc-host@80 {
-- 
2.17.1
