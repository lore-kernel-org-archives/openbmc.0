Return-Path: <yuenn@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::229; helo=mail-it0-x229.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Upy9++qb"; 
 dkim-atps=neutral
Received: from mail-it0-x229.google.com (mail-it0-x229.google.com
 [IPv6:2607:f8b0:4001:c0b::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40ndFD5mx0zF2Ff
 for <openbmc@lists.ozlabs.org>; Sat, 19 May 2018 05:16:15 +1000 (AEST)
Received: by mail-it0-x229.google.com with SMTP id q4-v6so14461858ite.3
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 12:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=EXODgq7jOZAfyvvOnHDgr7Fxocgj/D30tIAQMFwe6wM=;
 b=Upy9++qbf2xTOv//COkH/YB9jHHWNsJE5bOcoZV127L6f/lqoQgEtcjIyooYOXb7nH
 hkvDpQgNTkWH8DZLtfB7J20HYESJM6Nlp0hiXWUcC05IllnfMvEUQvz6VGB7spsxnEL2
 eDnBL3uV0p5gevrrTj0m6NT92CmgVXHpxIZGI/hx+Dp2es9U3PiZrDDY3ZOp0htMKMZ5
 i/XLHM31vvqiA1Mow8o5FclRWKLRKhFzvvQful5tVFG7DZQ+MQH7NLvmGF3YqL2WMNiq
 RLdZ/gkiiJJMjIQjHUxXD8akR2ZSQk31i1x1kmgyDsxiiwEvYIf/6EGEgKwcZulW+hOz
 XWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=EXODgq7jOZAfyvvOnHDgr7Fxocgj/D30tIAQMFwe6wM=;
 b=YxBUWG3bxZVwCRPlFBaFaVCg7VAkr+fiRueL9Ue8HTjPZF4QMz3wdvjBUn/P3cIk4z
 15sGBJq6qTjvTuzzjh5sqYhSqzyibV6cisHt1TyTQemZnFDG+ClTZTwmcHZoE9wvYNeQ
 kDkTA8UJDdS8PpZej11fbUv+osG4fzeZzDzcgtiItWuXSz/mFlnJnuLVIJRfFiBkkBEB
 b7qBlUFpXb9snGaG73/Z9Kz5zgNDnxBQPXBV2/C1JAG9XnfovJyZunDDMEP4d8kpOaWR
 zQOYmnvK0GIhmp3x5P3ggyhJBY2RbLdpGvy1D1FnOpgF6/mpk3xNHQSSroqVfxOB6ksU
 IjVw==
X-Gm-Message-State: ALKqPwe0bcvNLi8ZLxnJ5N9FvYg4KlAGwaxtTNhY3++hwIhOINXj4s4m
 nBpwbMTQubUAUfk/K0F+x79kzaAudeOD3Uv0V9SsOA==
X-Google-Smtp-Source: AB8JxZopzznWEv3YeDpCtMpZsQDHr31XvXccfUnvhpfSxJxtaMV/zC1qrtEQUUrCYDMkpfxRc1pGl4pZ+WMfgY4O+qw=
X-Received: by 2002:a24:94c9:: with SMTP id
 j192-v6mr8450625ite.153.1526670973171; 
 Fri, 18 May 2018 12:16:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5e:c90c:0:0:0:0:0 with HTTP; Fri, 18 May 2018 12:15:32
 -0700 (PDT)
In-Reply-To: <78bfadf4-1493-d9e9-58c0-9d1163f99f76@gmail.com>
References: <CADfYTpFfoEe2SvvBAsjL-UAPocC02Z49o-rTDxA7JwA9OagHnw@mail.gmail.com>
 <78bfadf4-1493-d9e9-58c0-9d1163f99f76@gmail.com>
From: Nancy Yuen <yuenn@google.com>
Date: Fri, 18 May 2018 12:15:32 -0700
Message-ID: <CADfYTpHhmE-TGMyyCLQBnJ45-9mHu4qawoDC-Ed1fCN7NQxwcQ@mail.gmail.com>
Subject: Re: OpenBMC Fix-It
To: krtaylor <kurt.r.taylor@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000000c2895056c7fc926"
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
X-List-Received-Date: Fri, 18 May 2018 19:16:17 -0000

--0000000000000c2895056c7fc926
Content-Type: text/plain; charset="UTF-8"

Next week I will post a shared doc where everyone can submit ideas for
things to work on.

----------
Nancy

On Thu, May 10, 2018 at 6:59 AM, krtaylor <kurt.r.taylor@gmail.com> wrote:

> On 5/8/18 2:28 PM, Nancy Yuen wrote:
>
> Please join my team for an OpenBMC  community "fix-it" event in June!
>
> My team is devoting the week of 6/11/-15 to a Google OpenBMC "fix it" as
> part of a larger fix-it initiative. OpenBMC is a large part of our project
> so I'd like to spend part of the week on a fix-it on OpenBMC.
>
> I propose to have the fix it on Tues and Wed 6/12 & 6/13.  We could set up
> an IRC channel for the fix it where everyone participating would hang out
> for the day.  We could pick one or two areas to
>
> I'd say let's just use the #openbmc channel, it may pull in others as you
> move along.
>
> focus on for those days, put together a list of things to "fix" in those
> areas ahead of time.  On the day, we all tackle things on the list (or
> something not on the list), discuss over IRC and do code reviews.
> Inevitably, people have meetings or things they can't get out of, but if
> you can be available for most of the day, that would be enough!
>
> Anyone interested in participating?
>
> I'm in.
>
> Thanks for organizing this Nancy!
>
> Kurt Taylor (krtaylor)
>

--0000000000000c2895056c7fc926
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Next week I will post a shared doc where everyone can subm=
it ideas for things to work on.</div><div class=3D"gmail_extra"><br clear=
=3D"all"><div><div class=3D"gmail_signature" data-smartmail=3D"gmail_signat=
ure">----------<br>Nancy</div></div>
<br><div class=3D"gmail_quote">On Thu, May 10, 2018 at 6:59 AM, krtaylor <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:kurt.r.taylor@gmail.com" target=3D"_b=
lank">kurt.r.taylor@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF"><span class=3D"gmail-">
    On 5/8/18 2:28 PM, Nancy Yuen wrote:<br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><font size=3D"4">Please join my team for an OpenBMC=C2=A0
            community &quot;fix-it&quot; event in June!</font></div>
        <div><font size=3D"4"><br>
          </font></div>
        <font size=3D"4">My team is devoting the week of 6/11/-15 to a
          Google OpenBMC &quot;fix it&quot; as part of a larger fix-it init=
iative.
          OpenBMC is a large part of our project so I&#39;d like to spend
          part of the week on a fix-it on OpenBMC.</font>
        <div><font size=3D"4"><br>
          </font></div>
        <div><font size=3D"4">I propose to have the fix it on Tues and Wed
            6/12 &amp; 6/13.=C2=A0 We could set up an IRC channel for the f=
ix
            it where everyone participating would hang out for the day.=C2=
=A0
            We could pick one or two areas to </font></div>
      </div>
    </blockquote></span>
    I&#39;d say let&#39;s just use the #openbmc channel, it may pull in oth=
ers
    as you move along.
    <span class=3D"gmail-"><blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><font size=3D"4">focus on for those days, put together a list
            of things to &quot;fix&quot; in those areas ahead of time.=C2=
=A0 On the
            day, we all tackle things on the list (or something not on
            the list), discuss over IRC and do code reviews.=C2=A0
            Inevitably, people have meetings or things they can&#39;t get
            out of, but if you can be available for most of the day,
            that would be enough!</font></div>
        <div><font size=3D"4"><br>
          </font></div>
        <div><font size=3D"4">Anyone interested in participating?</font></d=
iv>
      </div>
    </blockquote>
    </span><p>I&#39;m in.<br>
    </p>
    <p>Thanks for organizing this Nancy!=C2=A0</p>
    <p>Kurt Taylor (krtaylor)<br>
    </p>
  </div>

</blockquote></div><br></div>

--0000000000000c2895056c7fc926--
