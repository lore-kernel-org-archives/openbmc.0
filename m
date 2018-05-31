Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c0d::230; helo=mail-qt0-x230.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Slrf8n6K"; 
 dkim-atps=neutral
Received: from mail-qt0-x230.google.com (mail-qt0-x230.google.com
 [IPv6:2607:f8b0:400d:c0d::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xkRN0NY8zDrZD
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jun 2018 09:38:04 +1000 (AEST)
Received: by mail-qt0-x230.google.com with SMTP id h5-v6so22032136qtm.13
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 16:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MF+hwh/HikChp72XKCAvXfbsciGSTyL+ZvhKtY1N19s=;
 b=Slrf8n6KOsmYeLqbdQFcRnGc+SCjiQSeRicddDXrEHkeoZ4q0tIc/z6iMd3Psd1kSM
 QFV1lqAkLh9FHecTh7xwx1QdxEAn8BdwvT5nVVXJAAYUW35vpjeGVn9f/rGARbI3P4Lv
 fSgvqGsA8tNZCfP8eOKIDR66ktQwcdHbpiomrO1PujHO2bna4eCFPiu/rJRXJSaSJPoO
 bdMJqMy8fdzS4afIpHRNkxZiMDPH2vtgt7F3K8VZ74xQDQwJTCiqLohdiwAmaqxtiZgq
 uYVHbmecRhbsuuNOZeWykO2ZwZbrj44KRHm61/3OGbvM2/n3JsDVMsdXlJg6N5q1cEHk
 uQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MF+hwh/HikChp72XKCAvXfbsciGSTyL+ZvhKtY1N19s=;
 b=jpOxeGLIxJyC+3ueAYYIdJFqX/qul1fEWv1TBjhzbUM3cQ+HglJ2RnIv96a7lwSXcb
 +ytCXpZhAphCSAvOQ3f1jhHH3Tj1JQ4PZ+SGb8BWXHnELbPK4Nk9tpPPhlaJIQJNihSq
 DPDVjTmva14KK6a4DU0JWy54vc8kiW52xTjXLipIVat7q4ca4vOjYuElhVy4mTGRE6X8
 k/Bbzena1iPMzNsl3Y+O//fEBDm0Q6Fq9GMqs+4QeHed5v96mw1IDAvwtpPPSj4VUGyJ
 RY3CZCW9/LJmJRhwkxc328CPsnmUaMCfHmL8DNqRfkijyu2lbbJZUChCtRu/0jdbdhq6
 rGdA==
X-Gm-Message-State: APt69E0geaWA059o+FrhZp9RLxqsWekcfh2Ni2jVAjg7JF3zsDSZRcPi
 sLspTTsF0ccYDZ/elxT0Ylt0PaiBmm8DgjdT/cX/9w==
X-Google-Smtp-Source: ADUXVKLPim5Qw1G71PH52eVg4RP/CNQLPHVqihJ98OYJ9093Ud73qKzg4MiNZ9mQhG3gm3Zmd8ld7+VxS0m/L6QAFAQ=
X-Received: by 2002:aed:3c7a:: with SMTP id
 u55-v6mr8485214qte.391.1527809881406; 
 Thu, 31 May 2018 16:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <1526953427.458876.1380098832.53C3F9C7@webmail.messagingengine.com>
In-Reply-To: <1526953427.458876.1380098832.53C3F9C7@webmail.messagingengine.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Thu, 31 May 2018 16:37:47 -0700
Message-ID: <CAJoAoZmd+RJepSkFE+VUapmrY_rYdftKX0LnSrjUXSqv_bGy2w@mail.gmail.com>
Subject: Re: obmc-gerrit: A tool for automagically adding reviewers to your
 patches
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com
Content-Type: multipart/alternative; boundary="00000000000044d0d2056d88f5e3"
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
X-List-Received-Date: Thu, 31 May 2018 23:38:09 -0000

--00000000000044d0d2056d88f5e3
Content-Type: text/plain; charset="UTF-8"

Excellent! Thanks Andrew!!!!!

On Mon, May 21, 2018 at 6:45 PM Andrew Jeffery <andrew@aj.id.au> wrote:

> Hello,
>
> I've created a helper script that automatically adds reviewers to your
> patches when you push them to Gerrit:
>
>
> https://github.com/openbmc/openbmc-tools/tree/master/amboar/obmc-scripts/maintainers
>
> Why do you care? I'm hoping that it reduces the time it takes for your
> patches to get attention *and* relieves you from the tedium of adding the
> reviewers yourself.
>
> The script is a wrapper for `git push` that also parses the MAINTAINERS
> file in the root of the repository. I recently sent a flood of patches
> adding a MAINTAINERS file to each repo maintained by the OpenBMC
> organisation, so obmc-gerrit should be generally useful in the very near
> future.
>
> I'm always open to feedback, so make sure to reply here or ping me on IRC
> if you have opinions.
>
> Cheers,
>
> Andrew
>

--00000000000044d0d2056d88f5e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Excellent! Thanks Andrew!!!!!</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr">On Mon, May 21, 2018 at 6:45 PM Andrew Jeffery &lt=
;<a href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Hello,<br>
<br>
I&#39;ve created a helper script that automatically adds reviewers to your =
patches when you push them to Gerrit:<br>
<br>
<a href=3D"https://github.com/openbmc/openbmc-tools/tree/master/amboar/obmc=
-scripts/maintainers" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/openbmc/openbmc-tools/tree/master/amboar/obmc-scripts/maintainers</a><br=
>
<br>
Why do you care? I&#39;m hoping that it reduces the time it takes for your =
patches to get attention *and* relieves you from the tedium of adding the r=
eviewers yourself.<br>
<br>
The script is a wrapper for `git push` that also parses the MAINTAINERS fil=
e in the root of the repository. I recently sent a flood of patches adding =
a MAINTAINERS file to each repo maintained by the OpenBMC organisation, so =
obmc-gerrit should be generally useful in the very near future.<br>
<br>
I&#39;m always open to feedback, so make sure to reply here or ping me on I=
RC if you have opinions.<br>
<br>
Cheers,<br>
<br>
Andrew<br>
</blockquote></div>

--00000000000044d0d2056d88f5e3--
