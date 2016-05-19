Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9hyW46WwzDqCM
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2016 06:10:40 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463688635747704.8152331065464;
 Thu, 19 May 2016 13:10:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Bump version for console, object manager,
 and event logs
Date: Thu, 19 May 2016 15:10:33 -0500
Message-Id: <1463688634-15010-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 May 2016 20:10:44 -0000

Updates for:
Console - Support for local tty mirroring
Object manager - BMC boot performance improvements
Event logs - Cap the number of event logs at 128

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/279)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/279

Adriana Kobylak (1):
  Bump version for console, object manager, and event logs

 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb               | 2 +-
 meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console.bb      | 2 +-
 .../obmc-phosphor-event/files/obmc-phosphor-event.service               | 2 +-
 .../common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.8.2
