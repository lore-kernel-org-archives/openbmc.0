Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::241; helo=mail-oi1-x241.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KsFdV86I"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44CRtz63ynzDq62
 for <openbmc@lists.ozlabs.org>; Mon,  4 Mar 2019 15:31:55 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id t206so2834407oib.3
 for <openbmc@lists.ozlabs.org>; Sun, 03 Mar 2019 20:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=kN+FARBgdodsUatS9pyf+uqyZObxOdmvC2NEbut/CCI=;
 b=KsFdV86I4zbhgQTuH/I8HMabGx7/BTp3qHk0hbO6jGhUKR8/ra0NMRn8psl9UIdtww
 cB3vb5aAPOptmrji30AUz+eR1oXpi5JAXjSfp1DFK0QQqwRbOEWV2rNvCvoQs5+B/jY4
 bc/vLRpxwQ4iadh0X+/0qER3shFt9zFmirn58ecCE1BPoZgZm6y+NotFxEcUshIBw+zc
 g2TJ1gUTSFgouoFuETc4cI7hRTuEVAtA339kB0gJz3zf1A+lRm9W7vVVgp0FJXwwKC8f
 NMXlWeTTPy76l7Uq7ikyg1V2aaYPvxTIhIhgTl7QctfqfGuVFuabAHBU862BAyCuXuQ5
 qClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kN+FARBgdodsUatS9pyf+uqyZObxOdmvC2NEbut/CCI=;
 b=hzZzdLWvZYXTKgDty04fOJlifykxA2Pu1UQv57ChWiCh1qT8ea8wMK2cz8uoQo8gjs
 EMX3gkWgq583tZztAJcUJ9v9E7g+si58WS/Qy0QuziPD4Xr/A5LvlVVmF6lsnRKaVHcm
 Zu0fH1CAj4Z+k9QVsXKedopnttMqq8txZnDLl4qLxP+JXeo909iooTvmk2jl06BnYU0v
 IHikfVWDUYuFePq2GVkd1a/xwwFIbVsfOAu/ZDqt95lEbiusVvwdZj3bCqWZzgZ0RgHH
 qQe9HHXMxnts35X/3iyLC0z7HCsLfvfF1hCOxMLit/Hu+4lZh2b3E47D+BATjwy5y/oP
 xYpQ==
X-Gm-Message-State: AHQUAuY8Ebi9ysqj3Q/izAt72/ps5GVTA/feRcCLw8d2eV4kILcgq4UN
 oiRthAEvSvrFxK9UWsRbwoYXNyKi
X-Google-Smtp-Source: AHgI3IbqgdHH62y6PHvehIPrFAC4DgfoiHUw55c4ep/R0ZrwKX4Ae69bfCe4dg9OdLzkFEFQXVttTg==
X-Received: by 2002:aca:5785:: with SMTP id l127mr10195272oib.14.1551673911806; 
 Sun, 03 Mar 2019 20:31:51 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id m89sm2077185otc.7.2019.03.03.20.31.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Mar 2019 20:31:51 -0800 (PST)
Subject: Re: 2.7 Release Planning Guidelines - Features, Designs and Milestones
To: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <0f698442-7f23-4d4f-9e00-f5b77703e543@gmail.com>
 <3196f4ca-4d98-4374-8047-5bef11d3a736@www.fastmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <3b42a0d2-3325-e002-d8bd-a7dc3c460c73@gmail.com>
Date: Sun, 3 Mar 2019 22:31:49 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.2
MIME-Version: 1.0
In-Reply-To: <3196f4ca-4d98-4374-8047-5bef11d3a736@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 04 Mar 2019 04:31:56 -0000

