Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 860701A0018
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2015 15:30:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447993822941531.2739566407241;
 Thu, 19 Nov 2015 20:30:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] arm/mach-aspeed: Perform SCU setup for i2c busses 4-8
Date: Thu, 19 Nov 2015 23:30:21 -0500
Message-Id: <1447993822-11150-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
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
X-List-Received-Date: Fri, 20 Nov 2015 04:30:28 -0000

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

https://github.com/openbmc/linux/pull/19

Jeremy Kerr (1):
  arm/mach-aspeed: Perform SCU setup for i2c busses 4-8

 arch/arm/mach-aspeed/aspeed.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.6.3
