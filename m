Return-Path: <dja@axtens.net>
Received: from mail-pf0-x236.google.com (mail-pf0-x236.google.com
 [IPv6:2607:f8b0:400e:c00::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DE65E1A06C1
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2016 10:44:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=WkdmapTY; 
 dkim-atps=neutral
Received: by mail-pf0-x236.google.com with SMTP id 65so70497120pff.2
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 15:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:user-agent:date:message-id
 :mime-version:content-type:content-transfer-encoding;
 bh=I+ihdl+xRsAuoJnqJc36nOQBcAvxfvDuKvx7OpiJIcc=;
 b=WkdmapTYMcP5rakH2MhbhTRH4cGqAupbQJZ6tXDWV1yPB3o82/0RXWcwmNSzqb+mzu
 Y2EBHOkA8xAOmSTAdOK4bJ9ya+EyWjSeqgm/Zu8cDuNg38j7YHS+e/+jAwKEPsHH6MLh
 HeQvkk5Y9145vir7HawP92KtDJ3s+ne5M5SAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type
 :content-transfer-encoding;
 bh=I+ihdl+xRsAuoJnqJc36nOQBcAvxfvDuKvx7OpiJIcc=;
 b=MOR22fh4Uc1XVsbeFxGdpA5ckQhvqUNncTnlzlEBHm/B34ksbAgIM6d3BHC5GoeBeR
 LQ15mp0CKfIjdjtb38/7oPGyaIQLsitZEMu5RJyhvaToQmVbIYc107D05CDzhltgqSrc
 U5sX8MR0GCthDxFrYiqjlcb7LKWDRZQbV5uA1xLXRxsoMfatexoBsmThn/eDV+2yDcvp
 3IHhKOZcbSuDP2tdNGt7GEH2220ATxv/Kd0dBVzDMeRkrEPWKNInyCFayNWXy31kNdOd
 5om2dVbupGyYjgsWxv4rAuivNSwUDyffy4xUW3S3IU/Ar+a/hj1bfRWoQqtouGSWoFyX
 eH8A==
X-Gm-Message-State: ALoCoQkHPVFri10HrBOvHILDlHeaqmGAd1PnYolgglnusP9PR2zmZOhTURHd0L1KByJity6otmgpOXYtk5wvHAqDA3MbeMjvjA==
X-Received: by 10.98.1.203 with SMTP id 194mr38977271pfb.10.1452642288083;
 Tue, 12 Jan 2016 15:44:48 -0800 (PST)
Received: from localhost ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id n2sm30509630pfj.16.2016.01.12.15.44.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2016 15:44:47 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Cyril Bur <cyrilbur@gmail.com>, Chris Austen <austenc@us.ibm.com>,
 openbmc@lists.ozlabs.org
Subject: Re: Automated test migration
In-Reply-To: <20160113102954.6df6e334@camb691>
References: <201601122309.u0CN9SAg005900@d01av04.pok.ibm.com>
 <20160113102954.6df6e334@camb691>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Wed, 13 Jan 2016 10:44:44 +1100
Message-ID: <87k2ne5pn7.fsf@gamma.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jan 2016 23:44:51 -0000

Hi Chris,

I agree with Cyril: a couple of hours would be plenty to make huge
inroads into the things we identified. I think we've also tended to pick
on style issues because they are the first things we see.

Another reason I think it's worth pursuing at least a little bit of
cleanup is that as we do more things in the open, and as (hopefully) a
community forms around OpenBMC, people are going to care more about this
stuff being done right. Now is a good time to practise - we get better
at it and we get better at estimating how long it will take and
factoring that into our estimates.

Regards,
Daniel

Cyril Bur <cyrilbur@gmail.com> writes:

> On Tue, 12 Jan 2016 23:09:22 +0000
> "Chris Austen" <austenc@us.ibm.com> wrote:
>
>>  I've known for a while that we would eventually move the automated test=
 suites from https://github.com/mkumatag/openbmc-automation to https://gith=
ub.com/openbmc/openbmc-test-automation.=C2=A0 That day came yesterday.=C2=
=A0 Manjuanth and I have adhered to code review principals making sure that=
 we never merged without the others review.=C2=A0 However I will admit the =
commit message and the amount of commits per pull request was not my top pr=
iority.=C2=A0 To be honest just getting to the state where dev and test wer=
e developing code in the same sprint was good enough, all other things be d=
amned.=C2=A0 Now I see there are a lot of review comments aimed at the styl=
e of committing.=C2=A0=20
>>=20
>
> Hi Chris,
>
> I agree with you.
>
>> So now we are at a junction.=C2=A0 Should I ask Manjuanth to stop test a=
utomation development to work on squashing logical commits or should I keep=
 him working on automating the code we are developing.=C2=A0 I certainly un=
derstand the need for a git history that tells the story.=C2=A0 It also mak=
es sense to read commit best practices as those listed by Stewart and Patri=
ck and become better developers for it.
>>=20
>
> Becoming better developers is always a good thing no?
>
>> I ask is there anything that would put a hold on merging the pull reques=
t as is?=C2=A0 I do need a response from those with comments as you are the=
 ones that put the time and effort in to reviewing it in the first place.=
=C2=A0=20
>>=20
>
> I think it would be best not to merge the series as is. I'm willing to le=
t a
> lot slide for tests because yay tests and if Manjuanth can address the bi=
ggest
> issues that would be fantastic!
>
> Highest on my list of big problems with the series is that it appears
> duplicated, I'm not even sure how that could have happened. Other issues =
are:
> The need for squashed patches.
>  - Fixes to patches in the same series
>  - Having a patch to add tests and then a subsequent one to add more
>  - Multiple readme patches
>  - Adding and then removing files within the same series.
>
> Even just that, running a few git commands to make the series easier to f=
ollow
> would be 80% of the way to making it perfect and tests > perfection.
>
> Other things which wouldn't be much work would be typo issues and commit
> messages.
>
> The overall content of the patches looks like something we can live with =
for
> the sake of having tests and if making this series Linux kernel level per=
fect
> comes at the cost of more tests then I definitely vote for doing the easy=
 80%.
>
> Regards,
>
> Cyril
>>=20
>>=20
>> Chris Austen
>> POWER Systems Enablement Manager=20
>> (512) 286-5184 (T/L: 363-5184)
>>=20
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
