Return-Path: <raj.khem@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::242; helo=mail-qt0-x242.google.com;
 envelope-from=raj.khem@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QPzwLlQN"; 
 dkim-atps=neutral
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wStc1pcbzDr4N
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 08:23:51 +1000 (AEST)
Received: by mail-qt0-x242.google.com with SMTP id h5-v6so12797675qtm.13
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 15:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dtv4hr3G0QP+HGzY5uiqXSDt6vu5hrBpzlv6yHTrw0k=;
 b=QPzwLlQNf16itOtAfN1TEjB6kmqqCyanown1bgInALjv4E969gMp6xr2I78cmPvmRq
 q1iyGy6APE6Sss6kHMdqV/ogXmP6P0zpGJUb38unt0m8jgsWuAWE+gGc8tl9t75CqR01
 FpuVvkDmf00ozRJHEEpE9e5WZ+ldvn88UoR6MgI/wEPdByzUb/HRu+FxkTF+VqHrmx+W
 kY2TeyckODkbrP4EuH8hUW/ddKsiE+3pcN+vJrkerrYjIvP89xjGVI5eiMcqqKGEPLQb
 MaVPsy9+XuQI6mWhc9NPjiWpoVK75zgfWu5C+IM33Zf1PYLpSd+fZVoYGTGf5tzLliDB
 YPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dtv4hr3G0QP+HGzY5uiqXSDt6vu5hrBpzlv6yHTrw0k=;
 b=RXShewtVnv2riafBBiUP0XN7Kv6fl9Mzo4HlVbdR39Bu74+N8ri54p1/9AT+BldJSw
 NDtCpB42gYl4Orh5+AGlIDcGYHuM7QlaD0jzKNo3SYGv62fXTIKQRAlRLtZLBrqgFrKx
 1Z22ysKBjJDAsjgAWwQQ4vTCnToZ0nY8vIOmIYQpnfIbS1/122WqkGmmthLuDU0ZCXre
 oJrRByTpKcsBRm8HyCjEU7J+FgBOGGkE+wJo4rfjdup7FNSgAAhsuqLgpuPNgtaCgnfX
 OdYVWoAAbPhXGNJ2B/lrOCY7e554YFQ/wrd9aYLh8AF3LGYOCGbVGXyHoGhurtjPJRKk
 nHAg==
X-Gm-Message-State: APt69E0deIKtpjpnM26fI67XLelHCy9ZmbLJ/cjTFUnnFmjHWeX3nQNt
 2sYUN+7uAkNsduxx4NNNv7QwYaPSxYkY9mj4HfM=
X-Google-Smtp-Source: ADUXVKII3/T+3YeAODeRfkEJkLtNChj3oPsGieI//C5qsDS/ccU9G/qjXHCf+q5UjpeMKtwtwqcVwC4A4rvkHTY09AI=
X-Received: by 2002:ac8:26ea:: with SMTP id 39-v6mr287870qtp.128.1527632629354; 
 Tue, 29 May 2018 15:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20180510063718.16913-1-andrew@aj.id.au>
 <1527594494.687641.1388974752.4113AC8F@webmail.messagingengine.com>
 <CAMKF1sp+qOKAhA3K1OqLuPBwY3w2xNFkzSnoUsEY9okKxT45ow@mail.gmail.com>
 <1527631428.3392595.1389703584.53FF3C93@webmail.messagingengine.com>
In-Reply-To: <1527631428.3392595.1389703584.53FF3C93@webmail.messagingengine.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 15:23:37 -0700
Message-ID: <CAMKF1srL5ovf3FfNsk-S83djSY63gG4UyBmqGohvgEfJsW4qGA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2 1/3] meta-python: Add python-pyflame
 recipe
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org, 
 openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003854a6056d5fb088"
X-Mailman-Approved-At: Wed, 30 May 2018 09:05:36 +1000
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
X-List-Received-Date: Tue, 29 May 2018 22:23:53 -0000

--0000000000003854a6056d5fb088
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 29, 2018 at 3:03 PM Andrew Jeffery <andrew@aj.id.au> wrote:

>
>
> On Wed, 30 May 2018, at 02:34, Khem Raj wrote:
> > On Tue, May 29, 2018 at 4:48 AM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> > > On Thu, 10 May 2018, at 16:07, Andrew Jeffery wrote:
> > >> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > >
> > > Ping - is there anything I need to revise for this patch or the
> following two?
> > >
> >
> > There was a review comment for you to adress, see
> >
> > https://patchwork.openembedded.org/patch/150467/
> >
> > if you have addressed that please send a v3 for whole series.
>
> That comment is on v1 of the series. This is v2, and I have reworked the
> recipe to simply clone the git repo instead of grab the tarball to avoid
> the issue that was pointed out.
>

Ok thanks I think the v2 seems to be missing in patchwork that=E2=80=99s th=
e reason
it will go missed i wonder if you resend than patchwork will catch it

>
> Thanks,
>
> Andrew
>

--0000000000003854a6056d5fb088
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Tue, May 29, 2018 =
at 3:03 PM Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au">andrew@aj.=
id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On Wed, 30 May 2018, at 02:34, Khem Raj wrote:<br>
&gt; On Tue, May 29, 2018 at 4:48 AM, Andrew Jeffery &lt;<a href=3D"mailto:=
andrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt; wrote:<br>
&gt; &gt; On Thu, 10 May 2018, at 16:07, Andrew Jeffery wrote:<br>
&gt; &gt;&gt; Signed-off-by: Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj=
.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Ping - is there anything I need to revise for this patch or the f=
ollowing two?<br>
&gt; &gt;<br>
&gt; <br>
&gt; There was a review comment for you to adress, see<br>
&gt; <br>
&gt; <a href=3D"https://patchwork.openembedded.org/patch/150467/" rel=3D"no=
referrer" target=3D"_blank">https://patchwork.openembedded.org/patch/150467=
/</a><br>
&gt; <br>
&gt; if you have addressed that please send a v3 for whole series.<br>
<br>
That comment is on v1 of the series. This is v2, and I have reworked the re=
cipe to simply clone the git repo instead of grab the tarball to avoid the =
issue that was pointed out.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ok thanks I thin=
k the v2 seems to be missing in patchwork that=E2=80=99s the reason it will=
 go missed i wonder if you resend than patchwork will catch it</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><br>
Thanks,<br>
<br>
Andrew<br>
</blockquote></div></div>

--0000000000003854a6056d5fb088--
