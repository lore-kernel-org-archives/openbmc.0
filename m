Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="TPgotO0t"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ftJx3jvTzDqBG
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 17:42:09 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id s15so6026030qtn.3
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 00:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=47WXQ5H2gC7EYEgt9FWea71xFdlR2XJzuSeYVd1SNeE=;
 b=TPgotO0tengme0WnzwJ6YF8H9HZ+oF8bsmvKDbfWZJTY7NCJj+CEhM3rStREiQxUQg
 pIC3wLzprFHfcY1YZaUaqvgcmCa9G0bVOa2orWehmpVZTwU5gJlLBgfdif8rofBQizkP
 j7y6aEvRWSe51euwxk78U0cWJKPhtYoufwwUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=47WXQ5H2gC7EYEgt9FWea71xFdlR2XJzuSeYVd1SNeE=;
 b=RTq98bR5xowX3mS7+6lH3LwnFRLQ198p6gTB/3+JL/wlU5jobuFkmHXCoKgSCM2zF4
 UE+g2fsrYjoQtaj0m5+7H/q7iVY4mYxcUCs8ibbIYlEsAmiV70ISnq2hysa6Oj+CiiC0
 SN6oMDjmVu/DvRrwh5OHl+MPKwkpKf+DxDsfkMyZLHNIzDsCH5i0bhesdMMzOGlXgPwK
 Q594uIEXeSGwhhv313j8ajCzRTBjvmdofDUHHrnrVhKrJlSw6GaKl7cjGFMePQ0VnkCp
 F6UOm3HW65oNDKbqKJ8GSdunqVDrsdFiX1vm8p1KF8LSVS538Tcf0eAuYSFAClLWyD0N
 x78A==
X-Gm-Message-State: APjAAAVKXaublCm+aVov4VUwWkhXezeNvoDtILvbKp+DLkiSvHWsBBQf
 bXSr90xg4QPVlgPiFHDsyo36swRm3E4aD3LEsOI=
X-Google-Smtp-Source: APXvYqyhtLb7wcu7Sm4PPAud9R4gkQ6CMlERJ03sAaNbnrbLVwnfSNn6Dc6bi82Qr0aH8Z1N5kkMH1WIG74hYvRbSRQ=
X-Received: by 2002:aed:35e3:: with SMTP id d32mr39285025qte.43.1554968525878; 
 Thu, 11 Apr 2019 00:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190410153158.152020-1-venture@google.com>
 <8c591930-a8de-40a1-a2cb-ca77cbef55e9@www.fastmail.com>
In-Reply-To: <8c591930-a8de-40a1-a2cb-ca77cbef55e9@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 Apr 2019 07:41:54 +0000
Message-ID: <CACPK8Xf1wQmo+ppa4zvOkSZ-scjtaqE-aCf9HSzZPu0HYK-9AQ@mail.gmail.com>
Subject: Re: [PATCH dev-5.0] hwmon: (pmbus/isl68137): Add driver for Intersil
 ISL68137 PWM Controller
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Patrick Venture <venture@google.com>, Maxim Sloyko <maxims@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Robert Lippert <rlippert@google.com>
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
X-List-Received-Date: Thu, 11 Apr 2019 07:42:10 -0000

On Thu, 11 Apr 2019 at 00:33, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 11 Apr 2019, at 01:02, Patrick Venture wrote:
> > From: Maxim Sloyko <maxims@google.com>
> >
> > Adds the pmbus driver for the Intersil ISL68137 PWM Controller.
> >
> > Signed-off-by: Maxim Sloyko <maxims@google.com>
> > Signed-off-by: Robert Lippert <rlippert@google.com>
> > Signed-off-by: Patrick Venture <venture@google.com>
>
> Please send it upstream for feedback, then send a backport once upstream
> are happy.

FYI, I found that one of your workmates sent the Intersil ISL68137
patch upstream last year:

 https://lore.kernel.org/lkml/20181017225603.7782-1-kunyi@google.com/

Guenter gave some review to fix really trivial things. I suspect with
the two tiny changes he will accept it:

 https://lore.kernel.org/lkml/51dbddbc-0e92-7bb5-03c7-4bad3a0af029@roeck-us.net/

Cheers,

Joel
