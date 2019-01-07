Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z8K5+pLg"; 
 dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Y7B44L6xzDqCF
 for <openbmc@lists.ozlabs.org>; Mon,  7 Jan 2019 19:00:59 +1100 (AEDT)
Received: by mail-io1-xd33.google.com with SMTP id f4so15951907ion.2
 for <openbmc@lists.ozlabs.org>; Mon, 07 Jan 2019 00:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NfX801a2rpAdssdFrHkzgXCZDAr5tL93BZCUF9Z1jO0=;
 b=Z8K5+pLgo84jEdPj/GmNJRBH4yoNvwBBk9jmdXE9oviukWrGtUnv6vjfEJlagdKZRt
 rEEUUwmE6abPgSnncVDmF9YFtG0P5AlRgLUvE0evBXI5+Ou/kTVVQ5Vhz1p3LFaPbgB2
 4VB6pVuh5eU31X5+cC7bR/853hb8PsYi72r4O8U811G76MzRHSKQ62o4bSLjaw3opdfO
 gPUEJvdCKMI1a58VqrN79qW0tS0SwRnhmjFY+TOq3+x0n0n0BD3hlB4WjCjI4/uoaNDY
 /mzp6Gg6niGg1kyZ+9sqUoicmH32tgZ0iKcF4RnZbESBNOyq7CyOIN6zB2oaK3WRASQl
 zbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NfX801a2rpAdssdFrHkzgXCZDAr5tL93BZCUF9Z1jO0=;
 b=koHcJRsWapdPj4xW+JAb8Lju70fJEPOz4SFFedWdJO5yF/0YNgnPVXNkUnQDsVQcny
 SgBOoVGS+YbJz2bPIu3Zr2dG+BdSacsRikM6Uzo8SNyWyKf+eUpvXJP/L+xkExfFbF1W
 4wOdB8p7iqgL/6vsQpPhkawHCj8Grf3SdXn0sCJz0bAydCkONupwHoYv8A86oiFnATwj
 OS67XdMplEMMNv3CpBK7r6TmWp358x8ztHJL4ii3VrTd+jlsO3EZXSK7mJ20S/MPQeWi
 irenBsngF3aLzM8sbE8mKC5z2/kSjVETwEbTt+HmO2ZxoCQFhIQbN4qe5B3uuf7owran
 M6nA==
X-Gm-Message-State: AJcUukc3A74IfXnzXQJP2FplTfNH6pbifgLGBr/HJ8aaxZ5OKhlEJD8b
 wZI2cGb3k5tb20gSkmKRWtoFED56HkEqATYLXubEihoH
X-Google-Smtp-Source: ALg8bN62wSRzImumVXsS+rZthOgxZOFxUYrNf5iosmZk37rqEGP7nIvcWgJaRwZ0p8gAIjCR26YshdD3kOCRO5jwaxg=
X-Received: by 2002:a6b:c815:: with SMTP id y21mr39179508iof.98.1546848057464; 
 Mon, 07 Jan 2019 00:00:57 -0800 (PST)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Mon, 7 Jan 2019 16:00:46 +0800
Message-ID: <CAARXrtniNa3XejKfasL-YwhVtu9siXLQk0b6hN71XzUbX7xDBQ@mail.gmail.com>
Subject: About the usage of ipmi user management
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
X-List-Received-Date: Mon, 07 Jan 2019 08:01:01 -0000

This mail is to ask questions about how to set the ipmi user in build time.

With a recent OpenBMC master build, one can NOT use below net ipmi commands:

    ipmitool -I lanplus -H $bmc -U root -P 0penBmc
    ipmitool -I lanplus -H $bmc -P 0penBmc

Both gets `Error: Unable to establish IPMI v2 / RMCP+ session`, and the
OpenBMC logs `User not found`, which is related to the IPMI user management
changes.

So my question is:
1. How to specify the user at build time, to make either of the above commands
to work?
2. Or (if the above commands are not expected) what is the correct way to use
ipmi net commands?

Thanks!
