Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDDt43Jj3zDq72
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 21:16:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kzuSz3/Q"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id d72so1216955ybh.0
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 04:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=icM3KU4cwN/0V6HV3vzDuFOAfR0fgpmpRYZA4A3vz7Y=;
 b=kzuSz3/Qn+NV1lOuA9nIuJp4agw5XW5xOjyxTn6FbbIIqidb6cEpTN/18rTVsfXhZ/
 /5SnyOw1N2y6iD0dVHgZ4/IcBqGOnimN6o98CakCGBm+s2FOJAqkgv8JLc776xt7Pn4o
 LA6Z4jVtPnn/lZUGtnqH9+pJOdbvtM9mIxbVhuVHm8p6ttUoEuC6g0WTrDncJsH/ex8X
 lw8U35ZSQdgZqktX7NTvpWT559vFmaRvkQj5qKEWHSefOP2XU29lfgQQJWXR/Tz7NYiN
 +Q8/4QXkk4alb8k6SJ8BR0TNh0BXjA9bBdzmfLktzGJJG8J9D+/PMasXLwQIaQP9VkNB
 SBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=icM3KU4cwN/0V6HV3vzDuFOAfR0fgpmpRYZA4A3vz7Y=;
 b=ACr1rtcDAONGbO6IC0bhVRLjFxunu6VoOCUfqnrzvG1mwl6njX6HLr8D4OGJNdg9Wm
 xGxmntzdP70riVkP1B7296HC304KCzo5wFzsxJQvL8Uya2Ryu83SyDwbrJObHiI5tI3G
 d05GZKbGS9wE6C+ie1ybAR2dhMz57Qv369h6ybKNwBCDP6Pduh3tHIIZ+O9/X8yQxr+x
 A3XaILZZy34epQ9Ohos7E2odXIB66ZzZIBQ6OETnJy+hoqKyaol1RsNAGToL1ImtvExM
 fnTm03o9fLfyd5/12guqNxdeuTjUf5nA4LOsg5i9rDCHi2XHurUO71fEV2jv+X7v9c3R
 CWhw==
X-Gm-Message-State: AN3rC/40FXaDl0cKhxZ/CcZsSnX3jMK+8Jioe33idel0vHIgo5YuExzE
 aMCe0vKhNZBKG87wt1yUe5RBAoK+JtsU3Uw=
X-Received: by 10.37.33.193 with SMTP id h184mr3978053ybh.57.1493291800036;
 Thu, 27 Apr 2017 04:16:40 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 27 Apr 2017 04:16:38 -0700 (PDT)
Received: by 10.37.171.70 with HTTP; Thu, 27 Apr 2017 04:16:38 -0700 (PDT)
In-Reply-To: <1493281595.2083694.957888912.5A8D8515@webmail.messagingengine.com>
References: <20170427072015.23334-1-joel@jms.id.au>
 <CACPK8XecV7ffxhzbKJy_8D3jyieacCryHuoTV_r_MgRDv8XmpQ@mail.gmail.com>
 <CAFd5g455k78EaV4ES5gssVcMhVr-6iO96kz4pGs9jReGoi8LEA@mail.gmail.com>
 <1493281595.2083694.957888912.5A8D8515@webmail.messagingengine.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Apr 2017 20:46:38 +0930
X-Google-Sender-Auth: K6614iJRwFjIvOiGxQ8H9WJA-OE
Message-ID: <CACPK8XfPZEL9H0mZc2FfdiOjjPYydDVxeTWN7ZR-SftcdjRprg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Update i2c binding
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>
Content-Type: multipart/alternative; boundary=001a1143d95449ccdf054e2417d5
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
X-List-Received-Date: Thu, 27 Apr 2017 11:16:45 -0000

--001a1143d95449ccdf054e2417d5
Content-Type: text/plain; charset=UTF-8

On 27 Apr 2017 17:56, "Andrew Jeffery" <andrew@aj.id.au> wrote:

On Thu, Apr 27, 2017, at 17:49, Brendan Higgins wrote:
> On Thu, Apr 27, 2017 at 12:35 AM, Joel Stanley <joel@jms.id.au> wrote:
> > On Thu, Apr 27, 2017 at 4:50 PM, Joel Stanley <joel@jms.id.au> wrote:
> >> The I2C binding changed when upstreaming the I2C driver.
> >>
> >> Signed-off-by: Joel Stanley <joel@jms.id.au>
> >> ---
> >>
> >> I've boot tested this, but please take a look to make sure I didn't
stuff it up.
>
> I will take a look at the rest of this tomorrow.
>
> >
> > Do I also need aliases so the character devices appear where userspace
> > expects them?
>
> Yep, someone asked me about this a while ago on IRC. I can find with
> whom I had the conversation with tomorrow, since he probably already
> did this.
>

That was me, and yes you need them.


Have you got them laying around?


Cheers,

Andrew

--001a1143d95449ccdf054e2417d5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On 27 Apr 2017 17:56, &quot;Andrew Jeffery&quot; &lt;<a href=3D"m=
ailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br type=3D"attributio=
n"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div class=3D"quoted-text">On Thu, Apr 27, 2017=
, at 17:49, Brendan Higgins wrote:<br>
&gt; On Thu, Apr 27, 2017 at 12:35 AM, Joel Stanley &lt;<a href=3D"mailto:j=
oel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br>
&gt; &gt; On Thu, Apr 27, 2017 at 4:50 PM, Joel Stanley &lt;<a href=3D"mail=
to:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br>
&gt; &gt;&gt; The I2C binding changed when upstreaming the I2C driver.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Joel Stanley &lt;<a href=3D"mailto:joel@jms.id=
.au">joel@jms.id.au</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I&#39;ve boot tested this, but please take a look to make sur=
e I didn&#39;t stuff it up.<br>
&gt;<br>
&gt; I will take a look at the rest of this tomorrow.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Do I also need aliases so the character devices appear where user=
space<br>
&gt; &gt; expects them?<br>
&gt;<br>
&gt; Yep, someone asked me about this a while ago on IRC. I can find with<b=
r>
&gt; whom I had the conversation with tomorrow, since he probably already<b=
r>
&gt; did this.<br>
&gt;<br>
<br>
</div>That was me, and yes you need them.<br></blockquote></div></div></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Have you got them laying aro=
und?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail=
_extra"><div class=3D"gmail_quote"><blockquote class=3D"quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Andrew<br>
</blockquote></div><br></div></div></div>

--001a1143d95449ccdf054e2417d5--
