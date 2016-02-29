Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 441DB1A0035
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2016 05:49:18 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456771224695803.9355311043039;
 Mon, 29 Feb 2016 10:40:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/2] don't inherit image-overlay by default
Date: Mon, 29 Feb 2016 12:40:21 -0600
Message-Id: <1456771223-7654-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Mon, 29 Feb 2016 18:49:18 -0000

https://github.com/openbmc/openbmc/pull/193

Brad Bishop (2):
  Whitespace fixes
  Don't inherit image-overlay by default

 meta-phosphor/classes/image-overlay.bbclass        |  8 +++--
 meta-phosphor/classes/obmc-phosphor-image.bbclass  | 37 +++++++++++++---------
 .../conf/machine/include/obmc-bsp-common.inc       |  1 -
 3 files changed, 27 insertions(+), 19 deletions(-)

-- 
2.7.1
