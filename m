Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="AbekQJag"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HJwZf0O+"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hNpc6S4QzF2TF
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 16:38:32 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 99CEB21C3A;
 Thu, 10 May 2018 02:38:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 10 May 2018 02:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4fs2tW9Zux+gvy1Nh
 hzpRO1smQmti5nOIIbNXlIaCvA=; b=AbekQJag8bcWa1wYxGv9BUo0hy+iajVy8
 byLqr13/tN2rIs+HpPEa+Rld0zXmiePoE0gZpWxuBgKkLW5lN8QlnFAGZM5sqQEq
 YCtz0pzr9giwrdPEz2o/LaipfdRQvc0MIcT34Ek6EzkaTVDwa/atvY8uY7glwD4o
 h+UQuae8aUtJj/ptSpQWaeBwrR1P8hHvrwaIyywRspdK97x6bqZCd+Wk5RhiHg3l
 jZUhrLRyjjvDea8gG47A4nij11iENEHUz/ujk2e9UawT9Xvea7G6CsNOf1WTTjCC
 LuPlveKvWrrzNzt6uflbwdYvrG/B+9HtKYh++xH7LaQ51f02U517g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=4fs2tW9Zux+gvy1NhhzpRO1smQmti5nOIIbNXlIaCvA=; b=HJwZf0O+
 Cl6Rfx78Zl4ue45TS3Gq22lWe43DxcLAwUIyNOjGlbZaCmwHkYIGpIItzUAi+nJU
 MFJI1LMeRwzDUW80EMy0+RWza6Djs7YFmAXSgGJSu0+QOOQRvk3GVUz2Y+xUnh5o
 SzG+8nqs92nFVTapS0cdRE0iD6k+PrMkgPutXOeH7+sWvVRi4+AKJHCEYyZucf2U
 IA01irBPkEjdji6qsMj8UFZDyx+3zgq2ucyUzA8wgVjbATwwPfEIuxfdHdiJ/20c
 Q4x246ESGTjIJf2fiapbWQiHt06cJpOm6+L6Vjv+Z/Qkd2znBUAfd8h2ICBLbrMa
 cS+2FyTsPZsVdw==
X-ME-Sender: <xms:5ujzWu5rOj_Plo-epD_mNTLaN_Caa6B2gqGJIR1uE_lBkM4hBCt8tw>
Received: from dave.aj.id.au (ppp118-210-26-60.bras1.adl4.internode.on.net
 [118.210.26.60])
 by mail.messagingengine.com (Postfix) with ESMTPA id AABBA10253;
 Thu, 10 May 2018 02:38:28 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-devel@lists.openembedded.org
Cc: anuj.mittal@intel.com, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [meta-python][PATCH v2 3/3] meta-python: Make python-pyflame cope
 with prelinked ELFs
Date: Thu, 10 May 2018 16:07:18 +0930
Message-Id: <20180510063718.16913-3-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 10 May 2018 06:38:33 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 ...mbol-Account-for-prelinked-shared-objects.patch | 134 +++++++++++++++++++++
 .../python/python-pyflame_1.6.6.bb                 |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyflame-1.6.6/0001-symbol-Account-for-prelinked-shared-objects.patch

