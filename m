Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id AE6001A009B
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 15:40:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14483400256071001.9739362735343;
 Mon, 23 Nov 2015 20:40:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] meta-phosphor: Add watchdog userspace tool
Date: Mon, 23 Nov 2015 23:40:23 -0500
Message-Id: <1448340024-16578-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
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
X-List-Received-Date: Tue, 24 Nov 2015 04:40:29 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>

https://github.com/openbmc/openbmc/pull/99

Joel Stanley (1):
  meta-phosphor: Add watchdog userspace tool

 meta-phosphor/classes/obmc-phosphor-image.bbclass | 1 +
 1 file changed, 1 insertion(+)

-- 
2.6.3
