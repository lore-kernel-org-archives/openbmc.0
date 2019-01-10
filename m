Return-Path: <xiaoting.liu@hxt-semitech.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hxt-semitech.com
 (client-ip=223.203.96.7; helo=barracuda.hxt-semitech.com;
 envelope-from=xiaoting.liu@hxt-semitech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=hxt-semitech.com
Received: from barracuda.hxt-semitech.com (mx01.hxt-semitech.com
 [223.203.96.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43ZqcG6rKjzDqX7
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 13:26:05 +1100 (AEDT)
X-ASG-Debug-ID: 1547087088-093b7e40ef08350001-mgJK9t
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([10.128.0.15]) by
 barracuda.hxt-semitech.com with ESMTP id s050Yp5gHrq9w0zd (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
 Thu, 10 Jan 2019 10:24:50 +0800 (CST)
X-Barracuda-Envelope-From: xiaoting.liu@hxt-semitech.com
Received: from openbmc001.localdomain (10.5.21.169) by
 HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 10 Jan 2019 10:24:41 +0800
From: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
To: <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>
CC: <openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <shunyong.yang@hxt-semitech.com>,
 <dongsheng.wang@hxt-semitech.com>, Xiaoting Liu
 <xiaoting.liu@hxt-semitech.com>
Subject: [PATCH v3 2/4] dt-bindings: hwmon: add dps650ab documentation
Date: Thu, 10 Jan 2019 10:24:33 +0800
X-ASG-Orig-Subj: [PATCH v3 2/4] dt-bindings: hwmon: add dps650ab documentation
Message-ID: <0527fcf7155ea12a2a1be680b3617691e6e26d72.1546918172.git.xiaoting.liu@hxt-semitech.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1546918172.git.xiaoting.liu@hxt-semitech.com>
References: <cover.1546918172.git.xiaoting.liu@hxt-semitech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.5.21.169]
X-ClientProxiedBy: HXTBJIDCEMVIW01.hxtcorp.net (10.128.0.14) To
 HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15)
X-Barracuda-Connect: UNKNOWN[10.128.0.15]
X-Barracuda-Start-Time: 1547087090
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://192.168.50.101:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at hxt-semitech.com
X-Barracuda-Bayes: SPAM GLOBAL 0.9802 1.0000 4.1141
X-Barracuda-Spam-Score: 4.11
X-Barracuda-Spam-Status: No, SCORE=4.11 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.65431
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
X-List-Received-Date: Thu, 10 Jan 2019 02:26:07 -0000

Bindings for Delta Electronics DPS-650-AB power supply.

Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
---
v3:
  Change patch commit message.
  Add vendor delta to the compatible property.
---
v2:
  Change the patch subject.
---
 Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
new file mode 100644
index 000000000000..32d89e4f4956
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
@@ -0,0 +1,11 @@
+Bindings for Delta Electronics DPS-650-AB power supply
+
+Required properties:
+- compatible : "delta,dps650ab"
+- reg        : I2C address, one of 0x58, 0x59.
+
+Example:
+	dps650ab@58 {
+		    compatible = "delta,dps650ab";
+		    reg = <0x58>;
+	};
-- 
1.8.3.1
