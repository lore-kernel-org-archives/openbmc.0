Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::22b; helo=mail-oi0-x22b.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZgHQVQWN"; 
 dkim-atps=neutral
Received: from mail-oi0-x22b.google.com (mail-oi0-x22b.google.com
 [IPv6:2607:f8b0:4003:c06::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wvmS5ZwFzDr6B
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 01:35:04 +1000 (AEST)
Received: by mail-oi0-x22b.google.com with SMTP id d5-v6so13697281oib.5
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 08:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=8o1akaZJAqDUDfn0scqElb73saBMzAl0EBw33nlhqIo=;
 b=ZgHQVQWNvepLan0jqtJr99dO/+xJn3B9YJA4wBYoRpoEseuzHkTPXyieC1W9kqtgtG
 pz/677JwYBsI5/X4TI2PhgA5LyZ2xdfohp6NuLq/qxyM+6T1JgvUh8rMxaE5+jyf7KRy
 a++lJziNQY6OkjKkKFPbGRHx7FjAuFNEuc1ARG5deMWwated3K85Dk4xYFPwY4yh8XxZ
 FLv54sOtoBr7uS1fcBcLl3xSyvx6Eg4AFUk5W0mYOJ9EvrPuSlY3Ju6ClDp9TlQ+cFyw
 ypq7njRzRgWXUOti9ZnG6hu2x0eMwrmyI9F5r64eEqqVUdvP4P7mqkwXOJPO93wV95uS
 YF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=8o1akaZJAqDUDfn0scqElb73saBMzAl0EBw33nlhqIo=;
 b=Vq0D1Hps6EeEqvlF5gFRwiDZEXt04WNgvbUG7WMUF2pjQTsfvgZ4UJUggmGqI39lLh
 9GFX8gHqpRoNK5BKFxjTJ7Q9ZgOuWyhCVzAerWWekqHUsqdvH5v9MYEG6VxMSdUJrOQ8
 9YdpUHiMQEEuR0DoRYMSgxS4P47UTQeWlOeff29gs/0MwryKUe/qsqsGmKu8O6/G5nYk
 SjDJ2RjIwagHH+AOHU400OlClPGgjdqGEIqmylV2I1yw8ARi57XUQFn/xgx0aQQ2hWD4
 yHNtPAjJCTo1gXVcE55xnVP0qxf7VEF8pf2l2lhvTIKlVNwdFrBHbfjPPi0ygZ3kBi4p
 9X4g==
X-Gm-Message-State: APt69E2IL6gHHHOP+UTG2Mk/UhJ4O7Sukekhv6/4D1sP0Fvbu+FEPLBP
 4DMYr/DaRbOqlGlu98nHAeK0mOmSHO1Ofsf2cf4=
X-Google-Smtp-Source: ADUXVKIW61dQmWLDHnzp1lcfMhYELOVPNeViIVXZZyQDtkZpYgoTofxB3KzIFaZl+lhzZnbiXiJOMXG1JPFNCxziEnE=
X-Received: by 2002:aca:2810:: with SMTP id
 16-v6mr1877036oix.342.1527694502074; 
 Wed, 30 May 2018 08:35:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:3262:0:0:0:0:0 with HTTP; Wed, 30 May 2018 08:35:01
 -0700 (PDT)
In-Reply-To: <1527640725.1548539.1389826896.64777E84@webmail.messagingengine.com>
References: <CACPK8Xc_gTiJaCUzDiG6aNOu7rF6gU3e_oc-bd19bOswju7yTw@mail.gmail.com>
 <1527640725.1548539.1389826896.64777E84@webmail.messagingengine.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 30 May 2018 10:35:01 -0500
Message-ID: <CALLMt=qrXna7cd_x0F+mjNRbWNBPXuNcHioTCcAsmHY5gRLjfg@mail.gmail.com>
Subject: Re: Gerrit +1 policy
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 30 May 2018 15:35:05 -0000

All righty, I updated the gerrit config to maintain code review scores
if no code changes occur.

Not clear to me if a gerrit restart is needed or not to pick it up. If
so, it'll have to be done in our next maint window.

Andrew

On Tue, May 29, 2018 at 7:38 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
> On Tue, 29 May 2018, at 22:23, Joel Stanley wrote:
>> I get frustrated by Gerrit removing +1s from patches when I make a
>> small change to the commit message.
>>
>> This is a configurable option in Gerrit:
>>
>> https://gerrit-review.googlesource.com/Documentation/config-labels.html#label_copyAllScoresIfNoCodeChange
>>
>> I would like to propose we change this setting to true.
>>
>> The downside is someone could radically change the content of their
>> commit message that you've +1'd. However the maintainer still gets a
>> chance to pull someone up on this if they think someone has pulled a
>> swift one.
>>
>> If there are some repositories that would like to maintain the status
>> quo, this could be done at the top level, so that all repositories
>> inherit the new default, but would allow for individual projects to
>> override the setting if they desired.
>>
>> Cheers,
>>
>> Joel
>
> Jumping on the bandwagon here: +1 from me!
>
> Andrew
