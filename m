Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CE6311A03D1
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 07:40:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145505042392147.477111862660195;
 Tue, 9 Feb 2016 12:40:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Enable Persistent event logs in OBMC
Date: Tue,  9 Feb 2016 14:40:21 -0600
Message-Id: <1455050422-19194-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 09 Feb 2016 20:40:29 -0000

Enable the /var/lib/obmc/events in the whitelist
Move pointers up for event manager and object manager

https://github.com/openbmc/openbmc/pull/170

Chris Austen (1):
  Enable Persistent event logs in OBMC

 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb               | 2 +-
 .../common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb  | 2 +-
 .../common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist        | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.6.4
