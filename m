Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="HOtNaUpS"; 
 dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43g3Y522ZszDqkZ
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 10:38:01 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id k12so9350585qtf.7
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 15:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8pYv/ebkqiJa8HPsVZab9tMnDMCWTgU9DX8dnLb1FtY=;
 b=HOtNaUpSUVlOR0CDen5liRN3eFefRp4abf6ps9dmW5Hh3a6vdFNokHQNhRkrsrDG35
 zgkLZxBJQ9x39ZL41r0b9b52lFKQ4Rkgh5F8Wn2rMYI1z9u3a+ADhyaCa6rua90rIMFr
 y4/hrL0YyY3Kkq/gUKaIVyXbVQN5g8cjPB8ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8pYv/ebkqiJa8HPsVZab9tMnDMCWTgU9DX8dnLb1FtY=;
 b=iLfMeYbQf/zupNzoh94ockZtf6ktPanCCOUgAwSbeSa/kqylfhheadrXwityiO0VxW
 p8n7iv+RTDxpmQvc1J95h9QOuGy3dMsoUp0+QTl3MDsoPfK7cKwZhan6QbtMZpcXVNue
 mLr6679yVn/SKW6J5GauLizpliuh4thOCKjLHgQ3zR3FCuhVRFhLlJ1VEevQfGW/+1u0
 PpN37wXAGEj8zP0B2iZm+uF6tCluVs0VC5xuKjSl2hjXqhJJlXzoMb32GBeUF2mEsL5+
 5FuzjMlJawrPJ6AJhCYuVPHkV602ODbxHsjZQokWcmAJdq7Qfb4is+Y1Uk5TmdrOHFk+
 uTCg==
X-Gm-Message-State: AJcUukfdyGzmru+ppVaho0fjsBsdWiT/si/YfEYQB8Ed3CXO7hZZLklv
 CXNRHx1RlDOuLdfxG1oP+HEdaFkuZkqM9fEoY9/JHEHz
X-Google-Smtp-Source: ALg8bN6sFUaCAS3UgC7goX8+KOLGFx8BFj24ytypjIQvBvv0hxk1YGx+/i7TX+p0e0WoxGhatMgYm3Ua2r9b+ZG9rcg=
X-Received: by 2002:ac8:7308:: with SMTP id x8mr9426106qto.284.1547681878976; 
 Wed, 16 Jan 2019 15:37:58 -0800 (PST)
MIME-Version: 1.0
References: <20190116172615.203952-1-tmaimon77@gmail.com>
 <20190116172615.203952-2-tmaimon77@gmail.com>
In-Reply-To: <20190116172615.203952-2-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Jan 2019 10:37:47 +1100
Message-ID: <CACPK8Xfm1NHPLQ_Ep_4vL4=mSquOsKHg3ud4De0fsisc=achLg@mail.gmail.com>
Subject: Re: [linux dev-4.19 1/3] dt-binding: iio: Modify NPCM ADC
 documentation
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 16 Jan 2019 23:38:02 -0000

On Thu, 17 Jan 2019 at 04:26, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Removing unnecessary spaces in NPCM ADC documentation.

Series merged.

Try to avoid "Modify X" as your commit message, and instead say why
you're modifying the file. I tweaked them for you when applying in
this case.

Cheers,

Joel
