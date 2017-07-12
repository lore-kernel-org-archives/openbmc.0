Return-Path: <raltherr@google.com>
Received: from mail-wm0-x236.google.com (mail-wm0-x236.google.com
 [IPv6:2a00:1450:400c:c09::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x7CG5420VzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2017 07:46:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="px94YLes"; 
 dkim-atps=neutral
Received: by mail-wm0-x236.google.com with SMTP id f67so7161468wmh.1
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jul 2017 14:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Ovx9+l/12S0K0CpUtM8tT/8TUn31pwK1zrrXBwLxeOw=;
 b=px94YLesC16EWuZWhwrMqHsMFmbnQIiJ6b4Hc/LjTYxYJ9l3MA7vG7jBa2qDpL3Udy
 3PtbLpv6H0S/sHcXlFuxcecD8ytLFiWl8nCNj1n7eEBZwqk0hzwR3DiYqDI8xed/0vZr
 4BUWrMn2ghGrulmoGULMBddqWjGXObqtAMmLrgNqdBT6eo2ENi597Kv5f+OKl7XuRXz7
 C6g/ww02NHMXI+tuAvWjGuXyDdQHaltTkKKCjYgdcY1OxtUST98p/nl1Oe/6CQFSO4T/
 ia6+BRZ3Ofp9Po1JhADPI//7N8H4RkdCwM2HNlUyW242ykGDgwfS49+QDK8K/UBSFqNI
 9n9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Ovx9+l/12S0K0CpUtM8tT/8TUn31pwK1zrrXBwLxeOw=;
 b=jqtkyeJ3TLqWMH/rLkFfxzA0BvV9hSSH0i+xcCEd5CvXRCxtHyTyzRDLh5DvzDXU/K
 vfnF2zqMTabsoKuAhA43jAsYruLVQaWTNn9RcRtXCOyH3OwpLvJ+y2EQ1lcDg6Yjr6q+
 W0pBv6jU4qsfwlL5n8JdMqlwCeqRxaX73RKbV2xeMn9bSZIZ4ZowdQJVtibzN+uVn7FX
 pRpstzP5BjMBSuLf3Xv5OwXgG/hRDUiwZjz2XIQkzm1Q/CaFyWiN1Yx7PKJ8DTCDTsg5
 5bodudi2jEuW9k+VVhhejSYwZZMG0U1ZAE+znKWhRrzxUwPdTkeyc/JVQq9IrA40uTjf
 t/Aw==
X-Gm-Message-State: AIVw112+W0/qRt96KxznN4kzu4AIGdM1UzUVmsT/E4mzTpNuKh8vFoKM
 Db4AEIZ/uWuP1WmipEbYY6+r4tq0TvGL
X-Received: by 10.28.228.134 with SMTP id b128mr4126737wmh.64.1499896009521;
 Wed, 12 Jul 2017 14:46:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.153.69 with HTTP; Wed, 12 Jul 2017 14:46:48 -0700 (PDT)
In-Reply-To: <CAFR_W8rJ1iQ4CLe+fBd8_pB8b8LP=Mn5oTb0bamAETY0vC2ErQ@mail.gmail.com>
References: <CAFR_W8pJRVbb75NKmZcE=S1tHsQ8F4NSUToGgJ0vavaJKkEaWQ@mail.gmail.com>
 <BF2D9544-F30B-445F-A336-2A5C0CF5E3AF@fuzziesquirrel.com>
 <CAFR_W8rJ1iQ4CLe+fBd8_pB8b8LP=Mn5oTb0bamAETY0vC2ErQ@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 12 Jul 2017 14:46:48 -0700
Message-ID: <CAPLgG=k=Tvtp3JuC601eiS6jHPF=F_Ye5e=z9BC1h1OyzAR1xQ@mail.gmail.com>
Subject: Re: Linux Kernel PMBus drivers
To: Maxim Sloyko <maxims@google.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a114b1032d990fb055425c017"
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
X-List-Received-Date: Wed, 12 Jul 2017 21:46:54 -0000

--001a114b1032d990fb055425c017
Content-Type: text/plain; charset="UTF-8"

Look in the MAINTAINERS file for the longest file path match.  They specify
mailing list, git repo, and maintainer emails.

On Wed, Jul 12, 2017 at 2:17 PM, Maxim Sloyko <maxims@google.com> wrote:

> Hi Brad,
>
> Thanks for the info. Do you know which kernel subtree should I be basing
> my patches on?
>
> On Wed, Jul 12, 2017 at 1:56 PM, Brad Bishop <bradleyb@fuzziesquirrel.com>
> wrote:
>
>>
>> > On Jul 12, 2017, at 1:32 PM, Maxim Sloyko <maxims@google.com> wrote:
>> >
>> > Hi Joel,
>> >
>> > I have a couple of small PMBus HWMon Linux Kernel drivers for Zaius
>> (Infineon and Intersil parts). Do you know which subtree/mailing list I
>> should send these to or how can I figure this out?
>> >
>>
>> linux-hwmon@vger.kernel.org
>>
>> > Thanks.
>> >
>> > --
>> > Maxim Sloyko
>>
>
>
>
> --
> *M*axim *S*loyko
>

--001a114b1032d990fb055425c017
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Look in the MAINTAINERS file for the longest file path mat=
ch.=C2=A0 They specify mailing list, git repo, and maintainer emails.</div>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Jul 12, 2=
017 at 2:17 PM, Maxim Sloyko <span dir=3D"ltr">&lt;<a href=3D"mailto:maxims=
@google.com" target=3D"_blank">maxims@google.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi Brad,<div><br></div><div>=
Thanks for the info. Do you know which kernel subtree should I be basing my=
 patches on?<br><div class=3D"gmail_extra"><div><div class=3D"h5"><br><div =
class=3D"gmail_quote">On Wed, Jul 12, 2017 at 1:56 PM, Brad Bishop <span di=
r=3D"ltr">&lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com" target=3D"_bla=
nk">bradleyb@fuzziesquirrel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span><br>
&gt; On Jul 12, 2017, at 1:32 PM, Maxim Sloyko &lt;<a href=3D"mailto:maxims=
@google.com" target=3D"_blank">maxims@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Joel,<br>
&gt;<br>
&gt; I have a couple of small PMBus HWMon Linux Kernel drivers for Zaius (I=
nfineon and Intersil parts). Do you know which subtree/mailing list I shoul=
d send these to or how can I figure this out?<br>
&gt;<br>
<br>
</span><a href=3D"mailto:linux-hwmon@vger.kernel.org" target=3D"_blank">lin=
ux-hwmon@vger.kernel.org</a><br>
<br>
&gt; Thanks.<br>
<span class=3D"m_8650645105761474846HOEnZb"><font color=3D"#888888">&gt;<br=
>
&gt; --<br>
&gt; Maxim Sloyko<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div></div=
></div><span class=3D"HOEnZb"><font color=3D"#888888">-- <br><div class=3D"=
m_8650645105761474846gmail_signature" data-smartmail=3D"gmail_signature"><d=
iv><b>M</b>axim <b>S</b>loyko</div></div>
</font></span></div></div></div>
</blockquote></div><br></div>

--001a114b1032d990fb055425c017--
