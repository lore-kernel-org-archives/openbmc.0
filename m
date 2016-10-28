Return-Path: <raltherr@google.com>
Received: from mail-yw0-x232.google.com (mail-yw0-x232.google.com
 [IPv6:2607:f8b0:4002:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t4lFb5l7TzDvQC
 for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2016 11:37:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=K9d/YpgB; 
 dkim-atps=neutral
Received: by mail-yw0-x232.google.com with SMTP id p22so51244754ywe.0
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 17:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=TNBadiU2agyExF4Xiyd8PxszAe+AHrDhWpTH7zbHF74=;
 b=K9d/YpgBH0VslV0PHdZR05wj5JW6YEG8ibWhhf8GQXI8EqAuJ9YC8VP72wIu33RddY
 omNZMWEwGuskzEGf8vJoFeADt9lTwSZAe20Y1s3CSiCCK8A59t0gb73mus5NGqhkvcMa
 HKdn2N1SOEXG5fU9R1UQYcewLDXe5hkzkuN6V72f4f2CMgzd0ENiTzdDpu+4+SUrsMLh
 3Zn2zYv+OZwcM+91sbiFylsiFuH5Y+4RP2dDCtkgLVz/NHbCYY9ovfd8eoLrR7AH4s5p
 EaQLlQkzknzqxZHB+pAH66GqMEKBsFiwjlS7nmJRgcIl/CQOVRnLbvlGJT2DrqAOnzr1
 9PVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=TNBadiU2agyExF4Xiyd8PxszAe+AHrDhWpTH7zbHF74=;
 b=RgVuDZWSfjWVHcT4s3Cf/aSqDxRETsozG527x++UVY9qZevbKLff6O8yShLQEvztfq
 vnbbVmFG60kDtaxbaMLX3qI9rOdPC6fYDXW2ol9LFdJT3MMZVIxzjOwYg/g//s5qyyHx
 4kxRQd3NSeEWw/Vav3xvX4qT6//CAW3nM5V3VuMOI6XaWDe/CekXMX9L496RIbtZlOhh
 U8eJWYojCRbN3x3VOeHFSg6h60j1KiAVV4cvdGw/brXDyj58aJgObQmDgQ/m+qb5cJtc
 8s5hiGCWmLZsUzBV3j1pptR097+4CO/LSKAY4AGPTasxRvfYpbWYbABLVZCFnqLNvGVA
 77VA==
X-Gm-Message-State: ABUngvcIlv/JFsqxvrEnEG8nwhwqPLIuhJ1d3OTDps95sNKbrd7IWc0fZxzqBHsuF0kLUNIXxbs+B+WnTlvnbaIS
X-Received: by 10.13.244.65 with SMTP id d62mr9659436ywf.117.1477615024303;
 Thu, 27 Oct 2016 17:37:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.160.4 with HTTP; Thu, 27 Oct 2016 17:37:03 -0700 (PDT)
In-Reply-To: <1477611622-28120-1-git-send-email-jaghu@google.com>
References: <1477611622-28120-1-git-send-email-jaghu@google.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 27 Oct 2016 17:37:03 -0700
Message-ID: <CAPLgG=mLquJBFOCvxgCWmtOxaFUBB4Tw-0p9rj=3t947xDPJoQ@mail.gmail.com>
Subject: Re: Aspeed PWM driver support
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c030b6ca3ffa7053fe20efb
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
X-List-Received-Date: Fri, 28 Oct 2016 00:37:08 -0000

--94eb2c030b6ca3ffa7053fe20efb
Content-Type: text/plain; charset=UTF-8

This cover letter doesn't have the normal formatting.  Are you using
--cover-letter with 'git send-email'?

On Thu, Oct 27, 2016 at 4:40 PM, Jaghathiswari Rankappagounder Natarajan <
jaghu@google.com> wrote:

> Included :
> Aspeed PWM controller driver
> Aspeed PWM device driver
>
> Todo:
> Aspeed FAn tacho driver
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>

--94eb2c030b6ca3ffa7053fe20efb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This cover letter doesn&#39;t have the normal formatt=
ing.=C2=A0 Are you using --cover-letter with &#39;git send-email&#39;?</div=
></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Oc=
t 27, 2016 at 4:40 PM, Jaghathiswari Rankappagounder Natarajan <span dir=3D=
"ltr">&lt;<a href=3D"mailto:jaghu@google.com" target=3D"_blank">jaghu@googl=
e.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Included :<br=
>
Aspeed PWM controller driver<br>
Aspeed PWM device driver<br>
<br>
Todo:<br>
Aspeed FAn tacho driver<br>
<br>
______________________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
</blockquote></div><br></div>

--94eb2c030b6ca3ffa7053fe20efb--
