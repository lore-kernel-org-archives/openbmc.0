Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qRFj45d0LzDr07
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 17:30:48 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14582826462131023.5685569366316;
 Thu, 17 Mar 2016 23:30:46 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH obmc-console 2/2] console-server: fix initialiser
Date: Fri, 18 Mar 2016 01:30:28 -0500
Message-Id: <1458282628-8978-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458282628-8978-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458282628-8978-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Mar 2016 06:30:49 -0000

From: Joel Stanley <joel@jms.id.au>

When using clang (3.8, and 3.4), the initaliser for struct option:

console-server.c:471:6: error: missing field 'has_arg' initializer
  [-Werror,-Wmissing-field-initializers]
        { 0 },

Shut the compiler up by using four zeros, which is what the libc manual
suggests:

 "Terminate the array with an element containing all zeros."

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 console-server.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/console-server.c b/console-server.c
index 3857de1..ddff1af 100644
--- a/console-server.c
+++ b/console-server.c
@@ -468,7 +468,7 @@ int run_console(struct console *console)
 }
 static const struct option options[] = {
 	{ "config",	required_argument,	0, 'c'},
-	{ 0 },
+	{ 0,  0, 0, 0},
 };
 
 int main(int argc, char **argv)
-- 
2.7.1
