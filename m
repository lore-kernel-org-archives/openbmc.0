Return-Path: <pombredanne@nexb.com>
Authentication-Results: ozlabs.org; spf=none (mailfrom) smtp.mailfrom=nexb.com
 (client-ip=2a00:1450:400c:c09::22d; helo=mail-wm0-x22d.google.com;
 envelope-from=pombredanne@nexb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nexb-com.20150623.gappssmtp.com
 header.i=@nexb-com.20150623.gappssmtp.com header.b="Go6WG/kP"; 
 dkim-atps=neutral
Received: from mail-wm0-x22d.google.com (mail-wm0-x22d.google.com
 [IPv6:2a00:1450:400c:c09::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ynVkh2j52zDrq7
 for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2017 19:22:18 +1100 (AEDT)
Received: by mail-wm0-x22d.google.com with SMTP id i11so10665054wmf.4
 for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2017 00:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nexb-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=UgdqpOllkVnAI7zmCDAjMcCPO7SqRUMPrXVcQK4sfs8=;
 b=Go6WG/kPbqWk4HrjAQttkkh5pQVUrtlKqqcIj0PNLtpDyaUwRChHRSdbf02NpuTLWg
 mXI8XdUqtEGOzzCZqAwM6u/zseGNCX5ETg3/Tvg7JI8HqPMDQzdLM9vynWdIt40IABCK
 VWahY8tgUlqBUCdCCcdKyhKmgjpCihfflloYV5bWleFS5MmyIbgI93nlNMDc1T3yx3w8
 ydTDbBWpqsdDkJEFWX6T5iTJkofZqO5iWf3rcvm1NVlLOjWPu1GHmoUy9yoloDKojhYv
 wFDbxTUkyZ5NaCJcIs3SB5trnE4pmC2TCCRPvDrZby91erWft2+KtE39pQNc4nMgl88G
 RCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=UgdqpOllkVnAI7zmCDAjMcCPO7SqRUMPrXVcQK4sfs8=;
 b=U8Hn+SudKffumIpHoTb65oX1SXJuMwaZIJpP1gcr+AqVRZLeye2lttQYQDkoHcKNHS
 6AUw01CYkWxFvtUspolyblccZ/6EtK6Qq95RpoeLwnkcuRemdQgxTuj3Y81V3pmEEbI3
 30TfEBFAixhcby8xTQnOEJCsB+WLShTPB5pHUinJ21RSnsMetTfBBQD9H9L3gldNHG6i
 hA4r8Mq7K80g15RMBk5EMt8Pkd5hJvHe6ds08n+X15/zYyOiejQa0fhK5KHuJfwqhVg0
 JQO6d9Dlj+XhRv6hOtuRepr+K2vB8y4xKW3bAPfxAusPURYsx1mAbVyl4J/9t12xMh9R
 UCBw==
X-Gm-Message-State: AJaThX6/mP2QfBjUtWSi9FNxLJgVoxfwq0spA8zKAfp1Pp2zxsgNDspw
 KCigA4wcBwVl3mPlAsj9YMC86nfgOmb619Dse6nocA==
X-Google-Smtp-Source: AGs4zMZSCjChvABwjHS+caq8My12Z0Kj2l6+bBtaYRW3I6Vx6IcjVMZS0LTb87wx6/iwHVyfhVa9LGWPvlvd53A1ry0=
X-Received: by 10.28.9.146 with SMTP id 140mr1197258wmj.117.1512030130485;
 Thu, 30 Nov 2017 00:22:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.157.195 with HTTP; Thu, 30 Nov 2017 00:21:29 -0800 (PST)
In-Reply-To: <CAGMNF6XRwU5QEJhkg-mVwE5zpPigtcGJtRUupZHtcWRdedcsxg@mail.gmail.com>
References: <1510675867-24276-1-git-send-email-oleksandrs@mellanox.com>
 <1510675867-24276-3-git-send-email-oleksandrs@mellanox.com>
 <CAGMNF6XRwU5QEJhkg-mVwE5zpPigtcGJtRUupZHtcWRdedcsxg@mail.gmail.com>
From: Philippe Ombredanne <pombredanne@nexb.com>
Date: Thu, 30 Nov 2017 09:21:29 +0100
Message-ID: <CAOFm3uHg8n4A8opaOC3=pNtM1yJU6iy5Ta8XtGOvqT-Euv=X1w@mail.gmail.com>
Subject: Re: [patch v12 2/4] drivers: jtag: Add Aspeed SoC 24xx and 25xx
 families JTAG master driver
To: Kun Yi <kunyi@google.com>
Cc: Oleksandr Shamray <oleksandrs@mellanox.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, arnd@arndb.de, 
 system-sw-low-level@mellanox.com, devicetree@vger.kernel.org, 
 jiri@resnulli.us, vadimp@mellanox.com, linux-api@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 openocd-devel-owner@lists.sourceforge.net, mec@shout.net, 
 Jiri Pirko <jiri@mellanox.com>, robh+dt@kernel.org,
 linux-serial@vger.kernel.org, 
 tklauser@distanz.ch, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 01 Dec 2017 12:31:21 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Nov 2017 08:22:21 -0000

On Wed, Nov 29, 2017 at 11:51 PM, Kun Yi <kunyi@google.com> wrote:
> On Tue, Nov 14, 2017 at 8:11 AM, Oleksandr Shamray
> <oleksandrs@mellanox.com> wrote:
[]
>> diff --git a/drivers/jtag/jtag-aspeed.c b/drivers/jtag/jtag-aspeed.c
>> new file mode 100644
>> index 0000000..a6e2417
>> --- /dev/null
>> +++ b/drivers/jtag/jtag-aspeed.c
>> @@ -0,0 +1,782 @@
>> +/*
>> + * drivers/jtag/aspeed-jtag.c
>> + *
>> + * Copyright (c) 2017 Mellanox Technologies. All rights reserved.
>> + * Copyright (c) 2017 Oleksandr Shamray <oleksandrs@mellanox.com>
>> + *
>> + * Released under the GPLv2 only.
>> + * SPDX-License-Identifier: GPL-2.0
>> + */

I think the SPDX id should be on the first line as requested by Linus
and documented by Thomas (tglx) and Greg (greg-kh). And it should use
// comments, e.g:

// SPDX-License-Identifier: GPL-2.0

See the threads discussing all these.


-- 
Cordially
Philippe Ombredanne
