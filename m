Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nzU7P13T"; 
 dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43VCjD2zMtzDqJ2
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jan 2019 01:14:24 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id 81so26765226otj.2
 for <openbmc@lists.ozlabs.org>; Wed, 02 Jan 2019 06:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SPQLU1PXCc8CLhO+FHiBfyUBEu2yVHinLSwarK/kKGU=;
 b=nzU7P13T5tv7iKAIkGMhkk8e4wcb+vwKCoyOU7e3H0+cAO82pdlBEjA5RoZyyHi7of
 Ev6EEsFmvu7NRwDff7HDS1w5z9Iz5P5n7wczzyD9hFNVy6AtU1muTfGvtz5tfPWAz+nm
 YJjwb1EJGDJ6XQezbDeR+kw5rrrbI3NZxasHknQCxgdNj0PIII0L/NvflGWbgR8l78lN
 /vfAVwKy22splkSEYH/9HE3cuRGh8YEUuQMd41PxTfX+bCEkS//gzcMCXE/zwLAJfPPK
 uXWmuiZ/QWgXWtey/n5+lJ0FqRqyS4Fj65/J92N1RUX3Yexd4xwhsZCeK1/utfJo12Qy
 YmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SPQLU1PXCc8CLhO+FHiBfyUBEu2yVHinLSwarK/kKGU=;
 b=POxYEZnS7oSQqUmZARRE55MByQ3j2x7HmhJFMqGuAjufWdDKbXRU8hD+Xx3dXcBq0i
 swe0ALfV0NZMZLo1oXlZ50/HBrMCkyx3hpO0T9+xL//Z4iLe4FWCHMkdMZfpycBFtcTb
 gR93DQHIKoC1D1vmrElLmM5Ibw1xqnu13OIl0iJWhO1XowipQj2DtuRvNj2Rfa+ubO2m
 X8IYOJ2GKVFoLxNKsk7V6RBLLbHf/eAvwt/3G8AQvLRmKciL2CYDc/3BA8wtqnRffWyO
 YSqb4AAzO8dhxTkrvHf0q2k1tibFLq08aPFAMJIJU7jFCy73t0WaPtk04fKT0kkiPJM/
 Y7Dw==
X-Gm-Message-State: AJcUukdmbhUAXoCi3K1ZgxDdsuZaLKR7ugJn8KFoXIDUwFXSJcIZ9Ggi
 roJ534SjaktRY31yBOCtkWgC6prDJdTr5VTjoT8=
X-Google-Smtp-Source: ALg8bN76ViKkDbEWGl0ObiT5oe3GpFWUcqo+rKGUrZuROWtWrT7Ki45Uam4vMNP1yx1R6fA0awgML5UzDrF8vV+Zu5o=
X-Received: by 2002:a9d:71c9:: with SMTP id z9mr32005452otj.294.1546438461501; 
 Wed, 02 Jan 2019 06:14:21 -0800 (PST)
MIME-Version: 1.0
References: <00aad438-fff2-4e09-825c-292304d87f6d@Spark>
In-Reply-To: <00aad438-fff2-4e09-825c-292304d87f6d@Spark>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 2 Jan 2019 08:14:05 -0600
Message-ID: <CALLMt=r1UEwRsEzOcwhWZ2v6EP22Gfw0m-57EG_ZYf39nFg5CA@mail.gmail.com>
Subject: Re: [Help] Could not recvie gerrit register verification email
To: Samuel.Jiang@quantatw.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Buddy.Huang@quantatw.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 02 Jan 2019 14:14:25 -0000

On Fri, Dec 28, 2018 at 3:06 AM Samuel Jiang (=E6=B1=9F=E9=A8=8F=E5=85=88)
<Samuel.Jiang@quantatw.com> wrote:
>
> Dear openBMC Gerrit managers,
>
> I register new Gerrit account and sent verify mail request yesterday unti=
l now still not received any verification email.
>
> I confirmed our mail server never receive and didn't set any policy.
>
> Please help us check if any policy setting caused this problem.

Hi Samuel, can you please verify you followed the steps in
https://github.com/openbmc/docs/blob/master/development/gerrit-setup.md?

You're statement about registering a new account is a little
concerning, you shouldn't be
registering a new gerrit account, you should be linking your github one.

>
> Thanks,
>
> Samuel Jiang
