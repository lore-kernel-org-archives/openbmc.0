Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x22c.google.com (mail-yw0-x22c.google.com
 [IPv6:2607:f8b0:4002:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xCBBL1ydnzDrVQ
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 19:12:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KjoAOL4C"; 
 dkim-atps=neutral
Received: by mail-yw0-x22c.google.com with SMTP id x125so17742613ywa.0
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 02:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=td4RG25x9sFW9FnFFLZplLfowfYeVoSaF5LP1v8/Pkc=;
 b=KjoAOL4CoFjzCHuuu7G1f6uDVQgJM4pHflMpGGKN/wv+I+/7AbSNlksu+BDRNhh7oG
 AIv66WHdmknUMU2JbUxzH9axTi2XirdmfliDWrta5qSpkHS1AaRrEsX538tb/99a3ock
 ue9Yvut8Fu0tEBzh+1OWY4/PNLnImBf/xg4RfIu4yLO1/RPEauJ38KeGKoww1jegYneF
 QzKLkBjgWu1kDIRLHNS1hfq5hfuEy4IQC4ANeBroq+LMLsFiZdl8NOkRmTArZn/FJKKe
 WYX6o+uhzwF76qom+2hGnd0nN+P8/63B+OxfcjClYMziqMeARbVKtFLnaHbqb5btw47s
 ceuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=td4RG25x9sFW9FnFFLZplLfowfYeVoSaF5LP1v8/Pkc=;
 b=mV2Jc/jpqC8BC9VGWnXoAwABPHkzFykNdzZO8tFlZYtKX7u4PX2ftC9GthXnX1jBIT
 ELk6rdRVJvtbwXJlTP1Q9LXdSaqOrbOKp7DJSWX12kjrlqWuMZuip12+Xv8oBFDZ4hdU
 R4yWK9G/XZB2goSAHDuJama0F6mdG8+Va/xTFAG46WsNdhC1rFqPVGvG8wCfaXHV3CjE
 0bF0q8cJ0Vow+rWusaR6RhGdOABRLGHawPpJRizZjaM6sxCozdVASSIWvZ4zuYfgwJQ2
 /yL3DVoazOget00emm1BfcPq+1LFa0eOndUii88Bi3TLJCZtfmgukA1vJOZ5yeimobCr
 oXGA==
X-Gm-Message-State: AIVw110KNDB0+Dhn7i7y7glfUaw+5wrFJRoUwXerNgjVURpDbkezauUH
 ZvdX1TgPkyzoIeHwCbghS59nEswKGVaO
X-Received: by 10.129.201.4 with SMTP id o4mr1501364ywi.2.1500455544111; Wed,
 19 Jul 2017 02:12:24 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Wed, 19 Jul 2017 02:12:03 -0700 (PDT)
In-Reply-To: <1500354438-25577-1-git-send-email-mine260309@gmail.com>
References: <1500354438-25577-1-git-send-email-mine260309@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jul 2017 18:42:03 +0930
X-Google-Sender-Auth: Nls7T6xImLD_HXGk6LHR-kizlqE
Message-ID: <CACPK8XfC7cQsqHKez0hCn2e5RaCzwxwn3fXxP4oJ7JOvfn1vwQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: aspeed: palmetto: Fix FSI gpios
To: Lei YU <mine260309@gmail.com>
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
X-List-Received-Date: Wed, 19 Jul 2017 09:12:26 -0000

On Tue, Jul 18, 2017 at 2:37 PM, Lei YU <mine260309@gmail.com> wrote:
> Palmetto as P8 system still uses GPIO bit banging for FSI operations.
> So the gpio-fsi driver shall be disabled and GPIOH6 hog shall be added.
> Otherwise Palmetto fails to boot host.
>
> Signed-off-by: Lei YU <mine260309@gmail.com>

Thanks for hunting this down Lei. Applied to dev-4.10.

Cheers,

Joel
