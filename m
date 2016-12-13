Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3td7Yl1cwdzDvhJ
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 16:29:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FxGuq4jY"; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id 50so10845843uae.2
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 21:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=tQ4aqhekaPlzadgY4zuc5lbulZ1JotBgr/hmQwPFuOc=;
 b=FxGuq4jYu2h/xFQroYegWQ3j/6ok+DKu0dAeGw8MUPi0W0T82ykV2es79RSrKV+F+3
 A25JRnfppMpMDBAQTFwnRIC9a2Y8EEYhQGbFTGr2tFiEbWolT7WT2nL/w6KE2XIDH/Y3
 M2yN/t5OGSbT6L/azonjQDwmj4bsq9agwZqMWZygbL4WaV2FpUDIvuBfs9K+X4WGlUwJ
 ofJE9YnjU1nCDOwiQGdgzZm+0Wur8IJ+Kd11O2+toKvSfHNbogJAVUCMxX+WB7SG9zzq
 uOXg73pVlshfxO1/7HRjTT74CVebG4Jd31YMnPiiZSYXTk9oZxsoasEG3snSg5HL4YRo
 eRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=tQ4aqhekaPlzadgY4zuc5lbulZ1JotBgr/hmQwPFuOc=;
 b=G3+oxrbppCoyNHkePbRhiCRvu/sLzhZ9dk7L+YRBNvkTNF8J20iQdTqqH+Qz5ZPrAx
 beIFv1UqqoiH6Wf1cBSCk4R0Jx/WzFlbtVa51lyH/FS/NTS/BXVeT0bJtcx4LsnIelfF
 yLRPROW5iXGZ2jUMnoSZMn/PEm36Axola5Q3n5363RAry4zc/LO25IYeyyyxpsD9PCrb
 9/6vRLtePcRHhKgCVgTayUyKYtAivh/DenwcsY8wJodpg9Pcid56W1q4mfr0fK7HO7Lx
 Yb3jfU8nS/yf/Ypw2VNZrfUYhmSiLqAHVqOD8avfYYJhLYe5ZQQwzRJ3F79yPCne+cdH
 uvLA==
X-Gm-Message-State: AKaTC01BQHjnfk8zHjhcO+iV07MmSokeGyJ8moAc20vD2KnN6jfiy1HL5X7+L40RJOaQ9cfCUOp2P09Ywt5s8Q==
X-Received: by 10.176.82.181 with SMTP id v50mr66657736uav.31.1481606969128;
 Mon, 12 Dec 2016 21:29:29 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Mon, 12 Dec 2016 21:29:08 -0800 (PST)
In-Reply-To: <20161213045623.1542-2-cyrilbur@gmail.com>
References: <20161213045623.1542-1-cyrilbur@gmail.com>
 <20161213045623.1542-2-cyrilbur@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Dec 2016 15:59:08 +1030
X-Google-Sender-Auth: qCckxrmV6wC9dnseGlumuOwumC4
Message-ID: <CACPK8XfeLLetq8XhP6k-gQTiBYusdZAj5TQU5AjVphfWRH66oQ@mail.gmail.com>
Subject: Re: [PATCH linux 2/2] ARM: dts: aspeed: Reserve framebuffer memory
 2400 based opp platforms
To: Cyril Bur <cyrilbur@gmail.com>
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
X-List-Received-Date: Tue, 13 Dec 2016 05:29:32 -0000

On Tue, Dec 13, 2016 at 3:26 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> Use 16MB of framebuffer memory at the top of RAM
>
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>

This looks sane. Did you boot the host to make sure it does what it
says on the box?

Cheers,

Joel
