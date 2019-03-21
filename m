Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::12f; helo=mail-it1-x12f.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="se7UhzNS"; 
 dkim-atps=neutral
Received: from mail-it1-x12f.google.com (mail-it1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44QC8j63QwzDqSd
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 03:35:57 +1100 (AEDT)
Received: by mail-it1-x12f.google.com with SMTP id l139so5039236ita.5
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kT/iV86QroBFfTMFizdXSYmZF5SIE22+pb0e9nCE9TU=;
 b=se7UhzNSIq9Gxm38kyledMXMKNKnIGuXtzHM+c6spgymMljnnoU3Ld723YR+PXbLYA
 HHr6sn7oof3DnLMvYI8Vr+jGG7uJoskOOJROsowqdbERKfd64Ss4CvztIDFSEX8fD2Sc
 cp76iYJ2ZY3eW3bPFOX2FVkcaYKHbD6W/ZhNN7lteh5NBz68G026XX2KRgLTnTsp6y/j
 gYeLS4yEi1EfrqpQ55WHMdOxGSXPaB99X7OX/k24vVE+bi5kozYPcC3NCA22YHLeaty+
 Us9vl1iKJPWGFjPUU4j4l/TFckCchsEOZ9sd2ecJ639m9rkUg+/H+8i2U5K5C7cfq5K8
 6mCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kT/iV86QroBFfTMFizdXSYmZF5SIE22+pb0e9nCE9TU=;
 b=lhW/JUTOVB1l7qgRgphBBAgmegDHm1Qi1C/gnz3EJoILViiuK6GP62Nxc1+u8q7HBw
 DKs6r57Z2VBOfxVIVQzb8TbDrQlXySSuuWJNDSIrp8GSmCpX/ZRb3UXCOLMB+OJC/v+P
 x4KpTTHo7V/ATmAnMIrLCCDGFfMqptCNd9hlAyEB3ZRlndMN/5d2152Ji4VLlogNDjjC
 UhVEJY8/AZCjJAKZlrBQ9Y7pFcjvP5pMIGSYvyOD14TfYX4Dwuaa6DEbz3wujD+jN/5H
 bq69ZewRYBaBPoCrJQ26QdBHXe132JqeehMqoMu0BZHDC3UHRlC8CyulM2wSsPSuxk+U
 im7Q==
X-Gm-Message-State: APjAAAUx3qqN+FNeALVeaY0wjYLnRxd8GTa++N+VUcC6DWO+iMZGnHRq
 1KIPjoRQpr829fRoSI6Vm/KbXsVCWJkx5xeScQbFcyuERKeinA==
X-Google-Smtp-Source: APXvYqy7eWKf4tHYPD9nCmfQVncn3rWISONi+jh3OmC14ZiYXWyapdAdVbgQqtuF5p7Em5Yic746wo6JRHEK4tCzn9o=
X-Received: by 2002:a24:2487:: with SMTP id f129mr3402512ita.124.1553186151597; 
 Thu, 21 Mar 2019 09:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <7655B3A4-BB99-4EEE-8D7F-38B03DC03B14@fb.com>
In-Reply-To: <7655B3A4-BB99-4EEE-8D7F-38B03DC03B14@fb.com>
From: Kun Yi <kunyi@google.com>
Date: Thu, 21 Mar 2019 09:35:24 -0700
Message-ID: <CAGMNF6WkHoBbY1VkAQ53t1ahUWdvv=v5d-XapRZ6-DKK++JrpQ@mail.gmail.com>
Subject: Re: kcsbridged is failing
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000d671ed05849d5454"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Mar 2019 16:36:07 -0000

--000000000000d671ed05849d5454
Content-Type: text/plain; charset="UTF-8"

Hi Vijay,

The "Failed to send the time out response" error is
https://github.com/openbmc/openbmc/issues/3489. I don't think anyone has
taken actions on it though.

Repeatedly timing out could be due to several reasons, including IPMI
daemon crash or blocked. Is it consistent? Does it resolve itself if you
restart IPMI daemon? What's the system state roughly like (a 'top -n 1'
would suffice)?

On Wed, Mar 20, 2019 at 4:00 PM Vijay Khemka <vijaykhemka@fb.com> wrote:

