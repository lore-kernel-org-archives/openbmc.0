Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D8C231A03B1
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 17:40:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455086422154910.729376614281;
 Tue, 9 Feb 2016 22:40:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] meta-phosphor: Bump kernel to 20160211-1
Date: Wed, 10 Feb 2016 00:40:20 -0600
Message-Id: <1455086421-12306-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 10 Feb 2016 06:40:27 -0000

 - vuart driver fix
 - i2c name fix
 - led names and polarity fixes

Signed-off-by: Joel Stanley <joel@jms.id.au>

https://github.com/openbmc/openbmc/pull/171

Joel Stanley (1):
  meta-phosphor: Bump kernel to 20160211-1

 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.7.1
