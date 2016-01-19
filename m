Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DF4251A18C9
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2016 07:20:21 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453234817866689.6611299735241;
 Tue, 19 Jan 2016 12:20:17 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Norman James <nkskjames@gmail.com>
Subject: [PATCH linux] Add HDD backplane and SAS expander VPD to device tree
Date: Tue, 19 Jan 2016 14:20:16 -0600
Message-Id: <1453234817-17178-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
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
X-List-Received-Date: Tue, 19 Jan 2016 20:20:22 -0000

Signed-off-by: Norman James <nkskjames@gmail.com>

https://github.com/openbmc/linux/pull/41

Norman James (1):
  Add HDD backplane and SAS expander VPD to device tree

 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.6.4
