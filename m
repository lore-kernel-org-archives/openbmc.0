Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B8EE21A0CDA
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2015 13:50:23 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447728619851690.3925118788541;
 Mon, 16 Nov 2015 18:50:19 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 0/2] update build to support rest features
Date: Mon, 16 Nov 2015 21:50:17 -0500
Message-Id: <1447728619-12561-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 17 Nov 2015 02:50:25 -0000

list, enumerate, https, etc

https://github.com/openbmc/openbmc/pull/82

Chris Austen (2):
  update build to support rest features
  Enable new rest interface at boot time

 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb              | 2 +-
 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb                | 2 +-
 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/obmc-rest.service | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.6.3
