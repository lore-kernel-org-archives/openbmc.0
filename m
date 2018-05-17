Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::242; helo=mail-qk0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="c4kFZQIK"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="BOJE5uRp"; 
 dkim-atps=neutral
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40mbJc0clDzF1PQ
 for <openbmc@lists.ozlabs.org>; Thu, 17 May 2018 12:45:35 +1000 (AEST)
Received: by mail-qk0-x242.google.com with SMTP id c11-v6so2471273qkm.0
 for <openbmc@lists.ozlabs.org>; Wed, 16 May 2018 19:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=DwyHRmTT1us4upkjAhxkTRZX6SGCCN+z6TyNZ+UN7Bg=;
 b=c4kFZQIKj0H0ud79TUltM+nlnDDtOHEJvdixcjnUdwqdr+a09jmOq5q5NcibI8dlcv
 yM9vfjl8OrZnIomPxNCjrd8xfbsbLTTZL8eYzY/JvPBGirEQ7vfz5ePPk5ZspTtAczFp
 1t5cwfk1xnL1giR92RFPfBJWEA2VJZYmlq04rK4cvPQygst8qcSGncZV9o2SmUsZd+zg
 K797+CgrHe5OkDDjxrU1kL03ZOKUL2upUHYxvRXyGbnatYhwQPJEpglr2nqxv/3yhDaz
 I9nP6IUea+aXJiJmDPDGsVL7GvByVBHghZ046VPOxtN23hBzGelrT234gQsM8U4I+tiw
 zwTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=DwyHRmTT1us4upkjAhxkTRZX6SGCCN+z6TyNZ+UN7Bg=;
 b=BOJE5uRpkGOF7ujNEiuslmrYTIEdvqiFfqaJEwE2qTEhQH4yHjbbsFFenNYTTIn8T/
 TTuwoSK1sWrA+E7LOfbsjAG7SRnaXR6H52mwONauo8+17JUtDyNByvLH1Hp9MEFpO4At
 vRlYxeYWnijFVy+MGUOajJMaxPS90XYkos1+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=DwyHRmTT1us4upkjAhxkTRZX6SGCCN+z6TyNZ+UN7Bg=;
 b=md4fy6Ct947ZqssKhQGdRaLQk50KogDgd5bi7c9PBTyfAWgQUXxzHL2saPRe8dqMkJ
 BgigofEJaOEBubNIoVgLoOARUGon7idKml24wrqMR9i6HtUxU8b2YNC+2L/dBV/kpiMW
 RVvqEDk7/y1QWPWVdhMupCdy14/mEaCWXNFVPi2YffRPafuashpGh0oFIojNSAGyMvTx
 7GqNOXDOywcCpRcYmxsc4DtiFnaWPYVz0Ldyndd4Be2qkHsSboO6zuT9ijevqVKP+mgS
 yojaw3nft+QVfo4fAakcoC9dAzVTF8amFMU2fUOvI8MzwkycqTOdw17UiKMa6OkMv5xS
 oTWg==
X-Gm-Message-State: ALKqPwdpJnwnHC3wvisMn1GJ/e42WEtLjr79n0ebqTql0CQ47qkhoR65
 h8v8Gl+W5JQN2UraOGYPNvFV34XAyTq5xswK3k4=
X-Google-Smtp-Source: AB8JxZo7Vz9u4IkBxwp7ah7PZuFmOlmXOUYzTaf4RLkuintw8r/Bt8rFeWf9kqbXMggCcGzlFytmpr/5h4y3bYSaj1s=
X-Received: by 2002:a37:d445:: with SMTP id
 l66-v6mr3366729qki.112.1526525133299; 
 Wed, 16 May 2018 19:45:33 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.24.79 with HTTP; Wed, 16 May 2018 19:45:12 -0700 (PDT)
In-Reply-To: <aa6d2b18-de49-e0c5-31e6-20639e3f90fe@linux.vnet.ibm.com>
References: <1526069782-20693-1-git-send-email-eajames@linux.vnet.ibm.com>
 <aa6d2b18-de49-e0c5-31e6-20639e3f90fe@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 May 2018 12:15:12 +0930
X-Google-Sender-Auth: zxBleoFw1jGmqZmJLbHh9tlb66Q
Message-ID: <CACPK8XdXN_HKiVbtH1MZiZe04B=yQ56Fx-dhXw=k8fS83azv-A@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] pmbus: core: Use 64-bit ints for returned
 sensor values
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 17 May 2018 02:45:37 -0000

On 12 May 2018 at 05:51, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>
>
> On 05/11/2018 03:16 PM, Eddie James wrote:
>>
>> It's possible to overflow sensor values, especially for power sensors
>> reporting micro Watts. Use 64-bit values to prevent overflow.
>
>
> Cancel that. This has been fixed in linux-next with
> bd467e4eababe4c04272c1e646f066db02734c79

I have cherry picked this into dev-4.13.

Cheers,

Joel
