Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 646B81A0B68
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2015 03:20:35 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449073231212529.354145413888;
 Wed, 2 Dec 2015 08:20:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-rest-server] Drop number of Rocket threads to 1
Date: Wed,  2 Dec 2015 11:20:28 -0500
Message-Id: <1449073228-6684-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449073228-6684-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449073228-6684-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 02 Dec 2015 16:20:36 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

By default Rocket creates a threadpool 8 deep which uses a fair
amount of memory.  We don't need a multi-threaded server so this
patch drops the min/max to 1.
---
 obmc-rest | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/obmc-rest b/obmc-rest
index c5ba8dc..2c5e7e1 100644
--- a/obmc-rest
+++ b/obmc-rest
@@ -589,5 +589,7 @@ if __name__ == '__main__':
 			443,
 			default_cert,
 			default_cert),
-		'wsgi', {'wsgi_app': app})
+		'wsgi', {'wsgi_app': app},
+		min_threads = 1,
+		max_threads = 1)
 	server.start()
-- 
2.6.3
