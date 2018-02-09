Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::241; helo=mail-pg0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="N4a4wiAx"; 
 dkim-atps=neutral
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zd0hB2sH9zF17b
 for <openbmc@lists.ozlabs.org>; Fri,  9 Feb 2018 14:20:58 +1100 (AEDT)
Received: by mail-pg0-x241.google.com with SMTP id f6so2750968pgs.10
 for <openbmc@lists.ozlabs.org>; Thu, 08 Feb 2018 19:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=eZhFO2OZOvAx1W7IDgs/TawUqfOrTEqNGjFLXmlAL58=;
 b=N4a4wiAxEZnGovA0u46AUnxMWpNj2RfFqMytvDu9T9ZJS2qdDNCL5DxtgyVITFhWB8
 YywWwmNnUmsH+zKXhvmoUy4i38VTxzuqU61m6Ezs6iF6y7FHTNJvpY4cERuLIq4OjHcg
 WYcUOs7bWuCys6+s4uWAXUUcF7DlAeSclIF9CjLln5p6pfgEmamucq/G7y9WJ3TSiC0H
 ZDqI2TISTjiMtoxMXzrBKoOOxnrae53lASmDAEanxm/o3D+e2IWJOVDKbsutRZqyYbr0
 pWM540SXfI7G7C14n24peg6SvdLrs+mQucO2zL7PZA59ifSsSp1TT+Lrmj8xAHVPLTCf
 KcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=eZhFO2OZOvAx1W7IDgs/TawUqfOrTEqNGjFLXmlAL58=;
 b=CRevMIQrPyn+GLzV/XDNr69p8BfaNHluIRIy2DoOovJb8CDcvnU9XyyRWWmIKy3Suj
 VbjVemrlJZb3K1KfoIfNxHBANURU2d03RnSUYQm7jBsCUz6swQMKqO/VC/GUQNVR6/V4
 ImpXWX8zicPNg8qK8+siyLzsg/Ftdl5VFgBApmHvg9LwRCeuY7f1e1SjA2/K1gBKxZjy
 ObPStEbdiuWz3qd6oB5txyhIlSHGm1yaZ5MozYPoaeZqKWlOXsxXzSGzTCSuLHpkzlEl
 qTGEMqznqg2Io8sQnLuwp7b7SIo+Q+7HeFlouc6vI8F0zlkZ32m4yKhPULAIuSGpY7pB
 5Zdw==
X-Gm-Message-State: APf1xPD7ZxgDbn6zniihpHLPjo+0t1j4nhbyfENXRlC5zG3FMMnhRrqp
 zCi+JPqhE43NUkpeLVqwRAv6gKGO
X-Google-Smtp-Source: AH8x2264PADPFwAV3+ULMntKHxsF4Om2DMLjUCQz1kOpDJjT+ES/ERneI/TSYXtRrPAOJfY1RJitXw==
X-Received: by 10.98.68.91 with SMTP id r88mr1327205pfa.52.1518146455225;
 Thu, 08 Feb 2018 19:20:55 -0800 (PST)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id h80sm2836804pfj.12.2018.02.08.19.20.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 08 Feb 2018 19:20:54 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 09 Feb 2018 13:50:49 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13] fsi: core: Depend on OF
Date: Fri,  9 Feb 2018 13:50:48 +1030
Message-Id: <20180209032048.27450-1-joel@jms.id.au>
X-Mailer: git-send-email 2.15.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Feb 2018 03:20:59 -0000

The recent changes to match FSI slaves and engines to device tree nodes
introduced a dependency on 'of_' functions. As all in-tree users of FSI
are ARM OF platforms, make the FSI core depend on OF.

Fixes: 46d6856a33e67 ("fsi: Match fsi slaves and engines to available dt nodes")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
index 8ed4602d9acf..2c9b32d3127e 100644
--- a/drivers/fsi/Kconfig
+++ b/drivers/fsi/Kconfig
@@ -6,6 +6,7 @@ menu "FSI support"
 
 config FSI
 	tristate "FSI support"
+	depends on OF
 	select CRC4
 	---help---
 	  FSI - the FRU Support Interface - is a simple bus for low-level
-- 
2.15.1
