Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::229; helo=mail-it0-x229.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tB+F8exI"; 
 dkim-atps=neutral
Received: from mail-it0-x229.google.com (mail-it0-x229.google.com
 [IPv6:2607:f8b0:4001:c0b::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40FtM65SMNzF24T
 for <openbmc@lists.ozlabs.org>; Wed,  4 Apr 2018 01:30:05 +1000 (AEST)
Received: by mail-it0-x229.google.com with SMTP id 142-v6so23836888itl.5
 for <openbmc@lists.ozlabs.org>; Tue, 03 Apr 2018 08:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Ogump+i8fPhFyOYYsBUFAy5Q/uuQf1wsIO5h8dWh07A=;
 b=tB+F8exINQaCnNvyW/KLKU9BvM037gMOQeQbWLF7EESogqnbsPJTYVAWzML4ISN/As
 YX8QuGAwhYKt2aodgztLAjNppvVWvL0mSlOdVoXWUzNutlnIurJVLwCzH49Lfwlc7KwZ
 4dofovDRGHwcKzguhSLIBtUivD7UrXydxKld5kR7kVcEJX/Rev+0dRPIKzDp9CfZxT0G
 VY0M6JuJs7dj8Yg5Rckl5rg3DZmPUAywWsU7zUri+NgS2OeAcFDC+MyedttA1fbHJMmT
 st/YxldT2ADSss2WX2pQ8flPlx86xBipLfNO3CKpgAqjxmWXJWCnGfazD76BKYS2WJ9j
 +Nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Ogump+i8fPhFyOYYsBUFAy5Q/uuQf1wsIO5h8dWh07A=;
 b=k+LH7xqvIJdRRKN3yV5PR45jJR04wxaUiUd6zb4YeIVZdDkfzc1Nr4rZnDLXe9Ex/C
 fjYOzDgbr50e8gvyjMRce0/WAriWvZyg8XXmNc65fUIVo/3Hruye3034kGZP+VCbAjm3
 OWhGr/jTJT48TECG3PbPMCuLJZIx3K9T0QYIn1HV5qnZxxIgPlx4hQPh9iTafOSYUDdM
 J/qYDhH2BBWkkHI1GV/S2YYug8tQvvSP95N9DpGIgzDkw7ZD4Lx1BG+2ww5cV/AcsCQi
 QhWd9QyNYoiuBI4nsm8FkoeR3dGRnRajkg7SCKPL31lqTHhtMTGTc5BVMdud02lB/5/f
 dgUA==
X-Gm-Message-State: AElRT7EkrJIfGWIQOiCx9cnfwQQUORHnfwvvKSh7Ca2hwFAli4dnN7GY
 ++UvTRCUAGjF7fDI9K1mU8X+tYWMf2ipg7aLEUA=
X-Google-Smtp-Source: AIpwx4/vfxvnxSqtcSKbYbhxTUCPhwuX6xC2H1NxzAihPmh2MZ/t2AsrNrM5auV/dGti0RIYfIbt7fMi1/SWiJoCizM=
X-Received: by 2002:a24:45e5:: with SMTP id
 c98-v6mr5668403itd.128.1522769402854; 
 Tue, 03 Apr 2018 08:30:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.11.159 with HTTP; Tue, 3 Apr 2018 08:30:02 -0700 (PDT)
In-Reply-To: <CACPK8XcFXZb1yyjsQpY8Qb=Yxrst8c4BYPtA2VBNea_bHU5VLA@mail.gmail.com>
References: <CALLMt=rhu44zQUK3rv4vzCCzLJ7ehevQ-UQB8ydzdG0AHCvQSw@mail.gmail.com>
 <CACPK8XcFXZb1yyjsQpY8Qb=Yxrst8c4BYPtA2VBNea_bHU5VLA@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 3 Apr 2018 10:30:02 -0500
Message-ID: <CALLMt=qWz4eJYN+BzpO1L7ihhvQA=RPQxsKG4AQpyyEB=sk0eg@mail.gmail.com>
Subject: Re: Migration to new gerrit server is coming
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Tue, 03 Apr 2018 15:30:13 -0000

On Mon, Apr 2, 2018 at 5:46 PM, Joel Stanley <joel@jms.id.au> wrote:
> On 29 March 2018 at 06:25, Andrew Geissler <geissonator@gmail.com> wrote:
>> Greetings,
>>
>> We've gotten ourselves a nice big server to run our gerrit instance
>> on.  The virtual machine we're currently running in is going EOL
>> within the next few months so I've been slowly working on a
>> transition.  The migration should be pretty painless.  At some point
>> I'll take down the existing gerrit, migrate the data from it to our
>> new instance, and move the domain name over to the new server.
>>
>> I've got a test instance going now and would appreciate some poking
>> around for anything obviously wrong.  It's running the latest stable
>> gerrit, so we'll be getting an upgrade in this process. I synch'd over
>> the data from the production gerrit this morning.
>>
>> https://test-gerrit.openbmc-project.xyz
>
> Thanks Andrew!
>
> I had a poke around and it looks good. Much snappier than the old instance.

Thanks for taking a look!

>
> Do we have plans to use the gerrit.openbmc.org domain instead?

In order to reduce what's changing with this first migration, I'll
keep the old name but yes, Brad got me in touch with someone from the
Linux Foundation and long term we'll be moving to something like
gerrit.openbmc.org.

>
> Cheers,
>
> Joel

FYI everyone - The migration is tentatively planned for this weekend.
