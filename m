Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::341; helo=mail-ot1-x341.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QW8N75DY"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42MQgv6xYjzF3Kx
 for <openbmc@lists.ozlabs.org>; Sat, 29 Sep 2018 08:04:27 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id e21-v6so7459177otk.10
 for <openbmc@lists.ozlabs.org>; Fri, 28 Sep 2018 15:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UZxjDdnYRn7p4x7OGb/hhFGye4/7ZiLeMyVj0Bnlkr4=;
 b=QW8N75DY2GvNWonOXAzgBPNhOcef3CSbBL5QBtMNER3Zkx/Hl7vrgKef+87jI0qOFb
 O8wOf89S4wtKIvWmB9DL2hoySjpHsN9bc1/7vrvQuoGfqG0i2AO6o1QJuRzIgSkIBXyV
 rnq1HnFcRfLr91N+s02A7rVBuGWlaZ51DTlGeobVVf4qtftmqr1PC/k4B2f3DZmt3d2L
 NKdAHlnY/Q1K14kEMpX4tYVUPCO1tSj3SFoEREPXmx1Y8uItbtAS5SKI/BhHKUDmCPta
 +NQ9ltg3qD4PVuuvPoDTWzxpcq36tXtiYut3Jdstf8eumq+toB/vDbKefzAzNGBKaNKt
 3xLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UZxjDdnYRn7p4x7OGb/hhFGye4/7ZiLeMyVj0Bnlkr4=;
 b=rL5AMD2sefujzjQm+YRzUoY+KTWrM9jLxfVWKxokq91djXI6ThJ/I/hPeBKumECMbK
 d1HZPGPEEqnwOveJPOcQNZN4m4vB6/EYYTu7zOgGa4dUgF+ESUMq5f+VTj2HCLRQx0Bt
 /cDu5Sa/HZ636mfd884n3Qf119KMiJ070sstnVXau/3UpF7w5AU9ufe4AXe3rAPqymGq
 8OkMRQlf/bHXVstYALHboyCtpjHQBxr6aqRAAvw/AzK+fMNHAg1jmUqvUYZASzo0feYy
 vAHje3klZd1REqyAkv0SlNMlwylEtu+G4rmTD9cVvrlfOYlC76dFjBf7J5JizcYXMKBj
 xVNA==
X-Gm-Message-State: ABuFfojMgIESVa8a8ACFQtT12y041KWm/wEJxHpbbOXg7y/76YAYNhvL
 LU/JhMa5D/BEnrlQg8UAu9wWIYYmQ6Dc2sbaJ3TtbQ==
X-Google-Smtp-Source: ACcGV63KOoqK9k5NUWeKW6scQJ4ydqAUf9TRNVr2sujx+8c96S/kyd5Pk5bGuDSDhFFmaVUcfDQKE3GlLwSsPd3fkBQ=
X-Received: by 2002:a9d:2843:: with SMTP id h3-v6mr382472otd.230.1538172264539; 
 Fri, 28 Sep 2018 15:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20180928215117.28711-1-joe@perches.com>
In-Reply-To: <20180928215117.28711-1-joe@perches.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 28 Sep 2018 15:04:13 -0700
Message-ID: <CAFd5g45HZOA3CGd+g81DDEMw4B67kMbvkC3gkA-ewxhBMtUDcw@mail.gmail.com>
Subject: Re: Bad MAINTAINERS pattern in section 'ARM/NUVOTON NPCM ARCHITECTURE'
To: joe@perches.com
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 28 Sep 2018 22:04:29 -0000

On Fri, Sep 28, 2018 at 2:51 PM Joe Perches <joe@perches.com> wrote:
>
> Please fix this defect appropriately.
>
> linux-next MAINTAINERS section:
>
>         1781    ARM/NUVOTON NPCM ARCHITECTURE
>         1782    M:      Avi Fishman <avifishman70@gmail.com>
>         1783    M:      Tomer Maimon <tmaimon77@gmail.com>
>         1784    R:      Patrick Venture <venture@google.com>
>         1785    R:      Nancy Yuen <yuenn@google.com>
>         1786    R:      Brendan Higgins <brendanhiggins@google.com>
>         1787    L:      openbmc@lists.ozlabs.org (moderated for non-subscribers)
>         1788    S:      Supported
>         1789    F:      arch/arm/mach-npcm/
>         1790    F:      arch/arm/boot/dts/nuvoton-npcm*
> -->     1791    F:      include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
>         1792    F:      drivers/*/*npcm*
>         1793    F:      Documentation/devicetree/bindings/*/*npcm*
>         1794    F:      Documentation/devicetree/bindings/*/*/*npcm*
>
> Commit that introduced this:
>
> commit 6a498e06ba22872d3a27cc0dae77b9314b1de48b
>  Author: Brendan Higgins <brendanhiggins@google.com>
>  Date:   Thu Aug 17 09:44:32 2017 -0700
>
>      MAINTAINERS: Add entry for the Nuvoton NPCM architecture
>
>      Add maintainers and reviewers for the Nuvoton NPCM architecture.
>
>      Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>      Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
>      Reviewed-by: Avi Fishman <avifishman70@gmail.com>
>      Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
>   MAINTAINERS | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> No commit with include/dt-bindings/clock/nuvoton,npcm7xx-clks.h found

Ah, looks like it should actually be
include/dt-bindings/clock/nuvoton,npcm7xx-clock.h. We probably changed
it in one of the revisions and forgot to update it.

>
