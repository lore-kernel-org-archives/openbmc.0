Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::242; helo=mail-pf0-x242.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sj8pnAnh"; 
 dkim-atps=neutral
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCF1172FFzDr4T
 for <openbmc@lists.ozlabs.org>; Thu, 12 Oct 2017 13:19:48 +1100 (AEDT)
Received: by mail-pf0-x242.google.com with SMTP id 17so2872870pfn.12
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 19:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1JL5jaRejVQtAK3QGNQCabH9+WbuYmBIiqxrUG4heUo=;
 b=Sj8pnAnhZiTLoCpOR3JwXYFgZJVZ7pqyKI5DlNCVMpXE3ORljddtTIW9cRx6pPB2Y3
 rBApzI1+/q5wxHCVGrlz9C6NkhmM0k9ebPuP+DoEwUTmAupauUl+o5k6mtYbyFX53N4N
 9DbOZw6lxq2O5kiOyCNT3QtY0jutE5Xkup54eRXXUDE0sBfp3PXIyrHJN8x6UCWKnsWU
 f2G7/gkhNonoICDLlIw7IzZTxke/4nCz+JhciuAho9lq0HaubMiOD9revcFcuLYl044a
 hISKtmUpU5buMEqyMT2y6YUz5jH03v8h6QMQh/HkhTYUEEJLkc6F7y4H2/n+N/59k7F1
 8Ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1JL5jaRejVQtAK3QGNQCabH9+WbuYmBIiqxrUG4heUo=;
 b=h5BMejS4bEScXsvBqXgzyRowne86HPxDO/xs03MKRBHQJPd+7lfHqZbafUgsh1PSmT
 TKwFqDz9WRsfabFFEidxCrgpOIByFS1n6LRvChKZIXGY9JMBK6QSVSGs21o4V5B14eyJ
 OibKyEN12BTd6M99jCvYxB07uaoedw3H2DCJhjhOWZ7c6n7nzsniTp3qrmWgDJ5Tsxtr
 c5WtrKIiNGt6wtKI6LiSY0W+O4I+JBlIVuEGli5h+TRVbTeTfoykRoDCODMM6u5CsTEk
 9ghnZ3dcdFnZfAbDApup3Tnwc4/+GKuC7mb1bX3FcY8dEdX7PnGY6YLFK8i3maXL/Rhw
 Hsiw==
X-Gm-Message-State: AMCzsaVqhjaPNAGfE9CrDzZ2w8kyp6Zbazsk/JF6pkrQ9YqObNtno+zf
 a8brnsS7ZuKu+EHvgeZWBb74NF76
X-Google-Smtp-Source: AOwi7QB8o/PY1AxHuMGnhr5jl/aFb4if3Yq/penhvHdTJXCaOeveF6YskT+m6tjK2VYcKrHAuv751A==
X-Received: by 10.98.71.20 with SMTP id u20mr847376pfa.23.1507774786307;
 Wed, 11 Oct 2017 19:19:46 -0700 (PDT)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id d124sm25171576pfc.42.2017.10.11.19.19.44
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Wed, 11 Oct 2017 19:19:45 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>,
	andrew@aj.id.au
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: firstone: Fix occ and i2c
Date: Thu, 12 Oct 2017 10:17:17 +0800
Message-Id: <1507774637-13084-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Oct 2017 02:19:50 -0000

1. Use updated p8 occ driver;
2. Enable i2c buses that are used.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index d52b528..93ad3ea 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -117,6 +117,7 @@
 
 &i2c2 {
 	// i2c mux
+	status = "okay";
 };
 
 &i2c3 {
@@ -217,8 +218,8 @@
 	status = "okay";
 
 	// turismo
-	occ@50 {
-		compatible = "ibm,occ-i2c";
+	occ-hwmon@50 {
+		compatible = "ibm,p8-occ-hwmon";
 		reg = <0x50>;
 	};
 
@@ -232,9 +233,9 @@
 	status = "okay";
 
 	// turismo
-	occ@50 {
-		compatible = "ibm,occ-i2c";
-		reg = <0x50>;
+	occ-hwmon@51 {
+		compatible = "ibm,p8-occ-hwmon";
+		reg = <0x51>;
 	};
 
 	tmp423@4c {
@@ -260,10 +261,12 @@
 
 &i2c9 {
 	// 4 way mux
+	status = "okay";
 };
 
 &i2c10 {
 	// 4 way mux
+	status = "okay";
 };
 
 &i2c11 {
@@ -304,10 +307,12 @@
 
 &i2c12 {
 	// i2c hub PCA9516A
+	status = "okay";
 };
 
 &i2c13 {
 	// i2c hub PCA9516A
+	status = "okay";
 };
 
 &gpio {
-- 
1.9.1
