Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 109C71A01D7
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 04:39:13 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 144614035215359.685143071866946;
 Thu, 29 Oct 2015 10:39:12 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 0/2] rest/mapper recipes
Date: Thu, 29 Oct 2015 12:39:09 -0500
Message-Id: <1446140351-7369-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
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
X-List-Received-Date: Thu, 29 Oct 2015 17:39:14 -0000

These aren't being included in the image at the moment.  They can be merged without causing any problems.

Once my mapper/rest source code pulls have been merged I will follow up with another pull here to add it to the image and set the SRCREV in these recipes.

https://github.com/openbmc/openbmc/pull/40

Brad Bishop (2):
  Add object manager recipe
  Add REST server recipe

 .../common/recipes-phosphor/dbus/obmc-mapper.bb    | 25 ++++++++++++++++++++++
 .../dbus/obmc-mapper/obmc-mapper.service           | 10 +++++++++
 .../dbus/obmc-mapper/org.openbmc.ObjectMapper.conf |  8 +++++++
 .../common/recipes-phosphor/dbus/obmc-rest.bb      | 24 +++++++++++++++++++++
 .../dbus/obmc-rest/obmc-rest.service               | 10 +++++++++
 5 files changed, 77 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/org.openbmc.ObjectMapper.conf
 create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/obmc-rest.service

-- 
2.6.0
