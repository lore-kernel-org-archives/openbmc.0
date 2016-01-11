Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8A0C51A0202
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 04:00:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531632353450.40627880076966;
 Mon, 11 Jan 2016 09:00:32 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] pflash and linux updates
Date: Mon, 11 Jan 2016 11:00:30 -0600
Message-Id: <1452531631-14153-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 17:00:35 -0000

I've tested on Barreleye

https://github.com/openbmc/openbmc/pull/130

Chris Austen (1):
  pflash and linux updates

 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.6.4
