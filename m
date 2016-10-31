Return-Path: <mine260309@gmail.com>
Received: from mail-qt0-x22b.google.com (mail-qt0-x22b.google.com
 [IPv6:2607:f8b0:400d:c0d::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t70CL43XkzDsrV
 for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2016 03:27:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=RYjtjC3w; 
 dkim-atps=neutral
Received: by mail-qt0-x22b.google.com with SMTP id p16so76571523qta.0
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=FBXiyBDcuaymZ5FHUF8XruZ2zsiux+eiHM5y/CmgbuI=;
 b=RYjtjC3wDICcYnAHfMY4Le+t0Gzn966czebmN8Fv4zSUU2L9aHs545z7B1a0NTdlav
 vNkTbKOAwJY931surSj9j8Rvb3hej/fr2jTSI3l3aZdGOmtZSBnOs3prrprxkkgJJVvK
 7uoCkupgkqUWOc4KH6YkwF71OqGI+oXIQpOkKdxWmaam4WE1ptPNyWe67vQhVmWAQHcK
 IpD50vaNn5XPIlja/EQO14c7bfW5dNCb54GpjNQEH70ZCqb/PQoRGdPCHxbMcUf+mroB
 HYOsFJhMBBPlJw2tpqK8T1o7L9DzuxfXs0INIu2C51EaQgTGmYw34fPBIG3a1A7DOEd5
 nDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=FBXiyBDcuaymZ5FHUF8XruZ2zsiux+eiHM5y/CmgbuI=;
 b=dg/10pwoaR6/lKAHEv9V0j2MeqZhWLM8Bj4h+WydBXgl4kz68qyovEzi2mQdtEr4oW
 KH50dN2qp+EomfbEHI6cs49Dw9nYDhSN5E5Fp3JqCoC1gT6sW7HPrpwYjAI9XtyKbA1P
 z14K7R3JvA7OcBc1vLVvZaIOktvljy9d2FTPEaVqZIYLWsEy3dGk63fhGqFmXCNGY7y4
 jV2LD9XdrftSWUcJ/iYzPQgveS5uWKmrMopSW9FUHUgqQMnaCoGCwneHoY4iMqF0Ztre
 HmCtKp1TSeRuK6j7CR89llogjUov4EIaasKNLxuPzXlIL3+6Mm4UX7UIOM236SJ2BkI5
 O0oQ==
X-Gm-Message-State: ABUngveV/GsZqtkwiNKHktWFUvefNf8l+ITfSP6D/Rt+fXJCH1tdfeoTq7kuYNP06GXhLsCWKe3I0pgFoJb2Zw==
X-Received: by 10.200.49.41 with SMTP id g38mr2225410qtb.99.1477931276107;
 Mon, 31 Oct 2016 09:27:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.146.15 with HTTP; Mon, 31 Oct 2016 09:27:55 -0700 (PDT)
In-Reply-To: <CACPK8XfurNsb5t0dahhCXp3bZ7QykudtYMhxWnexUudpsF-Dhw@mail.gmail.com>
References: <CACPK8XeEiMremm9nbKRMxr3G6GmR4OTHjb1DHOxLjPqQ3WNBkg@mail.gmail.com>
 <20161028125249.esdyeqbkpk6nedc2@asimov>
 <CACPK8XfurNsb5t0dahhCXp3bZ7QykudtYMhxWnexUudpsF-Dhw@mail.gmail.com>
From: Mine <mine260309@gmail.com>
Date: Tue, 1 Nov 2016 00:27:55 +0800
Message-ID: <CAARXrtm0woMfHH=tk7aOqpMC2+ddnokCy-Ay=5agOdAB8mNT3w@mail.gmail.com>
Subject: Re: Gerrit emails
To: Joel Stanley <joel@jms.id.au>
Cc: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 31 Oct 2016 16:27:59 -0000

postfix with send-only config +1, I use it on my RaspberryPi :)

--
BRs,
Lei YU

On Sun, Oct 30, 2016 at 5:18 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Fri, Oct 28, 2016 at 11:22 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
>> On Thu, Oct 27, 2016 at 05:06:18PM +1030, Joel Stanley wrote:
>>> Hi Patrick,
>>>
>>> I think you mentioned that Gerrit emails broke a while back. A few
>>> people have asked about it recently, so I was wondering if you could
>>> update us on how that is going?
>>>
>>> Do you need help?
>>
>> I haven't had a chance to work on it.  Plan to get it fixed next week.
>>
>> If you know a good / easy to install localhost SMTP agent you can point
>> me at, that would be great.  I need to get that installed and update the
>> TXT record on openbmc-project.xyz to enable the server to send emails
>> again.
>
> I use ssmtp on my laptop to send from Gmail. It's in Debian and just
> needs a few options in a file in /etc to use.
>
> Cheers,
>
> Joel
>
>>
>> The mail host I am using for my personal email is what I relayed the
>> Gerrit emails into and they limit sending to 200 per day, so we end up
>> getting rate limited pretty quick with how many people have subscribed
>> to all changes.
>>
>> --
>> Patrick Williams
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
