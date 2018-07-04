Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::244; helo=mail-pf0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="refYgZkU"; 
 dkim-atps=neutral
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41LBn72G5TzF1Rv
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 17:04:27 +1000 (AEST)
Received: by mail-pf0-x244.google.com with SMTP id h20-v6so2212524pfn.4
 for <openbmc@lists.ozlabs.org>; Wed, 04 Jul 2018 00:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id;
 bh=2X2LosVE2aWkn6TORTrKNFytK9u6nq9OsVcJ3lBOb7Y=;
 b=refYgZkU7x9++V2qANL6/E2sELoCNcqBxLyE35fl2DkDywX5xkVuLT0agCCOREHmIq
 GBfZJEDQJXs7nbMSNrrncS6J/5RU8HrCAkwRTCgG9GHpuMz4wCNpbuWcgrg0eCx3gYvB
 JQi1fQAutPlPGRATU3hgBGDvoErIdpZfyEVDOR0eV+PXVqmgrDgeKdb9d7PiY8HRvNPL
 JPCz7FT/d5Ixuo4efxOCS0xvHJZiGUPBIZFgBkv0l/PoUxRbOzLsjz8oF2lQ3sA9sBdv
 7z5rE6O+XfAABLLSK0kfrJvyBgehyaWiZvinrbkFjnIOTnL5CUCYg45KbdJ+zVoJkZ8P
 zy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=2X2LosVE2aWkn6TORTrKNFytK9u6nq9OsVcJ3lBOb7Y=;
 b=Yp5PqTNZpMdGia2KBbEreH6Y0VOTawCpbT9j73jQM7Qt55HcqsLK1KPgEnVOPtsdLT
 XMJAUA/3Nhlpa+YxMOYQ2X1QwhRM1DJx+HIR1+IqfZHRDYZjnNgWk8UoNVAj1iWnmosn
 PCK7v2KOwBNo9b/2zuSDLlYH07zpkfTWEG2zgm4v2KZeWhlccZdYQ0E2j9KHYysQQDDl
 W5tR55iCn35U4Qf9KeSGDXiez1kStwPEM8Bg0/pnGKq4FhujDWFcQscZihYLPhbh8L/G
 fJe3Eq4OUqJj0srrKtam2WDHOucn5t9Duk5rZBxjEH3fmC1x6UoYqCctPb/mW2y+dSRe
 OVcg==
X-Gm-Message-State: APt69E2FR2Ndwve1lyTQiZoebryKNQ/0ZlBJONA90pdsSwoHkJF3r7yT
 ZAZY437H8frWXc3glU1YNSK9Gl1D
X-Google-Smtp-Source: AAOMgpf8NpfFPgTbJz9qm0GoBJ/oJGGDBgZb53x/J74PfDELLE/lLXyiLzx7nyw/FobvWezWDT5f4w==
X-Received: by 2002:a63:842:: with SMTP id 63-v6mr829804pgi.406.1530687865115; 
 Wed, 04 Jul 2018 00:04:25 -0700 (PDT)
Received: from aurora.jms.id.au (bh02i525f01.au.ibm.com. [202.81.18.30])
 by smtp.gmail.com with ESMTPSA id 63-v6sm6840920pfo.1.2018.07.04.00.04.21
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 04 Jul 2018 00:04:24 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Wed, 04 Jul 2018 17:04:17 +1000
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.17] ARM: dts: aspeed: Enable VHUB on Romulus
Date: Wed,  4 Jul 2018 17:04:15 +1000
Message-Id: <20180704070415.32032-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jul 2018 07:04:27 -0000

The Romulus USB bus is connected to the Power9's PCIe USB controller.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index ffe0c991d985..852b552b7c26 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -299,3 +299,8 @@
      status = "okay";
      memory-region = <&gfx_memory>;
 };
+
+&vhub {
+	status = "okay";
+};
+
-- 
2.17.1
