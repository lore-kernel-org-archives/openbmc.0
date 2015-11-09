Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6F79C1A0285
 for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2015 06:40:12 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447098009138485.2767800434332;
 Mon, 9 Nov 2015 11:40:09 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs] REST API updates
Date: Mon,  9 Nov 2015 14:40:07 -0500
Message-Id: <1447098008-27418-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 09 Nov 2015 19:40:14 -0000

I am working on a number of API (json format) changes.
Use https:// instead of http://
Show how to set the Content-Type HTTP header.
Show how to set the HTTP verb.

https://github.com/openbmc/docs/pull/6

Brad Bishop (1):
  REST API updates

 rest-api.md | 73 +++++++++++++++++++++++++++++++++++++------------------------
 1 file changed, 45 insertions(+), 28 deletions(-)

-- 
2.6.3
