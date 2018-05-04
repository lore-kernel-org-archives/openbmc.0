Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LfItW6rA"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QGWSDu2G"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40cjSh2b7TzF0QC
 for <openbmc@lists.ozlabs.org>; Fri,  4 May 2018 16:55:16 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EFDB322882;
 Fri,  4 May 2018 02:55:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 04 May 2018 02:55:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=b1oUnctt2r1eCGx+4
 p7OPFMGcdKNA6k3FafxLUdlMhU=; b=LfItW6rA9gHd6lOksBdT22YV1uWdtFTgz
 O9KJ45k5pN1j1xEbKylEnStjBeSngz0WiEhisGDq3MC263zVrstfVGq6tspPlB3+
 55Wo11mhAmTMswbBM4kZb462NVSevyf71Ta174pIsUxDfGKk6Ovmke5AP07fLs4S
 fkYrWXxiW80jATuy5kVLdN0dvL0tzHI5S9UcQsDYrCYMU3ws6Qc0dWjSkfk4+2Zr
 Ryf6RUBJhu1DOYE/vZvnoXrhAScd0vLYSOy2b1WzuB2XsyrsUPB8+jcTwTzPBoi6
 0lN5sxtnQVMWrhsacQTEv3cOADFKDUytpgEMputUJHXE+x7dAHAhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=b1oUnctt2r1eCGx+4p7OPFMGcdKNA6k3FafxLUdlMhU=; b=QGWSDu2G
 fiZuH84koIHY5tN0hvoS81baum7LSiRNP9IB9eVGgMLoaArjcNtW5xel4rlNpuSs
 zAuhBspXEsMrLdFXNeaaz111eG7d1g29DiGE1fIuKbA5FkvCDtfBVZWku/p7gbWt
 hmhvUi/J5UiEX4Cj8UKdupIAxIt2dtuKVM78wCB3SB/ESQL8p7Lfb8fBUVhGM2Rv
 mozHDaMqcvfIMvSe1cBdpo39jGqlGF3BhXxDcNfXjfwYkMleSw5Ih5Gy+FI0jpgT
 KRG8fPJC2tDw91P145GjLXddh9aoWM4itPah3XwWHFq/6GmJRIOY+I8NAu44rJbZ
 HHMSVNad23oQ4A==
X-ME-Sender: <xms:0QPsWghlgW3seyipXgWO14A0r5q14SO-ucJIql-bWRexzFPHD-aTwQ>
Received: from dave.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 45267E4408;
 Fri,  4 May 2018 02:55:11 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-devel@lists.openembedded.org
Cc: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [meta-python][PATCH 3/3] meta-python: Make python-pyflame cope with
 prelinked ELFs
Date: Fri,  4 May 2018 16:24:32 +0930
Message-Id: <20180504065432.10308-3-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 04 May 2018 06:55:17 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 ...mbol-Account-for-prelinked-shared-objects.patch | 134 +++++++++++++++++++++
 .../python/python-pyflame_1.6.6.bb                 |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyflame/0001-symbol-Account-for-prelinked-shared-objects.patch

diff --git a/meta-python/recipes-devtools/python/python-pyflame/0001-symbol-Account-for-prelinked-shared-objects.patch b/meta-python/recipes-devtools/python/python-pyflame/0001-symbol-Account-for-prelinked-shared-objects.patch
new file mode 100644
index 000000000000..3eefc9cb9830
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyflame/0001-symbol-Account-for-prelinked-shared-objects.patch
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
index 2edd708506e3..93c8ddc6d483 100644
--- a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
+++ b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
@@ -5,3 +5,4 @@ SRC_URI[md5sum] = "53d5822e5be371303e217a68ea9ea3e5"
 SRC_URI[sha256sum] = "03723509c037a994585e81e4a9c6d8e4fed87b486e23edd8d355a7bcc009bf79"
 
 SRC_URI += "file://0001-ptrace-Abstract-over-user_regs_struct-name-which-dif.patch"
+SRC_URI += "file://0001-symbol-Account-for-prelinked-shared-objects.patch"
-- 
2.14.1
