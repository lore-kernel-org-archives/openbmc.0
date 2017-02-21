Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vS7th5JqTzDqH5
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 16:13:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SeORXjLO"; 
 dkim-atps=neutral
Received: by mail-pg0-x241.google.com with SMTP id s67so5669238pgb.1
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 21:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6Jg3LOGaa+XePuYXZMWAMLbZyl0UINRVHXqEhdlTjq8=;
 b=SeORXjLOjbE4y6rgvjZ4sQkx01sMvqiICY0566Fh1UColLLJec8rRUYBHKzJKqJ6Mv
 Bm6Sv3EmjKPpLH8c/ZZuFdZdIMQoLnxbnuAN9WpCodnGRkEJ2RRicgmQkhWgeO0WapNd
 N74GsqfQphxmCAF+u0S3BQ/A+2f53UhmsD50NUEERktGfkj6vjGeNmYjGyPV+GKg1QTz
 v/+Pn5b7TCPIB5wRYb+MT/C4K4YY+7IhQOI5Ap9ZNaQ/HOk0SWSdvHhJ9W+jOjGAdj/R
 /dGUAyX8f7qtu6GuK8ewcNqmj0RpzGmSqVpJb27lEaaZoXZUTtlkol8ZxWQ2Zm2vq94s
 bIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=6Jg3LOGaa+XePuYXZMWAMLbZyl0UINRVHXqEhdlTjq8=;
 b=J9dS/9k3ivwVEFQrf8Fz90Vowbw5I72zsXuR8/+4HCYDmJ7Bz0nZdPsIhh7PM6cLDb
 LFz+jc9Jz+AiUVuTaT5Ejm6Qk1ikLwFag29SBQAORyTnNpHbubHSCIeYSUOcVqVyUaXo
 vGkkI7eN62SII0XcoArJCMXCAhR/fYjF7DARYEFsPbfyhUNM3cxCT7vSmNi6Y5OZbVuU
 dRI9g+uAzK9f01CLv/xJFrgu1PHgiHKhPuz+bw8XTBoHosjUlpO2S1c4dGJ4iDTarFAA
 1y9eqikJGOWJOUacEkrKiLipBQdARjwdj8PWcfpUqLOQyUpGRz/Pc1lllOaBs6nqv/sx
 C0fg==
X-Gm-Message-State: AMke39mZsXbt/TkDv4MH5NkF0SYtsYLUnwNLVHPbt5byYBB8Qi1SvuqNvc7mhjWvg+5ieg==
X-Received: by 10.98.152.79 with SMTP id q76mr30418184pfd.147.1487653994916;
 Mon, 20 Feb 2017 21:13:14 -0800 (PST)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id 9sm37844516pfk.121.2017.02.20.21.13.11
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 20 Feb 2017 21:13:14 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 21 Feb 2017 15:43:08 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyrilbur@gmail.com>, Lei YU <mine260309@gmail.com>,
 Xo Wang <xow@google.com>
Subject: [PATCH linux dev-4.7 2/2] ARM: dts: aspeed: Reserve memory on all P9
 machines
Date: Tue, 21 Feb 2017 15:42:59 +1030
Message-Id: <20170221051259.18383-2-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170221051259.18383-1-joel@jms.id.au>
References: <20170221051259.18383-1-joel@jms.id.au>
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
X-List-Received-Date: Tue, 21 Feb 2017 05:13:17 -0000

This flash_memory region reserved memory region is used by the host<->bmc
mailbox daemon.

The vga_memory region is for the host processor's framebuffer when using
the Aspeed as a PCI graphics device. We reserve the maximum region to
protect against bad host drivers. In the future this should correspond
to the amount of memory we've told the host it can use.

These numbers were generated as follows for Zaius:

 $ genmem.py --ram-base 0x80000000 --ram 1G --flash 64M

And for Romulus and Witherspoon:

 $ genmem.py --ram-base 0x80000000 --ram 512M --flash 64M --vga 64M

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
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 16 ++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  9 +++++++--
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       |  4 ++--
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 58baf87454e2..7293b41239a3 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -20,6 +20,22 @@
 		reg = <0x80000000 0x20000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		vga_memory: region@9c000000 {
+			no-map;
+			reg = <0x9c000000 0x04000000>; /* 64M */
+		};
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
index 2cbdeba88908..1ea8f65c1dab 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -25,9 +25,14 @@
 		#size-cells = <1>;
 		ranges;
 
-		flash_memory: region@94000000 {
+		vga_memory: region@9c000000 {
 			no-map;
-			reg = <0x94000000 0x04000000>; /* 64M */
+			reg = <0x9c000000 0x04000000>; /* 64M */
+		};
+
+		flash_memory: region@98000000 {
+			no-map;
+			reg = <0x98000000 0x04000000>; /* 64M */
 		};
 	};
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index e1c9b3f4fe44..c3a6a8656b3e 100644
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
