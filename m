Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rWJk119kZzDqwF
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 22:00:56 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146616484771077.11381069899505;
 Fri, 17 Jun 2016 05:00:47 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Nan Li <bjlinan@cn.ibm.com>
Subject: [PATCH phosphor-rest-server] Add a convenient/short logout command
Date: Fri, 17 Jun 2016 07:00:45 -0500
Message-Id: <20160617120046.29620-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jun 2016 12:00:58 -0000

With this patch, we can logout by:
    curl -c cjar -b cjar -k https://BMC/logout
Traditional/json format logout is retained.

Signed-off-by: Nan Li <bjlinan@cn.ibm.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-rest-server/22)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-rest-server/pull/22

Nan Li (1):
  Add a convenient/short logout command

 obmc-rest | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.8.4
