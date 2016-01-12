Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x22f.google.com (mail-pa0-x22f.google.com
 [IPv6:2607:f8b0:400e:c03::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C8F4C1A06B3
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2016 10:30:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=RQ2M5NtS; 
 dkim-atps=neutral
Received: by mail-pa0-x22f.google.com with SMTP id uo6so331016093pac.1
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 15:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:subject:message-id:in-reply-to:references:mime-version
 :content-type:content-transfer-encoding;
 bh=tXVDXzNGcU1cV4gL3UHMNMVDC8AwICWnL0zIOX6/yJ4=;
 b=RQ2M5NtS7ekiO64wXl34B5iwHO/cTmRb8dQZ8V5HKtmSu/SHZ3EUr9bq73W7Tp2QEK
 rdXPWVlRWwB6IbejioRtufL4bHyXJ/dytTA29I6u4/p9e0mIi+YrlXCd1fBPWIhanZXf
 kRpXmJq4nE8o7IA3UlWoRWxR+y6QtKc2j/7En2TsxchZtGyrMlaCjxPZX+N6rzUrRWUO
 aVE4D6mck7SbIE7Jxt0zGHcGFEjIgVjOU9fYgsa5sOXlcAGLe7dzLvKnJmKBVKzOB1Z7
 3iNh2sAWUjqxVMcWpfq9r/25AujYMz+Lw9NnKNBYA6RsqlicuAj+BOBCGEB1TW3N4HEO
 yidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:subject:message-id:in-reply-to
 :references:mime-version:content-type:content-transfer-encoding;
 bh=tXVDXzNGcU1cV4gL3UHMNMVDC8AwICWnL0zIOX6/yJ4=;
 b=dUTGs/V4/7AOH6rDvhsSQamtZ3lVy2AzpB8HvHmlkkNrDIAIexvz2u2mJ1vj6ktZK3
 NYpwQi4huntghhOZgolfvA+r38C/TvTpVyt8D2nB06z/jkugTvG7ziTYp8xx6rjuup3c
 Mk6ixwfhOsOP5SDGFRfkn67GixnLXvAJNMVrKEjvQbqY2vIobxndjVs1P7hcGedXt9Zi
 +rjsAUg5QvJfWdDs6sNKXhMyQfGOuqaCnwDC+FEUl0JNLrXZrqn5sM383XhkkylvWPBP
 wMWgstMh/YZnF1d0Ks/gIwT3IFZqv2O6ZTz7TclU8K+77KUDR7M2gVNCaDk84oUo2hlN
 oryw==
X-Gm-Message-State: ALoCoQlczuvY9qOOM1nwVrJamJVSZ3MOl/OcQ+E4TTjxvEJJx/KCriuuKxM9VAkNf9OZ4d3REu2nEofpyEYWSxENcvA5/PorjA==
X-Received: by 10.66.192.42 with SMTP id hd10mr189859752pac.111.1452641402918; 
 Tue, 12 Jan 2016 15:30:02 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id ud10sm195261373pab.27.2016.01.12.15.30.01
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 12 Jan 2016 15:30:02 -0800 (PST)
Date: Wed, 13 Jan 2016 10:29:54 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: "Chris Austen" <austenc@us.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: Automated test migration
Message-ID: <20160113102954.6df6e334@camb691>
In-Reply-To: <201601122309.u0CN9SAg005900@d01av04.pok.ibm.com>
References: <201601122309.u0CN9SAg005900@d01av04.pok.ibm.com>
X-Mailer: Claws Mail 3.13.1 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 12 Jan 2016 23:30:06 -0000

On Tue, 12 Jan 2016 23:09:22 +0000
"Chris Austen" <austenc@us.ibm.com> wrote:

>  I've known for a while that we would eventually move the automated test =
suites from https://github.com/mkumatag/openbmc-automation to https://githu=
b.com/openbmc/openbmc-test-automation.=C2=A0 That day came yesterday.=C2=A0=
 Manjuanth and I have adhered to code review principals making sure that we=
 never merged without the others review.=C2=A0 However I will admit the com=
mit message and the amount of commits per pull request was not my top prior=
ity.=C2=A0 To be honest just getting to the state where dev and test were d=
eveloping code in the same sprint was good enough, all other things be damn=
ed.=C2=A0 Now I see there are a lot of review comments aimed at the style o=
f committing.=C2=A0=20
>=20

Hi Chris,

I agree with you.

> So now we are at a junction.=C2=A0 Should I ask Manjuanth to stop test au=
tomation development to work on squashing logical commits or should I keep =
him working on automating the code we are developing.=C2=A0 I certainly und=
erstand the need for a git history that tells the story.=C2=A0 It also make=
s sense to read commit best practices as those listed by Stewart and Patric=
k and become better developers for it.
>=20

Becoming better developers is always a good thing no?

> I ask is there anything that would put a hold on merging the pull request=
 as is?=C2=A0 I do need a response from those with comments as you are the =
ones that put the time and effort in to reviewing it in the first place.=C2=
=A0=20
>=20

I think it would be best not to merge the series as is. I'm willing to let a
lot slide for tests because yay tests and if Manjuanth can address the bigg=
est
issues that would be fantastic!

Highest on my list of big problems with the series is that it appears
duplicated, I'm not even sure how that could have happened. Other issues ar=
e:
The need for squashed patches.
 - Fixes to patches in the same series
 - Having a patch to add tests and then a subsequent one to add more
 - Multiple readme patches
 - Adding and then removing files within the same series.

Even just that, running a few git commands to make the series easier to fol=
low
would be 80% of the way to making it perfect and tests > perfection.

Other things which wouldn't be much work would be typo issues and commit
messages.

The overall content of the patches looks like something we can live with for
the sake of having tests and if making this series Linux kernel level perfe=
ct
comes at the cost of more tests then I definitely vote for doing the easy 8=
0%.

Regards,

Cyril
>=20
>=20
> Chris Austen
> POWER Systems Enablement Manager=20
> (512) 286-5184 (T/L: 363-5184)
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
