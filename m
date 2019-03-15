Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SbGtBhdF"; 
 dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Lbsf6yLTzDqSC
 for <openbmc@lists.ozlabs.org>; Sat, 16 Mar 2019 06:55:34 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id 8so3644297pfr.4
 for <openbmc@lists.ozlabs.org>; Fri, 15 Mar 2019 12:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=zbNUPEUqIZSKK2frRQ1iHCc4BIGUBkg3EIogKHQ7rUo=;
 b=SbGtBhdFCdQfotSNKX34nVLebSma6ud6Rl1jryHJmayfrU+FGEL+HhirLyw7Lr9DYP
 MQJp2+ajbHVUk5RnZULKDftqafW6gag9l5mKg5nyN6BokDbU8NpLM2IznPLw/kB1KHGX
 2T36M0DTUgd0oRu/aIwcyby9fLkaDnVY1nDKG08X9zR32+BcpsV5Uwj8ojwVxcYLFFXH
 3YYZJINiH+kpStlKuroZLXgt1FxXlK5g8tEwqyZSOAVYVD4XgJJWnuIpqLUiElG0mEIV
 onvDpUlOgrMLVYeeB0qi0VoLORFanfXaziXTjBjxixELdQfgHKw+NmheOutKoonSO7UZ
 BU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zbNUPEUqIZSKK2frRQ1iHCc4BIGUBkg3EIogKHQ7rUo=;
 b=XTu1MukKe3Alz7NXiOdzk06F9i7JuYOoDP7Z1hA92mHjCD7gS3H7HfJqq2jYtIGGno
 DSwCohl1TwqrBvUTT9q4mDy0dPBY1xnjZ6EWm1dyPfwMrzB1I6VBNSzTt2jgoKciSkCd
 nD2wK3EAY+1gMUskTvdxS+PrC6OUL9WUJ3SOcyUQsGoccl/tv5fNMEJwBl5Hufpw3aAC
 AN8GNP5UGd4SrLXGUXi/6VVdBhJk66NylL7HZM8SdX17MGAEmEsY8cEzoC1WAkADdwVV
 rU3sZ8JX0o2zkWN7AtlzIJBl95r0OFnLe5hKMbwdYVPlhIOIRnM3QAhRMOYjwz55/zhK
 TV7A==
X-Gm-Message-State: APjAAAV96WFaKJMs9NTppnqHitcx9XrFIyDVw8IpZGi/bB7SGjrGWez9
 Iia467XzWb+u0hVKzLKG+sDz4om5WIM1QC2RjSuwHA==
X-Google-Smtp-Source: APXvYqy4VYG7mDJSdpJK/Q3I+NuX8TBYnVv+ER1TBOixiO7rNkM7UUkZ2yp3/GT7EfdzEHf0CtPe9jHqHHilDK6/Cr0=
X-Received: by 2002:a17:902:1486:: with SMTP id k6mr6008699pla.3.1552679730748; 
 Fri, 15 Mar 2019 12:55:30 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 15 Mar 2019 12:55:19 -0700
Message-ID: <CAO=notzWU-9gr99FoxL=9XbewvwsKTY8fMTLeAjfLGRsH+PFqQ@mail.gmail.com>
Subject: Proposal for automated documentation
To: Vijay Khemka <vijaykhemka@fb.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 15 Mar 2019 19:55:36 -0000

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/19286

PTAL
