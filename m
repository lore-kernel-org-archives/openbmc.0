Return-Path: <3ad25XAcKB_Ytclrspcemmejc.amkmnclZkajgqrq.mxjYZq.mpe@flex--venture.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--venture.bounces.google.com
 (client-ip=2607:f8b0:4864:20::249; helo=mail-oi1-x249.google.com;
 envelope-from=3ad25xackb_ytclrspcemmejc.amkmnclzkajgqrq.mxjyzq.mpe@flex--venture.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="We8aQxtp"; 
 dkim-atps=neutral
Received: from mail-oi1-x249.google.com (mail-oi1-x249.google.com
 [IPv6:2607:f8b0:4864:20::249])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lzB63w0WzDqBN
 for <openbmc@lists.ozlabs.org>; Sat, 20 Apr 2019 00:38:48 +1000 (AEST)
Received: by mail-oi1-x249.google.com with SMTP id x125so2282006oix.17
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 07:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=KXmmBkW8DPzMFPyQQK2m+Vr5EWw6pvM3wHUEjdsyITk=;
 b=We8aQxtpwlmjBKndUj8KgtSAnNo1HNGk9dB9zqxradLGK7HRYXKzoTA/OF6bwF53eG
 YdlYsVX9tV6cBqkqzL10r1Bs16rorgTezTMOgm//AgAzM2sW2zA5pr/v34byoZxafAYo
 /i3DRJV8YneaSEdTwIRWx/D8KxmMd6Y0ZXn9bgJ0ROidjmScOUc2rJ5/I4VGP1onujUK
 MGqWgF0KkX0Or8KTfOOO+bHzj922Tr5ytaVB4QbQFNSn9pJ87f/YG30w8OCOIFVPK96J
 KMpG0XM/OYG90KGHG37N8nlaysOkmHcCMdJrTKV/Xa7RTW58xeUbPPk92PTM8ljvKzg6
 3B6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=KXmmBkW8DPzMFPyQQK2m+Vr5EWw6pvM3wHUEjdsyITk=;
 b=Gn4o8SOoPcFlwSlN9cKJyasTM5gNdjsJGg0B9zadRcRRpNp5xcpqKB5tOlNoxd/fa8
 RWSpaSxkhJv5IILFCumU7TQ3HTJmee7lnqZpIBD9jfF+6Il7/eVmeOSMmV5QbbmqDydB
 2xivsXotwB7jBjg2jHYC7TaPrgeeI0AdURXM7m+gNh37rYUjNi/Eiy6LFjrIlSYeH0yk
 7bVHmRC6c2fYw88pE9EE6tHfjaVig05fBT4P8/78V7VbtOD+4Zgz53/CKdlSayX+JzHH
 bu1v+klJTuESW7Si31Iz9nM+PSQR2gF87XVjBGF8Ifkhv96mWws6A3/3ESp311Ka9zmV
 kDmw==
X-Gm-Message-State: APjAAAUI9pVbK5n+6p04vFWo6C77C9W3T0wV251MrpxA3460Nqtvrd+A
 lHmsk+c7mnVc7/b/ijazVjnqJZG7DiVT
X-Google-Smtp-Source: APXvYqwGjT37fmiFDz+Eou3yIVnSSVFXHkocWsTzBUw/L5A75CK/kQ9TUoX1/arFFQsfRjtnVqqm1+0w+Sbh
X-Received: by 2002:a9d:19af:: with SMTP id k44mr2302513otk.300.1555684713808; 
 Fri, 19 Apr 2019 07:38:33 -0700 (PDT)
Date: Fri, 19 Apr 2019 07:37:59 -0700
In-Reply-To: <20190419143757.232387-1-venture@google.com>
Message-Id: <20190419143757.232387-2-venture@google.com>
Mime-Version: 1.0
References: <20190419143757.232387-1-venture@google.com>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
Subject: [PATCH dev-5.0 2/2] dt-bindings: Add isl68137 as a trivial device
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
X-List-Received-Date: Fri, 19 Apr 2019 14:38:55 -0000

The isl68137 is a digital output 7-phrase configurable PWM controller
with an AVSBus interface from Intersil.

Signed-off-by: Patrick Venture <venture@google.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index c01dcacde198..eae6103a30d0 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -104,6 +104,8 @@ properties:
           - isil,isl29028
             # Intersil ISL29030 Ambient Light and Proximity Sensor
           - isil,isl29030
+            # Intersil ISL68137 Digital Output Configurable PWM Controller
+          - isil,isl68137
             # 5 Bit Programmable, Pulse-Width Modulator
           - maxim,ds1050
             # Low-Power, 4-/12-Channel, 2-Wire Serial, 12-Bit ADCs
-- 
2.21.0.392.gf8f6787159e-goog
