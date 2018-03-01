Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::241; helo=mail-qk0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PpxdwE5x"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="G+ntjWB2"; 
 dkim-atps=neutral
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zsKvc02gnzF1lB
 for <openbmc@lists.ozlabs.org>; Thu,  1 Mar 2018 15:58:35 +1100 (AEDT)
Received: by mail-qk0-x241.google.com with SMTP id o25so6038277qkl.7
 for <openbmc@lists.ozlabs.org>; Wed, 28 Feb 2018 20:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=EKtymf/k6QKCVzTMMRwtT2IAPSHAz1f6kg2mJadDSU4=;
 b=PpxdwE5x9hqWS9egRYExyNgCsAv/Xk0VUX14NLcIfMwOhpT7JDy6qgi6CWWbJc42vf
 D4yyHVDIhrRB5xx2GZvyI0nReCs52CKm5vrQU2B1ods4x5beIoXcIQyJ/dU4nfAkwT9B
 NfqyF89WdO3c5t5fMVTAkFxCXELweODIr7nFjnG4iFRV0U5ueRq9U1bWDHxDCP9ueNaq
 5jvJ8z/Q7ljgUHOZHZoidsZhjFsYRXy2CmQycgr4ieuEjPOXjBbIaNxF4quJSiIU3gnA
 dMNtr5g4vIBzm6lISvV4DtN/aou30H2Yg63L+rOSrEzGmbLFK6mB/JJhD+JN7zfQ+T3c
 c6Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=EKtymf/k6QKCVzTMMRwtT2IAPSHAz1f6kg2mJadDSU4=;
 b=G+ntjWB2pF3re7QiXab4/bYpCNhAlRfERnf+FU0Nk1WBD45Ig5mwt3dvKDwQdg6Fs3
 x/i4ZcTMS5cxvAEB4uh/dXw8oNbJsbgOdocVRt9qneMoatWkYUIHjWYxYQQqx/SNQSNT
 2i/uL+cd2SwLNm2Fv1FmmA9Z6AQddP6SL5BC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=EKtymf/k6QKCVzTMMRwtT2IAPSHAz1f6kg2mJadDSU4=;
 b=gEAesi3l6TuQCrr4OF8FY4t1/3z9dzHz7MEfXjpirk4/fiCQecBdm5qCEETUjH5MWN
 01TMN7NCDF+shN4pDgIZfKF03S4JJjWm20E585moJVzCUXZv00vR4Zr+bh4ZlZRsKLcv
 kK9Bs3hByCwm9GKKaGMSus/RONs/mnhDWPVnmzP7A1wYBTvK5f1WJMf866auEwc5RyEk
 x/1Ws4H/cUKjquEzX9P6TxV5+Z5yPgyrstOeuOPOgTRXq1Av4cu4JtsSDAi5LMITGXNH
 RRFqARlIjtUGBiiFwRDKrIpMqNPRkTUMTly6YDKXwvv275GVFxrz/6HGoSFG3Jpcs11/
 Fkdw==
X-Gm-Message-State: AElRT7Eey2dCqmVkiBF7TQCGlTX31pA7rqmKRkBkmu0NSMBmlUp0oEaQ
 yYtyY+Y/v0mQRL/1IupaUCU0MKAgHjEqHTxIAIo=
X-Google-Smtp-Source: AG47ELtKs5mlDyqlJL7HlJVxrDBotQ0W3rLsNFXXzKIvg3kU+gXSHj//v0MaYcnG8iGYHdvUMYKuYu0eKM7aWdZ8b5U=
X-Received: by 10.55.139.133 with SMTP id n127mr853367qkd.231.1519880313189;
 Wed, 28 Feb 2018 20:58:33 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Wed, 28 Feb 2018 20:58:12 -0800 (PST)
In-Reply-To: <1519748921-22052-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1519748921-22052-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 1 Mar 2018 15:28:12 +1030
X-Google-Sender-Auth: XTBvuZWrt2trq0TFDnZz067iwYA
Message-ID: <CACPK8Xckzp08FifzHG8sOS+zqERi_NPZizPEHo=T66HHMjJGPw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 0/2] Add user space accessibility for
 ucd9000
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 01 Mar 2018 04:58:37 -0000

On Wed, Feb 28, 2018 at 2:58 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> This set provides means to allow user space to access various properties of the
> ucd9000 type chips.
>
> This is a port of the patches merged in 4.10.

Have these been submitted upstream?

Our development process docs say that you can submit it for
re-inclusion in a later tree, as long as you show progress of
upstreaming:

 https://github.com/openbmc/linux/wiki/DevelopmentProcess#patch-submitters-wishing-to-have-a-change-included-through-this-process

Cheers,

Joel

>
> Christopher Bostic (2):
>   hwmon: (ucd9000) Add gpio chip interface
>   hwmon: (ucd9000) Add debugfs to list mfr_status info
>
>  drivers/hwmon/pmbus/ucd9000.c | 369 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 368 insertions(+), 1 deletion(-)
>
> --
> 1.8.3.1
>
