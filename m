Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::230; helo=mail-vk0-x230.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="J4kF6RGC"; 
 dkim-atps=neutral
Received: from mail-vk0-x230.google.com (mail-vk0-x230.google.com
 [IPv6:2607:f8b0:400c:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409YcC637GzF2D3
 for <openbmc@lists.ozlabs.org>; Wed, 28 Mar 2018 01:41:27 +1100 (AEDT)
Received: by mail-vk0-x230.google.com with SMTP id b16so6787721vka.5
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 07:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=R/KytLw/TrQcYWA6lWomfraoBaFBSxYc/Oedmc0P7HQ=;
 b=J4kF6RGChsJL15ORFQAnrjzCdOsF9ZFMmo0pqCVxSS5S5gA2G/Moa7P+p3VJLToN+f
 8az9KHIjh2lEDYx2Z45zLTUwBBiuTNKjepglFVJ2m9rZh3Jyy1ejiRjIMR5gLeq0ZBTZ
 dg28vRMgjUMbR46cYTlZhtgh8GmeSwqLCUhL+q3pOgdtaMVHHUc18r7qh0kXCSnrI18n
 LDDq/7ChqAvM0b+pTGUPaYgFJClasnZ3CH5T/mYvUTGJ3xr3va9Fl5sUG/xe9HluPAul
 KmMw6VcUvn3/ffrv2t/tw3UHY07mzg1nVILcd7dougJoL9QWyikd03WQ0tyO2GisifZj
 5FQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=R/KytLw/TrQcYWA6lWomfraoBaFBSxYc/Oedmc0P7HQ=;
 b=Veumm1lz1DNyGexdmoFOeL/siHc1KBP+eA3MctepCdRxy7yaX++l1lhyJQEfDc9eFQ
 5ftw4cWSOxQZuzM1pdDo5MqPEgLaL8FLgkcHPRixNGXVctWhizmFpP4UR/JgSsPskvVL
 GOxeLTYWyq83qrkvXODEFj987J/dY3Es+ZsBOj4BUgCV5l8hLu2tiB3eRnppOM3uSp33
 JZx0V48qTQg0CpH8bR3mkupX3/LR3M03gU+yRji+r9Dx+UHci1+cbTQsBd9zQI9rUeRV
 Jbpa0WIeHwwKIfgwAFdmdK/n+FaZcEexcgsIrmueUMUf1qIz257SewKQwFf2QTtMEkFZ
 78yw==
X-Gm-Message-State: AElRT7GYdmRFomo/T02n0fScXRFkUruUJLbDhI0z8VazYYhjkVfVgF46
 LX6LwEBIavwxvZ+gX0fzblkaJWnljbY8RSmPdixTHNsk
X-Google-Smtp-Source: AG47ELtcjvvfRjaSYn1UO8/b7MqtNdhxuE8EE148Wf5xZN395WrSLlhMB3loQvn61x6Ja4XYR2n2bE/fOl6gUHH+x/A=
X-Received: by 10.31.63.16 with SMTP id m16mr19670118vka.73.1522161684760;
 Tue, 27 Mar 2018 07:41:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Tue, 27 Mar 2018 07:41:04 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Tue, 27 Mar 2018 07:41:04 -0700
Message-ID: <CAO=notyi526qbqE2bBzC6d3LWAN9=NhdCm-wmxxyh1-FNVTMGg@mail.gmail.com>
Subject: KCS bridged
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Robert Lippert <rlippert@google.com>, Nancy Yuen <yuenn@google.com>,
 Kun Yi <kunyi@google.com>, Emily Shaffer <emilyshaffer@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2018 14:41:41 -0000

I have seen several patches from at least two groups related to IPMI
KCS drivers for the BMC.  However, I wasn't aware of the existence of
a bridge daemon, equivalent to btbridged -- to plumb the messages from
the kernel driver to phosphor-host-ipmid.  Is there one in design,
develop, test, or done?

Patrick
