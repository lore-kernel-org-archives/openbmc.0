Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B23001A0167
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 11:10:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455149422613699.576801011338;
 Wed, 10 Feb 2016 16:10:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Norman James <nkskjames@gmail.com>
Subject: [PATCH openbmc] update skeleton commit
Date: Wed, 10 Feb 2016 18:10:20 -0600
Message-Id: <1455149421-4851-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
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
X-List-Received-Date: Thu, 11 Feb 2016 00:10:28 -0000

- fix LED dependency so system will boot

Signed-off-by: Norman James <nkskjames@gmail.com>

https://github.com/openbmc/openbmc/pull/175

Norman James (1):
  update skeleton commit

 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.7.1
