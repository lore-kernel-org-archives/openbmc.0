Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c0d::22a; helo=mail-qt0-x22a.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SqZ47Go1"; 
 dkim-atps=neutral
Received: from mail-qt0-x22a.google.com (mail-qt0-x22a.google.com
 [IPv6:2607:f8b0:400d:c0d::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zjB4n3Q6LzF1F5
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 09:38:16 +1100 (AEDT)
Received: by mail-qt0-x22a.google.com with SMTP id k25so1689588qtj.9
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 14:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=MMQ2p6OR+QexkNOdx/26Aj5GQis5oE4/n518onrZRKw=;
 b=SqZ47Go12nzbruvyIuuKOOSktHdH9jyqeLSZ3at41yuYkJez62S+EnH1VU/WUxDZYy
 hm0V7s+VAIO32D9h3NEDWJLiCZ6Q2CI9Qo8652t0b8HU9n6Gl6E2cEdGiGj7z2mfhXen
 63IOJ1QFJIfbJsI5qEjjviswa9DBNTxVv4BYHyj6L9DMB6wUWpxFLXfXDHvnpFKzrOZR
 /zcgJKCTnMPKa4U/eYKlhprf25iHs/7TSiN87gnuswvUJPgf2nUcjh46XtvXvZN+X5d9
 VU4qMvZsNGxFH8ZWZ4aufDt+EBAQDKaNkQYeg6fhZhTGX3nF09RLurR2WsLOWCrMkNo9
 Omog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=MMQ2p6OR+QexkNOdx/26Aj5GQis5oE4/n518onrZRKw=;
 b=KeGWKhINqKFFNCvCFP9+a2Lhse2gy+5l+N1YCRABXDqNRzv6rQxSSo6HpGtTjf3zDB
 /Eu0j7ImfdK8MUQcWRKdDnHZbAL/LPXSycibCIdMo1TfJBSn9gMsZlTphY5nNcqD1zgl
 Oei9jgEtd0BZXExmR6oHQKxaOytIhOsxrRG3NS4aREcE0S1IPyzUzeV2t9g4o5AkKmQV
 PXY8ojC3d82rkgCxpA8PxI0jGYCN0jhSrO/Ci9aRjXzbr7n+3faEDid+j6WGQSfqeMme
 meg+iDPiSDG+YnHR/onwMFm9S019CKisNr2w3duPjF61NFo/5f65mqarJ48gnYYhIbCl
 i6MA==
X-Gm-Message-State: APf1xPASFsMQ5JniLRBYpGVvTa06zuxvcdew5TkGtenOPqpjLkE1rG7S
 tV1e8HBaan7E8DhS8kbrn5xth74egLOYzXINcu8Xaw==
X-Google-Smtp-Source: AH8x227x6HkQXLcXl9iK+o2MGTFKZg0/FW1XFLE/5wkbuV+7hWbsodJOfzeleZmWIq6kg9OOKYF3plSYcqCTM8QKDXc=
X-Received: by 10.237.42.198 with SMTP id t64mr6793679qtd.274.1518734293737;
 Thu, 15 Feb 2018 14:38:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.183 with HTTP; Thu, 15 Feb 2018 14:38:12 -0800 (PST)
In-Reply-To: <1518701959-22899-2-git-send-email-tali.perry1@gmail.com>
References: <1518701959-22899-1-git-send-email-tali.perry1@gmail.com>
 <1518701959-22899-2-git-send-email-tali.perry1@gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 15 Feb 2018 14:38:12 -0800
Message-ID: <CAFd5g44gBJp0-mYEWGdyiA67BCi2pZWAG2bYPS-WdJEwH1oA5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] clk: npcm750: update text with fixed clocks
To: Tali Perry <tali.perry1@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Russell King <linux@armlinux.org.uk>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Rick Altherr <raltherr@google.com>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>, 
 Patrick Venture <venture@google.com>
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
X-List-Received-Date: Thu, 15 Feb 2018 22:38:18 -0000

On Thu, Feb 15, 2018 at 5:39 AM, Tali Perry <tali.perry1@gmail.com> wrote:
>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>
 <snip>

I think this should probably be rolled into [PATCH v2 1/1] npcm750: add fixed
clocks (moved from drivers/clk/clk-npcm7xx.c):
https://www.spinics.net/lists/arm-kernel/msg634678.html

Cheers
