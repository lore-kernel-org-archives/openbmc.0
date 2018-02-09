Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::242; helo=mail-qt0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uDDaStTA"; 
 dkim-atps=neutral
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zd3kz2NCRzDqZ7
 for <openbmc@lists.ozlabs.org>; Fri,  9 Feb 2018 16:38:35 +1100 (AEDT)
Received: by mail-qt0-x242.google.com with SMTP id u6so8793096qtg.13
 for <openbmc@lists.ozlabs.org>; Thu, 08 Feb 2018 21:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=4w7lJv2mFHXQmhZ84EjjRpEBDiY57MBeAkLlmk/hZZA=;
 b=uDDaStTA+aejZCv+R8cpoYuGx+ov2+U4/+AY8pkkzxK2vI7pbl/y7QO0Lz17IQZv9b
 WuiPejpbc+rXJjsePL2vUHPCuuQyMEsi/J3LcGO4sOg9G8z2MKhwjPvLJLGc0GPQFQVL
 UKAVgerdlkXm5/zWA59hUcz/v31FiOh99/n0xcEbQIHyQZhQtiZ39FCvKLJ2rM/RGQDb
 L3NOJPdBWsA7K91xU9mAj5vM1MSlZJWw2S9r/ZEUH39kev7tW82DN3pM0JJkqTdbO5DK
 +8EPGN2z150p+78OygyJAT2dY9W1cf45kOvgrUJZOrS7ce7v5r3NYWUHRblIMEkKhJFE
 HEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=4w7lJv2mFHXQmhZ84EjjRpEBDiY57MBeAkLlmk/hZZA=;
 b=tzkVQb6Kv1qb05KzQwAfsJeTxRX6eA0tMegEYuHT+nBeMi6PDyGYo6qHjvCn9NeQJF
 MkpgNb5ieb1SpW3bojq/C16ZNuySnuVJAGFQV4Zg2cOeFNX3SocC7SYCurx++JBaU+F0
 Z8dUMAc4g7Vi7jpdwgfHLQ4txr7Qnodo1GGTGbeAMuSXLdXhOu2pCzpbqTt5fN6hokyX
 8MEien0ccwABb3lKQyzfROYdUrkWZObZJ8jVVQQfzCyU5LqBDA8Lc3vK6SUt/9pEYboX
 trZ6Tw5BfwoPCgRw3x9ERoYhPDi/nrdw0Ur1YdhBAOjooEGh8Wtxwlsu9USYcIukw9LS
 x9bg==
X-Gm-Message-State: APf1xPDUeznso6aRowAg+/LWlxTh6QUdi3QxecWwRj1XVQ79uqRZY+fp
 4rNvrwSfzY8HCKegSlHhVlVy1QZJmIsQ6LrUMNQ=
X-Google-Smtp-Source: AH8x225uMqSmq20GkZX/3Oc3aHl/oS+J8p5p8WTsa2LJcg8E3UgLeIn0mo4OqPlD062Hfdp7rUtclLeQEFq264DheHE=
X-Received: by 10.200.23.231 with SMTP id r36mr2631656qtk.314.1518154712157;
 Thu, 08 Feb 2018 21:38:32 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.81 with HTTP; Thu, 8 Feb 2018 21:38:11 -0800 (PST)
In-Reply-To: <fb0bc8c5-f0ca-4515-7f10-46c5af427622@ozlabs.org>
References: <20180209032048.27450-1-joel@jms.id.au>
 <fb0bc8c5-f0ca-4515-7f10-46c5af427622@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Feb 2018 16:08:11 +1030
X-Google-Sender-Auth: MBm6nUvMa4eixFhO58y7QZRc360
Message-ID: <CACPK8Xf=O4HHiUyk6y=o3qn3Vq=PzOJgn-Aj=G9mZfk617bzYQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] fsi: core: Depend on OF
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Feb 2018 05:38:36 -0000

On Fri, Feb 9, 2018 at 4:00 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Joel,
>
>> The recent changes to match FSI slaves and engines to device tree nodes
>> introduced a dependency on 'of_' functions. As all in-tree users of FSI
>> are ARM OF platforms, make the FSI core depend on OF.
>>
>> Fixes: 46d6856a33e67 ("fsi: Match fsi slaves and engines to available dt nodes")
>
> Definitely needed, thanks for that.
>
> Acked-by: Jeremy Kerr <jk@ozlabs.org>

Thanks! Applied to dev-4.13.

Cheers,

Joel
