Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 950DC1A0CCF
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 23:42:52 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446208969432868.7162591295548;
 Fri, 30 Oct 2015 05:42:49 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Enable DHCP
Date: Fri, 30 Oct 2015 07:42:47 -0500
Message-Id: <1446208968-26198-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 12:42:53 -0000

It just takes a basic config file to get systemd-networkd to pull and ip address.

https://github.com/openbmc/openbmc/pull/49

Brad Bishop (1):
  Make networkd grab dhcp address

 meta-phosphor/common/recipes-core/systemd/systemd/default.network | 4 ++++
 meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend      | 8 ++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-core/systemd/systemd/default.network

-- 
2.6.0
