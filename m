Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="r7tDyzYF"; 
 dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44TCTJ2vQ4zDqJR
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 01:00:51 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id b65so1681837plb.6
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 07:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=D9JQB/gZcKeEY+x9ZHkS5a15wBSosHPyFeNlEB3j61E=;
 b=r7tDyzYFZfVwPTUmxiWVoA/vX6Dt1S8aZZvAEg3HzOa3CV/CTFhd9hGh5/i+AfJhBk
 BrvsqvRRxM9aAi63lSnhGS/DBlOrpOYRQRuZ9JD1VqHGAJ5rgBU2WP6mTcbSs1d2MR0X
 IXR9uLlXcfkhsfh9RLkmgs00KgpeV69zm2+i6uhKyOHIMp4Vfw+gLFvJN3lGeLcMMGWn
 yI6XVGTzZO3X8dRbjHWOBotVbK7lqL57L83ESJr4R+ik93dgIbvUwrxSHN9XT2W4xKNu
 yRUD3es7qf40Dk8eGHLi6uQTeTuzBeA8X7+8c9ksa98V6Lwo/jB/xOf9ExE7Z5B0uSQc
 7sNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D9JQB/gZcKeEY+x9ZHkS5a15wBSosHPyFeNlEB3j61E=;
 b=EQgG/1ZhOrx0aCicwZBJlV76h6Vfi8D+FXV+8B5PnJmf2bJAwRdycRO6SYVpz3w5FA
 Q7GGSZoyhfOIVTOknANF3vZys7iYl2teB1TtyaxX1z+q5F5qKIsSKqiQ7XG1G9yBb/RC
 tB+K7Kmhk9MAmpcajG9JityjgvOS1Xc4Irm52+fHn4GNgjzYZIFMcqAYOlNzHb9I6p2U
 2u9g59NHoR/0hxaoK9RUv31JgGSEiaOEwv72SbuA0qlRTT+zoZoAHIJS5fRqDIpzVBDn
 hph9PtGq269lW4j4VFD0XPHLCK8BocE8vohyTwZWmFt87KX7rfjmpVcYRuAzFr9sEadx
 fpGA==
X-Gm-Message-State: APjAAAUKCzcaGZaIWkjgDA7NQJyVK5e24OEPi8niv3e3IuJRG20q+UIN
 3iwxbSRJd+cBmjYL2tDbHHfOuUBA5jYwvW+sdYzRe2QmxYM=
X-Google-Smtp-Source: APXvYqznTfl8yq5Tgg3sO+eJb45B78nYTf0vBAP+i0CoV220tFR/kOk836ZCJvmCEcut9hLIUL/XYIpNph7aX1Kc4XQ=
X-Received: by 2002:a17:902:864b:: with SMTP id
 y11mr1185426plt.1.1553608848578; 
 Tue, 26 Mar 2019 07:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <75d8c71fe0684d6ebc3710bada61b79f@quantatw.com>
In-Reply-To: <75d8c71fe0684d6ebc3710bada61b79f@quantatw.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 26 Mar 2019 07:00:37 -0700
Message-ID: <CAO=notwZHO5St-L_Ke=fADi3nd-XJoSeGvYHpqymAG85-pPP-Q@mail.gmail.com>
Subject: Re: [phosphor-pid-control] discuss the code in /pid/buildjson.cpp
To: =?UTF-8?B?SGFuayBMaW91ICjlionmmYnnv7Ap?= <Hank.Liou@quantatw.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 26 Mar 2019 14:00:53 -0000

On Tue, Mar 26, 2019 at 5:54 AM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0) <Ha=
nk.Liou@quantatw.com> wrote:
>
> Hi all,
>
> Sorry for insufficient info about my question.
>
> I am reading the source code of /pid/buildjson.cpp in phosphor-pid-contro=
l.
>
>
> Is there an error in line 59 and 69? To be precise, I think j should be p=
 since only p has elements positiveHysteresis and negativeHysteresis.

Looks like it.  I'll submit a patchset.

>
> Sincerely,
>
> Hank Liou
> Quanta Computer Inc.
