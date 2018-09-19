Return-Path: <prvs=2800ee65b3=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=2800ee65b3=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="bATWan4i"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Flgt0w0pzDrhS
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 02:29:43 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8JGSN6o026729
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 09:29:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=3FSfz0SMePFFobY+QPJQevQqPinMJaseubL3+zFTHB8=;
 b=bATWan4i80WQ2su5NO3lDxa7BsYYy2S4P6e2ehdsB5HI+bO3K3R6uMMr+2sxlYKn96kl
 wCu9G95iC4m/QaWKaUBpu//lsnF97iks4bVoOGX0efDU/F7j1aUfwzQDvW9qXS6RVBYX
 TJQW7X5Bos1enjsOjiqx8bbrOut8W8KoIRM= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2mkt0880b5-7
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 09:29:41 -0700
Received: from mx-out.facebook.com (192.168.52.123) by mail.thefacebook.com
 (192.168.16.23) with Microsoft SMTP Server (TLS) id 14.3.361.1; Wed, 19 Sep
 2018 09:29:40 -0700
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)	id
 5F7411755F7F; Wed, 19 Sep 2018 09:29:38 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Thierry Reding
 <treding@nvidia.com>, David Lechner <david@lechnology.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Johan Hovold <johan@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <vijaykhemka@fb.com>, "openbmc @ lists . ozlabs . org"
 <openbmc@lists.ozlabs.org>
Smtp-Origin-Cluster: prn2c23
Subject: [PATCH 1/2] ARM: dt-bindings: aspeed: Facebook TiogaPass BMC
Date: Wed, 19 Sep 2018 09:29:16 -0700
Message-ID: <20180919162918.3994257-1-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-19_10:, , signatures=0
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
X-List-Received-Date: Wed, 19 Sep 2018 16:29:46 -0000

Initial introduction of Facebook TiogaPass family equipped with
Aspeed 2500 BMC SoC. TiogaPass is a x86 server development kit
with a ASPEED ast2500 BMC manufactured by Facebook.

This adds an entry of Facebook in Documentation for vendor prefix
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 2c3fc512e746..0520303ee5b8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -127,6 +127,7 @@ everspin	Everspin Technologies, Inc.
 exar	Exar Corporation
 excito	Excito
 ezchip	EZchip Semiconductor
+facebook	Facebook
 fairphone	Fairphone B.V.
 faraday	Faraday Technology Corporation
 fastrax	Fastrax Oy
-- 
2.17.1
