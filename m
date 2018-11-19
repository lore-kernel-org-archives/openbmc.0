Return-Path: <osk@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Bgrvm+1/"; 
 dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42zGF86Cx1zF3K2
 for <openbmc@lists.ozlabs.org>; Tue, 20 Nov 2018 04:35:08 +1100 (AEDT)
Received: by mail-wr1-x433.google.com with SMTP id l9so20089404wrt.13
 for <openbmc@lists.ozlabs.org>; Mon, 19 Nov 2018 09:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wIElp97TgAPQ4H3JDBNOgVtubiMPnR3DDoxZgvGCaik=;
 b=Bgrvm+1/5IUyZ6C/oT/hZPdqc666YBPIDCMWrgN2usgNrw27bt50EdbFX0BzXX2pHC
 6izyHSkXm5parK6QAys/af+dr6bR757gJKdPVvzNg/6E1CYkPHyoFMbpjxxp//DUruiK
 ldJuBH+RDKWeWKRyKV33t1WEmFFY3GQ+WeeDi9oX8aT6+2gIweJV9XRupPzLqLTZ9bVD
 3Sqt9UoZB12PDMub8UraLnl6TDP1unfXZ6mfOydNndlo3vvWvd+rvpguj/7NlDGL+0hP
 36muFNBKQm6ysh9dX5k7B366WAWIn9YfeCRJmFLrE/xSVZIhNO6Fu5KfeizftLM2EA8v
 p/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wIElp97TgAPQ4H3JDBNOgVtubiMPnR3DDoxZgvGCaik=;
 b=P9pqeD6f3c6T6AmzvChwoXOFSczi6kFGjT5VFI0D1f/HKPMGhv6jckhhg6/c67TmgX
 s8vEw3AxouAzUu7JCEJs1SrjNO+yMjqHV/lm1/uB5fWFDdNtNgIX9KK/i8OdjckSBJTH
 w3c1HhaZIYN4s1iX4NIlFs8v99jx6yCkIJxYQRmNth+m5UPWoS6FQ01GaHBX0m37LCL/
 ntfQwf2y7w2f9GhfWC/11gtViwvO8I8Tk8hm+IHO6wgfXK5xrYHWEAKvh0tNTmR4RW+h
 bto/d53oaoMJ0583mrCOWJev8J5PFvnLAD592j7W7K3z9hngnWR4NWcBDpnAXI1UlOKz
 xDbQ==
X-Gm-Message-State: AGRZ1gKX0cW7yoTaqNJvz+mOJwP3GnWT8fxp+nThyncaG3mD0jLJRQTE
 svKU7VkMkI+xhhKVv18xwaJ717ZHy9FIWI3NgINWTw==
X-Google-Smtp-Source: AJdET5cQo27Qwwhv5GcMV2gmTQKIZw3XYOOzm2UYRdDKBqVJGYdfVdQqfPcnbjat7YLMtwLbRNomBVF+QyjOM2Xv3sY=
X-Received: by 2002:adf:ce86:: with SMTP id r6mr19850341wrn.257.1542648905108; 
 Mon, 19 Nov 2018 09:35:05 -0800 (PST)
MIME-Version: 1.0
References: <CABoTLcSpcTKHJu5xwWx4TQr1_5FjLvb9QsOAYQhCfMaQwQ5qug@mail.gmail.com>
 <BA3510D9-333A-40DB-9D03-43A5A2B2D963@fb.com>
 <CABoTLcTpMY4StimKijR4LmuSuc0dnnfxeTN=hv13WYghsOFcSw@mail.gmail.com>
 <2A161BFC-87CF-4FE9-9DC5-FF1712EE955C@fb.com>
In-Reply-To: <2A161BFC-87CF-4FE9-9DC5-FF1712EE955C@fb.com>
From: Oskar Senft <osk@google.com>
Date: Mon, 19 Nov 2018 12:34:52 -0500
Message-ID: <CABoTLcRkvH6o9rN67W1xMN0ZJiVQTCJoDMSTO_WpgV_b+jq_4w@mail.gmail.com>
Subject: Re: Submit board schematics to OpenBMC docs repo
To: sdasari@fb.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, bradleyb@fuzziesquirrel.com, 
 gmills@linux.vnet.ibm.com
Content-Type: multipart/alternative; boundary="000000000000010711057b07f082"
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
X-List-Received-Date: Mon, 19 Nov 2018 17:35:10 -0000

--000000000000010711057b07f082
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That makes sense. I.e. submit the meta machine layer for the particular
board and just include the PDFs in the commit. Would that be accepted?

Thanks
Oskar.

On Fri, Nov 16, 2018 at 5:27 PM Sai Dasari <sdasari@fb.com> wrote:

>
>
> I guess this is a question of # of small repos vs a single large repo wit=
h
> a lot of "stuff" in it. I generally prefer fewer (yet larger) repos vs. t=
he
> overhead of managing multiple small repos.
>
> May be an example would clarify for my suggestion of embedding details
> with the machine. I was referring to having =E2=80=98witherspooon=E2=80=
=99 schematics along
> with the machine layer @
> https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-witherspoon.
> This will provide context for how this machine witherspoon is designed wi=
th
> all the details.(hypothetical assuming  witherspoon schematics can be
> shared in open)
>

--000000000000010711057b07f082
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">That makes sense. I.e. submit the meta machine layer for t=
he particular board and just include the PDFs in the commit. Would that be =
accepted?<div><br></div><div>Thanks</div><div>Oskar.=C2=A0<br><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr">On Fri, Nov 16, 2018 at 5:27 PM Sai Dasa=
ri &lt;<a href=3D"mailto:sdasari@fb.com">sdasari@fb.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_-1285814671175473377WordSection1">
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">I guess this is a questio=
n of # of small repos vs a single large repo with a lot of &quot;stuff&quot=
; in it. I generally prefer fewer (yet larger) repos vs. the overhead of ma=
naging multiple small repos.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">May be an example would clarify for my suggestion of=
 embedding details with the machine. I was referring to having =E2=80=98wit=
herspooon=E2=80=99 schematics along with the machine layer @
<a href=3D"https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-wit=
herspoon" target=3D"_blank">
https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-witherspoon</a=
>. This will provide context for how this machine witherspoon is designed w=
ith all the details.(hypothetical assuming =C2=A0witherspoon schematics can=
 be shared in open)<u></u><u></u></p>
</div>
</div>
</div>

</blockquote></div></div></div>

--000000000000010711057b07f082--
