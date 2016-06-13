Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rSyvW0jftzDqbg
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 02:31:02 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465835452419487.2528731485928;
 Mon, 13 Jun 2016 09:30:52 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH pyphosphor] Use standard DBUS naming conventions
Date: Mon, 13 Jun 2016 11:30:49 -0500
Message-Id: <20160613163049.16291-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160613163049.16291-1-openbmc-patches@stwcx.xyz>
References: <20160613163049.16291-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 13 Jun 2016 16:31:04 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

The existing service/iface/object path names were out-of-spec.

busname: org.openbmc.ObjectMapper
iface: org.openbmc.ObjectMapper
path: /org/openbmc/ObjectMapper

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 obmc/mapper.py | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/obmc/mapper.py b/obmc/mapper.py
index 68ffb63..ab23524 100644
--- a/obmc/mapper.py
+++ b/obmc/mapper.py
@@ -19,11 +19,10 @@ import obmc.dbuslib.enums
 import obmc.utils.misc
 import obmc.utils.pathtree
 
-MAPPER_NAME = 'org.openbmc.objectmapper'
-MAPPER_IFACE = MAPPER_NAME + '.ObjectMapper'
-MAPPER_PATH = '/org/openbmc/objectmapper/objectmapper'
-ENUMERATE_IFACE = 'org.openbmc.Object.Enumerate'
-MAPPER_NOT_FOUND = 'org.openbmc.objectmapper.Error.NotFound'
+MAPPER_NAME = 'org.openbmc.ObjectMapper'
+MAPPER_IFACE = MAPPER_NAME
+MAPPER_PATH = '/org/openbmc/ObjectMapper'
+MAPPER_NOT_FOUND = MAPPER_NAME + '.Error.NotFound'
 
 
 class Mapper:
-- 
2.8.4
