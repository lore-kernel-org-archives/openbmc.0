Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C0EFA1A0BE5
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 07:11:39 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446149496413811.2188729237193;
 Thu, 29 Oct 2015 13:11:36 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v4 0/4] rest/mapper recipes
Date: Thu, 29 Oct 2015 15:11:30 -0500
Message-Id: <1446149494-11061-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 20:11:41 -0000

These aren't being included in the image at the moment.  They can be merged without causing any problems.

Once my mapper/rest source code pulls have been merged I will follow up with another pull here to add it to the image and set the SRCREV in these recipes.

https://github.com/openbmc/openbmc/pull/40

Brad Bishop (4):
  Add object manager recipe
  Add REST server recipe
  Add rest server and mapper to image
  Bump object mapper revision

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
