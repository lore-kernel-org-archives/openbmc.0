Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::234; helo=mail-lf0-x234.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XLmvPokv"; 
 dkim-atps=neutral
Received: from mail-lf0-x234.google.com (mail-lf0-x234.google.com
 [IPv6:2a00:1450:4010:c07::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xrxm13wNJzDqyG
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 17:50:09 +1000 (AEST)
Received: by mail-lf0-x234.google.com with SMTP id m199so24161352lfe.3
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 00:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=VpENUU4nrVLD9lLzCpHBwKv/Og5o6gw4JNbeqwS6zEg=;
 b=XLmvPokvCDuKHMdggJQicFoYEYf3nHpAzzPgSguWassX1+nVJmddvJ4yKweXR/+dxo
 RpRJZiuWnpQv9tHHhfa62l2rTzbOBO6BvQIPKO8CW9WJzDy2LLCMS5iw8jzYjSiHaaKV
 qVqApbrRvttp5yDicStRT/bukBthmNPuaD1REOhk8xtocU4ufNhtsQ7pNBb30YX352MT
 HQ2H4XmMZ767An3XR/CHA5c/kd9CWyFQjzKuQArLqrTwxmK+cLOOh+LBOIzitaG10SN+
 H/L+C+IvSxA9melHMdy5SThXakKttKAkg8K4UO9JHZhQUgxUPu3mBRhNAdZL55TfZkt0
 l1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=VpENUU4nrVLD9lLzCpHBwKv/Og5o6gw4JNbeqwS6zEg=;
 b=D+XLHWiIWuas+oUnqfV9Rkom1BHNShF8MvPU22gf+q0rKR+pO/SArPb/4kVxBVGOue
 P+PE2D2dgrQ5QlHh7Ms/FHeLJREkBmHAcoDuIq99NMICf68VVWmr519n0YhSHElaeqWY
 KAcac4+htlKwNUGAhBTiaQMiIdDtohqXhFre4YJYatGIMxe2Fe+iAvQey6t/Ew33DtL7
 OPp4fCmGd2o3m1D2jI+qBdmjJgtxzHoR5jlBd1n/a02TImeF7VHJcBQk4kpxsEZj2GOI
 DJVm0zV+3bwLvr/Hn7DlVmSskrquubIda72Ci8fHBQYN2ftmshTqgrAR/4k451LKV/GM
 X10g==
X-Gm-Message-State: AHPjjUhTfPsl129jWZQ0U3oVd70ri+zooMcRz2caDMdChl25D1lwa0VE
 Jg6eeZ0is57OJn2K2u44ENPGgNhW+NKhvoM=
X-Google-Smtp-Source: AOwi7QDklD2Zb2MY/RkeMw8cYUGAMt2rg0awgd+vspxxHN4AHM4DZDMIBcZLlNvmRsfSYUEP899Crm5XUeYW2N3agGw=
X-Received: by 10.25.181.5 with SMTP id e5mr4061360lff.42.1505202606229; Tue,
 12 Sep 2017 00:50:06 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.103.82 with HTTP; Tue, 12 Sep 2017 00:49:45 -0700 (PDT)
In-Reply-To: <20170908215728.115818-4-xow@google.com>
References: <20170908215728.115818-4-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 12 Sep 2017 17:49:45 +1000
X-Google-Sender-Auth: -ww0bWgTFUI1pv3glFDsn62gCx4
Message-ID: <CACPK8XdwYxKsPt9a3nNqmxUnCQvB6eEaRFvLgc0JAyfgOhpVkw@mail.gmail.com>
Subject: Re: [linux, 3/5] ARM: dts: aspeed: add LPC snoop device bindings for
 ASPEED G5
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 12 Sep 2017 07:50:10 -0000

On Sat, Sep 9, 2017 at 7:57 AM, Xo Wang <xow@google.com> wrote:
> From: Robert Lippert <rlippert@google.com>
>
> Signed-off-by: Robert Lippert <rlippert@google.com>
> Signed-off-by: Xo Wang <xow@google.com>

Applied to dev-4.10,

Cheers,

Joel
