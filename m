Return-Path: <james.mihm@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c30; helo=mail-yw1-xc30.google.com;
 envelope-from=james.mihm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z35ximAI"; 
 dkim-atps=neutral
Received: from mail-yw1-xc30.google.com (mail-yw1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42ztMg74z6zF3ZN
 for <openbmc@lists.ozlabs.org>; Wed, 21 Nov 2018 04:42:52 +1100 (AEDT)
Received: by mail-yw1-xc30.google.com with SMTP id l200so1093682ywe.10
 for <openbmc@lists.ozlabs.org>; Tue, 20 Nov 2018 09:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2qYgXhlrwbhgrER4mAXTAErVDahTUmxDlCEUpWNdiXk=;
 b=Z35ximAIXRk/bUrmxiOh7qWpLZ5txSrFiQZOn1m9zfJbqguyONE+uCAueLz38/ZYGL
 6rH4dPtXsKeT15XLfxIdTGY19aQYyX4bFSYmubO+4LGMcGHplYDs/xWwbvXkS4hEJB+C
 fkEWODhIrcFFA2JkWUvWi2ZbLeT6cm75/T/3zJcgx4pZICXzAHeS99QNIoYtVZN0RMNL
 V7eqSxKO9dbNAGxhiwr/VJqKucUJdYTHg1Y2jygHjg7leUJXsO27P90KHCBU+YLCJcbs
 5Kz8HFan9zoWXkrSV14fybdvf1cb9jJmd8/A1dkLTz+duEQEnNrpgicFpVY8woAsIQnc
 5csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2qYgXhlrwbhgrER4mAXTAErVDahTUmxDlCEUpWNdiXk=;
 b=YCjWx0S/KV6vFfYufXMpfDoq81wWKGPvkE+2b9DPTL5EisjMtr+UQmZf8R/yMWvzbK
 WzryBpIPmVi7Bzb+vWGD7m9z1z0XmtMz/aKr3ilyL68zewc3rycq642Qt1zkqg+2MRyc
 t/h2TZenYNwAgkh3GAm7HXRUTD5IozlJULPWU7Hhb0f5/FqTqLeTckB1QBzUKc5PRq09
 YT2KZupRPheIOCd6dPpPzU6blx3OxoP6NdYc7kKMv+qqaqIFVODKCqLWMxd9tM+7FaTK
 2Jn3xSTtnXEiB+Uj+XFmEAbp1fBYSsXLE4UyoH48TXJN2FT6YgGJA3vtI3ztUVVSxuMx
 w1VQ==
X-Gm-Message-State: AGRZ1gL3/KtD8adA8fE2/n+U3NQQj6GIm1mk5NHT48xVOt2XBmMl+T0b
 bj8m2Nt9jn4pw2+q94P9/BQ1bngqaQORR6cvjwnYUIdB
X-Google-Smtp-Source: AJdET5dp+O+UyTda/0jfb8JDBhSF6WkV1hdg8PfwgCwElM/pQc594C9zNbszzu3XhcFVENJvq4TqMT4SknnPyPPtrBo=
X-Received: by 2002:a81:ac1d:: with SMTP id k29mr2976286ywh.457.1542735769304; 
 Tue, 20 Nov 2018 09:42:49 -0800 (PST)
MIME-Version: 1.0
References: <19fe4e16-c014-3af8-ac1f-a73b446b379e@yadro.com>
 <CADy_Pt1P0Yv_GmHyHPsv6Wx-ML4JoYQ-HhOhc0+Dx-wTiKx3WA@mail.gmail.com>
 <06f38ed2-8963-0834-c786-aeba40fa140d@yadro.com>
In-Reply-To: <06f38ed2-8963-0834-c786-aeba40fa140d@yadro.com>
From: James Mihm <james.mihm@gmail.com>
Date: Tue, 20 Nov 2018 09:42:12 -0800
Message-ID: <CADy_Pt0eQR5ZdRkjwc=5t4yB-YGbzfT9c=BFUrpgYnQ317rKZA@mail.gmail.com>
Subject: Re: IPMI Adopter's agreement
To: a.amelkin@yadro.com
Cc: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 20 Nov 2018 17:42:56 -0000

I've refreshed my question internally, and expect to get a response next week.
The person is out of the office until next week.

James.On Mon, Nov 19, 2018 at 4:35 AM Alexander Amelkin
<a.amelkin@yadro.com> wrote:
>
> Any further info on this?
>
> 26.06.2018 21:49, James Mihm wrote:
> > I'm looking into how we need to proceed regarding this question
> > internally here at Intel.
> >
> > James.
> > On Wed, Jun 20, 2018 at 9:33 AM Alexander Amelkin <a.amelkin@yadro.com> wrote:
> >> Just wondering, does OpenBMC / TLF have this fine document signed?
> >>
> >> https://www.intel.com/content/www/us/en/servers/ipmi/ipmi-home.html/#adopters
> >>
> >> Or does each vendor need to sign this separately?
> >>
> >>
> >> Sincerely,
> >> Alexander.
> >>
> >>
>
>