> Hi,
>
> I am seeing latest failure in kcsbridged with following log.
>
>
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg with seq: 0xe9
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send the timeout
> response!
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg with seq: 0xe9
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send the timeout
> response!
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg with seq: 0xe9
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send the timeout
> response!
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg with seq: 0xe9
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send the timeout
> response!
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg with seq: 0xe9
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send the timeout
> response!
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg with seq: 0xe9
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send the timeout
> response!
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg with seq: 0xe9
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send the timeout
> response!
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg with seq: 0xe9
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send the timeout
> response!
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg with seq: 0xe9
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send the timeout
> response!
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg with seq: 0xe9
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send the timeout
> response!
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg with seq: 0xe9
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send the timeout
> response!
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg with seq: 0xe9
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send the timeout
> response!
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg with seq: 0xe9
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send the timeout
> response!
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg with seq: 0xe9
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send the timeout
> response!
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg with seq: 0xe9
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send the timeout
> response!
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg with seq: 0xe9
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send the timeout
> response!
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg with seq: 0xe9
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send the timeout
> response!
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg with seq: 0xe9
>
> Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send the timeout
> response!
>
> Feb 28 00:16:18 tiogapass kcsbridged[1042]: Timeout on msg with seq: 0xe9
>
>
>
>
>
> Any suggestions?
>
>
>
> Regards
>
> -Vijay
>


-- 
Regards,
Kun

--000000000000d671ed05849d5454
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Vijay,<div><br></div><div>The &quot;Failed to send=
 the time out response&quot; error is=C2=A0<a href=3D"https://github.com/op=
enbmc/openbmc/issues/3489">https://github.com/openbmc/openbmc/issues/3489</=
a>. I don&#39;t think anyone has taken actions on it though.</div><div><br>=
</div><div>Repeatedly timing out could be due to several reasons, including=
 IPMI daemon crash or blocked. Is it consistent? Does it resolve itself if =
you restart IPMI daemon? What&#39;s the system state roughly like (a &#39;t=
op -n 1&#39; would suffice)?</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 20, 2019 at 4:00 PM Vijay Khe=
mka &lt;<a href=3D"mailto:vijaykhemka@fb.com">vijaykhemka@fb.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_6279707022277487157WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Hi,<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">I am seeing latest fa=
ilure in kcsbridged with following log.<u></u><u></u></span></p>
<div style=3D"border-top:none;border-right:none;border-left:none;border-bot=
tom:6.75pt double windowtext;padding:0in 0in 1pt">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><span style=3D"fon=
t-size:11pt"><u></u>=C2=A0<u></u></span></p>
</div>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg wi=
th seq: 0xe9</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send th=
e timeout response!</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg wi=
th seq: 0xe9</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send th=
e timeout response!</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg wi=
th seq: 0xe9</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send th=
e timeout response!</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg wi=
th seq: 0xe9</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send th=
e timeout response!</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg wi=
th seq: 0xe9</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send th=
e timeout response!</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg wi=
th seq: 0xe9</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send th=
e timeout response!</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg wi=
th seq: 0xe9</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send th=
e timeout response!</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg wi=
th seq: 0xe9</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send th=
e timeout response!</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg wi=
th seq: 0xe9</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send th=
e timeout response!</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg wi=
th seq: 0xe9</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send th=
e timeout response!</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg wi=
th seq: 0xe9</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send th=
e timeout response!</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg wi=
th seq: 0xe9</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send th=
e timeout response!</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg wi=
th seq: 0xe9</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send th=
e timeout response!</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg wi=
th seq: 0xe9</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send th=
e timeout response!</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg wi=
th seq: 0xe9</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send th=
e timeout response!</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg wi=
th seq: 0xe9</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send th=
e timeout response!</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg wi=
th seq: 0xe9</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send th=
e timeout response!</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Timeout on msg wi=
th seq: 0xe9</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:17 tiogapass kcsbridged[1042]: Failed to send th=
e timeout response!</span><u></u><u></u></p>
<p class=3D"gmail-m_6279707022277487157p1"><span class=3D"gmail-m_627970702=
2277487157s1">Feb 28 00:16:18 tiogapass kcsbridged[1042]: Timeout on msg wi=
th seq: 0xe9</span><u></u><u></u></p>
<div style=3D"border-top:none;border-right:none;border-left:none;border-bot=
tom:6.75pt double windowtext;padding:0in 0in 1pt">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><span style=3D"fon=
t-size:11pt"><u></u>=C2=A0<u></u></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Any suggestions?<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Regards<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-Vijay<u></u><u></u><=
/span></p>
</div>
</div>

</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Kun</div></div></d=
iv>

--000000000000d671ed05849d5454--
