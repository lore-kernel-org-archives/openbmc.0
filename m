Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::233; helo=mail-qt0-x233.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="F3/fgNSg"; 
 dkim-atps=neutral
Received: from mail-qt0-x233.google.com (mail-qt0-x233.google.com
 [IPv6:2607:f8b0:400d:c0d::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zbVpf1yd0zF10M
 for <openbmc@lists.ozlabs.org>; Wed,  7 Feb 2018 03:51:22 +1100 (AEDT)
Received: by mail-qt0-x233.google.com with SMTP id f4so3125087qtj.6
 for <openbmc@lists.ozlabs.org>; Tue, 06 Feb 2018 08:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=T3SyxRgtE6yuDUeZLdcHzeRnPkKAvfvdgXODFL510Uo=;
 b=F3/fgNSgE5wv5FvgQHohbqLtJkIC9jH43T+uaAGrbPqYnJTdPLafB/0zKcZEJwVHao
 tO003z4+iP4TxvEnpOlaiP32CQ7NqxajZoqqSztuuaRKAxvmVEDAPcSvlIuY10N1o8Wc
 e3sq2f7dsySo1My7VBi80fwrLZJB3eb8QQLESAKdRW2hIjxPYH62g6Hf41tZhyjIJUfQ
 Uc0DelFkS3mwBs3JMY1wf3GovzCkfp0U3Md8uwZyoURwgRFNHxjCkM7w2d92gWpbGjRm
 dCeMYYlr4mcGNxql9ziF51ZLSWwc2R0yUPupApP/Zb4ZhoCSyFa1hyIy6Y1tQv+ckD0H
 pJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=T3SyxRgtE6yuDUeZLdcHzeRnPkKAvfvdgXODFL510Uo=;
 b=fUQohEoVUn7SeiQCIVlufCVqdpUYKSzcgz4yaQyH1tPxiuWBQ9CV0iuxH129BckFKB
 HL3y8UuZDUpc5IuM+DzWZtAKqCGh8wfs9xL/QpRcae7aCB9wOnzO0s8lKmWzqXQDNYM4
 E2dUQtxdql82xCOBuOtw3RpA3CJCKUubGuI97gLircetD2UMaKC9MgJ2o6OGHPma7xcz
 T8vzZK0BMnt9aB+fZedorT4yUEu1HJ95AHuh4pvjGODFiisckNF6trnImbykOgdnv55z
 Kq9c6/2jDVs61udyxRHRNtRc3yJqHi6KjF8loTxhRpepzocuM9H20XO1vw/RqNEoklG2
 AD9g==
X-Gm-Message-State: APf1xPCWfT7E2iHKlOdyweiz8Vu8Kw5JuIo69xuv1VzAZ6y2xa7qZVUz
 2YkENECFdmtl+be5fbdDDYdXOJkFjHRFNnaGYxE=
X-Google-Smtp-Source: AH8x226HgEGsIgJDCMglRuhYSuT4lxUPqfSwOKdykTufTMiBPD+iRPa5MSHpUKmIX6xQedUMYJVdf1o7v0pqw2xknuM=
X-Received: by 10.200.82.149 with SMTP id s21mr4592253qtn.50.1517935879504;
 Tue, 06 Feb 2018 08:51:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.99.76 with HTTP; Tue, 6 Feb 2018 08:51:18 -0800 (PST)
In-Reply-To: <85041309-7126-4E08-9767-868CCEFEE5DF@fuzziesquirrel.com>
References: <85041309-7126-4E08-9767-868CCEFEE5DF@fuzziesquirrel.com>
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Tue, 6 Feb 2018 10:51:18 -0600
Message-ID: <CAG5OiwiOCps=fY1FcSmLq1nmBybmorw7aN4OzFotz2GE7Ju-oA@mail.gmail.com>
Subject: Re: OpenBMC 2/5 community telecon - Call for Topics
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="f4f5e80c3050e3c66805648dfc6c"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Feb 2018 16:51:23 -0000

--f4f5e80c3050e3c66805648dfc6c
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 1, 2018 at 12:15 PM, Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> Agenda:
>
> Continue the discussion on BMC redundancy
>
> At the end of the call yesterday, someone mentioned creating a wiki. Where
will that live? I've been looking at the same.

Kurt Taylor (krtaylor)

--f4f5e80c3050e3c66805648dfc6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
On Thu, Feb 1, 2018 at 12:15 PM, Brad Bishop <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bradleyb@fuzziesquirrel.com" target=3D"_blank">bradleyb@fuzziesq=
uirrel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Agenda:<=
br>
<br>
Continue the discussion on BMC redundancy<br>
<br></blockquote><div>At the end of the call yesterday, someone mentioned c=
reating a wiki. Where will that live? I&#39;ve been looking at the same.<br=
><br></div><div>Kurt Taylor (krtaylor) <br></div></div><br></div></div>

--f4f5e80c3050e3c66805648dfc6c--
