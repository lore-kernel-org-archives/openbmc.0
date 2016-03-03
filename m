Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C9E441A0313
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2016 18:40:46 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456990843917821.402306807291;
 Wed, 2 Mar 2016 23:40:43 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: agangidi53 <adi.gangidi@rackspace.com>
Subject: [PATCH skeleton] Update hconsole to account for background sessions
Date: Thu,  3 Mar 2016 01:40:42 -0600
Message-Id: <1456990842-7503-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456990842-7503-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456990842-7503-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 03 Mar 2016 07:40:47 -0000

From: agangidi53 <adi.gangidi@rackspace.com>

Proposed change accounts for users connecting to host through "hconsole" who:
a. Have no existing screen sessions to host console
b. Have an existing attached screen session to host console
c. Have an existing detached screen session to host console

ADVANTAGE 1: Accounting for attached screen sessions in background
WITHOUT this change: When a user connected to host via 'hconsole', accidentally gets disconnected from ssh session, they would have an active screen session to host in background. When same user logs back in and executes 'hconsole' to get back to the host console, he would create a new screen session resulting in lost serial data between these parallel screen sessions on same tty.
WITH this change: Said user can ssh back into BMC and execute hconsole and it will :
a) Detach the existing host screen session
b) Reattach to the same
c) His previous state will be preserved.

ADVANTAGE 2: Accounting for dettached screen sessions in background
WITHOUT this change: If user doesn't want to kill the host screen session and disconnect instead, one cannot execute "hconsole" to reattach to the previously detached session.
WITH this change: User connected to host via 'hconsole' can chose to disconnect from host console screen session instead of killing it. When user wants to get back to the console, one need not actively monitor for existing screen sessions and reconnect to it. Instead one can just type 'hconsole' and it would automatically reconnect to the existing session and the state would be preserved.

PRESERVING PREVIOUS FUNCTIONALITY:
If a user with no background screen sessions to host types 'hconsole' , a new screen session will be created (as done previously ) with a name 'hostconsole'. This would help him differentiate between additional screen sessions he may create on BMC itself and BMC-to-Host screen session.

SCREEN FLAGS USED:
-d  Detach the elsewhere running screen (if exists).
-R Reattach if possible, otherwise start a new session.
-U Tell screen to use UTF-8 encoding.

TESTING:
Executed 'hconsole' command from modified source in following cases:
a) With NO screen sessions in background
b) With just local BMC sessions in background
c) With BMC-to-Host detached screen sessions in background
d) With BMC-to-Host attached screen sessions in background
e) Combination or (a)  and (b)
f) Combination of (b) and (c or d)
---
 bin/hconsole | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/bin/hconsole b/bin/hconsole
index 7652dbc..0d2777c 100755
--- a/bin/hconsole
+++ b/bin/hconsole
@@ -2,6 +2,12 @@
 
 echo "Ctrl-a k  to exit console"
 echo "A session log is created in current directory"
+if screen -list | grep "hostconsole" | grep -q -i "Detached"; then
+  echo "You have an existing detached console session to host, you will be reconnected to that session"
+fi
+if screen -list | grep "hostconsole" | grep -q -i "Attached"; then
+  echo "You have an existing attached console session to host, you will be detached from that session and reconnected here instead"
+fi
 echo "[Enter] to continue"
 read a
-screen -U /dev/ttyS5
+screen -dR hostconsole -U /dev/ttyS5
-- 
2.7.1
