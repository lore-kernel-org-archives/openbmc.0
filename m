Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vV0CS4dKvzDqGp
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 16:34:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="guWl2Dlt"; 
 dkim-atps=neutral
Received: by mail-pg0-x242.google.com with SMTP id z128so1754114pgb.3
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 21:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=icfClmvu1c2tLG4LzKKgIo+hiSqsVri6+0/414bed2k=;
 b=guWl2DltGy345VQCpvfKELJTGovI1I0Ejy6S61yQRFJvBwQeZb+zBHu9P+GEQWTSZQ
 t3HLMEnl6QQszWtInuh0bT1CC+zmnWjfU5SrDxsfnjj0RZfiZRhBr1mYlItNzrDyeWr+
 Qealh4oIfhyxkFA755gIaBYtirrKNE88A8M9J6GyptlbTpZDvrNLFu/txk19Qy942/t+
 mHSuFv74yX31yTB7cr5vHFzU/RtqZ/9/mHByFlBPRaKs4ht2j3ZZj4cuxWDvaoPDjY91
 TXvysaaS/qDfSPLdo+HG1OdpbTeWGXCA9YPU0cKf1ukbfA9qeDeC/M/7UegvkwGhiyPB
 szsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=icfClmvu1c2tLG4LzKKgIo+hiSqsVri6+0/414bed2k=;
 b=OXnFowKYuI+KPjmV5WA26Oa2+12kl0HQdr5qQZzABHdgNFzuOfxT9Lf84v/dsbMBVm
 oLs801rYKPhY5H0M75POiqqstS7asdPjZFhjWscLPtOmJgG/Jy89EUAwn3Ye1ERIDBgN
 7UuN9memdr57R5YjYr79zHTcM5gq03Lf/FsszedvCAPHEf/Gop5CFDpM5S4z/BcFbdHP
 5mbOi8G+CTMlR8eanZd5FkP5h2pzZKpwcFz9RV9flK8/CUNPEh+s+3BDd2aZq66va59y
 U2Ry4H+8BTF5C8y6pTwRVSWf6EPhP6oGDACzYbmTJ1Js8NQtY1LtHJlbEMO3wIshAt59
 VzSg==
X-Gm-Message-State: AMke39npq/cvUeGiZMmwL02VSGNByusSGiyApt80qpJiZ+BdVaRYaOwU1j9xd9qbBglabg==
X-Received: by 10.98.202.80 with SMTP id n77mr1221778pfg.167.1487914450569;
 Thu, 23 Feb 2017 21:34:10 -0800 (PST)
Received: from aurora.jms.id.au (103-232-208-194.nat.sa.cust.uniti.network.
 [103.232.208.194])
 by smtp.gmail.com with ESMTPSA id a77sm12709423pfj.1.2017.02.23.21.34.05
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 23 Feb 2017 21:34:09 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 24 Feb 2017 16:04:00 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyrilbur@gmail.com>, Lei YU <mine260309@gmail.com>,
 Xo Wang <xow@google.com>, Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Subject: [PATCH linux dev-4.7 v2] ARM: dts: aspeed: Reserve RAM on P9 machines
Date: Fri, 24 Feb 2017 16:03:57 +1030
Message-Id: <20170224053357.18391-1-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2017 05:34:13 -0000

This flash_memory region reserved memory region is used by the host<->bmc
mailbox daemon.

This patch initially had a vga_memory region for the host processor's
framebuffer when using the Aspeed as a PCI graphics device. However this
is not required as u-boot modifies the /memory node of the device tree
to report the total RAM size minus the strapped VGA framebuffer. This is
16MB of the current system.

These numbers were generated as follows:

 $ genmem.py --ram-base 0x80000000 --ram 1G --flash 64M

And for Romulus and Witherspoon:

 $ genmem.py --ram-base 0x80000000 --ram 512M --flash 64M

With this script:

def convert_one(s):
    suffixes = [
                ('K', 1024),
                ('M', (1024*1024)),
                ('G', (1024*1024*1024)),
                ('T', (1024*1024*1024*1024)),
                ('th', 1000),
                ('mi', (1000*1000)),
                ('bi', (1000*1000*1000)),
                ('tri', (1000*1000*1000*1000))
               ]

    s = s.strip()

    factor = 1
    for suffix, mul in suffixes:
        if s.endswith(suffix) or s.endswith(suffix.lower()):
            factor = mul
            s = s[:-len(suffix)]
            break

    val = None

    if s.startswith('0b'):
        val = convert_binary(s)
    elif s.startswith('0x'):
        val = int(s, 16)
    else:
        for c in 'abcdefABCDEF':
            if c in s:
                val = int(s, 16)
                break

    if val is None:
        val = int(s)

    val *= factor

    return val

import argparse
parser = argparse.ArgumentParser()
parser.add_argument('--ram-base')
parser.add_argument('--ram')
parser.add_argument('--flash')
parser.add_argument('--vga')

args = parser.parse_args()
base = convert_one(args.ram_base)
size = convert_one(args.ram)
flash_size = convert_one(args.flash)
vga_size = 0
if args.vga:
    vga_size = convert_one(args.vga)

vga_base = base + size - vga_size
flash_base = base + size - vga_size - flash_size

if flash_base % flash_size != 0:
    print("Error: flash base address not a multiple of window. Rounding down")
    flash_base -= flash_base % flash_size

print("memory {\r\n\treg = <0x%08x 0x%08x>;\r\n}" % (base, size))
if vga_size > 0:
    print("vga_memory {\r\n\tno-map;\r\n\treg = <0x%08x 0x%08x>;\r\n}" % (vga_base, vga_base))
print("flash_memory {\r\n\tno-map;\r\n\treg = <0x%08x 0x%08x>;\r\n}" % (flash_base, flash_size))

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2 drops the the reserved region for VGA as we don't need it

 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 11 +++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  4 ++--
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       |  4 ++--
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 5ba7b62aee83..93fbd7b8c490 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -20,6 +20,17 @@
 		reg = <0x80000000 0x20000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		flash_memory: region@98000000 {
+			no-map;
+			reg = <0x98000000 0x04000000>; /* 64M */
+		};
+	};
+
 	fsi-master {
 		compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index e15bd256c0fd..0769507f1126 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -25,9 +25,9 @@
 		#size-cells = <1>;
 		ranges;
 
-		flash_memory: region@94000000 {
+		flash_memory: region@98000000 {
 			no-map;
-			reg = <0x94000000 0x04000000>; /* 64M */
+			reg = <0x98000000 0x04000000>; /* 64M */
 		};
 	};
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index d9f63d7752dd..c2af9ffa89bf 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -25,9 +25,9 @@
 		#size-cells = <1>;
 		ranges;
 
-		flash_memory: region@94000000 {
+		flash_memory: region@bc000000 {
 			no-map;
-			reg = <0x94000000 0x04000000>; /* 64M */
+			reg = <0xbc000000 0x04000000>; /* 64M */
 		};
 	};
 
-- 
2.11.0
