Return-Path: <venture@google.com>
Received: from mail-pf0-x235.google.com (mail-pf0-x235.google.com
 [IPv6:2607:f8b0:400e:c00::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wq3bN6lnkzDq8B
 for <openbmc@lists.ozlabs.org>; Sat, 17 Jun 2017 01:05:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="DznvNQfM"; 
 dkim-atps=neutral
Received: by mail-pf0-x235.google.com with SMTP id 83so23639522pfr.0
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 08:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=TeuPABiNO2xbus/6T+oohGSSeo9NaH3/Sa0r2Eh66rg=;
 b=DznvNQfM9FCEA1YYOTOhyULkeSxCBizK9Kgc4S2SdHFcY8QjAhzr+4fNPZzf9DzY0u
 D/szgArVOQtmM++ISFIh8FPomY8qq4zt56k4TmRRu1tBP4T4rlEQS0/tGTdlPlrkWrxA
 a9QWH0rybP8oYWUxQHQsFAlAvuCv1cbk1U1CajWmaygSRLnBwe2HMOSGhXrwP3mEV5Vr
 YGF+9UzuSA/APXLh1NTHO164DfjvpKBv3P5WnTvyLde6g8SUrPF9TiAeEqE3x3hkNCfj
 rJw6HpZKfg2sUElITwX1vSTHYrIntkpKGgCK70vyTd/mmttKF0tQB5eBa79bgrysYKT+
 kjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=TeuPABiNO2xbus/6T+oohGSSeo9NaH3/Sa0r2Eh66rg=;
 b=WmEFk+iin8c1NYzpoE60DUPWuCrrwXpjp97fO99w39xi/+1h/6w/7oABDn1JD9IYDf
 O5a8EoXZH2ZSaP+nIs7y9CrjqALHT5YjMY0CMe83tKotc98mfWA83Jtg1TKrBIOiH6SI
 Nq5XO5qlotmSV1Z6kk0A4Euy+1lMdy7JQHdFSC4QLgk4Ii6g+YWd9qvH04nlZPl7Em4l
 DNTSpPyf08h8/vYDjyKdYW8U3z94rHdr2vmi181g/tylw6SsmntoOZ5L7mLTreB88gBU
 7n+y7aaRJ6mv42sGrnc7MacxifGziNZkZHSvMiDjS3xdwBef+QthXi4V73X8+gce4qQy
 nC4g==
X-Gm-Message-State: AKS2vOyJUON1WFTjf+t8/BaxvxSWE6uEw7zCfSK80saz/x/wvkxg1Wt4
 NKQVJ/n+qSaPq1pd
X-Received: by 10.84.208.102 with SMTP id f35mr13194028plh.53.1497625549821;
 Fri, 16 Jun 2017 08:05:49 -0700 (PDT)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id d71sm6222372pfe.106.2017.06.16.08.05.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 16 Jun 2017 08:05:49 -0700 (PDT)
From: Patrick Venture <venture@google.com>
To: venture@google.com, joel@jms.id.au, openbmc@lists.ozlabs.org,
 raltherr@google.com
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: quanta-q71l: i2c-mux compat
 fix
Date: Fri, 16 Jun 2017 08:05:40 -0700
Message-Id: <20170616150540.137808-1-venture@google.com>
X-Mailer: git-send-email 2.13.1.518.g3df882009-goog
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
X-List-Received-Date: Fri, 16 Jun 2017 15:05:53 -0000

Updating compatibility string from 4.7 to 4.10 version of driver.

Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index d5febe330121..a73d33d4ce90 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -164,7 +164,7 @@
 	 *    Slot 7
 	 */
 	i2c-switch@74 {
-		compatible = "pca9546";
+		compatible = "nxp,pca9546";
 		reg = <0x74>;
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -180,7 +180,7 @@
 	 *    SSD 2
 	 */
 	i2c-switch@77 {
-		compatible = "pca9548";
+		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x77>;
@@ -218,7 +218,7 @@
 	 *    PSU2
 	 */
 	i2c-switch@70 {
-		compatible = "pca9546";
+		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.13.1.518.g3df882009-goog
