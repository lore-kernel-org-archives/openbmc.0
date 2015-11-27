Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6556C1A0014
 for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2015 17:21:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448604027799305.9934885801714;
 Thu, 26 Nov 2015 22:00:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: adamliyi <adamliyi@msn.com>
Subject: [PATCH linux] Add BMC HWMON driver to kernel. Format patch based on
 Joel's comments.
Date: Fri, 27 Nov 2015 01:00:26 -0500
Message-Id: <1448604027-22820-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 27 Nov 2015 06:21:34 -0000

Signed-off-by: adamliyi <adamliyi@msn.com>
 Add BMC HWMON driver to kernel. Format patch based on Joel's comments.

https://github.com/openbmc/linux/pull/22

adamliyi (1):
  Add BMC HWMON driver to kernel. Format patch based on Joel's comments.

 Documentation/devicetree/bindings/hwmon/occ.txt |   14 +
 drivers/hwmon/Kconfig                           |   10 +
 drivers/hwmon/Makefile                          |    1 +
 drivers/hwmon/occ.c                             | 1347 +++++++++++++++++++++++
 4 files changed, 1372 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/occ.txt
 create mode 100644 drivers/hwmon/occ.c

-- 
2.6.3
