Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 52A871A1155
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 09:20:56 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450218053920317.7307986614692;
 Tue, 15 Dec 2015 14:20:53 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 0/2] Add support for get-sensor-reading
Date: Tue, 15 Dec 2015 16:20:51 -0600
Message-Id: <1450218053-12108-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 15 Dec 2015 22:20:56 -0000

https://github.com/openbmc/phosphor-host-ipmid/pull/54

Chris Austen (2):
  Add support for get-sensor-reading
  support correct methods in test

 ipmid.C         | 24 ++++++++---------
 ipmid.H         |  4 ++-
 ipmisensor.C    | 32 ++++++++++++-----------
 sensorhandler.C | 80 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 sensorhandler.h |  1 +
 testit.C        | 26 +++++++++++--------
 6 files changed, 128 insertions(+), 39 deletions(-)

-- 
2.6.3