On 3/3/19 5:16 PM, Andrew Jeffery wrote:
> 
> 
> On Sat, 2 Mar 2019, at 03:47, krtaylor wrote:
>> All,
>>
>> At the last release planning meeting we agreed to start enforcing the
>> design requirement for 2.7 release features. This gives the repo
>> maintainer the authority to not merge major contributions without
>> designs in place. Of course, the maintainer also has the discretion to
>> "grandfather" in work that was previously underway that had designs
>> socialized in IRC or email. I think having these designs in place will
>> fix a lot of the release notes concerns, as well as level-setting what
>> we're all working on.
> 
> What is the scope of these features? My gut instinct is it's something like
> "high-level capability that OpenBMC does not yet have" as opposed to
> "useful feature in existing platform-specific tool". Is there a description
> somewhere of where we're drawing the line? I guess my question can
> be rephrased as "what are we (explicitly) _not_ trying to control"?

We are a new open source project that has all the typical communication 
problems of teams that are not used to sharing what they are working on 
now having to. It can't wait until they are ready to drop a huge chunk 
of code. We are working toward breaking that cycle by starting early 
sharing what we are working on (features). Then we will get more detail 
(designs) and get needed feedback in the design reviews. When code 
starts dropping (incrementally), everyone knows about what is being 
delivered, and how the group intends on it functioning. This is about 
communication and cooperation, not control.
> 
>>
>> TLDR: if work has a feature issue created in github (tagged Release2.7),
>> it MUST to have a design template filled out in order to be merged.
>>
>> Second, we agreed to set a VERY aggressive schedule for having all
>> feature issue designs in place: *March 25th*  Obviously, that means that
>> release feature issues need to be completed before then.
>>
>> Third, we also agreed to establish checkpoints for delivery of features
>> so we can check the feature progress, seek community assistance, etc. We
>> will establish Design, Code1, Code2, Freeze and Release milestones. They
>> are mostly self-explanatory, with Code1 and Code2 being used for staging
>> dependent work for instance. They will be approximately 6 week intervals.
>>
>> Finally, I am asking for EVERYONE'S help in making sure what you are
>> working on falls into a openbmc/openbmc issue tagged Release2.7 (or
>> Release2.8 for long-running projects). If not, and it is not a quick
>> fix
>> or small enhancement, please let your release planning rep know and
>> help
>> them get the feature issue created ASAP. Check here:
>> https://github.com/openbmc/openbmc/issues?q=is%3Aopen+is%3Aissue+label%3ARelease2.7
>>
>> As always, I am available for any questions. Find me on IRC or come to a
>> release planning meeting and let's discuss.
> 
> I haven't been attending the release planning meetings; maybe I'm a bit
> under-informed/out of line so take this with a grain of salt. However:
> 
> This all seems like a top-down attempt to manage a large-ish open source
> project. Given everyone's diverse interest as a means to scratch their own
> itch, I feel like the kernel's approach is something that we should be
> modelling: Releases occur on a fixed cadence, and whether a feature makes
> it into a given release is largely dictated by whether the maintainer of a given
> subsystem feels its ready to go in rather than whether a particular label is

Exactly what we are doing. The label is for release intention.

> applied to a github issue. Having timed releases dictating included features
> rather than features happening to land in a given timed release leads to
> problems like serious slippage of release dates or merging of immature
> features simply to meet the promised deadline. Best for things just to go in
> when they are ready. If people need to ship the feature before it is integrated
> upstream then the responsibility and burden is on their own (probably
> internal) fork of the project. It's not something upstream should be saddled
> with.

Our release cycle is based on fixed dates, as are many other open source 
projects. Unlike product release cycles, we will not slip a date to 
finish a feature. If you miss the release train, you simply catch the 
next one.

> I'm not arguing against having designs or code freezes, but I am concerned
> about language like "Finally, I am asking for EVERYONE'S help in making
> sure what you are working on falls into a openbmc/openbmc issue tagged
> Release2.7". It has a distasteful dictatorial ring to it for an open source project,
> and to me it's a bit demotivating. Maybe that's not how it was intended?

If someone if working on a new feature that has not been added to 
github, then they need to talk to their release planning rep and get it 
entered, or just add it themselves. The last thing we need is to 
duplicate work. Again, this is about communication and cooperation, not 
control.

Thanks for your feedback,
Kurt (krtaylor)
