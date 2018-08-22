Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::241; helo=mail-io0-x241.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="u7R/Gme8"; 
 dkim-atps=neutral
Received: from mail-io0-x241.google.com (mail-io0-x241.google.com
 [IPv6:2607:f8b0:4001:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wJ836DQLzF2FK
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 16:50:11 +1000 (AEST)
Received: by mail-io0-x241.google.com with SMTP id n18-v6so661279ioa.9
 for <openbmc@lists.ozlabs.org>; Tue, 21 Aug 2018 23:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GBERz80iPjH8lhaYQZUtnaUnG9vakJR68KmBP8/uKkM=;
 b=u7R/Gme8uU0mLq4ekLR5IMiLYcpm79FX9dK0DhBeFCZbwkfzoZ7hWwSZzROYcn0PJg
 mIYHvjVuozJndSbtHLg8HOsTMWMWBhuhbpJ8GZ4UEswalYxDx0K7Dv2jphGHBVHbIrW3
 v2Y2OS1EIJZH+21Z/pPUV+BCZiQPMwopT2iDOQZqdTeMNAGHT9tmYMWTDeoNjOFyGvKl
 oETSkK2KvG9XT4vNHGngbDQeWotbqsLpQHOmKsX1AbTx71Gph5jyavEnHF3ZXIiIckgx
 royDyCM7GturMwTHCVkPfH+3wEK2fxFBiBTYulHaSKc1gjlB7sV34qYYD28ip0nlqk84
 r2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GBERz80iPjH8lhaYQZUtnaUnG9vakJR68KmBP8/uKkM=;
 b=qCHXgkYt1gIgomZJmmO4ZYFMaxNPpRE19laaVWVyhw0vX3MQh3qvWM21q3dCeh0aMd
 Vn4LgD5EaMJ/XpY4a818xTeI2Xr7+5HVs09Nxx10u7Lf8nBzeZZgxnLzQxaq6hLiJlY5
 DhbwSlwTDoRYl2nLvQzqoV+42kuMRGj03Km7xLKIZRtY0qji6PPPPYFSk1UggSFxRw9g
 umlyBvFxxTKCbCmdcTlcMRN0NCZYVnK2hOREe5V+XxRtFpagA9q+lawIIRaSQL/05Fi6
 cclQ2NrI6+vFbIRv+Ye4zfe1vKzxUbV/N7axEPoEWxUf7rVL0vxaXo3L7H6nKZIi26av
 x23A==
X-Gm-Message-State: APzg51D/F9jQh9hQqTee/CkgH0JET5T0wxT5hS0lBL46LeE57cK2Nw5b
 tR14jOjdCisIBlcRY735IUY6oORGl0Ez65CAmjkfFA==
X-Google-Smtp-Source: ANB0Vda0g6V01X6UvHHjTgiTKfO/AddfCy3YreJqVIr1aqv3MCclYonz3A5eMtMl+kUqyosGTbg9CI/UvecR7xhKYkY=
X-Received: by 2002:a5e:8408:: with SMTP id h8-v6mr33535ioj.171.1534920609443; 
 Tue, 21 Aug 2018 23:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <1534485925-63307-1-git-send-email-mine260309@gmail.com>
 <CACPK8XfcvJiX8jPgMxtnijtt7jVGXM2SCe6fiYfpvqQuU2du2w@mail.gmail.com>
In-Reply-To: <CACPK8XfcvJiX8jPgMxtnijtt7jVGXM2SCe6fiYfpvqQuU2du2w@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 22 Aug 2018 14:49:54 +0800
Message-ID: <CAARXrtkxYx8fNkgcUdMXCy1Wj0PqoGXeFmpKTtbwQUm4aHAY3w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.17 v2] ARM: dts: aspeed: romulus: Enable
 iio-hwmon-battery
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2018 06:50:12 -0000

On Tue, Aug 21, 2018 at 8:35 AM Joel Stanley <joel@jms.id.au> wrote:
>
> Hi Lei,
>
> On Fri, 17 Aug 2018 at 15:35, Lei YU <mine260309@gmail.com> wrote:
> >
> > Add iio-hwmon-battery using adc channel 12;
> > Enable adc to make adc running.
>
> I assume we're doing this to read a battery voltage of some kind (was
> it the RTC)? The commit message should describe why the change is
> being made (as we can read the patch to see what is being done).
>
Yes, the commit message will be updated.

> This patch does not apply to dev-4.17. Can you rebase and test on top
> of the latest?

Will check and submit a new version.
