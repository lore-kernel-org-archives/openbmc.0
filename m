Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3srJ7q3b4HzDrVW
 for <openbmc@lists.ozlabs.org>; Sat,  8 Oct 2016 05:33:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=R6z4BN8i; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id h186so3887146oia.3
 for <openbmc@lists.ozlabs.org>; Fri, 07 Oct 2016 11:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=mypidhDHA4www3+MhJsqmp4CQsxTieitPde2Vd0u1hQ=;
 b=R6z4BN8iUM4qcL92LZy6wvEFiVW2bcAfA6RV4XAAMrQggzocVcVgJN4leJFL6KQako
 4PATikR835arV/Kx3wlQjrmxv0SSaVc9Cn3KE37kFrU/934YqU2/AzCzg7tweuEff0QD
 KtgEQRihMuHiQe+X4Be3pNBkC8ONvFig1oOeNVF0II9UrqqLvpef+eUyXpt+9un9zB4q
 JKxu7YLHYpgTMa8eFjTYcL04muWBzgYTCrYnNnHCZ9TjyhnX5SgUZEgJfeDYsyH89usA
 Soo78hM0WPfP8vHPgFGcI65tJ/czvRnGkNRjH8SHX7U7zg/ZhwGHP5esOo6/zY8LZXVR
 7K5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=mypidhDHA4www3+MhJsqmp4CQsxTieitPde2Vd0u1hQ=;
 b=isHBjpaq8OJDNhcG64EzTYNFAWsAOjxBEEMcI0ivKxLG1HnqlFVXk8O6uw/brpVEKL
 4KuNHU0hxPbTzucbXIM+wDg+NTBvreiO21wNgDFBjRnKW9C8JWfCQ0g3K0YQQqxtHBL+
 yohIe7pqyR5ZwLi1t4ZiuE32Of8vqplQyucBVvuHQNSbmoV1wlBE3LXpU23GerrjMO9d
 T+GLdTIyJ2HIC3y530rE4V+ZSjjXTMcKN7FhrAwigt0/NWUN3Rm+peHBTu2bi1H9kPmV
 Fn4F0LvV2pDbPrvBmEFGfoWRFxD8QnB2Cz0/yCcSnbCCzmQrVU9LQLSN9v7Y2J/cy/0B
 M+2g==
X-Gm-Message-State: AA6/9RnoTrPT+F55J9IM7KYyF3jDVBcW02900IDZ/nMeCBXgVGfcUsIrq0yhA5dZjk2trnMp96m4FTcwBrgOfQ==
X-Received: by 10.202.61.65 with SMTP id k62mr15888886oia.26.1475865237612;
 Fri, 07 Oct 2016 11:33:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.220.132 with HTTP; Fri, 7 Oct 2016 11:33:56 -0700 (PDT)
In-Reply-To: <2ef17303-606f-f570-d0e7-f577f1aee5f9@ozlabs.org>
References: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475700868-75737-15-git-send-email-christopher.lee.bostic@gmail.com>
 <6e8e9ea9-b728-8deb-8859-73904682b7cd@ozlabs.org>
 <CAA0LjjV9EUp8L6tpzJbPcmycMVZWvfdBs6jWhuHW-fMfWAK97w@mail.gmail.com>
 <2ef17303-606f-f570-d0e7-f577f1aee5f9@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Fri, 7 Oct 2016 13:33:56 -0500
Message-ID: <CAA0LjjVvU7Q7P67toQdUjVPPB4gu9aSUUyquB+e3zoc7EOBrdA@mail.gmail.com>
Subject: Re: [PATCH linux 14/15] drivers/fsi: Rename slave to cfam
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
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
X-List-Received-Date: Fri, 07 Oct 2016 18:34:00 -0000

On Thu, Oct 6, 2016 at 8:22 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>>>> Suggested changes to the patch set so far as provided by Jeremy Kerr.
>>>> Rename slave to cfam to distinguish between the slave engine and its
>>>> containing cfam.
>>>
>>> I'm still not 100% on that. As is my understanding, a (hardware) CFAM
>>> contains multiple slaves, and that not what `struct fsi_slave`
>>> represents (it's a single slave).
>>
>> In redundant configurations yes there are two slaves.  However, any
>> controlling device driver would only ever use one of them.  A redundant
>> system with its own fsi device driver would be controlling the other slave.
>>
>> I still maintain that there is bound to be confusion with slave->read( )
>> etc... which are meant for accessing more than just the slave engine.
>> cfam->read makes it more clear I think that you are accessing some
>> range within the cfam, not just the slave engine.
>>
>> A cfam acts as a slave
>> in a general sense but it doesn't distinguish itself from the slave engine.
>
> Right, and that's where our confusion is coming from there.
>
> In my initial series, I've used `struct fsi_slave` to represent *just*
> the slave on the FSI bus, which is logically separated from the *slave
> engines*. In this case, a "slave" is a different logical unit from a
> "slave engine"; the latter being one of the actual functional units made
> available behind the slave.
>
> This separation is important, as each of the engines is what will be
> bound to a FSI device driver, whereas the slave itself will be managed
> by the core.
> So we have:
>
>   struct fsi_slave -> core slave logic, knows little about engines
>
>   struct fsi_device -> engine logic, to be bound to a driver
>
> (whereas a CFAM is slave + engines, right?)
>
> Nothing outside of the core will be doing slave->read; FSI engine
> drivers will be using the fsi_device API.

Hi Jeremy,

That makes sense.  I wasn't getting what you were thinking.  I'll
keep your 'struct fsi_slave' as is.   The previous note regarding
hardware workarounds, though, will possibly require some concept
of a separate 'struct cfam'.   That or some other construct to
deal in a common way with all the quirks related to a particular
cfam.  Can you make Chris Austen's call Tuesday morning
your time?  We can discuss that further.

>
>> I'm not sure what split out means in this case.  Git am applies each patch
>> in sequence so those warnings will be hit before any patches I add to reverse
>> something are applied.
>>
>> I know we had discussed last week about making it clear what changes
>> you had made versus mine.  As per discussion I left your changes as
>> is in the patch series, then made my recommended changes as the
>> next in the series.   A bit confusing on how to deal with checkpatch,
>> git am, ... in those circumstances.
>
> Yep, and if there are fixups to those patches, keep them separate from
> other changes, as I'll apply them directly to my tree.

So the plan is,  patches 01-12 your set.  patch 13 are my fixups to that.
Patches 14+ my content.

>
> From your follow-up email, it sounds like we want some identification of
> the slave HW implementation, to allow the core and drivers to work
> around any HW issues.
>
> Cheers,
>
>
> Jeremy