diff --git a/meta-python/recipes-devtools/python/python-pyflame-1.6.6/0001-symbol-Account-for-prelinked-shared-objects.patch b/meta-python/recipes-devtools/python/python-pyflame-1.6.6/0001-symbol-Account-for-prelinked-shared-objects.patch
new file mode 100644
index 000000000000..3eefc9cb9830
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyflame-1.6.6/0001-symbol-Account-for-prelinked-shared-objects.patch
@@ -0,0 +1,134 @@
+From 007965d341349679607699d005c4af811b2c419a Mon Sep 17 00:00:00 2001
+From: Andrew Jeffery <andrew@aj.id.au>
+Date: Fri, 4 May 2018 11:23:53 +0930
+Subject: [PATCH] symbol: Account for prelinked shared objects
+
+Some projects, such as those derived from Yocto, tend to prelink their
+binaries and libraries to reduce runtime overhead. Currently this trips
+up pyflame in its symbol address calculations, and leads to ptrace
+failures due to spurious addresses:
+
+   $ pyflame -t python -c "print 'foo'"
+   Unexpected ptrace(2) exception: Failed to PTRACE_PEEKDATA (pid 1482, addr 0x9f9b1d70): Input/output error
+   Unexpected ptrace(2) exception: Failed to PTRACE_PEEKDATA (pid 1482, addr 0x9f9b1d70): Input/output error
+   Unexpected ptrace(2) exception: Failed to PTRACE_PEEKDATA (pid 1482, addr 0x9f9b1d70): Input/output error
+   Unexpected ptrace(2) exception: Failed to PTRACE_PEEKDATA (pid 1482, addr 0x9f9b1d70): Input/output error
+   Unexpected ptrace(2) exception: Failed to PTRACE_PEEKDATA (pid 1482, addr 0x9f9b1d70): Input/output error
+   ...
+
+Add support for reading a prelinked base p_vaddr out of the ELF and
+adjust the PyAddresses values accordingly.
+
+Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
+---
+ src/symbol.cc | 15 +++++++++++++++
+ src/symbol.h  | 29 ++++++++++++++++++++++++++++-
+ 2 files changed, 43 insertions(+), 1 deletion(-)
+
+diff --git a/src/symbol.cc b/src/symbol.cc
+index 125174efeeb5..39c3e8132dd1 100644
+--- a/src/symbol.cc
++++ b/src/symbol.cc
+@@ -166,6 +166,17 @@ PyABI ELF::WalkTable(int sym, int str, PyAddresses *addrs) {
+   return abi;
+ }
+ 
++addr_t ELF::GetBaseAddress() {
++  int32_t phnum = hdr()->e_phnum;
++  int32_t i;
++  for (i = 0; i < phnum && phdr(i)->p_type != PT_LOAD; i++) {
++  }
++  if (i == phnum) {
++    throw FatalException("Failed to find PT_LOAD entry in program headers");
++  }
++  return phdr(i)->p_vaddr;
++}
++
+ PyAddresses ELF::GetAddresses(PyABI *abi) {
+   PyAddresses addrs;
+   PyABI detected_abi = WalkTable(dynsym_, dynstr_, &addrs);
+@@ -176,6 +187,10 @@ PyAddresses ELF::GetAddresses(PyABI *abi) {
+   if (abi != nullptr) {
+     *abi = detected_abi;
+   }
++  // Handle prelinked shared objects
++  if (hdr()->e_type == ET_DYN) {
++    return addrs - GetBaseAddress();
++  }
+   return addrs;
+ }
+ }  // namespace pyflame
+diff --git a/src/symbol.h b/src/symbol.h
+index 124853bcc1c1..bb92b9a2604b 100644
+--- a/src/symbol.h
++++ b/src/symbol.h
+@@ -28,15 +28,19 @@
+ 
+ #if USE_ELF64
+ #define ehdr_t Elf64_Ehdr
++#define phdr_t Elf64_Phdr
+ #define shdr_t Elf64_Shdr
+ #define dyn_t Elf64_Dyn
+ #define sym_t Elf64_Sym
++#define addr_t Elf64_Addr
+ #define ARCH_ELFCLASS ELFCLASS64
+ #else
+ #define ehdr_t Elf32_Ehdr
++#define phdr_t Elf32_Phdr
+ #define shdr_t Elf32_Shdr
+ #define dyn_t Elf32_Dyn
+ #define sym_t Elf32_Sym
++#define addr_t Elf32_Addr
+ #define ARCH_ELFCLASS ELFCLASS32
+ #endif
+ 
+@@ -67,8 +71,18 @@ struct PyAddresses {
+         interp_head_hint(0),
+         pie(false) {}
+ 
++  PyAddresses operator-(const unsigned long base) const {
++    PyAddresses res(*this);
++    res.tstate_addr = this->tstate_addr == 0 ? 0 : this->tstate_addr - base;
++    res.interp_head_addr =
++        this->interp_head_addr == 0 ? 0 : this->interp_head_addr - base;
++    res.interp_head_fn_addr =
++        this->interp_head_fn_addr == 0 ? 0 : this->interp_head_fn_addr - base;
++    return res;
++  }
++
+   PyAddresses operator+(const unsigned long base) const {
+-    PyAddresses res;
++    PyAddresses res(*this);
+     res.tstate_addr = this->tstate_addr == 0 ? 0 : this->tstate_addr + base;
+     res.interp_head_addr =
+         this->interp_head_addr == 0 ? 0 : this->interp_head_addr + base;
+@@ -113,6 +127,9 @@ class ELF {
+   // ABI.
+   PyAddresses GetAddresses(PyABI *abi);
+ 
++  // Extract the base load address from the Program Header table
++  addr_t GetBaseAddress();
++
+  private:
+   void *addr_;
+   size_t length_;
+@@ -122,6 +139,16 @@ class ELF {
+     return reinterpret_cast<const ehdr_t *>(addr_);
+   }
+ 
++  inline const phdr_t *phdr(int idx) const {
++    if (idx < 0) {
++      std::ostringstream ss;
++      ss << "Illegal phdr index: " << idx;
++      throw FatalException(ss.str());
++    }
++    return reinterpret_cast<const phdr_t *>(p() + hdr()->e_phoff +
++                                            idx * hdr()->e_phentsize);
++  }
++
+   inline const shdr_t *shdr(int idx) const {
+     if (idx < 0) {
+       std::ostringstream ss;
+-- 
+2.14.1
+
diff --git a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
index 7a6d3b09962f..abf3ed7fee71 100644
--- a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
+++ b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
@@ -1,3 +1,4 @@
 require python-pyflame.inc
 
 SRC_URI += "file://0001-ptrace-Abstract-over-user_regs_struct-name-which-dif.patch"
+SRC_URI += "file://0001-symbol-Account-for-prelinked-shared-objects.patch"
-- 
2.14.1
