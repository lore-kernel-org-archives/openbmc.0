Return-Path: <kunyi@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::230; helo=mail-it0-x230.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gC9Y6jbY"; 
 dkim-atps=neutral
Received: from mail-it0-x230.google.com (mail-it0-x230.google.com
 [IPv6:2607:f8b0:4001:c0b::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yC1KH5wDhzDr5x
 for <openbmc@lists.ozlabs.org>; Thu, 12 Oct 2017 04:33:06 +1100 (AEDT)
Received: by mail-it0-x230.google.com with SMTP id f187so3992453itb.1
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 10:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=FXVQDuMMhLbKnniRbVJOa+AR+j524dspa7Db4YxSDgs=;
 b=gC9Y6jbYyC2auMGt8oPnzEFp1VMKWb4X45h5tZ5jO1t7HfQFSOS2mXI9xUN/+f+/z8
 eHHj94wztQ2I4gKYXV+aGdSfREYuyPsG10aAzgH6+qaH59aKUECpR0YnCNh7qk0qIcOG
 IpMv72qfwKvPS+WYskMRu0zOevMi4FOm6l7UC7WjZHsYXPadTj1HbDYbNwweWi4H5Msd
 xNVx7QeiEqlNeuPML7N+4pFF7zmnUrpvkdrFfT6YCEwtCb94Hd+46k/Fe/Qof11cDEDp
 1tWZv3k0SZPbdKQKY4oYPq9/R4qMTiYG/eRTBjVB89hN3yOEDgGC2k4P/olJhZ682G77
 pAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=FXVQDuMMhLbKnniRbVJOa+AR+j524dspa7Db4YxSDgs=;
 b=oEuokws/Wk9a3Dhb+e29Nd3OTAX+otpj/GqK5fEIPwWPQHX/ekz/HeD93RN+8WGLiF
 SpuKllVxp8Whog3yz0l0jGPp/arMxTkUgF0etH4IH8SF0DhiAqn+z4ZGNck/wujt66mh
 IcQu7GC47zOAeBH8+6vIEA2htgUaC9xLN8k/WXQHMZDiOGIHFhhXCNtKvztdONX9vN8F
 ngqc2cMdfuwTMCeugwo9SfvRPoWgBhygz6//RA7Q+RoE3DWcGQSeQnVglEJNPleVPk6d
 hDX6bfyHhnPavw8G7GtXSzZTHrx/cASAEOCVDgU1qBtgD5cQm6dubYxJmejLWeMPzHnS
 a+Gg==
X-Gm-Message-State: AMCzsaVYcoQuD0eXcTvbY8dFu+s4m0FKEoEyNPBJFQjSxBA/k0BBq4+B
 VzgUtQ3GBlQ7ZjSSWaw93q8op7P9Gx7aYI7wUxvvnw==
X-Google-Smtp-Source: AOwi7QCFhUJ9F1qf3fkfZS3FTmmNMxf6awiEdu2yrD+Z63BWGYXcL9UZX2OyI53zKELJl2uc5/uaGtpNTQeDcTewQYI=
X-Received: by 10.36.124.72 with SMTP id a69mr403795itd.135.1507743184084;
 Wed, 11 Oct 2017 10:33:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.130.222 with HTTP; Wed, 11 Oct 2017 10:32:33 -0700 (PDT)
In-Reply-To: <CAPLgG=nut_9GaVeby6w8fcaq5n=3ntxCHqdSQorRmSSKLdcLbw@mail.gmail.com>
References: <CAGMNF6W+g_yAnm2e0ta7VtBZb01pwaRs_SZW+=N4tJtDO88xFw@mail.gmail.com>
 <CAPLgG=nut_9GaVeby6w8fcaq5n=3ntxCHqdSQorRmSSKLdcLbw@mail.gmail.com>
From: Kun Yi <kunyi@google.com>
Date: Wed, 11 Oct 2017 10:32:33 -0700
Message-ID: <CAGMNF6XRQECqaFLKzfDkU9sbOrivw3GYgLx5QruF4WypD4cEsQ@mail.gmail.com>
Subject: Re: pythonnative version mismatch?
To: Rick Altherr <raltherr@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a114a91e6e735d1055b48d046"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Oct 2017 17:33:08 -0000

--001a114a91e6e735d1055b48d046
Content-Type: text/plain; charset="UTF-8"

Wow, thanks for the super helpful and comprehensive answer, Rick!!

On Mon, Oct 9, 2017 at 1:51 PM, Rick Altherr <raltherr@google.com> wrote:

> This was a really good question.  I wrote a blog post to document the
> answer: https://www.kc8apf.net/2017/10/snakes-in-a-sysroot/.
>
> On Fri, Oct 6, 2017 at 11:00 AM, Kun Yi <kunyi@google.com> wrote:
>
>> Hello folks,
>>
>> I searched through the mailing list but haven't seen anyone brought up.
>> Here's a weird bug I found on my setup: pythonnative seems to be using
>> python3.4.3 whereas the recipe specified 2.7.
>>
>> Before diving into the layers of bitbake recipes to root cause what
>> caused this, I want to post on the mailing list to see if it is
>> reproducible on other setups, and if people have ideas why this went wrong
>> (environment variable accidentally being overwritten?)
>>
>> *What I tested:*
>> I found the code in phosphor-settings-manager, which inherits
>> pythonnative, seems to be working per python 3, so added the following line
>> into a native python function:
>>
>> python do_check_version () {
>>   import sys
>>   bb.warn(sys.version)
>> }
>> addtask check_version after do_configure before do_compile
>>
>> WARNING: phosphor-settings-manager-1.0-r1 do_check_version: 3.4.3
>> (default, Nov 17 2016, 01:08:31)
>>
>> This is with openbmc git tip, building MACHINE=zaius
>>
>> *What the recipe should be using is seemingly 2.7:*
>> $ cat ../import-layers/yocto-poky/meta/classes/pythonnative.bbclass
>>
>> inherit python-dir
>> [...]
>>
>> $ cat ../import-layers/yocto-poky/meta/classes/python-dir.bbclass
>> PYTHON_BASEVERSION = "2.7"
>> PYTHON_ABI = ""
>> PYTHON_DIR = "python${PYTHON_BASEVERSION}"
>> PYTHON_PN = "python"
>> PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"
>>
>> *Why this is bad:*
>> well, python2.7 and python3 have a ton of differences. A bug I discovered
>> is due to usage of filter(), which returns different objects between
>> Python2/3.
>>
>> --
>> Regards,
>> Kun
>>
>
>


-- 
Regards,
Kun

--001a114a91e6e735d1055b48d046
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Wow, thanks for the super helpful and comprehensive answer=
, Rick!!</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On =
Mon, Oct 9, 2017 at 1:51 PM, Rick Altherr <span dir=3D"ltr">&lt;<a href=3D"=
mailto:raltherr@google.com" target=3D"_blank">raltherr@google.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">This was a =
really good question.=C2=A0 I wrote a blog post to document the answer:=C2=
=A0<a href=3D"https://www.kc8apf.net/2017/10/snakes-in-a-sysroot/" target=
=3D"_blank">https://www.kc8apf.<wbr>net/2017/10/snakes-in-a-<wbr>sysroot/</=
a>.</div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Fri, Oct 6, 2017 at 11:00 AM, Kun Yi <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:kunyi@google.com" target=3D"_blank">ku=
nyi@google.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 dir=3D"ltr">Hello folks,<div><br></div><div>I searched through the mailing=
 list but haven&#39;t seen anyone brought up. Here&#39;s a weird bug I foun=
d on my setup: pythonnative seems to be using python3.4.3 whereas the recip=
e specified 2.7.</div><div><br></div><div>Before diving into the layers of =
bitbake recipes to root cause what caused this, I want to post on the maili=
ng list to see if it is reproducible on other setups, and if people have id=
eas why this went wrong (environment variable accidentally being overwritte=
n?)</div><div><br></div><div><b>What I tested:</b></div><div>I found the co=
de in phosphor-settings-manager, which inherits pythonnative, seems to be w=
orking per python 3, so added the following line into a native python funct=
ion:</div><div><br></div><div>python do_check_version () {</div><div>=C2=A0=
 import sys</div><div>=C2=A0 bb.warn(sys.version)</div><div>}</div><div>add=
task check_version after do_configure before do_compile<br></div><div><br><=
/div><div>WARNING: phosphor-settings-manager-1.0-<wbr>r1 do_check_version: =
3.4.3 (default, Nov 17 2016, 01:08:31)=C2=A0<br></div><div><br></div><div>T=
his is with openbmc git tip, building MACHINE=3Dzaius</div><div><br></div><=
div><b>What the recipe should be using is seemingly 2.7:</b></div><div><div=
>$ cat ../import-layers/yocto-poky/me<wbr>ta/classes/pythonnative.bbclas<wb=
r>s</div><div><br></div><div>inherit python-dir</div><div>[...]</div></div>=
<div><br></div><div><div>$ cat ../import-layers/yocto-poky/me<wbr>ta/classe=
s/python-dir.bbclass=C2=A0</div><div>PYTHON_BASEVERSION =3D &quot;2.7&quot;=
</div><div>PYTHON_ABI =3D &quot;&quot;</div><div>PYTHON_DIR =3D &quot;pytho=
n${PYTHON_BASEVERSION}&quot;</div><div>PYTHON_PN =3D &quot;python&quot;</di=
v><div>PYTHON_SITEPACKAGES_DIR =3D &quot;${libdir}/${PYTHON_DIR}/site-<wbr>=
packages&quot;</div></div><div><br></div><div><div><b>Why this is bad:</b><=
/div><div>well, python2.7 and python3 have a ton of differences. A bug I di=
scovered is due to usage of filter(), which returns different objects betwe=
en Python2/3.</div><span class=3D"m_1411724771436123755HOEnZb"><font color=
=3D"#888888"><div><br></div>-- <br><div class=3D"m_1411724771436123755m_942=
274962384234270gmail_signature"><div dir=3D"ltr">Regards,<div>Kun</div></di=
v></div>
</font></span></div></div>
</blockquote></div><br></div>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr">Regards,<div>Kun</div></div></div>
</div>

--001a114a91e6e735d1055b48d046--
