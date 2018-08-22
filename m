Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::22e; helo=mail-qk0-x22e.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="P8wo1Bhk"; 
 dkim-atps=neutral
Received: from mail-qk0-x22e.google.com (mail-qk0-x22e.google.com
 [IPv6:2607:f8b0:400d:c09::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wkyM6wsKzF0gv
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 09:58:19 +1000 (AEST)
Received: by mail-qk0-x22e.google.com with SMTP id f17-v6so2496668qkh.4
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 16:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=toYsvrvdmd1mxh8op8yyESI78gq9rNtN2X1TntiE7Fo=;
 b=P8wo1BhkSlenCZZcAzTX8eujQGJkhuwXFnGXxFdjgk3WCDeZxOKwxwXUBS6nqOhI41
 1TpPNSarl2ZZeUFyT8QtU4C8kCtvfx83UzQ1NG9YHOCuBhx/CfSmntbJ0LtYvMRCJVlX
 SUiWdFOZ3N5Qm0Vf5qc0c+9SQdUDg0A/bRyFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=toYsvrvdmd1mxh8op8yyESI78gq9rNtN2X1TntiE7Fo=;
 b=NZ41d1zuZ2RMJSHSNZpok9NLu5iv8umNtCUtoLyZsNAbp5Mjd2TkJuwvtHbiu+Rthp
 k3OKB2dv/ct4lZWsK5hj61KbfXK+WPNZ7z/3b/fg94pCnv/4R5mp2cLk0AEHoI1jxw+/
 hwboBm/ML0CETpK07lXH6Jqz7Pxxjx0I6hy/kAgDkrsLGeRdrRjcvXxJHFNIK7uVeOM7
 yG/kcFL5t31sgwRK3dZiKyzu4RMPiLRGRIsLtWBTDPlR8dfIo+dmtZJdfdLMQBXMvdLO
 FrjYh01kcWR3LtpzgruGDMglLfsbFuQwCfkFNAv8DyL9UE4W1VV5qVUXWCUVgXZHcZxb
 1+VQ==
X-Gm-Message-State: AOUpUlHGhK5gbvcawHghk50R4IikO+kf8ynWadrNeUdHAjR4UmzfuY9W
 odBkHvc0GN+g6bOhBEb5XXDdb3tmquxW7p9cA+M=
X-Google-Smtp-Source: AA+uWPwZFK8r2TFktY0rgl1gv/NFRZUiKV7Bi3THkpvdzwWqOvI0ivtAdO3vsVi2piqr1u8DQJMtFACy+yZw9E9YWjc=
X-Received: by 2002:a37:bd02:: with SMTP id
 n2-v6mr53813972qkf.336.1534982294923; 
 Wed, 22 Aug 2018 16:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
In-Reply-To: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Aug 2018 09:28:03 +0930
Message-ID: <CACPK8XdtitrjvDpuiPiz_ew03m972ueGRXAhd4kM_z6YSVtL3A@mail.gmail.com>
Subject: Re: Proposals for commit log policy
To: Alexander Amelkin <a.amelkin@yadro.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Wed, 22 Aug 2018 23:58:21 -0000

On Tue, 21 Aug 2018 at 22:01, Alexander Amelkin <a.amelkin@yadro.com> wrote:

> =================
> some-package: bump version 62286ef3 to 4fa63380
>
> Author Name (2):
>   commit 1 synopsis
>   another commit synopsis
>
> Another Author (3):
>   great commit
>   yet another great commit
>   fix previous not-so-great commit
>
> Change-Id: some-long-gerrit-hash
> Signed-off-by: The Version Bumper <bumper@nowhere.net>
> =================

> What do you think? Is this feasible? Any other ideas how we could simplify creating release notes suitable for end users?

I think this is a great suggestion. I would also like to see this happen.

Having the maintainers or authors of the packages submit their bumps
would ensure this does not become a burden for the central repository
maintainer.

An advantage of the maintainers of individual packages submitting
their changes is they know the best timing for integrating their
changes, and know what relevant details should be added to the bump
commit message.

Cheers,

Joel
