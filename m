Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qRMhc43cCzDqjb
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 22:00:48 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458298838762628.2295548929067;
 Fri, 18 Mar 2016 04:00:38 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] inarp: Update to 19ed5170
Date: Fri, 18 Mar 2016 06:00:31 -0500
Message-Id: <1458298832-18215-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Mar 2016 11:00:49 -0000

This change updates us to 19ed5170, which supports dynamic interface
configuration, and better syslog support.

Jeremy Kerr (3):
      Rename inarp_ctx.socket
      Use netlink for link state queries
      Use syslog for log output

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/211)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/211

Jeremy Kerr (1):
  inarp: Update to 19ed5170

 meta-phosphor/common/recipes-phosphor/inarp/inarp.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.7.1
