Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id F2F301A0295
 for <openbmc@lists.ozlabs.org>; Wed,  2 Dec 2015 03:50:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448988622169826.8815002271632;
 Tue, 1 Dec 2015 08:50:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/2] DBUS API for systemd/networkd to configure
 network parameters.
Date: Tue,  1 Dec 2015 11:50:19 -0500
Message-Id: <1448988621-12834-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 01 Dec 2015 16:50:29 -0000

https://github.com/openbmc/openbmc/pull/110

Hariharasubramanian R (2):
  Adding IPMI Parser Library.
  systemd/networkd patch (not in upstream) DBUS API to configure network
    interface.

 .../ipmi-fru-parser/ipmi-fru-parser.bb             |  18 ++
 .../packagegroup-obmc-phosphor-apps.bb             |   1 +
 .../0100-systemd_networkd_dbus_setaddress.patch    | 255 +++++++++++++++++++++
 .../meta/recipes-core/systemd/systemd_225.bb       |   3 +-
 4 files changed, 276 insertions(+), 1 deletion(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/ipmi-fru-parser/ipmi-fru-parser.bb
 create mode 100644 yocto-poky/meta/recipes-core/systemd/systemd/0100-systemd_networkd_dbus_setaddress.patch

-- 
2.6.3
