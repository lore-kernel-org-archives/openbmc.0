Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::232; helo=mail-lf0-x232.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gto81QVt"; 
 dkim-atps=neutral
Received: from mail-lf0-x232.google.com (mail-lf0-x232.google.com
 [IPv6:2a00:1450:4010:c07::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xrxpS2R1GzDrJm
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 17:52:16 +1000 (AEST)
Received: by mail-lf0-x232.google.com with SMTP id m199so24173712lfe.3
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 00:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=uWYvdQ+XrCd/NOBZ2lplBRWRWBn27sYOYj1zK9v6tWI=;
 b=Gto81QVtgokHyLfwxl4sf8Iqvy9+RizjEo+rAfE+s0vlempKgc47jdP26nsA0N6HZ9
 wcFTcJDYZwZfembd0bK6b5tSWLke3ySHjrB84Cc/1rzJrr23Vwu+zgXHv0OmCQGXV3Cn
 ECj1A/rN3kqIS+XKHYVGrwTXIHQHUJxycSQrtQpT7getUAfaH3gNbrPwOOScZTzCWxFr
 p8wsEEm5JvbESydR673DrOMteU2+4lKX/EBoNnAPClEx8M/OmzuinjLR/avrjuclbZLQ
 g0UMSyCSVpGmNPmZC+WOCYfRBZq5BBap82A4UV8i0JNDUeYN7t+UkIz8xL2Z3Aj/2FCM
 uV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=uWYvdQ+XrCd/NOBZ2lplBRWRWBn27sYOYj1zK9v6tWI=;
 b=Oo9hjF7yu/DxE0HmD24/qsSN6A01GVBkFoztVzlVaeESmLcB3LlkDfCQCM+fzNIJiQ
 d/Uw15BJPRvaNbCwdr5LFkVklw7Vis4kgsWjd8u3LiQl6Ai49ZPwwfWDtT0/qORcLL8d
 SC6NInuTHTGHbRO1n7POQ6U2qKYLSY+SRz30vfORovVdheXzZ1sd9NORgWPFaUYKGphC
 IvqgpU0GtsBew048E8e5x32HiT/Usi3nEyL+zVR2dUkaoskCSLJgPEljsg6os5FpV/RJ
 YD574cYOVfVbSzD8YUkJqWNqUpj+lNUMpTl7PbOHDlymX7yebgHfrgCghTMykVYXAqr7
 kN5A==
X-Gm-Message-State: AHPjjUh5i9jKoB/5B8eb+OIez3ubQUS/ROXM7YKLmJNpNuXc+VuEKxby
 ddf7gUtkmyyLucaor50pKo+Ww0YyV2Hmw70=
X-Google-Smtp-Source: ADKCNb7QnAJbeDfkw6ESl00FHYm9wcCoDUTTrs4fsnSL19/cnqdrgrhqcfwqjSVYWtGsSkbpCQaZL+FFrZbFrzDEA2M=
X-Received: by 10.46.85.145 with SMTP id g17mr6375431lje.46.1505202733285;
 Tue, 12 Sep 2017 00:52:13 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.103.82 with HTTP; Tue, 12 Sep 2017 00:51:52 -0700 (PDT)
In-Reply-To: <20170908215728.115818-6-xow@google.com>
References: <20170908215728.115818-6-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 12 Sep 2017 17:51:52 +1000
X-Google-Sender-Auth: 2rNexmY7amPZ6Px5OQxKhZ26Y40
Message-ID: <CACPK8XfuBwWaLu_Ua3=bxjvvkP5Ytr5FP_+zEe1dP6q6cNMYjA@mail.gmail.com>
Subject: Re: [linux,5/5] ARM: dts: aspeed: zaius: Add PWM/tach peripheral
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
X-List-Received-Date: Tue, 12 Sep 2017 07:52:17 -0000

On Sat, Sep 9, 2017 at 7:57 AM, Xo Wang <xow@google.com> wrote:
> Signed-off-by: Xo Wang <xow@google.com>

Applied to dev-4.10.

Cheers,

Joel
