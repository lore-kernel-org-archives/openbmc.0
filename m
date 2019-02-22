Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="iDaUeFau"; 
 dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 445fCc1FP4zDqXD
 for <openbmc@lists.ozlabs.org>; Sat, 23 Feb 2019 04:56:11 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id p19so1431509plo.2
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 09:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=qV36o3F0oSz4GWKtmSxXU8fx8G02Rp1HgNIXng6HJac=;
 b=iDaUeFaufS8XL5SuuWbC4HcKDz6ewB7wGk9JUhoCKYM4K4nsH1qYHkds0bmTRZDsdc
 setUQrCHMJwAuaPm1l7M+FVPem4MI9nYI+U3ywAyiCAzCr5wMBTonuqcEhm5Fn1YAdbe
 P5wq1BpbOVH6qlfm5gUlijE3DX6X5Cva5BPHzb3tpf7ACsnur3Ubyp9fMEDUcZR8kjR4
 ktHSdKkawc19dTUVSK0TBpw8yRrqOH07PTn5ntsr/+cKbCV40BtUdK8nvoAOUWkczNV/
 uevhVv/d/D6xzUOO1uprXNqMDjdUDmdCbYWz7ge23cUwDkh2erLn0+3xA19zSBnc2lt2
 2RdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qV36o3F0oSz4GWKtmSxXU8fx8G02Rp1HgNIXng6HJac=;
 b=IXqD4rx4wIkaIaRgXxxWy9DwDjxNltNrTJVHxcUbc5C4/rtVPL3H+IUDZjqcqR8IfJ
 uUdTmYw84WH8NuGGkIaaXPwdAXEjLHF81vGHv57OmMtS/6L8qDAmoA13F36kPWb3QYOA
 A08K+zv9DzjIR+LQyCwH4Sb6R4tTP27wwX6EWROBABfcoERM4PelEdQhLXDeMK8yBexd
 sK5VQv5vfViByn1VSGxqlSCB2h4AEdeNrvn70pTNnocKMHzPCZ/0VfEtn5NWxcx7gBvb
 Akj+EGUiv5HQLeTG7nRJG5FI7pRXwJf5a6Cl75v9Tu6lUu9LRBKYKC0d5Yf3aUcCv/7V
 N4ow==
X-Gm-Message-State: AHQUAuZxF+N8Y4kNg9OqxQNdj8DQg6ngWuC/SOBp7nv2vzTqNdcXM44N
 qh+jUjxzq6mdUpURZVnStgzqeg6kywYccsUrTmadwjcewXM=
X-Google-Smtp-Source: AHgI3IaAKV57POUJDb5nIDpdnfUlGLPYf9e5f/MHh7Tzb3W13BaJTkyWu0YtxSjkczAqSz3w13kRlVjQLBGBLG4ff0w=
X-Received: by 2002:a17:902:684:: with SMTP id 4mr5337512plh.3.1550858169141; 
 Fri, 22 Feb 2019 09:56:09 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 22 Feb 2019 09:55:57 -0800
Message-ID: <CAO=notwH0_2nGmWaxyr-56Tzb_SFJHmdUPeUZpjWBBVm5EArzg@mail.gmail.com>
Subject: IPMI Channel Config Removed?
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
X-List-Received-Date: Fri, 22 Feb 2019 17:56:13 -0000

It looks like the channel config for IPMI was removed from the
sources.  Instead the channel layer is doing something by checking
with the sysfs device instances -- and there's some mapping (I haven't
dug into it).

I'd like to know if I need to do anything to configure the channels
such that eth1 is channel 1, and eth0 is channel 0?  Or Did that
change?  Can I make eth1 channel 5?

All our platforms were using channel configs, and quanta-q71l upstream
was too, so I'd like some explanation as I don't remember seeing an
email about it when it was dropped.

Patrick
