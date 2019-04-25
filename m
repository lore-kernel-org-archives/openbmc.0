Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lkuMR+p4"; 
 dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qlFJ6MLQzDqdD
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 03:54:42 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id n2so196776pgg.13
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 10:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Bex4G+xahP68QJf+cxMppgtDpLS1epIrOlQSL3w0SlY=;
 b=lkuMR+p44y5Zj5OtYE64KvZEbNWuaOhicSVgrfdyYkLMoiUezw3gwxXWSbC/hUA+vY
 R5daGx/91YKnckAEMsmAWEhvVKH5sE1Sg853IdLO9KpgAw/sHzXP4M25ElZarS0xiwA9
 37k3Bx4Kl3Eon78GXwSK7V7SjdmjVivn68ImEZ3uSVArBDc+kJAwetSnwZRaGooTSuE5
 3qNIZh1FtqZP5vW3BLGBnk0jC3l1JR+SdwNMkyPHVxvQEgV/ronZpncQPfZ5vuCMoUPJ
 SaCksxUVG0nXE1vKGY4PA/oXWRRvRTi7Kyu7pwvzT3lcsIbi5fildW48EUg3V0BI9zyd
 F8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Bex4G+xahP68QJf+cxMppgtDpLS1epIrOlQSL3w0SlY=;
 b=IEVk/rhEi3TRsQ7G6BBjRtBwEkO/FSMsHFCWCvtPfX7ccb//Qu69yrghj5wiaBraiF
 Ogvx0hOTM/+5k2YszfCepmBgDyRb87bhje50rz5K2zDu4wD8m+4Cz7j3G7GfkSdEXrzD
 8EwsMv+5XkyY3emzz3BmgM9IW97S9+jcHVpkRTsPKtza9Xul3YJX3HZqIWhkeWGJ9Myt
 idKQIIaAo4jHq6PxOwxCcACmNYJVY9a0jq1tPBxWKeleFe5q4Vof/sNyEP4X/hf+IuWi
 BSycceX51roo6Ftkp5FGoEQBfHdB7tPVwlhdpIC0zYUelfpZtR5gHWmW2dQXI1IiX5OF
 7ogQ==
X-Gm-Message-State: APjAAAXxkBVyL7ibK0Ya10Tz1zL6CwxX2kF29Dbjpt5A9jwoaMKqi5FK
 TOh7Asltbdb0T66Tezzh3nj7eWB9TMgW6O9ZBAXpZB5JnKg=
X-Google-Smtp-Source: APXvYqzthzVyY8KZ04yeJzb4JpqdHi0DOqnXlmjEeAXqYL+ptcDVP+KvGF1sKwjD5ZZ8XNcNGGbygJEmztIB1be2/k4=
X-Received: by 2002:a63:5061:: with SMTP id q33mr36971844pgl.218.1556214879068; 
 Thu, 25 Apr 2019 10:54:39 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 25 Apr 2019 10:54:28 -0700
Message-ID: <CAO=notxWQFgmgJUUVXDZun1FR9jZ1+hhD-5mdWjNttcxKiwwcg@mail.gmail.com>
Subject: Requesting Patchset to linux
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Thu, 25 Apr 2019 17:54:45 -0000

Hi,

I was curious, when sending a patchset to openbmc/linux that is
already staged elsewhere in a maintainer's repo -- should we just send
an email with a link to the patchset or the full patch email?

I've done the patch email for this in the past, but wanted to ask.

Patrick
