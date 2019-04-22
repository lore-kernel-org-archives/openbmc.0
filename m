Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="YjcYykU9"; 
 dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44nv7069CjzDqHb
 for <openbmc@lists.ozlabs.org>; Tue, 23 Apr 2019 03:42:52 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id 9so6023134pfj.13
 for <openbmc@lists.ozlabs.org>; Mon, 22 Apr 2019 10:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=uI8pMQuiJ424iiixV/X4sardSaEkTdL6oRdf8LMGlAE=;
 b=YjcYykU9z0//1Ki9PMdVYlHCL9a386bfxBU0IgnwKVrn4foTIJ4xwzGiKG/TuCa1tj
 UcxpuHrLV5vcK/r7f0eS5Xh40Ozw2LuMcqb0VkpUqdwCBbwWka1srLH4UFlNh4flnrAd
 e665TOfsGC/ykjS3LnS1fmC3HQlUXMueAH7tKpGLcuxFf9BenA+doG9HWiHbNCsnvRFs
 CaVkYhWw5q+oY2fJb/3LDCIEKCxfBBIbQqRrjZXL6UsLL/0vKcp6T03U0afN2npJxw9p
 GLZ0uk2YU7k2ZaOkUx8RxPJAIFzaOrtFY8mIXB9q/0nBRRh2c+sF5aeUJf+wfLWqxm+T
 KQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=uI8pMQuiJ424iiixV/X4sardSaEkTdL6oRdf8LMGlAE=;
 b=KkXxC4r8MAS15IjfXj2Mb1/QTXXQeL0hWR4GIyBZYO2VpUP1fiNiP9DA3hA20yWnMA
 4POnPe+BCuNll31JEB5huEXMQsCQiLt9unFi0TYpuVJmOUTPC/POp3hI4F+NXKCPPo6b
 Z8mQzncu8ejxLtNXKEv7mj4I4eYH1oxYQyYKWkRlvoRxiqO89ZS8sJfrNzGXLa7SZFrH
 s4JvXUpg+TCg19QR1j7X/hYyDll769s5lLz+TtPSwfP4Ozue2rmkFONcLyHIcpZejODo
 1r22Jp96cUSw06zSommTry5Q+vjZV9+g67GxzguYnhTjz8OquFHjaI45GGKPJ59MkrXs
 +bdA==
X-Gm-Message-State: APjAAAXLpEmwfkwjjB7FHaHeYa09BI9P+mHOIDtYhHA4rVtWjv5faNLm
 Vc7KQJFgjcPDGHqPrIgll1NRJbKPDN6CwfZnTNnNNBSLCsLV6g==
X-Google-Smtp-Source: APXvYqxzSjSqN1NBYVTdSqnyCvW0Z/syRxxn85JqIqdqYOu2+XfYUXhE5MNBkVQ1xrXwH2jBekclv7baqI2BLkq5aAM=
X-Received: by 2002:a63:5059:: with SMTP id q25mr13263992pgl.314.1555954968367; 
 Mon, 22 Apr 2019 10:42:48 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 22 Apr 2019 10:42:37 -0700
Message-ID: <CAO=noty=gy4Bqkj3vscBCnvt8ASLEPCbnq1_3AHGN455rAWVqg@mail.gmail.com>
Subject: new aspeed drivers
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 22 Apr 2019 17:42:53 -0000

I've submitted a patch upstream for review that creates an ASPEED
specific SoC folder for drivers that only work on that part or parts
(ast2400/2500/2600, etc).

https://patchwork.kernel.org/patch/10911303/

If you're currently working on an Aspeed driver, it may be worth
watching that patchset to see where it goes -- whether it lands.

Patrick
