Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VE1Rl1oY"; 
 dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43BJSf47xzzDsy8
 for <openbmc@lists.ozlabs.org>; Sat,  8 Dec 2018 03:53:21 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id h25so3910826oig.1
 for <openbmc@lists.ozlabs.org>; Fri, 07 Dec 2018 08:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BlW+NJh3ULGPRuXLerFHWYaEZEOvg6x+Rb+H1ty3RJs=;
 b=VE1Rl1oY0ajE3HSlh0fIatRJij7WUUja/XlOwrQbW+EpF+VxPleVxIVjfnTqZdpkEZ
 5K+DQIVzfDw4gxm5a3MAOikqiY5Hp1+W9Ld9SpqX8bajBxenzHcCTbPujIRGSSZpAuy/
 HE8UqsowoZYSLGbnXoDosPn7PTmvzeaRMzXlS1lK8VR1YDWqinJpHKn60R0g6qII/eT7
 nxI81IjCKrLl/gzKWDcRGKQw5UUgbQZwksKlTxqHeH8WSzEanpV29VlFf9ZzSxLv/FSs
 YiJ8YW2Vqt6bYH7unJpm3sYguZN/F6zCr8quSy0d9BXjOkgejK8CMDKzJTNWaa4PXbJ6
 l+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BlW+NJh3ULGPRuXLerFHWYaEZEOvg6x+Rb+H1ty3RJs=;
 b=F8nmPVe4xnahsQ9VuD1RRHj4YXODI7MXskwM6yLNqeSSB8Hf6yAyk6Eka+Q6Z9Qp4M
 S5RqrO3eRIs7Yg1L/Gt/8aMwxzbb3KKFDpAYHklRNdHY+uAL7e5qx0QRwVYN9/2xSpr+
 xz8PagKB1R0Ax5OLM+/W6/jF45UVz+Ym37F25Da3uOrEy+b6R84u1ilr9KI4x6WXPOft
 DR8OLoHtiym6P6DefFhOJ3ha2XYBuwl+MwOf/KBFyz75r9N4+BRGdak3kRRZZFozM/kp
 fSj6GiIF9ycqhmPHNlNyV2xyv7Majm2vc8pmAlAgDkMSZXte699wPObQgYUuwbII/4oo
 6cag==
X-Gm-Message-State: AA+aEWYnjUkfhds8OaATJYZTVJQGM7suq4lg4Ry51SA9U7PoPnMFyPAr
 3zRCLFmAQTc8dw6Gjt3TkzpugLjXPDGbgPNG9czUHpz+
X-Google-Smtp-Source: AFSGD/Uiw8Mnc5K11PACGWZBDMfBnjgSY8JcyAq4VAEgqonu2wLlr3CiZXGTF77RUso0fbsqZZ1q/bzyaPTSibe0ReE=
X-Received: by 2002:aca:5587:: with SMTP id j129mr1706068oib.93.1544201599213; 
 Fri, 07 Dec 2018 08:53:19 -0800 (PST)
MIME-Version: 1.0
References: <b5a3f14c40c04288ab7347f707904f3c@HXTBJIDCEMVIW02.hxtcorp.net>
In-Reply-To: <b5a3f14c40c04288ab7347f707904f3c@HXTBJIDCEMVIW02.hxtcorp.net>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 7 Dec 2018 10:53:03 -0600
Message-ID: <CALLMt=qer2czu0h-fg07H8+kwfjK9htsQ50ob7URLWzQR60pWw@mail.gmail.com>
Subject: Re: How to enable bmcweb in openbmc
To: yao.yuan@hxt-semitech.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 07 Dec 2018 16:53:23 -0000

On Fri, Dec 7, 2018 at 2:57 AM Yuan, Yao <yao.yuan@hxt-semitech.com> wrote:
>
> Hi all,
>
> I=E2=80=99m new here and want to enable openbmc on my server.
>
> It seems the bmcweb server didn=E2=80=99t running on my openbmc or even n=
ot yet build the module in openbmc.
>
> So I think the bmcweb is not default build and running in openbmc.
>
> Do I need add some configure options or some others to support bmcweb in =
openbmc?

Hi, we're working on moving over to bmcweb as our default but not
quite there yet.
Take a look at https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-phosphor=
/+/12933/
You may be able to just cherry pick this in to get what you need.

>
> Thanks.
> Best Regards,
>
> Yao.
>
>
