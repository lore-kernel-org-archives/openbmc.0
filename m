Return-Path: <peterh@google.com>
Received: from mail-yw0-x22a.google.com (mail-yw0-x22a.google.com
 [IPv6:2607:f8b0:4002:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vpQLf1v6kzDq7N
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 10:07:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="LwV3uvl9"; 
 dkim-atps=neutral
Received: by mail-yw0-x22a.google.com with SMTP id d191so9338920ywe.2
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 16:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=SkekOGc4y7b3JqQw/e4Yvv1Wjk0g5Juo1QESUPHJipQ=;
 b=LwV3uvl9uLzdHTsMMHcAFoIV4cxdD4YCBdDtCn/HkCC8QTbY3o1SiuBEYmc3rvEFuC
 UasZvB/3A8WRJ08/2i/vq9tpz5Cpw18QWjg/rjBU3zNGmVShGBjlsz0quaQj1xMWnKZh
 xspbbYvc8YMuf7xB4GiyoMK3a0gZW2X+SImzrlFxRWQvRxC2/AOWCehmYxGH4+xdaKn1
 FJze8hlH76sHEVql+QNIEp6belJIjdkOttLFi3eXPmmrgHZVV0wtCmjn5ob7HgsK78gx
 sTPo79SzU0SzAjLscLCwory3KtM0mrYMCpABFFUnhhPFZ+QGA3iLY5ODOhAJWbz88mBc
 KIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=SkekOGc4y7b3JqQw/e4Yvv1Wjk0g5Juo1QESUPHJipQ=;
 b=aqGdMe8qhkNKOAjZXF0eFLnhaWBybBHAJl/2hPKyt9h/MjJ7aCJzX4Ss2LuPqim3oQ
 k3vv9wvexMTL1K4FD9yL032G+c+xiZTbyeKAjXosYvdUvoA7n6IzPja/aI/8c8XoL13T
 DE5iv4sOmENl7JzqvzUIB5EERyu60kxzBasYx1A93QMuGI5MOQrg9USDi+33/bAPgYaM
 asYiXeew3ZsCwwHuq6dq5d6glo8xhSWCoR2n14phngkuKxmosuKWxmRY+7KXoOh9a1lt
 8vSsF7v2gForF5QTnMr772G41IgKq7fGJQvevzu2K9GLbng+NkNZC2WEgcjaw3BoBSUs
 DK3g==
X-Gm-Message-State: AFeK/H0F330dXhqLzyGDp4/7Eg3V8yttbf9RJyyTLh2QSSjGLfuQxc+1GrvnOFiSZ2owZbIFHz4O+LolCeqL20VD
X-Received: by 10.37.69.5 with SMTP id s5mr28193721yba.184.1490224038282; Wed,
 22 Mar 2017 16:07:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.59.88 with HTTP; Wed, 22 Mar 2017 16:07:17 -0700 (PDT)
From: Peter Hanson <peterh@google.com>
Date: Wed, 22 Mar 2017 16:07:17 -0700
Message-ID: <CAPozSNqWfu9_+uY7Hs4ALQknS2GPnPpp8xe7eD1ShmuNjEEzoQ@mail.gmail.com>
Subject: [PATCH] Add Zaius device tree entry for 12V Delta Power Brick.
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Xo Wang <xow@google.com>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 22 Mar 2017 23:07:22 -0000

Signed-off-by: Peter Hanson <peterh@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 3bd70ed810af..4fd27617bb3a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -269,7 +269,13 @@
  /* Master selector PCA9541A @70h (other master: CPU0)
  *   LM5066I PMBUS @10h
  */
- /* 12V SMPS Q54SH12050NNDH @61h */
+
+ /* 12V SMPS Q54SJ12050 @61h */
+ q54sj12050@61 {
+ compatible = "delta,dps800";
+ reg = <0x61>;
+ };
+
  /* CPU0 VR ISL68137 0.7V, 0.96V PMBUS @64h */
  /* CPU0 VR ISL68137 1.2V CH03 PMBUS @40h */
  /* CPU0 VR ISL68137 0.8V PMBUS @60h */
-- 
2.12.1.500.gab5fba24ee-goog
