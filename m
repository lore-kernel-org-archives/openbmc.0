Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9096F1A02C2
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 16:10:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145499462363557.88302596036863;
 Mon, 8 Feb 2016 21:10:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Prep work for presistent event logs
Date: Mon,  8 Feb 2016 23:10:21 -0600
Message-Id: <1454994621-21413-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454994621-21413-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454994621-21413-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 09 Feb 2016 05:10:29 -0000

From: Chris Austen <austenc@us.ibm.com>

Making a very simple commit that contains the additional required
c++ flags along with making the directory to store the new event
manager log files.  This does not enable anything, it is a
precursor got the big drop.  I'd like to get some of the more
simple things in to the build first since a 2 line change is
faster to review.
---
 .../common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
index 6cdf398..3b8ce0e 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
@@ -9,6 +9,7 @@ inherit obmc-phosphor-event-mgmt
 inherit obmc-phosphor-sdbus-service
 inherit obmc-phosphor-c-daemon
 
+TARGET_CPPFLAGS += "-std=c++11 -fpic"
 
 SRC_URI += "git://github.com/openbmc/phosphor-event"
 
@@ -22,6 +23,7 @@ S = "${WORKDIR}/git"
 INSTALL_NAME = "event_messaged"
 
 do_install() {
+        install -d ${D}/var/lib/obmc/events/
         install -m 0755 -d ${D}${sbindir}
         install -m 0755 ${S}/${INSTALL_NAME} ${D}/${sbindir}/obmc-phosphor-eventd
 }
-- 
2.6.4
