Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qZFSv3WGQzDq5d
 for <openbmc@lists.ozlabs.org>; Wed, 30 Mar 2016 02:44:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145926605926784.26848976125723;
 Tue, 29 Mar 2016 08:40:59 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-rest-server] Add support for serving jsonp
Date: Tue, 29 Mar 2016 10:40:56 -0500
Message-Id: <1459266057-23662-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 29 Mar 2016 15:44:32 -0000

Jsonp adds a javascript wrapper to json responses.  It allows client
applications to work around cross domain restrictions imposed by some
browsers.  For more information on jsonp:
https://en.wikipedia.org/wiki/JSONP

To get a jsonp response, an application adds a callback url parameter
with the desired name of the wrapper:
https://192.168.252.1/list?callback=my_callback

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-rest-server/17)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-rest-server/pull/17

Brad Bishop (1):
  Add support for serving jsonp

 obmc-rest | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

-- 
2.7.1
