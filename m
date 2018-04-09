Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:400c:c09::230; helo=mail-wm0-x230.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BGVNDTpo"; 
 dkim-atps=neutral
Received: from mail-wm0-x230.google.com (mail-wm0-x230.google.com
 [IPv6:2a00:1450:400c:c09::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Klfq1XvHzDqy8
 for <openbmc@lists.ozlabs.org>; Tue, 10 Apr 2018 08:42:10 +1000 (AEST)
Received: by mail-wm0-x230.google.com with SMTP id f125so19601655wme.4
 for <openbmc@lists.ozlabs.org>; Mon, 09 Apr 2018 15:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ydqz1fxG0XjOm2Tokd5ZdHmc9edwNJGm1ZdbL70V6M=;
 b=BGVNDTpoDRV8J6wLr+OsClC2O6lK5hGrT9YRv/+0H7ge6WCzMVk5wEEy8AlT7wmAIw
 v6mz4Pojfizzo/9D+XKJImFk4P5dQ3CcuGIQi3fQ8caT1SUMnUM+By9Lq4Smsgg4IIhw
 vuwjoQ8mS9RAg4rzRemJJQIKmqDXt5a5DQRbV2Nf8ICV+hgsql6S7rZXYV0LYvrONCyL
 7kZNMHU2sqhpoJ9HJMsRYd1ki1XNY3766obwUG8eKYNrWj+P+Pg87eSy+07hawcPW9zH
 8f1dOLd5fHYnQ7sG/UiB+6BVrOw1WbcHzRcHKBvhgBZcIFjFQwzIh7f1Lj2+DQCskILC
 CB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ydqz1fxG0XjOm2Tokd5ZdHmc9edwNJGm1ZdbL70V6M=;
 b=g7CrpeS3+9cGZuPgFdCrXTpbalG2l7hbEEg/8RA3Pq95crHacwD6ZBY5vdn/DhjUjg
 qt0q6rTjPKKJLICoCa+lGftlqxY9kqpAy10xg6xcnZXwCyS0peTUnr3zHTkA1n6G+aPB
 +yGQr/A5ymEhPB7E/X1Jbu0XLj5zYGG65n0XSwvBv1vu4zgb7I842DxaotrIg3wf4pxr
 CqZ6++22y32vyLZV5rGmMYs1zlF2IBppZ70d4kgNOwba+OgaVfo1CuIUUvlJD0v9ja2r
 nodK1E4fg8GKF3V4mcTApuW8mk6xTiBxaMrMOfwCJ0sZkrYr2WM6hB3B73x83MUC+do4
 UMXA==
X-Gm-Message-State: ALQs6tB9luAfhNq75YxLttYiRgvIs1b38+NJcqVFwZ9jayT+5hwzRaO3
 X75xOBxd50XnP5DWA2Gs2h9Ufya9z9hUo6AkG5yKzQ==
X-Google-Smtp-Source: AIpwx4+NMKGLo5DfB2vkN5pFfmTIZggR7ptB6Ew2kmboNMnUht+mdrpS332jlgpaa7k7kwZj/xaoLkfCjMY+jZW/cmY=
X-Received: by 10.28.122.3 with SMTP id v3mr31843wmc.81.1523313727711; Mon, 09
 Apr 2018 15:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <C664861D-B057-42CD-ADF1-B493E5324C79@fuzziesquirrel.com>
 <CAJoAoZ==uqjn1zKyqhF=dFPurzY+W_jrN2CXbBcXx3AKf+6ong@mail.gmail.com>
 <1523237500.4169453.1330941672.4E3BB08C@webmail.messagingengine.com>
In-Reply-To: <1523237500.4169453.1330941672.4E3BB08C@webmail.messagingengine.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Mon, 09 Apr 2018 22:41:57 +0000
Message-ID: <CAJoAoZnavbs2B5MHArVa0Uqgu4kL+8o_SGyw4asJH8WqbOg3Uw@mail.gmail.com>
Subject: Re: Maintainers and the CLA
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, geissonator@yahoo.com,
 gkeishin@in.ibm.com, 
 joel@jms.id.au, swanman@us.ibm.com, ed.tanous@intel.com, 
 vernon.mauery@linux.intel.com, jk@ozlabs.org, gmills@us.ibm.com, 
 spinler@us.ibm.com, tomjoseph@in.ibm.com, anoo@linux.vnet.ibm.com, 
 dkodihal@in.ibm.com, msbarth@linux.ibm.com, venture@google.com, 
 "guptam.qdt" <guptam.qdt@qualcommdatacenter.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="089e082ff9ac9fc6ad0569721d53"
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
X-List-Received-Date: Mon, 09 Apr 2018 22:42:12 -0000

--089e082ff9ac9fc6ad0569721d53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

AndrewJ was nice enough to merge that today.  I'm hoping that if any of us
encounters a cache miss & notices the CLA has changed, that person can be
kind enough to update the file in that directory. :)

On Sun, Apr 8, 2018 at 6:31 PM Andrew Jeffery <andrew@aj.id.au> wrote:

> On Thu, 5 Apr 2018, at 06:06, Emily Shaffer wrote:
> > On Wed, Apr 4, 2018 at 12:15 PM Brad Bishop <bradleyb@fuzziesquirrel.co=
m
> >
> > wrote:
> >
> > > If you are in the to: list you have code-review +2 authority
> > > on one or more OpenBMC project repositories (i.e. you are a
> > > project maintainer).
> > >
> > > If you don=E2=80=99t think you are a maintainer, or don=E2=80=99t kno=
w what
> > > projects you maintain, please reply and we will get that fixed
> > > up.
> > >
> > > As you probably all know by now, the OpenBMC project has moved
> > > to The Linux Foundation and under the new project charter
> > > contributors must execute one of the OpenBMC CLAs.
> > >
> > > I=E2=80=99ve put together a guide:
> > >
> > > https://gerrit.openbmc-project.xyz/#/c/9933/
> > >
> > > (please review it and provide feedback like anything else)
> > > to help you ensure you are complying to the conditions
> > > outlined in the charter, until such a time that we can have
> > > a more automated verification process.
> > >
> >
> > In the meantime while we're waiting for the automated process, I
> suggested
> > to Brad that we might be able to add a sorted/searchable plaintext list
> of
> > CLA signers somewhere like openbmc-tools repo; I figure that even
> manually
> > updating it based on cache miss (contributor isn't on the list) or Brad
> > pinging when the CLA repo gets updated may still beat putting the onus =
on
> > maintainers to look through all the disparate CLAs every time someone
> posts
> > a changelist.  I'd be happy to put up the first take of this if there's
> no
> > dissent.  (Brad suggested that we should make sure _not_ to include ema=
il
> > addresses, in order to avoid spam; that's fine with me since most
> > contributors use their full name along with their commits.)
> >
>
> Emily has sent a pull-req for a list and a maintenance tool for inclusion
> in openbmc-tools:
>
> https://github.com/openbmc/openbmc-tools/pull/16
>
> Brad: If you're happy with a hosting a complete list of CLA'ed names
> there, I'll merge it.
>
> Andrew
>

--089e082ff9ac9fc6ad0569721d53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">AndrewJ was nice enough to merge that today.=C2=A0 I&#39;m=
 hoping that if any of us encounters a cache miss &amp; notices the CLA has=
 changed, that person can be kind enough to update the file in that directo=
ry. :)</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sun, Apr 8, =
2018 at 6:31 PM Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au">andre=
w@aj.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, =
5 Apr 2018, at 06:06, Emily Shaffer wrote:<br>
&gt; On Wed, Apr 4, 2018 at 12:15 PM Brad Bishop &lt;<a href=3D"mailto:brad=
leyb@fuzziesquirrel.com" target=3D"_blank">bradleyb@fuzziesquirrel.com</a>&=
gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt; &gt; If you are in the to: list you have code-review +2 authority<br>
&gt; &gt; on one or more OpenBMC project repositories (i.e. you are a<br>
&gt; &gt; project maintainer).<br>
&gt; &gt;<br>
&gt; &gt; If you don=E2=80=99t think you are a maintainer, or don=E2=80=99t=
 know what<br>
&gt; &gt; projects you maintain, please reply and we will get that fixed<br=
>
&gt; &gt; up.<br>
&gt; &gt;<br>
&gt; &gt; As you probably all know by now, the OpenBMC project has moved<br=
>
&gt; &gt; to The Linux Foundation and under the new project charter<br>
&gt; &gt; contributors must execute one of the OpenBMC CLAs.<br>
&gt; &gt;<br>
&gt; &gt; I=E2=80=99ve put together a guide:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://gerrit.openbmc-project.xyz/#/c/9933/" rel=3D"n=
oreferrer" target=3D"_blank">https://gerrit.openbmc-project.xyz/#/c/9933/</=
a><br>
&gt; &gt;<br>
&gt; &gt; (please review it and provide feedback like anything else)<br>
&gt; &gt; to help you ensure you are complying to the conditions<br>
&gt; &gt; outlined in the charter, until such a time that we can have<br>
&gt; &gt; a more automated verification process.<br>
&gt; &gt;<br>
&gt;<br>
&gt; In the meantime while we&#39;re waiting for the automated process, I s=
uggested<br>
&gt; to Brad that we might be able to add a sorted/searchable plaintext lis=
t of<br>
&gt; CLA signers somewhere like openbmc-tools repo; I figure that even manu=
ally<br>
&gt; updating it based on cache miss (contributor isn&#39;t on the list) or=
 Brad<br>
&gt; pinging when the CLA repo gets updated may still beat putting the onus=
 on<br>
&gt; maintainers to look through all the disparate CLAs every time someone =
posts<br>
&gt; a changelist.=C2=A0 I&#39;d be happy to put up the first take of this =
if there&#39;s no<br>
&gt; dissent.=C2=A0 (Brad suggested that we should make sure _not_ to inclu=
de email<br>
&gt; addresses, in order to avoid spam; that&#39;s fine with me since most<=
br>
&gt; contributors use their full name along with their commits.)<br>
&gt;<br>
<br>
Emily has sent a pull-req for a list and a maintenance tool for inclusion i=
n openbmc-tools:<br>
<br>
<a href=3D"https://github.com/openbmc/openbmc-tools/pull/16" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/openbmc/openbmc-tools/pull/16</a>=
<br>
<br>
Brad: If you&#39;re happy with a hosting a complete list of CLA&#39;ed name=
s there, I&#39;ll merge it.<br>
<br>
Andrew<br>
</blockquote></div>

--089e082ff9ac9fc6ad0569721d53--
