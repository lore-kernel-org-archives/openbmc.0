Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x233.google.com (mail-it0-x233.google.com
 [IPv6:2607:f8b0:4001:c0b::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3stKXL566CzDrSF
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 12:43:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=vHeIXO22; 
 dkim-atps=neutral
Received: by mail-it0-x233.google.com with SMTP id e203so31199476itc.0
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 18:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=pXZ/0r0+9TSHlYpC+8k4Xd2ACx3/qz6AAxLI+kCL270=;
 b=vHeIXO2236ydPJkpilIm/unKGMXWerxrP6Q0gM7FE/mOrpp/UTI2YK+14FMqEk/rFi
 HqVpx9ZEkGYcuOiRpwjhIlXnfUYwnfwoERYuLysQr6Q3N8HHRDLl1WNvKIUSXMeguL9I
 cuSokIjdSNL+xutfcl9ZR87fYeU9Uep1HAx6/Fds6IOBHkPKBGbp2huUIoyMMewenDNq
 TmAx91oJ/zE90J+0OMKOtcxrEUtjhYeDipiWc2MIeQZJVnG16QuO5Q0uiQ8Ah3exx0UM
 e2EL425Xh0yTJhwuGr8jHMv2rO9LhB9TPFxoqDogiJDwxiuRHLsDSS2kotnoARqEBr+W
 2OuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=pXZ/0r0+9TSHlYpC+8k4Xd2ACx3/qz6AAxLI+kCL270=;
 b=a923aCd/hdkksaNic+tDWLT04x7KwM4Rb1f04updJW1biEkcyoYLU6smPESZf0IFNR
 Y1a6+/4VKvSsz7foeuhHafM3JlsC5Rhk+NW422fRX9rZ3C4jPYDVD4xlVB4HCTxoJBEn
 9V483S+Xzy3NaUJtom4q4if8XV5AzCMLis83PSP143mAfJew1aqUUpVoXSOMfJnJsS5t
 NoOQUgUs/YfSA9AvW7I2xWHXsBsMqVGv3OW2iGCbLVDppJu8cn3LiGK2ZX5umZazga46
 5Detit5w2D9+BLw6/vYf3K6qk1/CUO26xDNC85iJIxDd2Z+XQ+N4Ad/NmLCdrgQ+HNWz
 vRHA==
X-Gm-Message-State: AA6/9RkHFe2IpUpmCoPhVhD9UNmqXblY0tUSSPsQB2K719GFaqQg58gqjZ5S7sZ29GbUJ+nrE+ZauZFS8dZfRw==
X-Received: by 10.36.92.196 with SMTP id q187mr2654511itb.33.1476150224454;
 Mon, 10 Oct 2016 18:43:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.148.194 with HTTP; Mon, 10 Oct 2016 18:43:43 -0700 (PDT)
In-Reply-To: <20161011013601.GA19444@distroguy.com>
References: <CACPK8XfQPDg0H_aNKmZOje7pPDRE9sJsD-epqAB8uW2X6SrrDg@mail.gmail.com>
 <CALLMt=rbR1usfKPt9G8kdUa2RaqRaaVEG3rV62wSBjaM59qi6Q@mail.gmail.com>
 <CACPK8Xcn=s3NAnVNOYBXwHrnfYPT7xicH-TTXTb50TJU6OHHrA@mail.gmail.com>
 <20160930013816.GC7390@heinlein.lan>
 <CACPK8Xd3vP0E14-QSnpKxcLYdnaf=eqZb3hvfm26QCEZCA3aiA@mail.gmail.com>
 <20160930131252.GD7390@heinlein.lan>
 <CALLMt=o-pdSefwGK9rSyoW1+6UzMspzkvQmSnZJrz9h3G89W5w@mail.gmail.com>
 <1476143058.16733.10.camel@aj.id.au> <20161011013601.GA19444@distroguy.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 10 Oct 2016 20:43:43 -0500
Message-ID: <CALLMt=rTC2rgPc-_rkdVwN=o688AsKg7WvefEBrSZE48GMzRqA@mail.gmail.com>
Subject: Re: openpower.xyz updates
To: Chris Smart <chris@distroguy.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Patrick Williams <patrick@stwcx.xyz>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Tue, 11 Oct 2016 01:43:47 -0000

On Mon, Oct 10, 2016 at 8:36 PM, Chris Smart <chris@distroguy.com> wrote:
> On Tue, Oct 11, 2016 at 10:14:18AM +1030, Andrew Jeffery wrote:
>>
>> On Mon, 2016-10-10 at 11:09 -0500, Andrew Geissler wrote:
>>>
>>> I noticed our gerrit trigger job to verify userid's was broken again
>>> this morning.  Looks like the trouble plugin (Git Client Plugin) was
>>> upgraded again to the latest version.  Anyone out there know why/who
>>> did it?  I'm going to put us back to 1.19.7 per my earlier comments.
>>
>>
>> Joel and Chris Smart were looking at this yesterday. A job broke:
>>
>> https://openpower.xyz/job/openpower-op-build/184/console
>>
>> According to Chris it broke because of:
>>
>> https://bugs.eclipse.org/bugs/show_bug.cgi?id=428039
>>
>>    15:58 < csmart> joel, basically release() was replaced with close()
>>    and so any plugin that uses git needs to be updated
>>
>> Looks like we're stuck between a rock and a hard place.
>>
>
> Yep, I updated the git client plugin because openpower build couldn't
> perform any git operations.
>
> I didn't expect that to affect any comms with other Jenkins instances
> though, that is strange. Why does the gerrit userid plugin rely on on
> git client? Do you have a log or backtrace? Might help to try and track
> it down.

Here's the fail, it's a weird one:
https://openpower.xyz/job/openbmc-userid-verify/795/console

07:05:18  > git rev-parse FETCH_HEAD^{commit} # timeout=10
07:05:18 FATAL: org.eclipse.jgit.revwalk.RevWalk.release()V
07:05:18 java.lang.NoSuchMethodError:
org.eclipse.jgit.revwalk.RevWalk.release()V
07:05:18 at com.sonyericsson.hudson.plugins.gerrit.trigger.hudsontrigger.GerritTriggerBuildChooser$1.invoke(GerritTriggerBuildChooser.java:185)
07:05:18 at com.sonyericsson.hudson.plugins.gerrit.trigger.hudsontrigger.GerritTriggerBuildChooser$1.invoke(GerritTriggerBuildChooser.java:166)
07:05:18 at org.jenkinsci.plugins.gitclient.AbstractGitAPIImpl.withRepository(AbstractGitAPIImpl.java:27)
07:05:18 at org.jenkinsci.plugins.gitclient.CliGitAPIImpl.withRepository(CliGitAPIImpl.java:64)
07:05:18 at com.sonyericsson.hudson.plugins.gerrit.trigger.hudsontrigger.GerritTriggerBuildChooser.getFirstParent(GerritTriggerBuildChooser.java:166)
...

No bug report on my part since I didn't think it was that big an
issue....I have been proven wrong.  I thing we have an imminent call,
lets touch base there and I'll get one open if needed.

>
> -c
>
>
>> Cheers,
>>
>> Andrew
>>
>>>
>>> There's no fix per-se for this, jenkins is always a bit hit or miss
>>> with it's latest LTS version working with the latest plugins.  Best
>>> thing we can do is when we schedule our next jenkins LTS upgrade, to
>>> try all the latest plugins again.
>>>
>>> Andrew
>>>
>>> On Fri, Sep 30, 2016 at 8:12 AM, Patrick Williams <patrick@stwcx.xyz>
>>> wrote:
>>> >
>>> > On Fri, Sep 30, 2016 at 11:16:08AM +0930, Joel Stanley wrote:
>>> > >
>>> > > Okay. Do we plan to test the individual projects as part of an
>>> > > openbmc/openbmc build in the future?
>>> > >
>>> > Yes.  https://github.com/openbmc/openbmc/issues/382
>>> >
>>> > --
>>> > Patrick Williams
>>> _______________________________________________
>>> openbmc mailing list
>>> openbmc@lists.ozlabs.org
>>> https://lists.ozlabs.org/listinfo/openbmc
>
>
>
