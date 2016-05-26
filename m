Return-Path: <raltherr@google.com>
Received: from mail-ig0-x230.google.com (mail-ig0-x230.google.com
 [IPv6:2607:f8b0:4001:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rFXHJ1jpmzDqKM
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 11:53:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=StdlzYbf; 
 dkim-atps=neutral
Received: by mail-ig0-x230.google.com with SMTP id fh2so39608577igd.1
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 18:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=JeM4thRB39O1KkMACnmXwG13B35bpC6v+tCsxy+2exA=;
 b=StdlzYbfHjE5ENW92lsxrJVrtOkdXPuB3EDKC/OWy60RYGx0nPICCwFNJhj0+Q4jts
 smkqtHWY0e5kptZWK7Gvt9CkvGLUTGFYXCbon7w+IthHM1eOCBo5ypYTtRj9Mv7HLezr
 TPa3iW7yj2nhYhirDZYZ5amaNwbKHO7sKM7TKqRmkMTVi6H2Knm2EuZbtmaTPBMX0aJ6
 0mXBMMgK/g5Zv5epbd1DZjgH8fyu94X92XNBAqQ58i/8+ZuHTStw5ajstPaowwdtGfi4
 e8wcAZ2UAdIrdJkba1lEurWk59IAC8nspJJNFxDV0ol8BR7MSqdT9yCBDHBrfJbOaudX
 hIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=JeM4thRB39O1KkMACnmXwG13B35bpC6v+tCsxy+2exA=;
 b=CMj+EgcybspM5Omp28Iu4HbQ0lC4p21Vqc28jXikGhSKS+YIKAFIIjQDB0RpgQAjvw
 /yND3+JkGPZg6jOkF8BqlllaU7RVTB2ZP8StrhbYET/94r0PEBOSggQD3VCFWCkgVIhS
 A4DJESlmCLE6i9E5O0QPyIIUtS2wQTz/KeugXVWbAeRT7qs68D2UnLM1ir5v6h4V9ffb
 jSlaC0wW01IUcep+Y/UzyzxBUDvPVeFW6okGQ3Nf5Uac5uWsThv9C0QAJ5Wnlg8k+cRD
 DjJNdsrJ+HgTH7nGEOYG8bNSOHLLQWhhv7Eng/Fo0G5s9gS50ZzjVb4eYz6kISGUH3vc
 4cPA==
X-Gm-Message-State: ALyK8tKVf4dFVx/2cijLoaT2bzyo/nBC1hNmg0ZoBwkC3BdL7L1C2Cs6eExhyYLPmtbyD6ck4bBs0lU2Bgo4TYXG
X-Received: by 10.50.88.36 with SMTP id bd4mr829580igb.23.1464227608543; Wed,
 25 May 2016 18:53:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.63.164 with HTTP; Wed, 25 May 2016 18:53:27 -0700 (PDT)
In-Reply-To: <1464227463.8430.28.camel@aj.id.au>
References: <1464223026-8881-1-git-send-email-raltherr@google.com>
 <1464225896.8430.21.camel@aj.id.au>
 <CAPLgG=nmaLuLuF-xuMQbpjHaNg2b8eUZwQSoY2B=GpRHhWWX8Q@mail.gmail.com>
 <1464227463.8430.28.camel@aj.id.au>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 25 May 2016 18:53:27 -0700
Message-ID: <CAPLgG=kRK06EMKaJOTbnc_schry=7fqCw7k-3vcbPAk_i0zreA@mail.gmail.com>
Subject: Re: [PATCH] Fix i2c-tools SRCURI syntax
To: andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org, Patrick Williams <patrick@stwcx.xyz>,
 nkskjames@gmail.com
Content-Type: multipart/alternative; boundary=089e013cc0307ab42e0533b50e22
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
X-List-Received-Date: Thu, 26 May 2016 01:53:32 -0000

--089e013cc0307ab42e0533b50e22
Content-Type: text/plain; charset=UTF-8

Not a big deal.

On Wed, May 25, 2016 at 6:51 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Hi Rick,
>
> On Wed, 2016-05-25 at 18:41 -0700, Rick Altherr wrote:
> > Shall I resend this patch as a pull request?
>
> That's probably the best thing to do if it's not too much fuss for you.
> Either Patrick or Norm (both CC'ed now) will merge it, so maybe they
> can weigh in?
>
> Andrew

--089e013cc0307ab42e0533b50e22
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Not a big deal.</div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On Wed, May 25, 2016 at 6:51 PM, Andrew Jeffery <span =
dir=3D"ltr">&lt;<a href=3D"mailto:andrew@aj.id.au" target=3D"_blank">andrew=
@aj.id.au</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Rick,=
<br>
<span class=3D""><br>
On Wed, 2016-05-25 at 18:41 -0700, Rick Altherr wrote:<br>
&gt; Shall I resend this patch as a pull request?<br>
<br>
</span>That&#39;s probably the best thing to do if it&#39;s not too much fu=
ss for you.<br>
Either Patrick or Norm (both CC&#39;ed now) will merge it, so maybe they<br=
>
can weigh in?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Andrew</font></span></blockquote></div><br></div>

--089e013cc0307ab42e0533b50e22--
