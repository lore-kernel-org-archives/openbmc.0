Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2D7351A026C
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 04:45:29 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446140727261857.2914973660087;
 Thu, 29 Oct 2015 10:45:27 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v3 0/3] rest/mapper recipes
Date: Thu, 29 Oct 2015 12:45:22 -0500
Message-Id: <1446140725-11766-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 17:45:30 -0000

These aren't being included in the image at the moment.  They can be merged without causing any problems.

Once my mapper/rest source code pulls have been merged I will follow up with another pull here to add it to the image and set the SRCREV in these recipes.

https://github.com/openbmc/openbmc/pull/40

Brad Bishop (3):
  Add object manager recipe
  Add REST server recipe
  Add rest server and mapper to image

 .../common/recipes-phosphor/dbus/obmc-mapper.bb    | 25 ++++++++++++++++++++++
 .../dbus/obmc-mapper/obmc-mapper.service           | 10 +++++++++
 .../dbus/obmc-mapper/org.openbmc.ObjectMapper.conf |  8 +++++++
 .../common/recipes-phosphor/dbus/obmc-rest.bb      | 24 +++++++++++++++++++++
 .../dbus/obmc-rest/obmc-rest.service               | 10 +++++++++
 .../packagegroup-obmc-phosphor-apps.bb             |  1 +
 6 files changed, 78 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/org.openbmc.ObjectMapper.conf
 create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/obmc-rest.service

-- 
2.6.0
