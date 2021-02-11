Return-Path: <SRS0=fhgC=HN=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE096C433DB
	for <openbmc@archiver.kernel.org>; Thu, 11 Feb 2021 08:37:02 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3403F64E16
	for <openbmc@archiver.kernel.org>; Thu, 11 Feb 2021 08:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3403F64E16
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dbqk44FJqzDvYB
	for <openbmc@archiver.kernel.org>; Thu, 11 Feb 2021 19:37:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--gmouse.bounces.google.com
 (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com;
 envelope-from=3muwkyaykb6ulrtzxjlttlqj.htrtujsgrhqnxyx.teqfgx.twl@flex--gmouse.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=eRRFCi1o; dkim-atps=neutral
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com
 [IPv6:2a00:1450:4864:20::349])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dbqgy5DxxzDwmD
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2021 19:35:03 +1100 (AEDT)
Received: by mail-wm1-x349.google.com with SMTP id z188so5283766wme.1
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2021 00:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=XoHdkQfGIq0UPLGmwj/uEJr/Rth4Y5UbWF/+QD+59Zg=;
 b=eRRFCi1oHv8Na4x50Lg/Dp3xPN0goocMfG9v3YA/kAg4aWIc1YW2ArK8kmR3a8zOAo
 hbhF5qaOs6PnZ5ob46+yTTzfRiUUj/CDRwhNXFWDX7VJkM4o6oeu6OTpXi15dGCabtK9
 3T1EWPMo0PAA4wBqWzfrL7y3S0DoZXCE5yduzr2l4PftiBnIapSe/fbAeIKnOUzhA5A3
 vyi4XCiv0R5CGJ61jIvnuK4apG6x/x+BxiEEmB2XzRLUTtHjOemxsaXXBhO1fkIRDdqJ
 D3iq4ldtzqTSEwxSdbdAnxuIIWSUO+PA/vTXasUpG/KomYa6RIk2wxJ1f6AwN58YkWQf
 brXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=XoHdkQfGIq0UPLGmwj/uEJr/Rth4Y5UbWF/+QD+59Zg=;
 b=fHNWHbJadCTfzXv7MoZ5BZzlbQMfB5+oSgb7JQsuPYcvGKWAFscHFUFoQr3xBvQJJl
 WfWiZxI3U1Xa6ufcyxlkABZ0Q0rIul9K37Raw+/zvywyYmjE3IjPV4eg3ZF9V5wFpFvS
 jIDZ6MrpH3owE17DVXZa+f/npkb/E5aXWv50RX/svpjSNqZb4M+RwMaN15fBSVacBQDF
 i/E7k+fRn+bZjKPmIwFt9ALk2LgJrAu0l/+BrDhyzGFSoaK96nNqGdEjCOsagLvppZZ/
 /UZd269DWlXImd72kKp+C8VjMQErRrOj/5xb51ycdMDuon7eI2N1CtpJjxL9ho39pWng
 hsOQ==
X-Gm-Message-State: AOAM530LSqK6mmDl7yRcm6Eqg76fM02gXuJJTztXlmXqfMnSHf1ReppN
 25j7IH8dUBENIUyHnf0a8smB1Ap8VG06e5l6S/b200SPhCAm8GnMl2T9kKY2vsSA1r99WniRk1x
 Xa5EUDX0PRmaQLOmVDolBLErQWLI4payWzNSLRfyvcyD+5B6MuGf3jdVfU2Z7s2eK
X-Google-Smtp-Source: ABdhPJzrq8vLDgM37smg7wsVQgTCdFf1URF3oAGcbjzZe2/xgBF/2MEvoQVEYAqbLMOgTGelYpjyWpQe0Ho=
X-Received: from gmouse.zrh.corp.google.com
 ([2a00:79e0:42:200:bc3a:4732:1655:1b61])
 (user=gmouse job=sendgmr) by 2002:a05:600c:6c5:: with SMTP id
 b5mr3909306wmn.137.1613032498522; Thu, 11 Feb 2021 00:34:58 -0800 (PST)
Date: Thu, 11 Feb 2021 09:34:53 +0100
Message-Id: <20210211083454.37117-1-gmouse@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH] ARM: dts: nuvoton: Fix flash layout This change satisfy
 OpenBMC requirements for flash layout.
From: gmouse@google.com
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: "Anton D. Kachalov" <gmouse@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

From: "Anton D. Kachalov" <gmouse@google.com>

Signed-off-by: Anton D. Kachalov <gmouse@google.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28 +++++++----------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
index bd1eb6ee380f..741c1fee8552 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -182,8 +182,8 @@ bbuboot2@80000 {
 				reg = <0x0080000 0x80000>;
 				read-only;
 				};
-			envparam@100000 {
-				label = "env-param";
+			ubootenv@100000 {
+				label = "u-boot-env";
 				reg = <0x0100000 0x40000>;
 				read-only;
 				};
@@ -195,25 +195,13 @@ kernel@200000 {
 				label = "kernel";
 				reg = <0x0200000 0x400000>;
 				};
-			rootfs@600000 {
-				label = "rootfs";
-				reg = <0x0600000 0x700000>;
+			rofs@780000 {
+				label = "rofs";
+				reg = <0x0780000 0x1680000>;
 				};
-			spare1@D00000 {
-				label = "spare1";
-				reg = <0x0D00000 0x200000>;
-				};
-			spare2@0F00000 {
-				label = "spare2";
-				reg = <0x0F00000 0x200000>;
-				};
-			spare3@1100000 {
-				label = "spare3";
-				reg = <0x1100000 0x200000>;
-				};
-			spare4@1300000 {
-				label = "spare4";
-				reg = <0x1300000 0x0>;
+			rwfs@1e00000 {
+				label = "rwfs";
+				reg = <0x1e00000 0x200000>;
 			};
 		};
 	};
-- 
2.30.0.478.g8a0d178c01-goog

