Return-Path: <raltherr@google.com>
Received: from mail-wm0-x22a.google.com (mail-wm0-x22a.google.com
 [IPv6:2a00:1450:400c:c09::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wz5s70GK5zDr0g
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jun 2017 03:15:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="O2d8Q7Fw"; 
 dkim-atps=neutral
Received: by mail-wm0-x22a.google.com with SMTP id 62so88693179wmw.1
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 10:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=VF4lsjeZnDcjwPJ0liYtoL6hKHIL+drbgBtcPIk58oc=;
 b=O2d8Q7FwpAcm94YN+NTHHNj2zgjFQiKCrGIgFpAz/2mThPcMWhIbCCH5i7CuTkPpLj
 RXZgSjZT7+9GvhEnjtYUADFxS27lPT8D574Knny7ClS9glwNEPzziV0hTmcZQFp/lkfX
 Ym7DAfwHWo/zGD+MFWW82l3v7AggTOKcTsCqrPxJXrmM0j58EEMGzVwsqy5nxeSwCVrV
 vszJLvg72wc8xnvQvhoMKZwVyzAsXZGkSEkujfbCAZLN5oOGfE9tmcx7TAoCftx1m2gq
 V+DuMg/1odz/m7C2LVqHJBaS0n1doradOhQ2rlT5xcq/pDhOcaDLbA7295+TACTKk8lv
 fAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=VF4lsjeZnDcjwPJ0liYtoL6hKHIL+drbgBtcPIk58oc=;
 b=hV+bp8OUVZ9aIwjcLLOOLGwuqnlpQHbzKQYbPHIxDIfIEfybgaLbZ5u3gouhP6rBEt
 KGOdgc10yTMKo4EqkVL6z1sNS3pz2DLyDq/Fh6s6auGSDrSK9tuzq9c3XepWZeNh6KFo
 mdid0Up/MCodInv6FRO0EV8keFYEABxnBb50rvuypzyuuIIXtgp4r4UZLyaxlck1Dr/a
 XOrXgvAtdX2YC5rIwZmO3hSeyjcTOlJQ4lsC77E55WFHGRcj6MmqJXSjIZATWqw7EHtX
 PONKWa1sX1pHVl4PPil9WZlCbrNI4sdISeVO/jfdB7uuBAi2caya9UxsgyKJhyJ0g1VU
 pAkw==
X-Gm-Message-State: AIVw111W+hxIU+nh2zoe0XT/i5ejasZ17V5CLC2kaeR+q2jSjYie/PcX
 hl46tdp/GrGkqk0uCVXRrIEBrpOm/u/8mSg=
X-Received: by 10.28.19.205 with SMTP id 196mr2944960wmt.122.1498756535175;
 Thu, 29 Jun 2017 10:15:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.143.18 with HTTP; Thu, 29 Jun 2017 10:15:34 -0700 (PDT)
In-Reply-To: <CACPK8XfEoxHnj9-UOvSMXwuE=YoXQp21NeT7EsxHk4miNLz-zw@mail.gmail.com>
References: <CACPK8XfEoxHnj9-UOvSMXwuE=YoXQp21NeT7EsxHk4miNLz-zw@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 29 Jun 2017 10:15:34 -0700
Message-ID: <CAPLgG=kQPbdvRxHTLuBXG7SHVG-tNX0mGG+3RAxsnSMRE1M1iA@mail.gmail.com>
Subject: Re: Setting timeriomem rng quality
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a1145b67ce31df505531c727d"
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
X-List-Received-Date: Thu, 29 Jun 2017 17:15:40 -0000

--001a1145b67ce31df505531c727d
Content-Type: text/plain; charset="UTF-8"

Huh.  I thought I sent a patch for that.  Quality is #bit of entropy per
1000 bits read.  100 is a conservative value that was suggested by those in
the know.

On Wed, Jun 28, 2017 at 9:36 PM, Joel Stanley <joel@jms.id.au> wrote:

> Hi Rick,
>
> I saw your patch to allow the device tree to set the timeriomem rng
> quality. I was wondering what value that should be set to for the
> Aspeed SoCs?
>
> Cheers,
>
> Joel
>

--001a1145b67ce31df505531c727d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Huh.=C2=A0 I thought I sent a patch for that.=C2=A0 Qualit=
y is #bit of entropy per 1000 bits read. =C2=A0100 is a conservative value =
that was suggested by those in the know.</div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On Wed, Jun 28, 2017 at 9:36 PM, Joel Stanley =
<span dir=3D"ltr">&lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_blank">j=
oel@jms.id.au</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Ri=
ck,<br>
<br>
I saw your patch to allow the device tree to set the timeriomem rng<br>
quality. I was wondering what value that should be set to for the<br>
Aspeed SoCs?<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div><br></div>

--001a1145b67ce31df505531c727d--
