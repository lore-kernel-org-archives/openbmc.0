Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:400c:c09::235; helo=mail-wm0-x235.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="B6re6oBW"; 
 dkim-atps=neutral
Received: from mail-wm0-x235.google.com (mail-wm0-x235.google.com
 [IPv6:2a00:1450:400c:c09::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Gd6C5wrQzF1qK
 for <openbmc@lists.ozlabs.org>; Thu,  5 Apr 2018 06:36:35 +1000 (AEST)
Received: by mail-wm0-x235.google.com with SMTP id x4so596048wmh.5
 for <openbmc@lists.ozlabs.org>; Wed, 04 Apr 2018 13:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qAXL59SiqrEeg1l1EL6bR3zz92VI8ACL34rpJLhZ/GE=;
 b=B6re6oBW6abiQ+GlyhOhSH/NcjPka8c02v1xQo8VqtOH8X5zoFxgAUqXIBUgCyd3AL
 JvK/+S9q4fnIOdOksA07zXGEFY5v4GrIClrlEYwuTQ5myKhTwYHS9/S2rnH0KAh6P/0L
 58hEFQMGZXpaeJL6I05sZp/G9bCI2PrytT1WFc+tHjRExcSyLELavwH9N8y22Tx12wrW
 8EGdbQtBzKjxjIfeH/Z3JOtnjXBqQj/y0YL9mVFuOJLiyAvCTwbksbSfwHggneS1V+0d
 Ls8iSWrjtPSOTdBNeJ2/bujuOb98+VFOeqGKgBweGc+kkc8MnV3Gzz9nZreFmqskxJgb
 Nyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qAXL59SiqrEeg1l1EL6bR3zz92VI8ACL34rpJLhZ/GE=;
 b=VwoeLsgKlCg5YV3buoGTqYX3V1K4mllAGtjJYahEgMNBVPWT0RFC1ZYx/BZU6vQ+/P
 UwyaB5dQ3Sq67hF/llukz432EDgWxa+QvSnLNBLdSEhrretaQevHY9HzJ9ooMHT1Mggl
 MB8qRKwamQwL9NRsIuueQHrCXeXpHmAvdgqV/ppvCzHD+y8D3dPw9IkQWXwDTlj5SwdO
 bN8mYaQ1zZFSqAPvNpzZIywYspMQO4Ql8BAMnI31D9Mh3RNI3qmpkm4DZIEpgYX1ox48
 5l3U6JjkFPDee/ZYqHHnDC9nQHM6hfia8Cn1H3GFf2vr0TKzQzbO3u+4y7YaD9Spn0eo
 43vQ==
X-Gm-Message-State: ALQs6tDpjDMZuCX3ssDNsx6gWBrj/qanohB6+t7XJilsvxnyceNn0Dm2
 +XOHtpY0VhTIP4nStbt9/Qk2Hc/MxZC8HuZ6sWuqAQ==
X-Google-Smtp-Source: AIpwx4+eH8X4jYhfgy2RqBVusF8kK+TktqNcihnsluQO6nSzbc8Jn0ydRphFzuWM2ReP6ky8Fpg5I/fjR25XhqzNLmY=
X-Received: by 10.28.64.3 with SMTP id n3mr289591wma.33.1522874190934; Wed, 04
 Apr 2018 13:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <C664861D-B057-42CD-ADF1-B493E5324C79@fuzziesquirrel.com>
In-Reply-To: <C664861D-B057-42CD-ADF1-B493E5324C79@fuzziesquirrel.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Wed, 04 Apr 2018 20:36:20 +0000
Message-ID: <CAJoAoZ==uqjn1zKyqhF=dFPurzY+W_jrN2CXbBcXx3AKf+6ong@mail.gmail.com>
Subject: Re: Maintainers and the CLA
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: geissonator@yahoo.com, gkeishin@in.ibm.com, joel@jms.id.au, 
 swanman@us.ibm.com, ed.tanous@intel.com, vernon.mauery@linux.intel.com, 
 jk@ozlabs.org, andrew@aj.id.au, gmills@us.ibm.com, spinler@us.ibm.com, 
 tomjoseph@in.ibm.com, anoo@linux.vnet.ibm.com, dkodihal@in.ibm.com, 
 msbarth@linux.ibm.com, venture@google.com, 
 "guptam.qdt" <guptam.qdt@qualcommdatacenter.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a114b05a230e5ab05690bc7a7"
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
X-List-Received-Date: Wed, 04 Apr 2018 20:36:37 -0000

--001a114b05a230e5ab05690bc7a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 4, 2018 at 12:15 PM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> If you are in the to: list you have code-review +2 authority
> on one or more OpenBMC project repositories (i.e. you are a
> project maintainer).
>
> If you don=E2=80=99t think you are a maintainer, or don=E2=80=99t know wh=
at
> projects you maintain, please reply and we will get that fixed
> up.
>
> As you probably all know by now, the OpenBMC project has moved
> to The Linux Foundation and under the new project charter
> contributors must execute one of the OpenBMC CLAs.
>
> I=E2=80=99ve put together a guide:
>
> https://gerrit.openbmc-project.xyz/#/c/9933/
>
> (please review it and provide feedback like anything else)
> to help you ensure you are complying to the conditions
> outlined in the charter, until such a time that we can have
> a more automated verification process.
>

In the meantime while we're waiting for the automated process, I suggested
to Brad that we might be able to add a sorted/searchable plaintext list of
CLA signers somewhere like openbmc-tools repo; I figure that even manually
updating it based on cache miss (contributor isn't on the list) or Brad
pinging when the CLA repo gets updated may still beat putting the onus on
maintainers to look through all the disparate CLAs every time someone posts
a changelist.  I'd be happy to put up the first take of this if there's no
dissent.  (Brad suggested that we should make sure _not_ to include email
addresses, in order to avoid spam; that's fine with me since most
contributors use their full name along with their commits.)


>
> -brad

--001a114b05a230e5ab05690bc7a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed=
, Apr 4, 2018 at 12:15 PM Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzzie=
squirrel.com">bradleyb@fuzziesquirrel.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">If you are in the to: list you have code-review +2 au=
thority<br>
on one or more OpenBMC project repositories (i.e. you are a<br>
project maintainer).<br>
<br>
If you don=E2=80=99t think you are a maintainer, or don=E2=80=99t know what=
<br>
projects you maintain, please reply and we will get that fixed<br>
up.<br>
<br>
As you probably all know by now, the OpenBMC project has moved<br>
to The Linux Foundation and under the new project charter<br>
contributors must execute one of the OpenBMC CLAs.<br>
<br>
I=E2=80=99ve put together a guide:<br>
<br>
<a href=3D"https://gerrit.openbmc-project.xyz/#/c/9933/" rel=3D"noreferrer"=
 target=3D"_blank">https://gerrit.openbmc-project.xyz/#/c/9933/</a><br>
<br>
(please review it and provide feedback like anything else)<br>
to help you ensure you are complying to the conditions<br>
outlined in the charter, until such a time that we can have<br>
a more automated verification process.<br></blockquote><div><br></div><div>=
In the meantime while we&#39;re waiting for the automated process, I sugges=
ted to Brad that we might be able to add a sorted/searchable plaintext list=
 of CLA signers somewhere like openbmc-tools repo; I figure that even manua=
lly updating it based on cache miss (contributor isn&#39;t on the list) or =
Brad pinging when the CLA repo gets updated may still beat putting the onus=
 on maintainers to look through all the disparate CLAs every time someone p=
osts a changelist.=C2=A0 I&#39;d be happy to put up the first take of this =
if there&#39;s no dissent.=C2=A0 (Brad suggested that we should make sure _=
not_ to include email addresses, in order to avoid spam; that&#39;s fine wi=
th me since most contributors use their full name along with their commits.=
)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
-brad</blockquote></div></div>

--001a114b05a230e5ab05690bc7a7--
