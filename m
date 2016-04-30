Return-Path: <teddy.reed@gmail.com>
Received: from mail-wm0-x22e.google.com (mail-wm0-x22e.google.com
 [IPv6:2a00:1450:400c:c09::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qy2DF25r0zDqBB
 for <openbmc@lists.ozlabs.org>; Sun,  1 May 2016 06:27:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=JwKcfF9k; 
 dkim-atps=neutral
Received: by mail-wm0-x22e.google.com with SMTP id a17so86043356wme.0
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2016 13:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:date:message-id:subject:from:to;
 bh=KGjnj9w1K5hhaE9H2xI6obODfELnU1PZ9PkDx71EqLk=;
 b=JwKcfF9k4o/v4Pcs68shdxjS8Sxh8IcMeBfk47qNA/7DtWe+mrj1rl3lcYPocC/cgX
 YlXIGBidlxbRqgGrikkdiUKFzBh1Y2niMMrwXTmc3E7E+2rUlIUYyHJ+x7ropjlhpBhG
 DH+CtocbAYvXYVZ4lwM0xACBhWmmMS03FUoGl1+NH6UtmK4dBr90P2Yja4BsA77kHPgA
 rgcWf74lPbBI2+1D3BrfWizJ4katZbSgxsE7VnAZLgyx73mC1OAyh4l2fWmtYq9QDxlS
 PctLFSpZh2kOOpGkyJoGoQY2SiB0wgkJlyufnjHNwC/C2bbCZMgvL1G0SGahO8/tZMqa
 WyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=KGjnj9w1K5hhaE9H2xI6obODfELnU1PZ9PkDx71EqLk=;
 b=JhkEDE7ArtQMSFRPE6b2rc9j7/kTlHziy9T+lKojnTE3KfID4CIfN220S/xgV2q39o
 RXlHHFJIZCzL/8H6GK/3jbEZqusV650S3qgFWDAhn2qY0SRG/y2/7Y3+VZpZK28N/QqN
 l+4QxbIWTOMu+LVEN/tCUL8Vhcye0CFNjrTUMgrBHMg5U6n9LeLUAxrEzw8SO/Os5Bv9
 R6+xhkAoQ7XWNplkFJPgJD+MmOaOgQRvVNwW0WIstqXiWj6mhsWgIZtelawpoqXGX3f7
 UfqqlS2gc3lLPNVVqdj7qZeGffIOl2Tqx2SVTdGbV2TqBJekLZufSvXJlwXnJgXy+iBx
 qJAw==
X-Gm-Message-State: AOPr4FXUFz0GNW/a1DqbGQ9E/GbwmySmxyNUGz3e9BJ6LDkJVBlwuvWbYgHX0iIDJvYBPg==
X-Received: by 10.28.51.5 with SMTP id z5mr11378172wmz.101.1462048023313;
 Sat, 30 Apr 2016 13:27:03 -0700 (PDT)
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com.
 [74.125.82.53])
 by smtp.gmail.com with ESMTPSA id i3sm21481265wjx.30.2016.04.30.13.27.02
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 30 Apr 2016 13:27:02 -0700 (PDT)
Received: by mail-wm0-f53.google.com with SMTP id n129so65073547wmn.1
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2016 13:27:02 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.194.173.161 with SMTP id bl1mr5831584wjc.11.1462048022408;
 Sat, 30 Apr 2016 13:27:02 -0700 (PDT)
Received: by 10.194.94.163 with HTTP; Sat, 30 Apr 2016 13:27:02 -0700 (PDT)
X-Originating-IP: [2620:10d:c090:180::e48a]
Date: Sat, 30 Apr 2016 13:27:02 -0700
X-Gmail-Original-Message-ID: <CADUykeoN5=KtG7FKuCOrDEY5u46VjJN3mvqmuC8CpkaemFrMNw@mail.gmail.com>
Message-ID: <CADUykeoN5=KtG7FKuCOrDEY5u46VjJN3mvqmuC8CpkaemFrMNw@mail.gmail.com>
Subject: qemu: Question about including Facebook's Yosemite board
From: Teddy Reed <teddy.reed@gmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 30 Apr 2016 20:27:10 -0000

Hello!

I'd like to model the Facebook Yosemite board in QEMU, which from the
QEMU model perspective, is almost equivalent to the Palmetto. The only
requirement for the board, outside of the AST2400 capabilities, is the
inclusion of 2 flashes.

Here's an example of what I mean:
https://github.com/theopolis/qemu/blob/bc20ef6a7a17f8424571234d4429e7e6b67f17e8/hw/arm/fbyosemite-bmc.c#L78

If you don't mind including those flash definitions in the Palmetto
model I can save some QEMU complexity by not adding another board
definition, which IMO is ideal. If that's the case, I can also submit
a patch to add the flashes ASAP.

Thanks :)

-- 
Teddy Reed V
