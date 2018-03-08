Return-Path: <arndbergmann@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::243; helo=mail-qk0-x243.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QgasQSaK"; 
 dkim-atps=neutral
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zxnPw5NZtzF1h9
 for <openbmc@lists.ozlabs.org>; Thu,  8 Mar 2018 21:51:48 +1100 (AEDT)
Received: by mail-qk0-x243.google.com with SMTP id v124so6249473qkh.11
 for <openbmc@lists.ozlabs.org>; Thu, 08 Mar 2018 02:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=iQDzrLV5uNVYWLoA1h32F3O1Wz+fLk5iMgNUbqcm74A=;
 b=QgasQSaKOwuKgvll2DgoTmcbAAlacOFqLQzP3Ejvdb3pLf9gqkXP5bOdR5bgx5dvJq
 KR3ubV4uThjtzwlZp5L4AUOWwyjnnrJb4zA/ESC8LuNugd597ex7qTsfP3Q9Vr1Pcz43
 /SzBTzs6btWGd3LOZLrbhH+fhkgS8qq3PAguSW+1WB1Byul0LugSc+SuE1pdccjuKpBW
 pek2ENvorNhYc65h8nFNUiLEM2fGalHXeZuNobaWGRDeW5mBhVeC2gKuu2BttSITSjkR
 AksiBG/goNXiSKsTsNlNKHg52hdSNUHTtXYRV4B9xYrbvLcmq0+/lDyvgNk/RBK8Xan7
 aBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=iQDzrLV5uNVYWLoA1h32F3O1Wz+fLk5iMgNUbqcm74A=;
 b=pKdK/FfoY50DoB917AbyDLDoUk0ZVvbrPWtCO+J8PG+BRuJifJIRJA1wDLbOfJp5TE
 lBsh4ZPa2+0EmMI+7GnqE3YHtnWSU00uKxSuYcBtGvsbS6oWs5Jw73iDzW3KJcwOUySE
 fU6uJHNOVQdjjNWScmhXBv4sKYMETZqWPTK3R57VXHXpL9lQw3QXJCMLiGiYhKTb1kID
 EbLnHk849x8vZfR3j4qwKKcgX73/PUskAisL8VSX2/u/h6D/enMjF4LnCaHuWhgnsLGv
 SPQbkGcmFv5lTussVbgPxswQ6Li9jyKoS1YBCB6QC8sit7DXpTx2k9imLq7CFScI+BYH
 Vsbg==
X-Gm-Message-State: AElRT7G5O2O38xBx+p796Os0W0wVSrlNcaTxk49pIxqc1XTjIVND9p2M
 KZQCtRV5GaX/aLxPPtNWmshgYj8cw82XQlJBWSk=
X-Google-Smtp-Source: AG47ELuUXE8YAObBrMRipx/9AEP/9LcEXglHxU9lPc8h6tPROOameJmyGgmyqDQ15rVBGBYcex6D4zEpMUvxpSOOPaA=
X-Received: by 10.55.215.153 with SMTP id t25mr36103930qkt.343.1520506305993; 
 Thu, 08 Mar 2018 02:51:45 -0800 (PST)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.12.185.46 with HTTP; Thu, 8 Mar 2018 02:51:45 -0800 (PST)
In-Reply-To: <CAKKbWA5F29HJFOTNfVmt14Qg5rMgrLSsHjY4NQESZL6OKmA95w@mail.gmail.com>
References: <20180307162430.2664523-1-arnd@arndb.de>
 <20180307162430.2664523-2-arnd@arndb.de>
 <CACPK8XeVMSeQNkPNp1_vms97H_9rMuk1-DzUAc=s-7o=FmVncw@mail.gmail.com>
 <CAKKbWA5F29HJFOTNfVmt14Qg5rMgrLSsHjY4NQESZL6OKmA95w@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 8 Mar 2018 11:51:45 +0100
X-Google-Sender-Auth: _TPr3GpUACcAIUZ8KfPMho9Z5qs
Message-ID: <CAK8P3a3fCRAuBjLXbjzc+1rYJsW90TDN2URZ=sOHvRNB3kyd6Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: npcm: drop extraneous 'select' statements
To: Avi Fishman <avifishman70@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Mar 2018 10:51:49 -0000

On Thu, Mar 8, 2018 at 11:46 AM, Avi Fishman <avifishman70@gmail.com> wrote:
> So at least replace CACHE_L2X0 with MIGHT_HAVE_CACHE_L2X0 then
> CACHE_L2X0 will be selected by default and user can still remove it.

I looked at the other platforms for this one again, and found that most simply
select CONFIG_CACHE_L2X0 directly, so we probably want the same here
after all.

The ones that use MIGHT_HAVE_CACHE_L2X0 are the platforms
that have multiple SoCs in one family, and only some of them have an
L2X0. Is that the case here as well? Usually, the L2X0 is used with
Cortex-A9 and A5, rarely on older cores, and never on newer
ones.

       Arnd
