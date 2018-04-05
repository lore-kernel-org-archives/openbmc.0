Return-Path: <arndbergmann@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::22b; helo=mail-qk0-x22b.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YuQ6sYbA"; 
 dkim-atps=neutral
Received: from mail-qk0-x22b.google.com (mail-qk0-x22b.google.com
 [IPv6:2607:f8b0:400d:c09::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40HFBB4QkpzF1sR
 for <openbmc@lists.ozlabs.org>; Fri,  6 Apr 2018 06:42:10 +1000 (AEST)
Received: by mail-qk0-x22b.google.com with SMTP id p67so19298952qke.13
 for <openbmc@lists.ozlabs.org>; Thu, 05 Apr 2018 13:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=X3dehHXAt+3P26ry5biioESHxs2guhTNhFtPEDZY7Kw=;
 b=YuQ6sYbA8uPFCS4/VO97P1P9w3ckXDzHLoQSZy89tPhYpH+50MxE1yY0hgRBZuUFNV
 YJ08XCWLPEop7JbSzdRBInvzsVb2yYM/IrVZOLrVHLmsILaT+49xYytSFCXvxTo1EwCB
 eQhDoYWaQTYHG3e+pUKw3z+1U7t1kmFjoKK0dRCUvqybTxIaLZlCr4BztDruc3BtICZ2
 8414SAhqjGgfmE50B2+B3CyfKYY7zFJWvJN2LVqPwyAYp10+1akM4bO9SIHiWD1HtA23
 gJo1YZMBjUPqxFHClE5ta6dYrIsGWS8ubSOxRDkVr8yqPynPr/0ABFEpAiiWg3iSiXKv
 KoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=X3dehHXAt+3P26ry5biioESHxs2guhTNhFtPEDZY7Kw=;
 b=DpAya2slO79qweg5heR9Q0bionoLWF1b3i8fepFeEDjh3ynn/K75Ys4k4B3QJA4UeM
 GG3ABk/aIPNLCnq4XcUZJrUKoyr2bqnFqMdCgm3HWlsk/8WnH9E6ycSSNcIqNFpcEE5a
 F1m+96KPq8wM+d084+ocu6xQadYkYyob0ynzold5uOHQaS0UNf03w0h1ebPk3GbTFEYR
 hTHkcnO2yhOdWqzX5p/a2j0GFkz/yj/i9QsytRz1z8GiM/f7rL/Q52LiV8DP/YVt3aXU
 8OPm9JbmPr/BvrV/vCPRmbXFV30/WrKThEPNCDFB1+NnVdcHcab2Hu0QtX5aXuT5jjAu
 T+Rw==
X-Gm-Message-State: ALQs6tBogsh9IvWLi2M5yybprTFAXkGSFwkuuUjUAmH097sMhq89iowt
 lFKA8+iymP2yczdbR9X7u8oz255ZWgjm2bsi3uk=
X-Google-Smtp-Source: AIpwx49ZwpPPW+htnIfKa2e0fjr5wX3MbciDWLA/ysHrPkxixX5NfEuxKhHc8woDMB3OuGMc7I3bNORwnv8bRx8xQ7M=
X-Received: by 10.55.234.6 with SMTP id t6mr32669289qkj.291.1522960927686;
 Thu, 05 Apr 2018 13:42:07 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.12.185.25 with HTTP; Thu, 5 Apr 2018 13:42:06 -0700 (PDT)
In-Reply-To: <CAP6Zq1j9i0Zdt3wPCGLLnPZJPGf8BaG9Nh1pLAsnwczqWHtthQ@mail.gmail.com>
References: <1521155412-29229-1-git-send-email-tmaimon77@gmail.com>
 <1521155412-29229-3-git-send-email-tmaimon77@gmail.com>
 <CAFd5g44NOFRmQbDJfRLw_SwsHwVB-hxsUYMYSmkqeyRKmXqSqQ@mail.gmail.com>
 <CAP6Zq1jvCvM+uG8kU_JAYzm9e3BG28AS80ANmn_0a0HmiVBm3A@mail.gmail.com>
 <CAK8P3a3HBkqgas-QkAr_J767ffBMXJTJeqqVY9fFxw2Yexi27g@mail.gmail.com>
 <CAP6Zq1j9i0Zdt3wPCGLLnPZJPGf8BaG9Nh1pLAsnwczqWHtthQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 5 Apr 2018 22:42:06 +0200
X-Google-Sender-Auth: LLU4H9ShoGJJhg_E4nkL-jcxouU
Message-ID: <CAK8P3a1zvjc8EyXX+c4r++pVHrVQ84CSUrnMA=+9kf7FZojiGg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] arm: npcm: Enable L2 Cache in NPCM7xx
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Patrick Venture <venture@google.com>, 
 Avi Fishman <avifishman70@gmail.com>, Joel Stanley <joel@jms.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Nancy Yuen <yuenn@google.com>
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
X-List-Received-Date: Thu, 05 Apr 2018 20:42:11 -0000

On Thu, Apr 5, 2018 at 6:56 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> On 5 April 2018 at 15:54, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Fri, Mar 16, 2018 at 10:51 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> It seems that I have to add l2c_aux_val, l2c_aux_mask parameters to the
> DT_MACHINE_START
> to enable the L2 Cache.
>>
>>
>> The last email in that thread mentions
>> L310_AUX_CTRL_CACHE_REPLACE_RR, is that required after all?
>
>
> No it is not require this is why I added:
> .l2c_aux_val    = 0x0,
> .l2c_aux_mask   = ~0x0,
>
> Can I resend it on Sunday?

Yes, please resend it as soon as you have the time to improve the changelog,
no need to wait if you can do it right away. We can always merge bugfixes,
but doing it earlier rather than later is better.

      Arnd
