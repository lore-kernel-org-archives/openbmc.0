Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x244.google.com (mail-ua0-x244.google.com
 [IPv6:2607:f8b0:400c:c08::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgPpt56cSzDsl3
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 17:18:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=kb5KEOZm; 
 dkim-atps=neutral
Received: by mail-ua0-x244.google.com with SMTP id 107so1080479uah.2
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 00:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=r9afplTERGQihjFuKb/gKYPsfgkj6qpBQb+wfGriRBA=;
 b=kb5KEOZmk65AT5t8kz8YNhoV1E+m95LtqNc1PtA9gpE+wq7v9xV4NCVw0PrKMpEYHm
 DWHK+WhGjUUfG9XNCWl9wHX4vgxaVrohhe3Hrr32LhXRrN5Pku49fbBQ4VwJogsaedzP
 /FzDDeRwcaebD9Sq2NCWeynl0R8qM+f9OSIMflYzbi65AKxB+oxiziYZ4G6T4xVDUZnO
 KJNwbjlbwcTrLvshCczHjudNXcuNQo/U07NQgLAEBIg+itcM5l5GRfIvDgfLxYSet1Ln
 FWeWb4iMRFW//JuwifnserFVgfqE91B8q8G2ny/2luzDx+Xem7hbHgpJ5FgNykw4zSJU
 aHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=r9afplTERGQihjFuKb/gKYPsfgkj6qpBQb+wfGriRBA=;
 b=Kmk3RvuizCpL1RFaRnGEllaiuyiD+PwmpvDAXmKnFOs7H1DQ3ryIH0VnpHzLj2Japw
 JthFgY0lyU85KTq3cSc5bbYU13xkz4CAP40jb3vZpyydy/V8iboVCRgh3ZSn4GyfHfJ3
 snXOpzmg0r3aVeJkfvPar2CpYDqpGZJGdBeZTVzndTiUM03atw5Lgb3s0QqeqjHEPKxm
 Qk+90xd1hrueOilkBMLc3XzMKuCsqCwRKevym76xJPu313Iw9lPxDT8qabom8lR47BV4
 jlMss9rcGo/7S59nQAPt0A20Mt3nVxhnY9yWZTuX/kyyek/SRpRY64mWQkkI4jpssl2r
 dvFg==
X-Gm-Message-State: AE9vXwNvwm7+Vh4mrQKFudUGYDxmjdERROjSVf/aaqpuxB+Qc6YrKYU6Hto7JxSFNBhfXaFUB877GaD7+106oQ==
X-Received: by 10.176.4.99 with SMTP id 90mr2619148uav.121.1474615108677; Fri,
 23 Sep 2016 00:18:28 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Fri, 23 Sep 2016 00:18:08 -0700 (PDT)
In-Reply-To: <1474058133-27363-16-git-send-email-tpearson@raptorengineering.com>
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
 <1474058133-27363-16-git-send-email-tpearson@raptorengineering.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 23 Sep 2016 16:48:08 +0930
X-Google-Sender-Auth: c56yE_iZ6qBQSOTGTzSzMba57YQ
Message-ID: <CACPK8XfxGufBZ-mcZDxkBNq9grZaU7036J4xTQXFqOPadKwPWA@mail.gmail.com>
Subject: Re: [PATCH 15/17] Enable vuart in Firestone DT
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 23 Sep 2016 07:18:31 -0000

On Sat, Sep 17, 2016 at 6:05 AM, Timothy Pearson
<tpearson@raptorengineering.com> wrote:
> This allows the "startup-hacks" service to load.
>
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>

Applied to dev-4.7 as 3723080882903fc43531867bdcedad7fe92e3f07.

Cheers,

Joel
