Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="pEHGkvmv"; 
 dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44m5y62kNmzDq5k
 for <openbmc@lists.ozlabs.org>; Sat, 20 Apr 2019 05:43:57 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id t16so3022345plo.0
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 12:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=+34/Fyb/u+ssN7GnnKWwtcUM95ObpcjJH4J6YQI/bU4=;
 b=pEHGkvmvfyciCLK+XQh+SmP3xt7t9Cb05hAQDZD0NVuNY2kQUJ/WxnLGrTpNu7dDM1
 UTcd4F52y/rbX6Mn/mdimPWRY1q1poNM+DGhVyHGmcbO2zPKPyahXF/t1Je+qgqEj+LT
 X0B91AQVmfe2FyEEAjyYlW8RGswfTalAXFg3HuY1fu/7Inft2CwxyPQViQU9/rJ+mMC3
 0Sq9SSNf1zijifmwWzUpNApWCIjIiWN6g2Wa7d4sH+cJ6P6N2dT7Ueb7EqZcO/kkY1bV
 AWnTPxZfzkceckN7X909kVnFkqVWjU4BC9RoLPY+jXhVUh/wcKZzxleA2nFPakuIP10X
 IDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=+34/Fyb/u+ssN7GnnKWwtcUM95ObpcjJH4J6YQI/bU4=;
 b=hxmRcRsKpthZflDO/sugaHZygt8q1LYnywL9adg5rV8mdfShK7vptGv2hdjzU3W6XP
 ElRMOfadQ9yvgnRic5u+DU676ejWE1xZCOFPKHB9zmgLGdUE8STeQ8wxYI7pfeKhMYwb
 ZR/BZkNJa72QinimoEJjFu8XiHAVTw8sHd//X5+7yFVwqUiNGCGOuKWJAxSBwhnYIlcB
 0E+ILspBM3CtUW0CtgPiYDtYEOIP6m7vPHmfGEVbVP2HmAtw1KSvk/APOnsQ3cA4DkwP
 +sAEo2+vcxk8myOXJkfOYvZjJZY8KSH39MUsqAQ+8gdJO32mqfpCmgQFv+PY8kzGhQBW
 lWDg==
X-Gm-Message-State: APjAAAU/O4gbt/0z1sxHsiZO63EU3w44FBVcOvBYgK7dDmSRSlsbTBsA
 0hQgcfgjlTP/dvFQ5YMpehQkPQ2TKasjPE9WxHVHKw==
X-Google-Smtp-Source: APXvYqypPOHIsvpjKNtHLOVV2Y39N2PAtWQVrj0lBL0eTlfN4EZBy7+IpSCXy6hYQ11RTc9oy45KBb7dQz4TZbsNjs8=
X-Received: by 2002:a17:902:2:: with SMTP id 2mr5667728pla.61.1555703035135;
 Fri, 19 Apr 2019 12:43:55 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 19 Apr 2019 12:43:44 -0700
Message-ID: <CAO=notwmhWoeCry_Z+xL=7N1Pp+74tJ9BCF7nr4Jq1MwqRjfOA@mail.gmail.com>
Subject: meta-ingrasys patches required for new merged drivers
To: Joel Stanley <joel@jms.id.au>, Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 19 Apr 2019 19:43:59 -0000

If you don't work on or maintain meta-ingrasys/meta-zaius you can stop
reading and go on with your Friday. :D

All;

https://gerrit.openbmc-project.xyz/20692 and below are all ready-to-go
and some are required for the meta-aspeed bump staged for
openbmc/openbmc.

I wanted to throw this into an email to it jumps out more.

Patrick
