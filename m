Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x236.google.com (mail-yw0-x236.google.com
 [IPv6:2607:f8b0:4002:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w2rHH5qBgzDq9B
 for <openbmc@lists.ozlabs.org>; Wed, 12 Apr 2017 14:17:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="egCrsJTT"; 
 dkim-atps=neutral
Received: by mail-yw0-x236.google.com with SMTP id r128so7017554ywg.2
 for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2017 21:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=gt9Ojfx119efDdPj7kJd+op1oMqR9sznUKZumw7g2gQ=;
 b=egCrsJTT8Q1RqwxcDZ7lx2lCo1bQKEkBfz11c7P1sy6ngJAIiRxcsK6VVGUpvVIej5
 07PQ331/XWpAqrHBAQCZapJjowZZHsOyqGm4LzZNvQzTuAljvjZjsSl5TwFn0+VEDp02
 rEQ+Z2qwIyqDftw22QO9ZkMTRYXPjs/b7pjyEQw7tzUkqIriIZ3mr+jSWnNG8qcZYLK9
 Rdh2+Qsm3uv8gxoRmPG4QOrXhOGhM2XWCMp7UCcdicFikebAUDi8QuqN4TzkEy7HyxZL
 dSpbnuOsY3MHrv9YVI6el5N0FnZvWlgv1TCSUiNNZrCv3ykWlnQ7uADIu9HTH6UGaZY4
 0k+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=gt9Ojfx119efDdPj7kJd+op1oMqR9sznUKZumw7g2gQ=;
 b=dSJ2p60ZBXYVQ0dTdWz/diYnMkgIPsUMedhBpbAZ9TlQ9XDxdg+C1zFd32hhN7j5CT
 5trX1dcZ/1hVw0hVaZ690asHo9XHvKiWv8JboYi5ptkDwKZYka+rB7ah/tM2bBcY/Whr
 t3ZVvM4tjU04ubKEDL8Qlybert0E1jDHZMGMHoHjl/gB8EvQFhb84a4/GElFArbrd1Q+
 OQkc+n0h+LhSLnsqZaKjQWqPH/0I5rY5t14AzuCE69rdJRhIku+4Y+vleAPASCeX5E5u
 gMBkEIu0FnnuzOOo4GqR5wAsCgKn5mAsXuXaHB67WzMVd+M4R70S9kTPWPDa7lTby4SG
 y8Zg==
X-Gm-Message-State: AFeK/H1D6Pmk2CXv42hsL7pzZ0y8uHH9kHLXbrAfLHzfoK2usLPTp4JOFjwe+Jh7CL7dlNK64OleCGfuG1OX5Q==
X-Received: by 10.129.101.195 with SMTP id z186mr40937008ywb.11.1491970649168; 
 Tue, 11 Apr 2017 21:17:29 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.20.87 with HTTP; Tue, 11 Apr 2017 21:17:08 -0700 (PDT)
In-Reply-To: <1491961541-10864-1-git-send-email-bradleyb@fuzziesquirrel.com>
References: <1491961541-10864-1-git-send-email-bradleyb@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Apr 2017 13:47:08 +0930
X-Google-Sender-Auth: OtJF-eDzfaAaLOQl-WvHxe6hjVY
Message-ID: <CACPK8XcT=QGSXmStod2AFYm6gXgQp1U6=gTHkH_z-0giM7czMQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 0/2] enable gpio-keys
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: "joel@jms.id.au" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Apr 2017 04:17:32 -0000

Hi Brad,

On Wed, Apr 12, 2017 at 11:15 AM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
> Enable the gpio-keys and evdev drivers on ast24xx generally.
>
> Bind gpio-key events to the checkstop and air-water cooled gpios on the
> Witherspoon system.

Thanks for the patches. It looks like something went wrong in your
git-send-email invocation:

 From: Brad Bishop <bradleyb@fuzziesquirrel.com>
 To: "joel@jms.id.au" <openbmc@lists.ozlabs.org>

Did you intend to send it to me as well as the list?

Cheers,

Joel

>
> Brad Bishop (2):
>   ARM: configs: aspeed: Enable keyboard-gpio
>   ARM: dts: Enable checkstop and cooling gpio keys
>
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 17 +++++++++++++++++
>  arch/arm/configs/aspeed_g4_defconfig             |  8 +++++++-
>  arch/arm/configs/aspeed_g5_defconfig             |  8 +++++++-
>  3 files changed, 31 insertions(+), 2 deletions(-)
>
> --
> 1.8.3.1
