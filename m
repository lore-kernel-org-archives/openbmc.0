Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E77081A0986
 for <openbmc@lists.ozlabs.org>; Sun, 21 Feb 2016 02:20:39 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455981636446568.5709669379501;
 Sat, 20 Feb 2016 07:20:36 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Enable debug data section of event logs
Date: Sat, 20 Feb 2016 09:20:34 -0600
Message-Id: <1455981635-30583-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 20 Feb 2016 15:20:40 -0000

until now event logs have 3 bytes of debug data.  This was due to
a bug in our debug / testing interface.  Now that the problem has
been resolved we can start seeing the full ESEL over the rest
interface.  This will lead to larger files in the writable
filesystem.

https://github.com/openbmc/phosphor-host-ipmid/pull/66

Chris Austen (1):
  Enable debug data section of event logs

 storageaddsel.C  | 17 +++++------------
 storagehandler.C |  2 --
 2 files changed, 5 insertions(+), 14 deletions(-)

-- 
2.7.1
