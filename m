Return-Path: <raltherr@google.com>
Received: from mail-yw0-x22d.google.com (mail-yw0-x22d.google.com
 [IPv6:2607:f8b0:4002:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s05tw0dckzDqhL
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 06:19:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=k7ALpXmp; 
 dkim-atps=neutral
Received: by mail-yw0-x22d.google.com with SMTP id r9so68025842ywg.0
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 13:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ANvtMesA/2GgEx0OCihO/zyhhBTdswvcFSAIG++/oKg=;
 b=k7ALpXmpnTni/eXxoN2xx7CR26I/AHeiKA+s3MU0cYQctjTTCn3sTmN3fJoRpgQGpB
 dLLYo4taAxKGpdv/199dh6chTM5i/rYYjtn1qY4CuFN9aXIRMSHTScHHzIeXHz1XK3Cl
 etMQoWx+Eh/AoWVcApYiNBAVzZCbtN3TGZq0Z76QFjhBX4rUXvkHuVyw7dg1qSRrLT8k
 foU5lhnwjQFXcRfMvv5mB6TDq+k9410uBfNQWDCcXzevOM69B9iiNaC/C/ifskDB0zjg
 Fx7Iahr7pdPzeRlLpX+oCRoqeLqW69cQJcOFH5KcnIqm3kn4wSbnj6q7eIRXUgEL6fd1
 d+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ANvtMesA/2GgEx0OCihO/zyhhBTdswvcFSAIG++/oKg=;
 b=OBLGLqhMJeUNLhvFhgc0hlUUT+AtF1UvzAqHcQyFxpgV9IhdC+Ki7N1AQAW4uHlDqf
 xDThqy/MyOK+GQV07A0oNwb6fswdidsEN0AoohA3gaPdcEMujNAqVOVnmC2XEBIi8uY9
 R2CWQCCtTvjt4w+9i23/QN3UbPqVeoO8h1KgeIaTQTQtkKUYd359LPqpMsxjCErmf/k4
 rFjjgJkbR3CWL2imPx2uSEyyu8P2RKfRHJBAHMHziV8aa4VDkf8MSERE7+wcMZgugaMD
 vdwXuDcJXORsNOuMM75NLJccetbJ5IU1mM73eMvV/Mn1n8k5mSbAyPTZsOx+BKNveI0M
 ZiPQ==
X-Gm-Message-State: AEkoouvauX0W53SJmyU31VOw+s11oFAH2u1TDfBMKaVBewxNXv/LrKoxm6QJ9DLnSnAqklxLx8rNmULlZ9nBo0+R
X-Received: by 10.37.223.7 with SMTP id w7mr16214074ybg.27.1469650773214; Wed,
 27 Jul 2016 13:19:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.197.148 with HTTP; Wed, 27 Jul 2016 13:19:32 -0700 (PDT)
In-Reply-To: <86BC2638B1D5DA48B2AEFCA5BCA462667134F6D9@ORSMSX115.amr.corp.intel.com>
References: <86BC2638B1D5DA48B2AEFCA5BCA462667134F6D9@ORSMSX115.amr.corp.intel.com>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 27 Jul 2016 13:19:32 -0700
Message-ID: <CAPLgG==6C_JOvE=ZkeVNYOYS1K=Qo-GaRwAnkqrBSoCJEY5k2A@mail.gmail.com>
Subject: Re: REST API support on AST 2500 EVB
To: "Deuskar, Prafulla" <prafulla.deuskar@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c089074487c790538a3bc64
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
X-List-Received-Date: Wed, 27 Jul 2016 20:19:36 -0000

--94eb2c089074487c790538a3bc64
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The daemon is probably running but skeleton hasn't been updated for the
EVB.  I'd expect it to respond with mostly empty responses.

On Wed, Jul 27, 2016 at 1:17 PM, Deuskar, Prafulla <
prafulla.deuskar@intel.com> wrote:

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
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>

--94eb2c089074487c790538a3bc64
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The daemon is probably running but skeleton hasn&#39;t bee=
n updated for the EVB.=C2=A0 I&#39;d expect it to respond with mostly empty=
 responses.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jul 27, 2016 at 1:17 PM, Deuskar, Prafulla <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:prafulla.deuskar@intel.com" target=3D"_blank">prafulla.deus=
kar@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"m_-1251437100260258598WordSection1">
<p class=3D"MsoNormal">Hello =E2=80=93 <u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Does the OpenBMC code support REST API as documented=
 here?<u></u><u></u></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/docs/blob/mast=
er/rest-api.md" target=3D"_blank">https://github.com/openbmc/docs/blob/mast=
er/rest-api.md</a><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Looks like obmc-rest is running (according to =E2=80=
=9Cps=E2=80=9D) and there are services listening on ports 22, 3000, 2200 an=
d 443 (=E2=80=9Cnetstat =E2=80=93lntu=E2=80=9D).<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Any pointers appreciated.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
<p class=3D"MsoNormal">Prafulla<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>

<br>_______________________________________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/listinfo/openbmc</a><br>
<br></blockquote></div><br></div>

--94eb2c089074487c790538a3bc64--
