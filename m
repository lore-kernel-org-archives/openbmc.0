Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3stH0M02d9zDskb
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 10:49:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=QFW9I4H1; 
 dkim-atps=neutral
Received: by mail-vk0-x241.google.com with SMTP id 192so227562vkl.2
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 16:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=nEcoVAmqXc18fzxoCspLRwiFil8Af5n2u0HdMItrF4c=;
 b=QFW9I4H1dw0uFjASDTiDYAXGK7/Qg5ikfDGAUzzNQGJjuiixTultVntnMNyobcJF5X
 p+L2CeRg0908bAlveD9E6iSNMUsH4abcF7z63A29RL84uf67Od/VM23BXeQdN7C2SHip
 iCd3/DBYTH6zw3SYA2foLPuVFFncU8T8sTIPczU2iVsH382rvVn4MSW65M6Ne+DapQ2i
 c5+9YVqdrDV4vbilYbCb2EAU2p0Ei6ww+/GDnuS0T6q6AlC+yAiL4bR4gpb1WoYTtOzO
 Pb1fAitWojJpVgXPx3xQ79kNu94tHtwNheS5xvQhcVLro+XcMdAtEGTtbSjKLUUwCezZ
 a+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=nEcoVAmqXc18fzxoCspLRwiFil8Af5n2u0HdMItrF4c=;
 b=ONoYu7vsl6rTyRdVsQ8et3nHwhAMfiS5KPc4vPY+Mp4lXbuDTTpndtWx99OclfTJ5h
 tAGB7XE+Fhppbtjnx5d8CGgvzxj2Bz293iu08NMZPfw/APQWWs0FHSYteWr/qqDlF1P6
 l0YRrLVt4JomSoAuM4HcLpqdQkngCau+IYQlNqPPce6oHG5mADVsqCqXqWaW7kitQtuJ
 rj1oIxO9AHVpCGNZ85Pk1c75qwAP8I8VORrphUfIUcuiyTr9iS/xPlyLeNEDLgzd/Cue
 L0//BBWzdkX/Ar+v37950F33kCaaRlx7Z/L0S8r3lJRPH9SREVngWfPhdk9lvWpu1Yve
 jiMA==
X-Gm-Message-State: AA6/9Rl9KDTM24tRHcPEtZ96qat0rVscNJRUliYjQKnuXN7pqnjbWaSklLX9rNDZVBt1ZUdvRnEz2d22XESErw==
X-Received: by 10.31.4.195 with SMTP id 186mr881794vke.82.1476143360943; Mon,
 10 Oct 2016 16:49:20 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Mon, 10 Oct 2016 16:49:00 -0700 (PDT)
In-Reply-To: <1476143058.16733.10.camel@aj.id.au>
References: <CACPK8XfQPDg0H_aNKmZOje7pPDRE9sJsD-epqAB8uW2X6SrrDg@mail.gmail.com>
 <CALLMt=rbR1usfKPt9G8kdUa2RaqRaaVEG3rV62wSBjaM59qi6Q@mail.gmail.com>
 <CACPK8Xcn=s3NAnVNOYBXwHrnfYPT7xicH-TTXTb50TJU6OHHrA@mail.gmail.com>
 <20160930013816.GC7390@heinlein.lan>
 <CACPK8Xd3vP0E14-QSnpKxcLYdnaf=eqZb3hvfm26QCEZCA3aiA@mail.gmail.com>
 <20160930131252.GD7390@heinlein.lan>
 <CALLMt=o-pdSefwGK9rSyoW1+6UzMspzkvQmSnZJrz9h3G89W5w@mail.gmail.com>
 <1476143058.16733.10.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 11 Oct 2016 10:49:00 +1100
X-Google-Sender-Auth: 8Nt0dKe4YTll6FSda4z-Aivs5Vw
Message-ID: <CACPK8XcTWswLZx_HmymWbtC7h3prLS-zUmiF1LfpQ+9XjsmNjA@mail.gmail.com>
Subject: Re: openpower.xyz updates
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Andrew Geissler <geissonator@gmail.com>,
 Patrick Williams <patrick@stwcx.xyz>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Chris Smart <chris@distroguy.com>
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
X-List-Received-Date: Mon, 10 Oct 2016 23:49:23 -0000

On Tue, Oct 11, 2016 at 10:44 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Mon, 2016-10-10 at 11:09 -0500, Andrew Geissler wrote:
>> I noticed our gerrit trigger job to verify userid's was broken again
>> this morning.  Looks like the trouble plugin (Git Client Plugin) was
>> upgraded again to the latest version.  Anyone out there know why/who
>> did it?  I'm going to put us back to 1.19.7 per my earlier comments.
>
> Joel and Chris Smart were looking at this yesterday. A job broke:
>
> https://openpower.xyz/job/openpower-op-build/184/console
>
> According to Chris it broke because of:
>
> https://bugs.eclipse.org/bugs/show_bug.cgi?id=428039
>
>     15:58 < csmart> joel, basically release() was replaced with close()
>     and so any plugin that uses git needs to be updated

Yep.

Andrew G, do you have a bug report for the issue you're having?

We need to find a solution that lets us stay up to date with fixes from Jenkins.

Cheers,

Joel

>
> Looks like we're stuck between a rock and a hard place.
>
> Cheers,
>
> Andrew
>
>>
>> There's no fix per-se for this, jenkins is always a bit hit or miss
>> with it's latest LTS version working with the latest plugins.  Best
>> thing we can do is when we schedule our next jenkins LTS upgrade, to
>> try all the latest plugins again.
>>
>> Andrew
>>
>> On Fri, Sep 30, 2016 at 8:12 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
>> >
>> > On Fri, Sep 30, 2016 at 11:16:08AM +0930, Joel Stanley wrote:
>> > >
>> > > Okay. Do we plan to test the individual projects as part of an
>> > > openbmc/openbmc build in the future?
>> > >
>> > Yes.  https://github.com/openbmc/openbmc/issues/382
>> >
>> > --
>> > Patrick Williams
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
