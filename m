Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="XyaDhElE"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Tcsy2Cb8zDqD3
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 17:05:09 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id v20so17474600qtv.12
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 23:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zE2uB69DmJqJxIjyDRgrJKj9mQRNU/hBd8BEcJ5xbJ4=;
 b=XyaDhElEc3b+rpbm9dfGf+yZ1DA+MHOwy895i5Imns/rIiqnXPhILqqmpPgsg3Pcka
 A4wFxzmjHt3ciXBXHnAnbb3VX87xhDfZWutM3GhbY+b8tjYj51RGeA3aiz8r7C5kuTYe
 Yd6+N8C1yPSeQvGJUqgzJvT5Vggi07xfCTN7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zE2uB69DmJqJxIjyDRgrJKj9mQRNU/hBd8BEcJ5xbJ4=;
 b=hPAWVEdbv8svGbyHpEiSdhU5QGqDwghBLFFZW+nCAXtYvLJjva3/6GWdAH/Yn0TPaO
 FFyMti7KKxkQ/sVAANzDJyznq+S9CIjX0TRXcaSrLuTYLrX5bsAQyo6aNCgGAHiAk8EE
 Ob2Wsa5zg1LD07hujDO3k35OxnTLLX6YrjwrZfde98RMunHritsJirdZFZxe8Lwvcb6m
 0Axbr3KzJSYK0RHQRV3p11WK+XatjwsgzHLblgR0qwqs5YqISQCrFZAPlocDgfi3L4Ld
 yWIR3swsWMi1Ia0sYmEZrD1oD6HQdd3Fy6jaZLc4YwGIjl50PjgGhksxA8sxkDv/ZfO5
 5Z0Q==
X-Gm-Message-State: APjAAAUoQssC0xLATLKqj7q/pgFGM/7ozbly2NjIohMAbdKgYyiP+F6H
 UApKMySR7jRo47wE8ucNlL5Gs1gta4jleNMdyWj2fw==
X-Google-Smtp-Source: APXvYqzzvGiL0+VymOtGeyfIa/e1Y8qBapb+sfFcUiylfcvVOUDLUXhHHlVWHCW5g/LTuVn6vA42UWOTUy0oMexj2PM=
X-Received: by 2002:aed:3641:: with SMTP id e59mr28926062qtb.235.1553666706061; 
 Tue, 26 Mar 2019 23:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <1553196610-29595-1-git-send-email-eajames@linux.ibm.com>
 <1553196610-29595-2-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1553196610-29595-2-git-send-email-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Mar 2019 06:04:54 +0000
Message-ID: <CACPK8XckCMXzvxEWMEMAV-VAOXmFXmZsF7jbiB_ei=gKBsBHJg@mail.gmail.com>
Subject: Re: [PATCH dev-5.0 1/7] media: platform: Fix missing spin_lock_init()
To: Eddie James <eajames@linux.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 27 Mar 2019 06:05:11 -0000

On Thu, 21 Mar 2019 at 19:30, Eddie James <eajames@linux.ibm.com> wrote:
>
> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> The driver allocates the spinlock but not initialize it.
> Use spin_lock_init() on it to initialize it correctly.
>
> This is detected by Coccinelle semantic patch.
>
> Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

This lacks your sign off.

I have found the upstream commit and cherry picked that instead.

Cheers,

Joel
