Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 19DEB1A0019
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 12:30:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455154229115104.52958644546129;
 Wed, 10 Feb 2016 17:30:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 0/2] I2c : do not rename added devices,
 and a minor dtsi fix
Date: Wed, 10 Feb 2016 19:30:26 -0600
Message-Id: <1455154228-7217-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Thu, 11 Feb 2016 01:30:33 -0000


The documentation says you can't rename devices once they are added.

The commit log is a bit wide because I didn't wrap the cut & pasted comments from the code.

The code is a bit ugly looking for properties in the child to determine the name.

But there are rules!

Comments and alternatives welcome.

Also is a separate patch for the dtsi which I noticed while looking at the tree structure.

milton


https://github.com/openbmc/linux/pull/49

Milton D. Miller II (2):
  i2c: aspeed: Don't rename added devices
  arm: dts: unit address should not have 0x prefix

 arch/arm/boot/dts/ast2400.dtsi  |  2 +-
 drivers/i2c/busses/i2c-aspeed.c | 28 ++++++++++++++++++++--------
 2 files changed, 21 insertions(+), 9 deletions(-)

-- 
2.7.1
