Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DDB611A02AE
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2015 10:20:23 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447716019933213.00732982638044;
 Mon, 16 Nov 2015 15:20:19 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] update build to support rest features
Date: Mon, 16 Nov 2015 18:20:18 -0500
Message-Id: <1447716019-4142-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 16 Nov 2015 23:20:25 -0000

list, enumerate, https, etc

https://github.com/openbmc/openbmc/pull/82

Chris Austen (1):
  update build to support rest features

 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.6.3
