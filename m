Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 31F7A1A002B
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 16:20:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455254422323657.7160285300183;
 Thu, 11 Feb 2016 21:20:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-build-scripts] build-setup: Ensure we fail the build
 when a step fails
Date: Thu, 11 Feb 2016 23:20:20 -0600
Message-Id: <1455254421-26850-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 12 Feb 2016 05:20:28 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>

https://github.com/openbmc/openbmc-build-scripts/pull/3

Joel Stanley (1):
  build-setup: Ensure we fail the build when a step fails

 build-setup.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.7.1
