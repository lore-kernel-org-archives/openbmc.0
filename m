Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E350A1A01DC
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2016 20:10:16 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452762611118765.6697951826857;
 Thu, 14 Jan 2016 01:10:11 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs] Add doc for contribution guidelines
Date: Thu, 14 Jan 2016 03:10:09 -0600
Message-Id: <1452762609-724-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452762609-724-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452762609-724-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 14 Jan 2016 09:10:17 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Start somewhere to document our development conventions.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 contributing.md | 145 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 contributing.md

diff --git a/contributing.md b/contributing.md
new file mode 100644
index 0000000..bf36363
--- /dev/null
+++ b/contributing.md
@@ -0,0 +1,145 @@
+Contributing to OpenBMC
+=======================
+
+Here's a little guide to working on OpenBMC. This document will always be
+a work-in-progress, feel free to propose changes.
+
+Authors:
+
+  Jeremy Kerr <jk@ozlabs.org>
+
+Structure
+---------
+
+OpenBMC has quite a module structure, consisting of small daemons with a
+limited set of responsibilities. These communicate over dbus with other
+components, to implement the complete BMC system.
+
+The BMC's interfaces to the external world are typically through a separate
+daemon, which then translates those requests to dbus messages.
+
+These separate projects are then compiled into the final system by the
+overall 'openbmc' build infrastructure.
+
+For future development, keep this design in mind. Components' functionality
+should be logically grouped, and keep related parts together where it
+makes sense.
+
+Coding style
+------------
+
+Components of the OpenBMC sources should have consistent style.
+
+For C code, we typically use the Linux coding style, which is documented at:
+
+  http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/CodingStyle
+
+In short:
+
+  - Indent with tabs instead of spaces, set at 8 columns
+
+  - 80-column lines
+
+  - Opening braces on the end of a line, except for functions
+
+
+Submitting changes
+------------------
+
+We use git for almost everything. Changes should be sent as patches to their
+relevant source tree - or a git pull request for convenience.
+
+Each commit should be a self-contained logical unit, and smaller patches are
+usually better. However, if there is no clear division, a larger patch is
+okay. During development, it can be useful to consider how your change can be
+submitted as logical units.
+
+Commit messages are important. They should describe why the change is needed,
+and what effects it will have on the system. Do not describe the actual
+code change made by the patch; that's what the patch itself is for.
+
+Use your full name for contributions, and include a "Signed-off-by" line,
+to indicate that you agree to the Developers Certificate of Origin (see below).
+
+Ensure that your patch doesn't change unrelated areas. Be careful of
+accidental whitespace changes - this makes review unnecessarily difficult.
+
+The guidelines in the Linux kernel are very useful:
+
+ http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches
+
+Your contribution will generally need to be reviewed before being accepted.
+
+Avoid references to non-public resources
+----------------------------------------
+
+Code and commit messages should not refer to companies' internal documents
+or systems (including bug trackers). Other developers may not have access to
+these, making future maintenance difficult.
+
+
+Best practices for dbus interfaces
+----------------------------------
+
+ * New dbus interfaces should be reusable
+
+ * Type signatures should and use the simplest types possible, appropriate
+   for the data passed. For example, don't pass numbers as ASCII strings.
+
+ * New dbus interfaces should be documented in the 'docs' repository, at:
+
+     https://github.com/openbmc/docs/blob/master/dbus-interfaces.md
+
+See also: http://dbus.freedesktop.org/doc/dbus-api-design.html
+
+
+Best practices for C
+--------------------
+
+There are numerous resources avaialble elsewhere, but a few items that are
+relevant to OpenBMC work:
+
+ * You almost never need to use `system(<some shell pipeline>)`. Reading and
+   writing from files should be done with the appropriate system calls.
+
+   Generally, it's much better to use `fork(); execve()` if you do need to
+   spawn a process, especially if you need to provide variable arguments.
+
+ * Use the `stdint` types (eg, `uint32_t`, `int8_t`) for data that needs to be
+   a certain size. Use the `PRIxx` macros for printf, if necessary.
+
+ * Don't assume that `char` is signed or unsigned.
+
+ * Beware of endian considerations when reading to & writing from
+   C types
+
+ * Declare internal-only functions as `static`, declare read-only data
+   as `const` where possble.
+
+
+Developer's Certificate of Origin 1.1
+-------------------------------------
+
+    By making a contribution to this project, I certify that:
+    
+    (a) The contribution was created in whole or in part by me and I
+        have the right to submit it under the open source license
+        indicated in the file; or
+    
+    (b) The contribution is based upon previous work that, to the best
+        of my knowledge, is covered under an appropriate open source
+        license and I have the right under that license to submit that
+        work with modifications, whether created in whole or in part
+        by me, under the same open source license (unless I am
+        permitted to submit under a different license), as indicated
+        in the file; or
+    
+    (c) The contribution was provided directly to me by some other
+        person who certified (a), (b) or (c) and I have not modified
+        it.
+    
+    (d) I understand and agree that this project and the contribution
+        are public and that a record of the contribution (including all
+        personal information I submit with it, including my sign-off) is
+        maintained indefinitely and may be redistributed consistent with
+        this project or the open source license(s) involved.
-- 
2.6.4
