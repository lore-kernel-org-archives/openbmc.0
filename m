Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fiRjcD2a"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RonTTIKr"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40cjSf1V7fzF13T
 for <openbmc@lists.ozlabs.org>; Fri,  4 May 2018 16:55:14 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E917B227E9;
 Fri,  4 May 2018 02:55:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 04 May 2018 02:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=XNRM+3FPSX1KMp/hX
 LRs94SWZhfLGRgC/MnxlT2Yu8o=; b=fiRjcD2aww+Bby04wjB4NzYO9GLax8pQ0
 loonhvv8A6gBilwUZj2ygcvBMYVa45ZVKEbe/hmW5pTrkaxDATSl6uvu8CBSesp0
 +ZMZBLfD8MTOHoBtTP+yR7VwaSmfHEniaU3tNoZ+/2YqoOQ9RhnmovEOZB0Y60Ng
 59qPtCLya4iQQnpkOMQ3oPO+EdkZHsJN+ARs5EornV33V8n4aNGsqmMR0MR1Gr6l
 tQha/sU/paQ4S9C4jVdLAyWsnGB6TEQT38C2ZkVxSRg/4sNTA9dScERA+4OHlRUq
 3NpQPaVc7KpSBo6ufqydU723w4E/+C2DIvJT3w3u78/ewG/SShZ2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=XNRM+3FPSX1KMp/hXLRs94SWZhfLGRgC/MnxlT2Yu8o=; b=RonTTIKr
 vIQ27bOJZyo5VMX5HA81KsEto8TcznwF2uIfNmnLRnG3BKqslZK4yUA1dyG6zDtq
 aQKROG6MDqD5WfE/xAx8maVQFbTehgc2hfqcc+Zcx1TPLhLUXD41fKWHwySgt3tc
 xfLTLEjfonuOUd0sVVoVdDo916kK/PHOmjmXFokM+qcYvNrTSnZw3Z7+/6s7Pt45
 vt41SMUo9nNztadsIK83BJKaDhQP94FT4BO000x5WO9PrE4jpAAbswzQsxyoPe8V
 6/IhJo8tcCe9ELZ9W2vYwv7C0CrTTf0V8vjECo5aY1TBtQXaEDLHN0SjJoRl5vCV
 hoTaX9FvNBC7Cg==
X-ME-Sender: <xms:zwPsWsa7Nj4UE69mIVITliV3IeGyOwXYeeIynFXCkhD2Jm9WAYRwmg>
Received: from dave.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 15CE4E4408;
 Fri,  4 May 2018 02:55:09 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-devel@lists.openembedded.org
Cc: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [meta-python][PATCH 2/3] meta-python: Port python-pyflame to 32-bit
 ARM
Date: Fri,  4 May 2018 16:24:31 +0930
Message-Id: <20180504065432.10308-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180504065432.10308-1-andrew@aj.id.au>
References: <20180504065432.10308-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 04 May 2018 06:55:14 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 ...ract-over-user_regs_struct-name-which-dif.patch | 69 ++++++++++++++++++++++
 .../python/python-pyflame_1.6.6.bb                 |  2 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyflame/0001-ptrace-Abstract-over-user_regs_struct-name-which-dif.patch

diff --git a/meta-python/recipes-devtools/python/python-pyflame/0001-ptrace-Abstract-over-user_regs_struct-name-which-dif.patch b/meta-python/recipes-devtools/python/python-pyflame/0001-ptrace-Abstract-over-user_regs_struct-name-which-dif.patch
new file mode 100644
index 000000000000..09c4394c2a4b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyflame/0001-ptrace-Abstract-over-user_regs_struct-name-which-dif.patch
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
index c902e121231b..2edd708506e3 100644
--- a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
+++ b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
@@ -3,3 +3,5 @@ require python-pyflame.inc
 SRC_URI = "https://github.com/uber/pyflame/archive/v${PV}.tar.gz"
 SRC_URI[md5sum] = "53d5822e5be371303e217a68ea9ea3e5"
 SRC_URI[sha256sum] = "03723509c037a994585e81e4a9c6d8e4fed87b486e23edd8d355a7bcc009bf79"
+
+SRC_URI += "file://0001-ptrace-Abstract-over-user_regs_struct-name-which-dif.patch"
-- 
2.14.1
