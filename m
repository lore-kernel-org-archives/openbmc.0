Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 975EB1A0707
 for <openbmc@lists.ozlabs.org>; Wed,  2 Dec 2015 00:40:41 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448977220983112.4191789734067;
 Tue, 1 Dec 2015 05:40:20 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Update kernel version
Date: Tue,  1 Dec 2015 08:40:18 -0500
Message-Id: <1448977219-9336-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 01 Dec 2015 13:40:42 -0000

Brings in a fix for the GPIO interrupts.

Signed-off-by: Joel Stanley <joel@jms.id.au>

https://github.com/openbmc/openbmc/pull/108

Joel Stanley (1):
  Update kernel version

 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.6.3
