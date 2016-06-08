Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rPXVS1K7pzDq62
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2016 12:30:54 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146535304659444.087780878797616;
 Tue, 7 Jun 2016 19:30:46 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-rest-server v4] The streaming support for obmc-rest.
Date: Tue,  7 Jun 2016 21:30:44 -0500
Message-Id: <20160608023045.18704-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
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
X-List-Received-Date: Wed, 08 Jun 2016 02:30:57 -0000

Changes:
1) The main idea of this change is to have a streaming path as below:
    dbus signal -> obmc-rest capture the dbus signal -> obmc-rest notify the client of the signal receiving.
2) Replace rocket with gevent WSGI server to support multiple async accesses.
3) Use gevent queue to notify the dbus signal receiving.
4) The uri to the streaming should be in the form as below:
    https://<ip>/<path>/stream/<signal_name>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-rest-server/15)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-rest-server/pull/15

shgoupf (1):
  The streaming support for obmc-rest.

 obmc-rest | 118 +++++++++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 106 insertions(+), 12 deletions(-)
 mode change 100644 => 100755 obmc-rest

-- 
2.8.3
