Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5FEBB1A0CD4
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 05:52:30 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446231147912759.4962505708381;
 Fri, 30 Oct 2015 11:52:27 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] added i2c busses and devices for palmetto and barreleye
Date: Fri, 30 Oct 2015 13:52:24 -0500
Message-Id: <1446231145-31066-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
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
X-List-Received-Date: Fri, 30 Oct 2015 18:52:32 -0000

i'm not sure compatibility string is correct for barreleye

https://github.com/openbmc/linux/pull/10

Norman James (1):
  added i2c busses and devices

 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 333 +++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  |  28 ++-
 2 files changed, 354 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts

-- 
2.6.0
