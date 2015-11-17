Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7E7E41A03A3
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 08:40:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447796421477237.10167673939497;
 Tue, 17 Nov 2015 13:40:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] need the nct7904 removed until pinmux driver is
 complete
Date: Tue, 17 Nov 2015 16:40:19 -0500
Message-Id: <1447796419-10805-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447796419-10805-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447796419-10805-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Nov 2015 21:40:28 -0000

From: Norman James <njames@us.ibm.com>

---
 .../meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.dts  | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.dts b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.dts
index c4f4076..9277307 100644
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.dts
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.dts
@@ -166,14 +166,6 @@
 					bus = <6>;
 					clock-frequency = <100000>;
 					status = "okay";
-					nct7904@2d {
-						compatible = "nuvoton,nct7904";
-						reg = <0x2d>;
-					};
-					nct7904@2e {
-						compatible = "nuvoton,nct7904";
-						reg = <0x2e>;
-					};
 				};
 
 				i2c7: i2c-bus@0x300 {
-- 
2.6.3
