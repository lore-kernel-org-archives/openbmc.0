Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C38411A0075
 for <openbmc@lists.ozlabs.org>; Tue,  1 Dec 2015 03:04:00 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448899228717737.0048598428102;
 Mon, 30 Nov 2015 08:00:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Bump mapper and rest server revisions
Date: Mon, 30 Nov 2015 11:00:26 -0500
Message-Id: <1448899227-17646-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 30 Nov 2015 16:04:01 -0000

Fixes for freedesktop ObjectManager signal handling.

https://github.com/openbmc/openbmc/pull/106

Brad Bishop (1):
  Bump mapper and rest server revisions

 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.6.3
