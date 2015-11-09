Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BF9681A03F4
 for <openbmc@lists.ozlabs.org>; Mon,  9 Nov 2015 21:40:22 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447065619822152.95287911964658;
 Mon, 9 Nov 2015 02:40:19 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] add i2c-occ to barreleye device table
Date: Mon,  9 Nov 2015 05:40:18 -0500
Message-Id: <1447065619-13533-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 09 Nov 2015 10:40:23 -0000

So i2c-occ driver can be initialized and read sensor data from OCC.

https://github.com/openbmc/openbmc/pull/73

adamliyi (1):
  add i2c-occ to barreleye device table

 .../meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.dts  | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.6.3
