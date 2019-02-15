Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::132; helo=mail-it1-x132.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tYNHf/7d"; 
 dkim-atps=neutral
Received: from mail-it1-x132.google.com (mail-it1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4413ks1D4kzDqQG
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 17:48:52 +1100 (AEDT)
Received: by mail-it1-x132.google.com with SMTP id z7so21868185iti.0
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 22:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hr/cfAdKsD1AqsencqhQZREk1UeaSzHJTTfuf5lFTQw=;
 b=tYNHf/7dNllu92gMJIZjR4utSPtwHG/gcr5s568AvjnPJ83J5K6ayAq8FOeSbyZ1oe
 IvGYZkMEeBhyD6QduWaiacggLQ46dMbWb21NaylcmvLf9Cz+s4uqHwCWhkrCOxDq9vN1
 FMrCJyeZ5fc0q9dLW4rJr0+rOlcSx8xDDaakK76xH4qbfl/fjVZW0tN8A+q8AeUwvPMC
 rV5SGUyVWA3dZJCPmsriNEnvuCGwJbHzLJMw5Z1/IWbYSdo2r7Xg/mr489Syi8XCI/VL
 7nuQdbjrTUrqNMDWZ9/iufLU333qG9cLN1t1PUyoFv4PHxv1xKdMsw3BpkKFLd4IffEe
 XPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hr/cfAdKsD1AqsencqhQZREk1UeaSzHJTTfuf5lFTQw=;
 b=SGuHhdr0/WoqGwJisHFGcbN+Hqp8kP/vwAl6OxZCIQysq4okOLN7UCBt0NiricHpMV
 gGhxkUj9b1eWWZRyePydlpso5Agn4s2eGU1ktnlqmGpJ+p6MqMA1zeO3twMpOvnj7j8I
 UvNljMO/OIIcY/BswGXDieK8mVX+WqJE8ELeTmIIdm38v4ZWyZzsqvUZ2UOAwADWObSC
 Iw1bM4MvIQ7jdVOtsMKJyyi/y+qLKO7VwDXsmlazRPCqIB2JlbEcOXD5Gk1YernuJPN9
 18NIW84i9WNptTrC8UPt4hmCJGFJ2Px82T4TUYi5KZO11Z0JjYoDa4LpFFwurEC4Nmu3
 hIIw==
X-Gm-Message-State: AHQUAuYhq6+UD9CSdDIPD2qHHVi23PwUb7W+BcS+upuSZD11SMIx8RjQ
 shOl0C+WuX1LC3305bJG6wmhzj79Hc413PX7lJI5NXzQ
X-Google-Smtp-Source: AHgI3IbbHiDAA7DKoym6+BhP+jU2/01dy8WckD2CZlkcb/vKiPD0kEsd+tlTbiECHmaFyMvoE2DG1OAnZk2ocYP2mZQ=
X-Received: by 2002:a6b:8d55:: with SMTP id p82mr4672665iod.171.1550213330609; 
 Thu, 14 Feb 2019 22:48:50 -0800 (PST)
MIME-Version: 1.0
References: <CAARXrtmBsbJt7n_wmpg3nadtoJuz0bqbT9d9ijKL8bDTu+k+WA@mail.gmail.com>
 <CACPK8Xd-OX_zQtn5rtfRw+rXB+783hQSwc_PTmzMYr=SHaP5Tg@mail.gmail.com>
 <CAARXrtnjhLDez0vjXOxMGgNeNXPTZCBZZBa6Kk+U9=tkRJoKgg@mail.gmail.com>
 <3ddb6822-51ae-a613-f46c-bad4826d546e@yadro.com>
In-Reply-To: <3ddb6822-51ae-a613-f46c-bad4826d546e@yadro.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 15 Feb 2019 14:48:37 +0800
Message-ID: <CAARXrtmR1+akCu9u3QhDEU6+i8GRNgpxaJV2rwse-xy+vHUCFQ@mail.gmail.com>
Subject: Re: Romulus to use Virtual PNOR
To: Alexander Amelkin <a.amelkin@yadro.com>
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
X-List-Received-Date: Fri, 15 Feb 2019 06:48:54 -0000

> What's the problem with version and image verification?

By that, I mean there is no service on Romulus to implement the interface of
/xyz/openbmc_project/Software/Version.interface.yaml and no pnor code's
verification during code update as how Witherspoon does.

> The installed PNOR reports its version via IPMI FRU now, so we know the installed version.
Great! Could you kindly let me know how do you implement this?
