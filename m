Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D29D91A0065
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 04:39:32 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446140369387188.99110039074446;
 Thu, 29 Oct 2015 10:39:29 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Write FRU cmd handler for STORAGE NetFn
Date: Thu, 29 Oct 2015 12:39:26 -0500
Message-Id: <1446140367-7542-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 17:39:33 -0000

https://github.com/openbmc/phosphor-host-ipmid/pull/25

vishwabmc (1):
  Write FRU cmd handler for STORAGE NetFn

 Makefile         |  24 ++-
 storagehandler.C | 584 ++++++++++++++++++++++++++++++++++++++++++++++++++-----
 storagehandler.h |  44 +++++
 3 files changed, 592 insertions(+), 60 deletions(-)

-- 
2.6.0
