Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x233.google.com (mail-ua0-x233.google.com
 [IPv6:2607:f8b0:400c:c08::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3slYGF3nLlzDvJ2
 for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2016 11:08:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=GxdBJ95d; 
 dkim-atps=neutral
Received: by mail-ua0-x233.google.com with SMTP id v7so7092773uaa.0
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 18:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=e3905/7w0mD3oPQIfyfUD2rlDJd/GN80IHA+zKOyCBg=;
 b=GxdBJ95dKFbCH4De2snRCXkHGO4vZXM9ENE4y+fiPwiKyFaMJyNOTU+E3L5+FMkCT3
 TGrhq6u7NJLDMZAlwG1BDk+3gJirTDw65MA0OY8FQwICkTyJN7lN+WQipkXTbCHhnt3f
 6E9jQFtAva3sIy1T/r2tnkniz2tPfl/tXfHar+IrmXIRi31Y/gdt/VH/8PRKubTT9r6M
 FwqwBtR0i3jtJxSU7XullMm9ZZuBKJPjuvi5FqRVMB3FJtvwaTDt3nbxKsUrEs0tREpw
 iIy17qieTX7uKxN3m//KppNPctyM5GXm3J9DHqBPIsM7isgV7VBvIuVtfBTJUEfW7rM7
 uWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=e3905/7w0mD3oPQIfyfUD2rlDJd/GN80IHA+zKOyCBg=;
 b=TC2TI8h5a9yJ1pcXsF6ZslmD0XHCwGkk6LqWGcXYU9Me+rDn9xxy22Vmp7r8NyqS4E
 aPpeFrnhuPY9iiPccN/+ipEmwyF50/D3YZckA5+zyV33wN0TBbG1x2pKCIzFlHoqmvfa
 NPanSxGWDMUHsSx4cSoieo6hfi82zU7lDRgZR68a+hTgTmtGJQrYFecNipESvNZEuxv6
 ATq3WXedXyjbcONn5AWSucJb7xZwtxwXhUeTIzgv8Ci0sdNIufapYQMQZLqTRrYh43ql
 jpELW3w5vY0wSUtX3CRGIEGY42CiA1l0IFwnF6jGASpTu9+Ad91+iaAjSNgOecwnuksi
 y3yg==
X-Gm-Message-State: AA6/9RmiFCs7La9E/F8LvNHYi/yCOue6xADSWPaikmsZLJSnMg9FF+G01djYXbc4CqxlWZZSvUU3mSR+K8BEdA==
X-Received: by 10.176.81.56 with SMTP id e53mr1724180uaa.160.1475197682988;
 Thu, 29 Sep 2016 18:08:02 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Thu, 29 Sep 2016 18:07:42 -0700 (PDT)
In-Reply-To: <CALLMt=rbR1usfKPt9G8kdUa2RaqRaaVEG3rV62wSBjaM59qi6Q@mail.gmail.com>
References: <CACPK8XfQPDg0H_aNKmZOje7pPDRE9sJsD-epqAB8uW2X6SrrDg@mail.gmail.com>
 <CALLMt=rbR1usfKPt9G8kdUa2RaqRaaVEG3rV62wSBjaM59qi6Q@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 30 Sep 2016 10:37:42 +0930
X-Google-Sender-Auth: AxUu4ei6zYmlxaloksF83rJ9QnM
Message-ID: <CACPK8Xcn=s3NAnVNOYBXwHrnfYPT7xicH-TTXTb50TJU6OHHrA@mail.gmail.com>
Subject: Re: openpower.xyz updates
To: Andrew Geissler <geissonator@gmail.com>
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
X-List-Received-Date: Fri, 30 Sep 2016 01:08:06 -0000

On Wed, Sep 28, 2016 at 10:08 PM, Andrew Geissler <geissonator@gmail.com> wrote:
> Hey Joel, late yesterday afternoon Patrick reported that the gerrit CI
> jobs were not triggering.  I took a look and found that our job that
> does ID validation (which triggers on patch set creation) was still
> working fine but the follow up job that would trigger on the
> "Ok-To-Test" comment was no longer triggering.

I noticed that many of the gerrit reviews I have pending do not have
the OOT or Verified checked. Is the system still having issues?

> I've seen this a few times and it's usually always incompatibilities
> between the gerrit and git plugins and/or the jenkins version.  Since
> it was blocking all dev work and we're getting near the sprint end I
> jumped on and just had to downlevel the gerrit and git plugins by one
> level to get things working again.
>
> Specifically, I had to downgrade our gerrit plugin to 2.21.1 and our
> git client plugin to 1.19.7

Thanks for letting me know.

Do you have a plan for fixing the issue so we can run up to date
versions of the gerrit plugins?

Cheers,

Joel

>
> Andrew
>
> On Mon, Sep 26, 2016 at 6:07 AM, Joel Stanley <joel@jms.id.au> wrote:
>> Today I performed some upgrades on openpower.xyz:
>>
>>  - Upgraded from Ubuntu 14.04 LTS to 16.04 LTS
>>  - Moved from the one-year free TLS certificate to LetsEncrypt
>>  - Updated Jenkins from 10 month old version to the latest (2.7.4)
>>
>> Things appear to be working okay. Please let me know if you notice any
>> breakages.
>>
>> Cheers,
>>
>> Joel
