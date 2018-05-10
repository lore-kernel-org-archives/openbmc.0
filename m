Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="UKdl/50o"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HSi1LPnc"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hNpZ5fjBzF2TG
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 16:38:30 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 55CCD21721;
 Thu, 10 May 2018 02:38:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 10 May 2018 02:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=B9n0++9iKRZZFSjD+
 T2e803SZt5dT9c7icgedpTKcRM=; b=UKdl/50oQ4DkjQJlMoESUXJtkfwFOJV4n
 fc3B5r8rQPT8lpiSNvKR9JEDaLk78JrH/AfinEw33vCROL2OnKKD8jD6+5HJ8Kwx
 vJ44hIa/R7S8YMYzhL5X+m1DfXbl/fFM+8r+/yHR1x3ggFA6kLh5t+XrRWcUmrit
 JRidETXMmibxvnzT1Yv+EPweyJ4ctCGHG4kMiiYoYaJmKmSbh+BbLrF4hSYtj3wt
 eRsG8P0jV3jwYgf1xz3jJtOXKS8ZzYhJz5mpWnJScWm5Us+mbKyzX4WDTI1kEq49
 BXyCAkAul/UXLyxjcBdVMs06wp2KIm21ylPikuuKJCwahyzsp5nlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=B9n0++9iKRZZFSjD+T2e803SZt5dT9c7icgedpTKcRM=; b=HSi1LPnc
 IoUFec1vqYXr+69kG5vE707uEqTXLt5bRVNM5zOvjSFkCFDBhmpwEMciuf07op68
 Gg4FpARyMjZtHaQlqppC6erpDhfubAjaksYVuBJg3q0aRfU3Ktq6DpMHmFEU0+D8
 mNSYkCO4FVp5UVkZHGp7LYEpfKXNpAb3TqHGOV1YWAGHfcwo6iV86HbgbySQ5oiy
 cji45sgaOmIUJLwbEJQ6KIptz/wJs83qikHoXf1Xvms6N8kyhdeGa3QKA8DxxwJJ
 97QXcYQj4rx6FxfGF+OdPp4PmE1YfmMQdPgeE02Db9j/bKjjf4tl+SSu5TmlMLCp
 phkt/AffxcVsAQ==
X-ME-Sender: <xms:5OjzWoMDxESYTeK-dT7a0be6N6sfdqfzk40TW-gdO7K_e1YNN8gsnA>
Received: from dave.aj.id.au (ppp118-210-26-60.bras1.adl4.internode.on.net
 [118.210.26.60])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7B0B610253;
 Thu, 10 May 2018 02:38:26 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-devel@lists.openembedded.org
Cc: anuj.mittal@intel.com, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [meta-python][PATCH v2 2/3] meta-python: Port python-pyflame to
 32-bit ARM
Date: Thu, 10 May 2018 16:07:17 +0930
Message-Id: <20180510063718.16913-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180510063718.16913-1-andrew@aj.id.au>
References: <20180510063718.16913-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2018 06:38:32 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 ...ract-over-user_regs_struct-name-which-dif.patch | 69 ++++++++++++++++++++++
 .../python/python-pyflame_1.6.6.bb                 |  2 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyflame-1.6.6/0001-ptrace-Abstract-over-user_regs_struct-name-which-dif.patch

diff --git a/meta-python/recipes-devtools/python/python-pyflame-1.6.6/0001-ptrace-Abstract-over-user_regs_struct-name-which-dif.patch b/meta-python/recipes-devtools/python/python-pyflame-1.6.6/0001-ptrace-Abstract-over-user_regs_struct-name-which-dif.patch
new file mode 100644
index 000000000000..09c4394c2a4b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyflame-1.6.6/0001-ptrace-Abstract-over-user_regs_struct-name-which-dif.patch
@@ -0,0 +1,69 @@
+From 2ef124e235a47dd4742813cf80e11a89cf4f02f8 Mon Sep 17 00:00:00 2001
+From: Andrew Jeffery <andrew@aj.id.au>
+Date: Thu, 3 May 2018 12:35:31 +0930
+Subject: [PATCH] ptrace: Abstract over user_regs_struct name, which differs on
+ ARM32
+
+Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
+---
+ src/ptrace.cc |  6 +++---
+ src/ptrace.h  | 10 ++++++++--
+ 2 files changed, 11 insertions(+), 5 deletions(-)
+
+diff --git a/src/ptrace.cc b/src/ptrace.cc
+index 485f58e4d82e..610fabb3b8e8 100644
+--- a/src/ptrace.cc
++++ b/src/ptrace.cc
+@@ -122,8 +122,8 @@ void PtraceInterrupt(pid_t pid) {
+   DoWait(pid);
+ }
+ 
+-struct user_regs_struct PtraceGetRegs(pid_t pid) {
+-  struct user_regs_struct regs;
++user_regs_struct PtraceGetRegs(pid_t pid) {
++  user_regs_struct regs;
+   if (ptrace(PTRACE_GETREGS, pid, 0, &regs)) {
+     std::ostringstream ss;
+     ss << "Failed to PTRACE_GETREGS: " << strerror(errno);
+@@ -132,7 +132,7 @@ struct user_regs_struct PtraceGetRegs(pid_t pid) {
+   return regs;
+ }
+ 
+-void PtraceSetRegs(pid_t pid, struct user_regs_struct regs) {
++void PtraceSetRegs(pid_t pid, user_regs_struct regs) {
+   if (ptrace(PTRACE_SETREGS, pid, 0, &regs)) {
+     std::ostringstream ss;
+     ss << "Failed to PTRACE_SETREGS: " << strerror(errno);
+diff --git a/src/ptrace.h b/src/ptrace.h
+index 7083be1c4dfd..d6af8bf9f83a 100644
+--- a/src/ptrace.h
++++ b/src/ptrace.h
+@@ -23,6 +23,12 @@
+ 
+ #include "./config.h"
+ 
++#if defined(__arm__)
++typedef struct user_regs user_regs_struct;
++#else
++typedef struct user_regs_struct user_regs_struct;
++#endif
++
+ namespace pyflame {
+ 
+ int DoWait(pid_t pid, int options = 0);
+@@ -39,10 +45,10 @@ void PtraceSeize(pid_t pid);
+ void PtraceInterrupt(pid_t pid);
+ 
+ // get regs from a process
+-struct user_regs_struct PtraceGetRegs(pid_t pid);
++user_regs_struct PtraceGetRegs(pid_t pid);
+ 
+ // set regs in a process
+-void PtraceSetRegs(pid_t pid, struct user_regs_struct regs);
++void PtraceSetRegs(pid_t pid, user_regs_struct regs);
+ 
+ // poke a long word into an address
+ void PtracePoke(pid_t pid, unsigned long addr, long data);
+-- 
+2.14.1
+
diff --git a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
index 96f03305f883..7a6d3b09962f 100644
--- a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
+++ b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
@@ -1 +1,3 @@
 require python-pyflame.inc
+
+SRC_URI += "file://0001-ptrace-Abstract-over-user_regs_struct-name-which-dif.patch"
-- 
2.14.1
