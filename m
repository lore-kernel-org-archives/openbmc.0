Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9CB9D1A04EC
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 18:00:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447830022711109.1587379313263;
 Tue, 17 Nov 2015 23:00:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-build-scripts] kernel-build-script: fix creation of
 uImage
Date: Wed, 18 Nov 2015 02:00:20 -0500
Message-Id: <1447830021-25787-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 18 Nov 2015 07:00:28 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>

https://github.com/openbmc/openbmc-build-scripts/pull/1

Joel Stanley (1):
  kernel-build-script: fix creation of uImage

 kernel-build-setup.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.6.3
