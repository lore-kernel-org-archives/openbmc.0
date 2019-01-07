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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43YCBW1VQ2zDqDy
 for <openbmc@lists.ozlabs.org>; Mon,  7 Jan 2019 22:01:38 +1100 (AEDT)
X-ASG-Debug-ID: 1546858862-093b7e2d88524a0001-mgJK9t
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([10.128.0.15]) by
 barracuda.hxt-semitech.com with ESMTP id ZGV4YeSamT1I0GId (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
 Mon, 07 Jan 2019 19:01:32 +0800 (CST)
X-Barracuda-Envelope-From: xiaoting.liu@hxt-semitech.com
Received: from openbmc001.localdomain (10.5.21.169) by
 HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 7 Jan 2019 19:00:56 +0800
From: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
To: <linux@roeck-us.net>, <jdelvare@suse.com>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <openbmc@lists.ozlabs.org>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <shunyong.yang@hxt-semitech.com>,
 <dongsheng.wang@hxt-semitech.com>, Xiaoting Liu
 <xiaoting.liu@hxt-semitech.com>
Subject: [PATCH v2 2/4] dt-bindings: hwmon: add dps650ab documentation
Date: Mon, 7 Jan 2019 19:00:56 +0800
X-ASG-Orig-Subj: [PATCH v2 2/4] dt-bindings: hwmon: add dps650ab documentation
Message-ID: <0087d2d9c7cd7f38761f76c80d1c37cb2cea6ef2.1546851856.git.xiaoting.liu@hxt-semitech.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1546851856.git.xiaoting.liu@hxt-semitech.com>
References: <cover.1546851856.git.xiaoting.liu@hxt-semitech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.5.21.169]
X-ClientProxiedBy: HXTBJIDCEMVIW01.hxtcorp.net (10.128.0.14) To
 HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15)
Content-Transfer-Encoding: quoted-printable
X-Barracuda-Connect: UNKNOWN[10.128.0.15]
X-Barracuda-Start-Time: 1546858892
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://192.168.50.101:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at hxt-semitech.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.5000 1.0000 0.0000
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.65265
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
X-List-Received-Date: Mon, 07 Jan 2019 11:01:39 -0000

Bindings for DPS650AB power, voltage, temperature, and fan monitering.

Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
---
v2:
  Change the patch subject.
---
 Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documen=
tation/devicetree/bindings/hwmon/dps650ab.txt
new file mode 100644
index 000000000000..6bbbff89f6d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
@@ -0,0 +1,11 @@
+Bindings for DPS650AB power, voltage, temperature, and fan monitering
+
+Required properties:
+- compatible : "dps650ab"
+- reg       : I2C address, one of 0x58, 0x59.
+
+Example:
+       dps650ab@58 {
+                   compatible =3D "dps650ab";
+                   reg =3D <0x58>;
+       };
--
1.8.3.1




This email is intended only for the named addressee. It may contain informa=
tion that is confidential/private, legally privileged, or copyright-protect=
ed, and you should handle it accordingly. If you are not the intended recip=
ient, you do not have legal rights to retain, copy, or distribute this emai=
l or its contents, and should promptly delete the email and all electronic =
copies in your system; do not retain copies in any media. If you have recei=
ved this email in error, please notify the sender promptly. Thank you.
