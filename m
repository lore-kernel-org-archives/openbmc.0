Return-Path: <raltherr@google.com>
Received: from mail-yw0-x233.google.com (mail-yw0-x233.google.com
 [IPv6:2607:f8b0:4002:c05::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0D1F2KpxzDrML
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 10:55:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=PKF4zzR7; 
 dkim-atps=neutral
Received: by mail-yw0-x233.google.com with SMTP id z8so73196676ywa.1
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 17:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=3dOEr+9y2WidBjtgPpUpof2Uc66HBZ8g18Y8yPYXcno=;
 b=PKF4zzR7cgzu2dE/HatvAbTkkFfOfSY9SetML++wnM6PTpGSQ8baa1ME1YPN3ITGds
 Ifx+FB2dAwSKTHHjC0knaRCOraGvmDL7XeaylXbqcn/Flbv9u/X8CmbKTvN1fTMnQz27
 iK78zNzoV/ob0Nb9IeQnp6nHc3oylv9S8yEsu2cOqZQ3t4UW2EzRXrcz+3CQH/Funxpj
 Ayw4Akejeq1Elxd9RXLmEJunkNPHZmrrrZJcKRO1FYjXbFDFnJz6uHp8/0qEFpcExrtz
 +zU5sEYBeXBDzVlwheS/Sw9t5N6IATpjk3LXUaFo989Z8W66vEfUbKJ6ZlDtYiqikT6k
 527g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=3dOEr+9y2WidBjtgPpUpof2Uc66HBZ8g18Y8yPYXcno=;
 b=UcIC9Jg3fvkl1ZzLOA1RRzHqa4bi88shUT3yT3duPof65TDNUOIFGD8HKglhKYpDp6
 OOiIhkdI7EHnKRL2c1Zmg+DfhHiO249fhL8eWS2/o73HIPLV0+3eKJmvAuUw1RfQnt0B
 /6xVH0XC5eoZW2sPTiKt+ftda0VwrcvvPtgqQ9LZFTO1QaTksNVEaONwxF22oKBCT9e8
 ZpJPEOzoDnviAhUD+2NrEZPmpo0aTZakJeoietiYhsP/bgMcuwZwbP6UvpqKgqI++80F
 YmgYx63t4/Ftc7ynvNGPoNMGqixy1+TrWYW7Q/t5nP+dFtktsVk6MYhoQMdZmQHwjPaK
 YXkw==
X-Gm-Message-State: AEkoousBT/jMkiMKUgJ4VaOj63aQcPmrATzJdf03UeKUy3+Q7/P+TU6+dZAyHuLOWS/Iv4QNCRXGm2KnEyfps612
X-Received: by 10.129.169.6 with SMTP id g6mr14911018ywh.128.1469667326327;
 Wed, 27 Jul 2016 17:55:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.197.148 with HTTP; Wed, 27 Jul 2016 17:55:25 -0700 (PDT)
In-Reply-To: <86BC2638B1D5DA48B2AEFCA5BCA462667134F7FD@ORSMSX115.amr.corp.intel.com>
References: <86BC2638B1D5DA48B2AEFCA5BCA462667134F6D9@ORSMSX115.amr.corp.intel.com>
 <CAPLgG==6C_JOvE=ZkeVNYOYS1K=Qo-GaRwAnkqrBSoCJEY5k2A@mail.gmail.com>
 <86BC2638B1D5DA48B2AEFCA5BCA462667134F7FD@ORSMSX115.amr.corp.intel.com>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 27 Jul 2016 17:55:25 -0700
Message-ID: <CAPLgG=mR+_rzrfKTvaGZRoczQsMRHueOb2g7iYaJ6Tv1AGw0Bw@mail.gmail.com>
Subject: Re: REST API support on AST 2500 EVB
To: "Deuskar, Prafulla" <prafulla.deuskar@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c1461ceecf8d60538a796e4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jul 2016 00:55:30 -0000

--94eb2c1461ceecf8d60538a796e4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I haven't personally used it as I only have a AST2500-EVB and have been
focusing on kernel and image packaging.  It _should_ work on other
platforms such as Barreleye.  That you are getting HTTP responses says that
the server is responding.  You might ask on IRC.

On Wed, Jul 27, 2016 at 3:26 PM, Deuskar, Prafulla <
prafulla.deuskar@intel.com> wrote:

> We get =E2=80=9CHTTP/1.0 404 Not Found=E2=80=9D when trying to login to p=
ort 3000,
> =E2=80=9CHTTP/1.0 400 Bad Request=E2=80=9D when we try port 443.
>
> Is this supposed to work with OpenBMC on another platform?
>
>
>
> Thanks,
>
> Prafulla
>
>
>
> *From:* Rick Altherr [mailto:raltherr@google.com]
> *Sent:* Wednesday, July 27, 2016 1:20 PM
> *To:* Deuskar, Prafulla <prafulla.deuskar@intel.com>
> *Cc:* openbmc@lists.ozlabs.org
> *Subject:* Re: REST API support on AST 2500 EVB
>
>
>
> The daemon is probably running but skeleton hasn't been updated for the
> EVB.  I'd expect it to respond with mostly empty responses.
>
>
>
> On Wed, Jul 27, 2016 at 1:17 PM, Deuskar, Prafulla <
> prafulla.deuskar@intel.com> wrote:
>
> Hello =E2=80=93
>
>
>
> Does the OpenBMC code support REST API as documented here?
>
> https://github.com/openbmc/docs/blob/master/rest-api.md
>
>
>
> Looks like obmc-rest is running (according to =E2=80=9Cps=E2=80=9D) and t=
here are services
> listening on ports 22, 3000, 2200 and 443 (=E2=80=9Cnetstat =E2=80=93lntu=
=E2=80=9D).
>
>
>
> Any pointers appreciated.
>
>
>
> Thanks,
>
> Prafulla
>
>
>
>
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>
>

--94eb2c1461ceecf8d60538a796e4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I haven&#39;t personally used it as I only have a AST2500-=
EVB and have been focusing on kernel and image packaging.=C2=A0 It _should_=
 work on other platforms such as Barreleye.=C2=A0 That you are getting HTTP=
 responses says that the server is responding.=C2=A0 You might ask on IRC.<=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Jul =
27, 2016 at 3:26 PM, Deuskar, Prafulla <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:prafulla.deuskar@intel.com" target=3D"_blank">prafulla.deuskar@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_-7526023677510048349WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">We get =E2=80=9CHTTP/1.0 404 Not Foun=
d=E2=80=9D when trying to login to port 3000, =E2=80=9CHTTP/1.0 400 Bad Req=
uest=E2=80=9D when we try port 443.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Is this supposed to work with OpenBMC=
 on another platform?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Thanks,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Prafulla<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"m_-7526023677510048349______replyseparato=
r"></a><b><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,s=
ans-serif">From:</span></b><span style=3D"font-size:11.0pt;font-family:&quo=
t;Calibri&quot;,sans-serif"> Rick Altherr [mailto:<a href=3D"mailto:ralther=
r@google.com" target=3D"_blank">raltherr@google.com</a>]
<br>
<b>Sent:</b> Wednesday, July 27, 2016 1:20 PM<br>
<b>To:</b> Deuskar, Prafulla &lt;<a href=3D"mailto:prafulla.deuskar@intel.c=
om" target=3D"_blank">prafulla.deuskar@intel.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
<b>Subject:</b> Re: REST API support on AST 2500 EVB<u></u><u></u></span></=
p>
</div>
</div><div><div class=3D"h5">
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">The daemon is probably running but skeleton hasn&#39=
;t been updated for the EVB.=C2=A0 I&#39;d expect it to respond with mostly=
 empty responses.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">On Wed, Jul 27, 2016 at 1:17 PM, Deuskar, Prafulla &=
lt;<a href=3D"mailto:prafulla.deuskar@intel.com" target=3D"_blank">prafulla=
.deuskar@intel.com</a>&gt; wrote:<u></u><u></u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<div>
<div>
<p class=3D"MsoNormal">Hello =E2=80=93
<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Does the OpenBMC code support REST API as documented=
 here?<u></u><u></u></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/docs/blob/mast=
er/rest-api.md" target=3D"_blank">https://github.com/openbmc/docs/blob/mast=
er/rest-api.md</a><u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Looks like obmc-rest is running (according to =E2=80=
=9Cps=E2=80=9D) and there are services listening on ports 22, 3000, 2200 an=
d 443 (=E2=80=9Cnetstat =E2=80=93lntu=E2=80=9D).<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Any pointers appreciated.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
<p class=3D"MsoNormal">Prafulla<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><br>
_______________________________________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists=
.ozlabs.org</a><br>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" target=3D"_blank">htt=
ps://lists.ozlabs.org/listinfo/openbmc</a><u></u><u></u></p>
</blockquote>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div></div></div>
</div>
</div>

</blockquote></div><br></div>

--94eb2c1461ceecf8d60538a796e4--
