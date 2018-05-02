Return-Path: <tali.perry1@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::234; helo=mail-lf0-x234.google.com;
 envelope-from=tali.perry1@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lq8EvBGx"; 
 dkim-atps=neutral
Received: from mail-lf0-x234.google.com (mail-lf0-x234.google.com
 [IPv6:2a00:1450:4010:c07::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40bXlv28xZzF2SW
 for <openbmc@lists.ozlabs.org>; Wed,  2 May 2018 19:19:19 +1000 (AEST)
Received: by mail-lf0-x234.google.com with SMTP id u21-v6so19798931lfu.9
 for <openbmc@lists.ozlabs.org>; Wed, 02 May 2018 02:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=mNPYjNXLU/subMCvjtl7xs2V/fqljL0jjga/YY7+OSw=;
 b=Lq8EvBGxhXV3lsEwea818rB3qFAT0iJ87QmLjFwx+QgLnSEpkap1U3hWg1esgiP1r3
 Ai02XLNrnVd21RDEvsdc+hjAh5ruqLqzPuw432Xjb7uKiAidA3DXBi0GQgknpG5C9xxd
 zGXLWeu+R9txkGRovwmeyaCRzUOz8lxTON7t5MuVkNRaeTyQs5UCLvgO+tuW+YsOgR0r
 h3WcQ+AwiNUChZyPj9Qpkb+uzwRZdVdNZUxC0PIA82+sjOnwMtOO8rm9e9ntMt4ZGIie
 wZETgxbt2DlK5mYwXoIZfVPMXb8iVFBlqVeIKgVhv8JJ+D4Mr88Y7V47BMWhTC3DuHbO
 6jdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=mNPYjNXLU/subMCvjtl7xs2V/fqljL0jjga/YY7+OSw=;
 b=NhsE6M88XGDPyhbLOHQ4S3w9PKwT5VLL2k9ceA5Zg5Vq2V8fNwG/Fl0WtU3p/FjnVY
 FS8ofR13tdCXtOqUUwx2+fMu2jZ+lCjNZxEB2AzBWQHClYvKYiSq6Xs1Jzwr7n/Upfex
 54DDj55UDI3l7A8mX0Q1BmIkAwdPpw4dF8WDvuRcpBYzLESyxCPKvJ0o77gaZMfY2fuv
 pbzio8ktybuzgyhER1e7mF9wfRbcp2QFC1OVCVyth8kL6+Gp/bJXN86LaHeoaxdpubhc
 y2I7b4enJbAkICX3NqEyxYzTI3kRnlEaxEaWeBrYtqHPm4df7z73UG94sD7bHMcEbKTz
 R/Mw==
X-Gm-Message-State: ALQs6tDjCRNs5H1hW9qq0oVm/D1vWxFlTIksEYYx5cOaVoqFqGNaKFV8
 H2rDUNxveeo+2T9Ah69xu//pf/zX5cf0T6Z2WV8=
X-Google-Smtp-Source: AB8JxZqFDagECxb9Fg8hSiIVLIjKn0k5sGPDKpxllzoYYt5Dpxqa0gSdFZD9Bjtovod7oYZ4xYO6r36htd/oN6MP4UI=
X-Received: by 2002:a19:690e:: with SMTP id
 e14-v6mr10973897lfc.44.1525252755953; 
 Wed, 02 May 2018 02:19:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:101f:0:0:0:0:0 with HTTP;
 Wed, 2 May 2018 02:19:15 -0700 (PDT)
In-Reply-To: <152521142011.138124.3008284989746799940@swboyd.mtv.corp.google.com>
References: <1524741668-158135-1-git-send-email-weiyongjun1@huawei.com>
 <152521142011.138124.3008284989746799940@swboyd.mtv.corp.google.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Wed, 2 May 2018 12:19:15 +0300
Message-ID: <CAHb3i=vYwGAwAcyQVrsZVgc3xq2dSw58Zi9RtokauEjkoA+LpA@mail.gmail.com>
Subject: Re: [PATCH -next] clk: npcm7xx: fix return value check in
 npcm7xx_clk_init()
To: Stephen Boyd <sboyd@kernel.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
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
X-List-Received-Date: Wed, 02 May 2018 09:19:24 -0000

I added the fix Wei Yongjun indicated ( Thanks Wei !)
and another fix similar to the above + error print change.

I'm a newbie... what's scripts/coccinelle/ script ?
I just made a new patch same way I did before. Is this OK?

On Wed, May 2, 2018 at 12:50 AM, Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Wei Yongjun (2018-04-26 04:21:08)
>> In case of error, the function ioremap() returns NULL pointer not
>> ERR_PTR(). The IS_ERR() test in the return value check should be
>> replaced with NULL test.
>>
>> Fixes: fcfd14369856 ("clk: npcm7xx: add clock controller")
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>
> Have you made this into a scripts/coccinelle/ script I can run?
>
> Applied to clk-next
