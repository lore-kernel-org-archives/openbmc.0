Return-Path: <openbmc+bounces-2315-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0CDC531F9
	for <openbmc@archiver.kernel.org>; Sun, 26 Jul 2026 06:46:21 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h7C1H493Sz2yd7;
	Sun, 26 Jul 2026 16:46:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785045849;
	cv=none; b=BioeQZjxu+KPe1dKssSjHbf3A1fdTsbleAjz15dak72bXCd2lxyidVBNrHfKI4NqEL3tmZUyc33ga6b3EA+Oj124AIwD9UydX62LdkZNH7QVzTRU+t6OmhIbi8W0ohOtZBv3aXcX+etwnjlOSUclZntBetAEFeGJunb83WrjwmTpV/X+Q8ZnP5227bfMJjacKsixvpQpq0ihR+Dqh4e+1QX1tO1lg36cPQFrFBQDLcVaXEDFzIysfAje90l521RBGS1yd5IX7iGf3ZQo1Y3l9p7fc9ONbD4eLBFQ10pUpCFulvdbMzWm8CjLK2fii350wYqVrkvf67JCL/k6baHXnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785045849; c=relaxed/relaxed;
	bh=V+26Pgn5yyytqUfGY957+3+8j+6xWmgyw5AfMu8lBmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JBS15LMI32ClRrFeh9mwkokO4Pj+hNqz97b4/mQHWYiqQ1ZDMQKeKdm2piepmKnn2UYYyI1M2LVDhv3vob1mOQ46prUaOBlMOUDQx2Cuq03chlAG6RGBzkB15L//HUTSWYwj1NJGl5CxZLb5tnKcExA7HP/UlWeDv8dkdbu62meeeHKT/zgfMyRRzc60M8dBn1SnJ/HYCstyxBiQWtonfhxvCxXIRcJs7nHDzyHbQk4wiFUn091dk+GuPm2QHTDHHx3lDWZWVaius2l/A2vwx2kVd7yWcakUODgLnihIry3WhAT7c0ecFgAxDHJm5akUfnkK7QFDlQhmQQKwjGHVvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IXzo9OZc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=shaikhkamal2012@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IXzo9OZc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=shaikhkamal2012@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h7B4m3W8pz2xfB
	for <openbmc@lists.ozlabs.org>; Sun, 26 Jul 2026 16:04:07 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84867f07d63so2092733b3a.2
        for <openbmc@lists.ozlabs.org>; Sat, 25 Jul 2026 23:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785045845; x=1785650645; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V+26Pgn5yyytqUfGY957+3+8j+6xWmgyw5AfMu8lBmw=;
        b=IXzo9OZcMsmKcbHqG+L722vIAerEYYXr1SKKq5sLklEmbDKynjD5M+dSNyLIrS3x+R
         ANLej0EZ7FbEUrNsFWZW5q3SJJzXo0hd2Y8C/0dYcnHZvolZ9v7sMJwWJySaffaO7SqP
         twGbAwnatQO2Kc4jRlHoszlRtTg9bOgYdj4xa9uN9Bf+Adl6epbWlRaHz738ELoTkzF1
         gEBu9fsfRu6EDRN6DSA94fpY4e0IihIBjKtyfwc8odMnslIVd4MWS0VngBii1g4WbPEj
         RAB1uwb1WIeZHkveD8nO9QxIknnTc7We+V7gYw+T2KdFBCQhg3sTYjdkSqjAHEPlqgBC
         Y1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045845; x=1785650645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+26Pgn5yyytqUfGY957+3+8j+6xWmgyw5AfMu8lBmw=;
        b=lsZdei4+TompsK7ouSttbCvR6IbtpsNny4d/d6VgPV3+Sh+j87GbRzMak0mvTRghsM
         RIUFT7J20GDytwSzgGIWep1wLSr+T1rMB8mCcJKz3JdW6JjH+7GUq94MzrcK+NU7bVS2
         PrxRS/W2i2iAqv2yjh/OdYUrbSGvhzrmasoapxEj7pakF+rZ6xa/lKl3k9HsSAl+GYOn
         0OR1cKoqEqWYPF/Ov0E2RXgfwRZhDeS2PT0YtuDcN7frX+jmTbEg5SD8SuEjUnb0v1Fz
         vNvyTbMnjIyNb2aHOkRjPyr6U5lsRzCtNt7Fi1WUHaBTeQvM6zpUbwQh3OCqbY+20beh
         IVLg==
X-Gm-Message-State: AOJu0YwvWphPXOMivXgHX3jk1ksl8zS7SvhOsiTKzOlofhtpJC0UCykB
	MAf8dIyIrSbmotTD6qcr5kVmdwwq0aPohPl0p5U4QXVTC1N0bZKULAh+
X-Gm-Gg: AR+sD11dTH2f2nCdG6e4wpFR8v/npYqUjLeRdd5nMBcWkUOpdrwm5M/9Cs+zTw6MXOc
	GLhtUqzd8GCYdkKzfAhiBTtihGwxnaUYkAFhJKGs8ppLNGSJJQ/nsgyRy1pf+1qxuRvYD+rOFPv
	pEYzZxsu82NUbI4byniSJ3bA6shxLhA1AKs9WD/0UXgAFhbS8FOrQjsrdpAn9BQm4hnod/6uKu0
	MIDq5iT4zpNWZkbGMi2pHgE4youNzQm73zyqTCJ2XQZDYjlgexzZohtBwRIt+PNsoydlIYtm2Co
	a79/C88WwakdT8EBpYL1mCIEsmnzwXnNk3CP7i8QAMbMdV4ZW7NL7qYlo/DwooTX9GUTILbpMoV
	S2wsKxPfF5Fl9Jl9HmY5SNZEIixEc5oIFrMU4bGLLM2lwkHLEm4M+Lpq9sI4eUYO7KmtYwy5wDH
	D3PSlZngQPwALNZFjdtnCL0wRZS+NClySoFjNnyQ1yLiOmrwHNe1OAl2MOMumoJpzeiZC1CJH5g
	V6cvLnDbrAsgxXPPA==
X-Received: by 2002:a05:6a20:9186:b0:3c0:9c19:65ad with SMTP id adf61e73a8af0-3c67e16413bmr4106101637.69.1785045844721;
        Sat, 25 Jul 2026 23:04:04 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb6623294sm1781164a12.10.2026.07.25.23.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 23:04:04 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: openbmc@lists.ozlabs.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: nuvoton,npcm750-clk: fix 'suppling' spelling
Date: Sun, 26 Jul 2026 11:33:54 +0530
Message-ID: <20260726060354.18755-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling error reported by codespell: suppling -> supplying.
No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 .../devicetree/bindings/clock/nuvoton,npcm750-clk.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.yaml
index 694dac68619c..b46b4ffb3501 100644
--- a/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.yaml
@@ -18,7 +18,7 @@ description: >
   There are six fixed clocks that are generated outside the BMC. All clocks are of
   a known fixed value that cannot be changed. clk_refclk, clk_mcbypck and
   clk_sysbypck are inputs to the clock controller.
-  clk_rg1refck, clk_rg2refck and clk_xin are external clocks suppling the
+  clk_rg1refck, clk_rg2refck and clk_xin are external clocks supplying the
   network. They are set on the device tree, but not used by the clock module. The
   network devices use them directly.
 
-- 
2.43.0


