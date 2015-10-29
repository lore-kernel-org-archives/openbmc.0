Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 287791A0BCB
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 04:39:02 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446140338504576.8791213616706;
 Thu, 29 Oct 2015 10:38:58 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Update skeleton version to pick up new executables
Date: Thu, 29 Oct 2015 12:38:55 -0500
Message-Id: <1446140336-7218-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 17:39:03 -0000

Update skeleton commit version in the recipe
Get executables from bin and libraries from lib

https://github.com/openbmc/openbmc/pull/45

Adriana Kobylak (1):
  Update skeleton version to pick up new executables

 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.6.0
