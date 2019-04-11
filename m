Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oqSryTV9"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44g3DP5B9LzDqSQ
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 00:23:49 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id bf11so3473350plb.12
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 07:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OAAV8nZ8TEBCfVULwdv7seE0MrmZVFwxNLUlUt99IqU=;
 b=oqSryTV9o6PWR8MqaMJlus4pHRzFPwIZLl2Jyw5lXTPkJbh7ftMPrUEz7hQytfo2j6
 4VF86LY2ykhkgnv1wtt5zN4nAWAuwk7dksY8ogveb1JTYaM+9cnOeDMt+SpeZEPPZdJL
 iE4/b1FD5+lvaUjShT4+98Ub7XikkxZJ8uIqRBlJireMdKN6mbV7a4Sy9QgD4aFoL7ln
 qoYo3IkpC4+xWmdokssJ+keu2FRwLUfzZCO9iKbJ6mKpzPjEcou0qesD0syh5kUhWrky
 NA3oM+KqEug3YVzsBpqOwXNK+btNs/AIingUKYAP5dLwdz9RDzuIE9evW0ZNunUQVwgz
 95sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OAAV8nZ8TEBCfVULwdv7seE0MrmZVFwxNLUlUt99IqU=;
 b=shQf6trts0AOsqWNdCujxGy+ScLScH6l168yrc0gZcJvpO7C7C0to0hHAwwDdgGT45
 v0m+jkJqYDVzIeICC7PqnlWQHCmGXBEDYkmuoFtE/4HdDQi4pZavpWlR1knGkeZtemUC
 sVfJL8tcShPC2ikaqdBlwaRDx9/FQPF4Ncq5NaNbCxkN0MccFyWVPqfUgBpIOUOznIPP
 ynE99RYgL/RI5IBaPGevIeputyJaX2LSqKnFUm/B2RPyaicAGGESDUDpXGp+o3RmYo9G
 PEALdN/gxtRAtTwR4M5R5LanAdrKH+Qp8fzCXUa1VA8x+dH5q/DPTvn7W6ha33OnjBkJ
 HuPA==
X-Gm-Message-State: APjAAAWo8sRSOk/2vW2V4JH+OCuL3bj6xMsdGWkp/bKDsGcbaY4WQAMe
 ms9d+GGBudjYh2WtxnhGfcOEP92KNN/OTWnLqqIWqg==
X-Google-Smtp-Source: APXvYqxizR2hR/uxboUfe7aw2pPm2EnRQ6ZuJCGwxvND/s3h8CulisVgfKevabX0XHD7fE5FOGIJLBb7YnXJydFQuTI=
X-Received: by 2002:a17:902:854c:: with SMTP id
 d12mr3402520plo.150.1554992625443; 
 Thu, 11 Apr 2019 07:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190410153158.152020-1-venture@google.com>
 <8c591930-a8de-40a1-a2cb-ca77cbef55e9@www.fastmail.com>
 <CACPK8Xf1wQmo+ppa4zvOkSZ-scjtaqE-aCf9HSzZPu0HYK-9AQ@mail.gmail.com>
In-Reply-To: <CACPK8Xf1wQmo+ppa4zvOkSZ-scjtaqE-aCf9HSzZPu0HYK-9AQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 11 Apr 2019 07:23:34 -0700
Message-ID: <CAO=notzPzJstii-qrRi_fp9ybE7TQw8sSb1=TqZgb8s2fLQ5jQ@mail.gmail.com>
Subject: Re: [PATCH dev-5.0] hwmon: (pmbus/isl68137): Add driver for Intersil
 ISL68137 PWM Controller
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, Maxim Sloyko <maxims@google.com>, 
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
X-List-Received-Date: Thu, 11 Apr 2019 14:23:50 -0000

On Thu, Apr 11, 2019 at 12:42 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 11 Apr 2019 at 00:33, Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Thu, 11 Apr 2019, at 01:02, Patrick Venture wrote:
> > > From: Maxim Sloyko <maxims@google.com>
> > >
> > > Adds the pmbus driver for the Intersil ISL68137 PWM Controller.
> > >
> > > Signed-off-by: Maxim Sloyko <maxims@google.com>
> > > Signed-off-by: Robert Lippert <rlippert@google.com>
> > > Signed-off-by: Patrick Venture <venture@google.com>
> >
> > Please send it upstream for feedback, then send a backport once upstream
> > are happy.
>
> FYI, I found that one of your workmates sent the Intersil ISL68137
> patch upstream last year:
>
>  https://lore.kernel.org/lkml/20181017225603.7782-1-kunyi@google.com/
>
> Guenter gave some review to fix really trivial things. I suspect with
> the two tiny changes he will accept it:
>
>  https://lore.kernel.org/lkml/51dbddbc-0e92-7bb5-03c7-4bad3a0af029@roeck-us.net/

I verified that the patchset sent upstream last time has minor fixes
that my patchset push includes.  But likely the comments will be the
same.

I'm surprised there is acceptable possible without the Documentation
file, but I'll give it a shot, thanks.

>
> Cheers,
>
> Joel
