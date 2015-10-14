Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D51771A0739
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2015 01:25:45 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444832616854517.7861753911652;
 Wed, 14 Oct 2015 07:23:36 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] FRU validator CLI
Date: Wed, 14 Oct 2015 09:23:34 -0500
Message-Id: <1444832615-18343-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 14 Oct 2015 14:25:46 -0000

https://github.com/openbmc/phosphor-host-ipmid/pull/4

vishwabmc (1):
  FRU validator CLI

 fruvalidator.C | 252 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 252 insertions(+)
 create mode 100644 fruvalidator.C

-- 
2.6.0
