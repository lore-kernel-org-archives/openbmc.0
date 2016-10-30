Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x229.google.com (mail-oi0-x229.google.com
 [IPv6:2607:f8b0:4003:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6BkT4VxlzDvSS
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 20:18:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=eyYbaztZ; 
 dkim-atps=neutral
Received: by mail-oi0-x229.google.com with SMTP id i127so174019041oia.2
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 02:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=DuKcj0F9LhI3W6z9xrPnSviqG5QngPEGksSX6olbD1o=;
 b=eyYbaztZATjiChDO3iA5a9XLdu/64NImUhoBH3E5v/tRnxpaJTXsIoOqhVfHiqWQuK
 hntKm4mS4SjR0dP9pGvs2YpHLGfxXHk3O0cWFGS9JUAQZtOqWZJo1/vEOVbF2rHW//5o
 rUVDk1V39X+qiDoaGgMGsyYtC0e7lwpchgD43gP62TQvAEEQpwUCr9skE04yUyyRPGJk
 6x/iKnfzjOKp+zhdKfkCCwBzXZUtcFZv1pOP9hVLHtPhuWtvdof6qMHWA4v94HuaLf4O
 9GR8Kynu13u5Kq9PbGvio/0ys30Nb5sEoxDIyfBMwiRRlTZ01s8cVgY8PQtov5AnIGmZ
 Vpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=DuKcj0F9LhI3W6z9xrPnSviqG5QngPEGksSX6olbD1o=;
 b=H5LRUqFxMuQkacs4vJT8kujL8fdN9Re7AEDpd1geVEBdv3NV/DrSJFtkAiKOgNowKx
 hdpgrO7ke5X3iTwX8p/ChlcwQjePy0tHU1H/UuArdWH7BGRAG/Aw8Tf4foKepzo+NeSP
 Arzn7mxK47njZYidY01kKj6NQ0gzVGc6n+/1rh6+fDym7ZrSk27idfg4O9UzIgipWsRH
 QtcTVSmku4Xn3tIKyqXChYX3+PTqW/Amg3AVU313smP+ELray1qU6af8ZlvrBFS6nn8Y
 QSJvwRcZaOaodfd+ae4aleCODeIA1cLeeRd2svm8SO1ly7Kf/LnYAAXFs7A7Y6+bp/IS
 yuUg==
X-Gm-Message-State: ABUngveOmlc7hUJzOACCfZyv6dllfT07MNPUS7xXakbivO5sBcGrnhQJd8qcSQwqCcaeVyNzxn3ad080nVOEhQ==
X-Received: by 10.157.15.154 with SMTP id d26mr16496643otd.85.1477819118427;
 Sun, 30 Oct 2016 02:18:38 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Sun, 30 Oct 2016 02:18:18 -0700 (PDT)
In-Reply-To: <20161028125249.esdyeqbkpk6nedc2@asimov>
References: <CACPK8XeEiMremm9nbKRMxr3G6GmR4OTHjb1DHOxLjPqQ3WNBkg@mail.gmail.com>
 <20161028125249.esdyeqbkpk6nedc2@asimov>
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 30 Oct 2016 19:48:18 +1030
X-Google-Sender-Auth: YRUsqR8DWC3YowyJJD9V90zZuKA
Message-ID: <CACPK8XfurNsb5t0dahhCXp3bZ7QykudtYMhxWnexUudpsF-Dhw@mail.gmail.com>
Subject: Re: Gerrit emails
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sun, 30 Oct 2016 09:18:44 -0000

On Fri, Oct 28, 2016 at 11:22 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
> On Thu, Oct 27, 2016 at 05:06:18PM +1030, Joel Stanley wrote:
>> Hi Patrick,
>>
>> I think you mentioned that Gerrit emails broke a while back. A few
>> people have asked about it recently, so I was wondering if you could
>> update us on how that is going?
>>
>> Do you need help?
>
> I haven't had a chance to work on it.  Plan to get it fixed next week.
>
> If you know a good / easy to install localhost SMTP agent you can point
> me at, that would be great.  I need to get that installed and update the
> TXT record on openbmc-project.xyz to enable the server to send emails
> again.

I use ssmtp on my laptop to send from Gmail. It's in Debian and just
needs a few options in a file in /etc to use.

Cheers,

Joel

>
> The mail host I am using for my personal email is what I relayed the
> Gerrit emails into and they limit sending to 200 per day, so we end up
> getting rate limited pretty quick with how many people have subscribed
> to all changes.
>
> --
> Patrick Williams
