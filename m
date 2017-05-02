Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wH9vC30gBzDqFG
 for <openbmc@lists.ozlabs.org>; Tue,  2 May 2017 16:12:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qzySoYjF"; 
 dkim-atps=neutral
Received: by mail-pg0-x242.google.com with SMTP id v1so19377925pgv.3
 for <openbmc@lists.ozlabs.org>; Mon, 01 May 2017 23:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=395hZPBKPcaTQp0zemRhC6o45HCNYxhVhMR6iFi6Uwg=;
 b=qzySoYjF2pT3TD/9Ef8VlD5imQo97gNHAUEs0jeRNvdijkIYmKcsBqTUjdKGCu5/e6
 5c/Wukv95P6CXJLaRtxDpF//7VtwnHAWHCwri2I0oQoM8KacWIni7NT1gznPx8rtczQF
 5Jh6lJrqSsU734EqEj+COcyMDxrQWicypBgtVJ0YdrilzBNDfGrT9qthOIqzNJmTy7TF
 vVTtiA6nlFUcbBwXS1br7gvt9KEdrkTLlK6CR/lbehFsPBShZm2aBy+VebEobzifjP/x
 zJXcB+c4c05EjKE+sE75jiZCn82DLD0hJ32vUl25RWKvwXrtTSxOm9rsiI+STLNSXpF0
 1TCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=395hZPBKPcaTQp0zemRhC6o45HCNYxhVhMR6iFi6Uwg=;
 b=h7k3BWwECqKngUG/vt8/X3ZvzkqSUlBwH4mc0x7vQEH+A+mAym+3B+NkfSu/PhukIa
 18XPyN0ZAtIRsnrumIRXVDHEb55XBI6qXX2OHOnvL4bRC8LcdqFgyenvfSYPQnz0GPbC
 SUX3YnLxBUHBp9tr76tYEjzD8JSiwZe8TjkWF11yZVqxjPus+E4QFH3pICY56KfxORYy
 K1Ic5v+knGcr995B0ABCM9y9Wi+AA7iSpSZih39EFetfs94kIhEzBwsHsOJVFIUZwypb
 Ee1FNzal/JFSBzmeOJh3VLQGaM+s9LZbD68Sz+RvAq30aBYzIiraJxcNzna+SaplP8h4
 d48w==
X-Gm-Message-State: AN3rC/512pdjPRAnocWswFblH3Nl445FHspcYsSWQ6XXYyfvo+aSu28Z
 LDW9koc7z3Iybw==
X-Received: by 10.84.230.229 with SMTP id e92mr39010972plk.2.1493705573669;
 Mon, 01 May 2017 23:12:53 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id y184sm23585793pgb.33.2017.05.01.23.12.50
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 01 May 2017 23:12:53 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 02 May 2017 15:42:47 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>, Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: [PATCH linux dev-4.10 1/3] ARM: dts: aspeed: romulus: Add Infineon
 ir35221
Date: Tue,  2 May 2017 15:42:37 +0930
Message-Id: <20170502061239.7677-2-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170502061239.7677-1-joel@jms.id.au>
References: <20170502061239.7677-1-joel@jms.id.au>
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
X-List-Received-Date: Tue, 02 May 2017 06:12:55 -0000

The driver is not loaded at boot as the host must have power applied
before they can be probed.

OpenBMC-Staging-Count: 1
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index e70fc00b6d8d..07e8168fdf7f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -134,6 +134,11 @@
 	 *  CPU0 VDDR A
 	 *  CPU0 VDDR B
 	 */
+	 hwmon@70 {
+		 compatible = "infineon,ir35221";
+		 reg = <0x70>;
+		 status = "disabled";
+	 };
 };
 
 &i2c5 {
@@ -145,6 +150,11 @@
 	 *  CPU1 VDDR A
 	 *  CPU1 VDDR B
 	 */
+	 hwmon@70 {
+		 compatible = "infineon,ir35221";
+		 reg = <0x70>;
+		 status = "disabled";
+	 };
 };
 
 &i2c6 {
-- 
2.11.0
