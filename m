Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qW24c047vzDq72
 for <openbmc@lists.ozlabs.org>; Thu, 24 Mar 2016 21:00:47 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458813642275763.4597483489869;
 Thu, 24 Mar 2016 03:00:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add obmc-console project
Date: Thu, 24 Mar 2016 05:00:39 -0500
Message-Id: <1458813640-3032-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 24 Mar 2016 10:00:48 -0000

This change introduces obmc-console, a little daemon to handle the UART
data and multiplex it to a log and client processes.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/215)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/215

Jeremy Kerr (1):
  Add obmc-console project

 meta-phosphor/classes/obmc-phosphor-image.bbclass   |  1 +
 .../recipes-phosphor/obmc-console/obmc-console.bb   | 21 +++++++++++++++++++++
 .../obmc-console/obmc-console/obmc-console.conf     |  3 +++
 .../obmc-console/obmc-console/obmc-console.service  |  9 +++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console.conf
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console.service

-- 
2.7.1
