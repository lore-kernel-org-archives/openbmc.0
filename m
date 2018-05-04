Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="AV+TwkXA"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="iDgqrf4d"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40cjnR72RzzF13n
 for <openbmc@lists.ozlabs.org>; Fri,  4 May 2018 17:09:47 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8E5CE22704;
 Fri,  4 May 2018 03:09:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 04 May 2018 03:09:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=XNRM+3FPSX1KMp/hX
 LRs94SWZhfLGRgC/MnxlT2Yu8o=; b=AV+TwkXAkrFV+Ps89roaFLW3nXW7gNvG7
 3IN8O/mK8WqQbkrOYB2SPu9vieCBMAaURDZN4gCk3ReEugTfgM5jnPstH6uEo92i
 iYPOFFEG3KUW1U+mxo0AWNU5kF7RLVvCNBMt9OldUQrgFRLL9+eMrhZEMk7sgO4d
 3S5YhkW77xI3bADpoF0Yz1vxgzwF9ptaaG1Be7SIuuWYJjufwBnR/y6qU5mKHLGa
 hafiVuA+uFgYgLTX9R8CI7eOrnA11KC3Neps+WjpfnMo58CjrtzaNWaG0QdHcFCd
 vEBirSoMWMKaGf9i4Ce1ChywGo8RnIHuMcj+hzq4BueohDtSrA7yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=XNRM+3FPSX1KMp/hXLRs94SWZhfLGRgC/MnxlT2Yu8o=; b=iDgqrf4d
 eMtxc/LuojlyIPsgWZoufR2K2TBoCwG0UR5kZUiMz4k774Bm9dnu0eF6TlGA9b0v
 ppLoguqmYwAiKnlJKZrzCN/B57nFOZcBa5hrgiJrf75pJqu+5UyuOy3qUSmHOMJF
 xSx+9g/dAFYZjVnbxDc3EYzUNS24/BuTJeLLiTDUQSVabFB0gx6ocxK+E63UqySe
 teX5zgLg4dOlnue2wnxGTRM5dR9wi140liACvAAs9hP3kgaGxFEZU0bTgrCm0Ocs
 a2Ps6ouZ9I3eRI9ELnmYRTA2vPIlulv8TU48W7mWZXzfrLyXonga8/efnVrhWsI5
 Xd4hvxNK3/PMnA==
X-ME-Sender: <xms:OQfsWuDMSW7ndB1ldshVIBsHNBhYULrFwptzZesgS6wzBc8Vi8IePw>
Received: from dave.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id A157C10256;
 Fri,  4 May 2018 03:09:43 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-devel@lists.openembedded.org
Cc: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [RESEND][meta-python][PATCH 2/3] meta-python: Port python-pyflame to
 32-bit ARM
Date: Fri,  4 May 2018 16:39:15 +0930
Message-Id: <20180504070916.11024-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180504070916.11024-1-andrew@aj.id.au>
References: <20180504070916.11024-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 04 May 2018 07:09:48 -0000

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
