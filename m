Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aZE8X+VQ"; 
 dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42hRYm0FmDzDrS4
 for <openbmc@lists.ozlabs.org>; Sat, 27 Oct 2018 01:43:07 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id j202-v6so757956oih.10
 for <openbmc@lists.ozlabs.org>; Fri, 26 Oct 2018 07:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=gBg07f8foWga/F7p2Ci8LUBwToLQ+DqSMr5PkgzZ7k4=;
 b=aZE8X+VQVhKKMLw0o3Q/BgGXZyBr5+cb3ZjeDNXeU46ghKdd8KSFy9MOLp7IyFeoi5
 wQfZvcFdRAtwt6ZM92RVmyAVd6RjZr7ZOgkzeGmYmvOYNwjbkRcidtMAWMUHaGEX8iyI
 k/yf9wOUq/JXgexW8peFAL+ifnCxt4ykxwNhCL+rs226XBfwj4XvIVGzRvJ4QRZ9I5y+
 t+odmRSRTOIH/DK3qC5uHGND7y1uXopLCn01D+vtdW9JbG8OUHhG8CetqZvfNKuMotJv
 YFHpNcRYdM4HArAjOBeiUU5uR2R5pl61kZMa2GwN+15LPV+PULUNdLk+kHEMi2BEYFFA
 ILrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=gBg07f8foWga/F7p2Ci8LUBwToLQ+DqSMr5PkgzZ7k4=;
 b=ObtxbLq1kuPWn1shaD13/Wglf/9PH8G/rzV8oMZ3bhOgaPK0TUcB1aqHfpmLSOxDPa
 pPzXd3kLgtKQgIHKJ75YPj2utO9CFm4932LRuLIvkDEF/u1/P7QOXn+WMiboyuRifBSk
 DpGBiHMtA1D+/AgCw2oErfTqW+ix6Sjmd1HLXe4EUH6ASmrx3oC25yjZ9/qE+5brNnCT
 krvho/Hv6q4zYeaV+am4iBEE2kCEeyCo00DkznQHgYT7CzbHKwVrnQGI33q8wlx0Nweo
 tdhJ5Y4O1Mj+cnxPJX04eLaq39LTqs/ed4OqrmGQe4BKth1hoF0+pDQOV4gpvWek9lIp
 J/GA==
X-Gm-Message-State: AGRZ1gIc2My6FmuckAOodSy2WJdIQ5sGL+nhq+NilCrJfAuVVWSiAeB4
 D+KK+hLgLIpJixofyfOs9nhOMJOkg6OHVxSFt0BmJ4it
X-Google-Smtp-Source: AJdET5fG1ZWcWpC2piri7tH42519M5Iqs6sehOO9HdaY1F1RCg3uKnyJjyysKCdvqDMK/fn1mw2auzUpooI/250rDrg=
X-Received: by 2002:aca:d582:: with SMTP id
 m124-v6mr662359oig.93.1540564985292; 
 Fri, 26 Oct 2018 07:43:05 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 26 Oct 2018 09:42:54 -0500
Message-ID: <CALLMt=odgQwSqYZ6r9c_ENR2Ox=fsOvmJLMx2m6GcZDRL1kPvQ@mail.gmail.com>
Subject: Disabling systemd-coredump in meta-phosphor
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
X-List-Received-Date: Fri, 26 Oct 2018 14:43:08 -0000

I put up a commit,
https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-phosphor/+/14745/,
to remove the systemd-coredump service from meta-phosphor.

I've got a pretty lengthy commit msg describing my reasoning. Please
feel free to participate in the review if you have an opinion.

Andrew
