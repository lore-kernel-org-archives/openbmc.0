Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 03D791A0337
 for <openbmc@lists.ozlabs.org>; Mon, 15 Feb 2016 11:10:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455495022593360.89837579097923;
 Sun, 14 Feb 2016 16:10:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-build-scripts v2] build-setup: Ensure we fail the
 build when a step fails
Date: Sun, 14 Feb 2016 18:10:20 -0600
Message-Id: <1455495021-25108-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 15 Feb 2016 00:10:28 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>

https://github.com/openbmc/openbmc-build-scripts/pull/3

Joel Stanley (1):
  build-setup: Ensure we fail the build when a step fails

 build-setup.sh | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

-- 
2.7.1
