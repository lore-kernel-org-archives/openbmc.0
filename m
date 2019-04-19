Return-Path: <3Xt25XAcKB-siRagheRTbbTYR.PbZbcRaOZPYVfgf.bmYNOf.beT@flex--venture.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--venture.bounces.google.com
 (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com;
 envelope-from=3xt25xackb-siraghertbbtyr.pbzbcraozpyvfgf.bmynof.bet@flex--venture.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="E/qRaYBr"; 
 dkim-atps=neutral
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lzHg4d2xzDqVC
 for <openbmc@lists.ozlabs.org>; Sat, 20 Apr 2019 00:43:41 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id d1so3516568pgk.21
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 07:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=fNViD6KokvZnlcaMBEPsB/jUeCh5aAKtkVTXIVegPKE=;
 b=E/qRaYBrsn6gW3blk4t8zt52DbGdoSRHkwLD8SKibSvvnktau2nRukst8xGTRB1n+G
 5p1lujciqPuI/eEJ/TPn5i+R6fjCsGah/yzT6mpmLyZhjzgOELL86amdmMvF3EM44qRF
 Rg1mklPFEHibjVyZgvbeLRVSyDmXJXeUAizsC/bufceWGvzmz9A7s/XkN8L0493G+NMK
 YyPOwQMgvkcmaLZygwVvvV2ekmVRkwG1qcg4blG3k58y/++/epJ9XukApnETpLhjdnOp
 XBeBSFIKs51uKLciDA+gMaLobbIfpJ5uFKIRuLYQr41JWEKsm8DWxK9V0ZUVRAzuHPck
 zPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=fNViD6KokvZnlcaMBEPsB/jUeCh5aAKtkVTXIVegPKE=;
 b=TRjPNYEm2e1qI0tX+S4z/yJSOpUrS2TseI9YCysLn4a6FP4x95yuCrt4K2dvrm6HOF
 Ps7J2oL8yoDmIzUu27Q4O6Najrtvvupbl1dqkEs6pDsPJIgSfnrRDHanUzDmS+ApLhCp
 y1ZlVstFiA9eSbSaZd0uHq8ax2jJij4p+FclKHwMR0LwKMRjRdP3n5eEFyeB3o86dP5d
 bOhHAWce8X/8Ovz41/PtIj0OvnHPdUBu6bXEGyHgT5c/7xPlNXvdyO4Na0gFV5kPtQ3Q
 GLDvWS2c9T1DIsCt1BP2K6CPPm9wayRAI3r5GoQLG9i6hrK0w7msp6PPQsLRFO7uxlYf
 iuwg==
X-Gm-Message-State: APjAAAUcOHMX9aVOdICN+Y5MZ2zwoPs3SSBuV47jfmdJmvSoGg6UZdUL
 gjN/ISX3aJxz39aR5LRhkHO/T7Ztaj8Q
X-Google-Smtp-Source: APXvYqxay/TmJgM1RklDTRcDWeZ+6CXt2yDk8dFJLQRu2f2eYnrf6bDdMgMnatrlMYLIJ2g6oDcjAjJapFrz
X-Received: by 2002:a63:7c45:: with SMTP id l5mr4183088pgn.303.1555684702621; 
 Fri, 19 Apr 2019 07:38:22 -0700 (PDT)
Date: Fri, 19 Apr 2019 07:37:57 -0700
Message-Id: <20190419143757.232387-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
Subject: [PATCH dev-5.0 1/2] dt-bindings: Add ir38064 as a trivial device
From: Patrick Venture <venture@google.com>
To: venture@google.com, andrew@aj.id.au, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Fri, 19 Apr 2019 14:43:44 -0000

The ir38064 is a voltage regulator from Infineon.

Signed-off-by: Patrick Venture <venture@google.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index cc64ec63a6ad..c01dcacde198 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -92,6 +92,8 @@ properties:
           - fsl,sgtl5000
             # G751: Digital Temperature Sensor and Thermal Watchdog with Two-Wire Interface
           - gmt,g751
+            # Infineon IR38064 Voltage Regulator
+          - infineon,ir38064
             # Infineon SLB9635 (Soft-) I2C TPM (old protocol, max 100khz)
           - infineon,slb9635tt
             # Infineon SLB9645 I2C TPM (new protocol, max 400khz)
-- 
2.21.0.392.gf8f6787159e-goog
