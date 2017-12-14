Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22f; helo=mail-vk0-x22f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CC3f4OP+"; 
 dkim-atps=neutral
Received: from mail-vk0-x22f.google.com (mail-vk0-x22f.google.com
 [IPv6:2607:f8b0:400c:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yyVLC0P9VzDrd2
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 10:35:46 +1100 (AEDT)
Received: by mail-vk0-x22f.google.com with SMTP id o16so4589276vke.12
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 15:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=3iSICfPpguaQZWMrNFZSIIEh7WjDIAMIcVLQjQGWhsE=;
 b=CC3f4OP++iQ6mTbJ3VADhZIs/d0F+GMyUzc0IalbRolenbVpUTrNsEy06DrTpdGlYc
 gEajwgwdgcQtldfmgqWkRJXyxtMaregWWhDs7IuZQ8B+oDuHIUp0eOQi7JYu9LAiRTVE
 qHb8Ek+ko19UC/+laBrPe5exfPdmDzQG3VYbdB4q3BgrOJNb9H+4T3deXBbtn+93ivsv
 kzjIRegC9B3tkludjkt6Ygrrjfxhd4Vc5CBT++TwDncZDye4dItzy2Mt7ugzKQ1TBuHa
 RUg37dwmXsNDIqZ4aHmzU9nODAHEiEeKCsNBSbDCOOQwz5Ag1W5QongRWewp09Y2LPM9
 oMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=3iSICfPpguaQZWMrNFZSIIEh7WjDIAMIcVLQjQGWhsE=;
 b=MCJR3Tstq2Vhvz4GK1yRFghloDxHDBeG/eBxmG16iDEqWtVqcQ+jIHoS9Tw1eu8yCk
 4krOKD3oTwzF+WpvYfRFvX6KQRF+YhvDo136Vwm9AENZurEsT0pje3R2iU/s/W+lGH1B
 eyeIkmtKJjOMgzp4hUqeN2nkSZkDWUBhXna/zOloTTErGIQ9us4is/f14ReQTDW8mlfh
 zOK/koIuGCC59gn8Q06ilH+U+VjPvedx3wPu9riwPR7U+fm0G4ewYNN4wbwwMNHPGt/Y
 Yo2Hscp2DWiPPdScPfGl0jEiSXSED0Xm35w3FcpAXVbv/4ODY85ol8DQe9qS/7Azqi4F
 LHyg==
X-Gm-Message-State: AKGB3mK3KZlglFJOtAk3mMl1iykSkRBazRb0fhp4X9VBo5OZkKZ5ylP1
 SRbiCNLLytkV+4ZyoJ2xHm+FwU3l/VeUGqI199q5gg==
X-Google-Smtp-Source: ACJfBos1uHX7UHC4c4Aa6RtpB1hnCCmrJK0BAdoppE09VYbuGNLIqBZO5w2F6E73P/Oa7g59AGe6EmPvByo8r6zCEp0=
X-Received: by 10.31.225.69 with SMTP id y66mr17971vkg.102.1513294543575; Thu,
 14 Dec 2017 15:35:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.164.82 with HTTP; Thu, 14 Dec 2017 15:35:23 -0800 (PST)
In-Reply-To: <c10d1ea4-f4c4-f51a-acb2-a6b252be4ba9@ozlabs.org>
References: <TY1PR06MB08635DA92530A90D5D2C039DF6A30@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <581C8C7D.8080702@linux.vnet.ibm.com> <20161104141455.GE17105@heinlein.lan>
 <581CCA61.4010202@linux.vnet.ibm.com> <20161107035006.GB15757@heinlein.lan>
 <80bcfede-6212-157b-e391-6e4bc526b339@ozlabs.org>
 <432e5d6e-ac7a-6844-2bc9-4a046af0abda@linux.vnet.ibm.com>
 <86bef8c4-2f54-6c33-93eb-5ed6aa212aff@ozlabs.org>
 <84218d7b-714c-761e-cd93-97118ceee49f@linux.vnet.ibm.com>
 <f0577dd5-1df9-d077-fb95-24eaec58489d@ozlabs.org>
 <20171214162608.GK113334@mauery>
 <c10d1ea4-f4c4-f51a-acb2-a6b252be4ba9@ozlabs.org>
From: Patrick Venture <venture@google.com>
Date: Thu, 14 Dec 2017 15:35:23 -0800
Message-ID: <CAO=notyQS4uCzYifQAjH3p1FPny-T8NqpT5CY_CbYFzL4APRRQ@mail.gmail.com>
Subject: Re: IPMI LAN command story design - try 3rd send
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Dec 2017 23:35:47 -0000

Along with any change here, and sorry I haven't followed the email
thread is that the network configuration is applied when "access on"
is sent over IPMI and not when the "set complete" flag is set.  That's
an easy move of code from one place to another in the IPMI daemon.

On Thu, Dec 14, 2017 at 1:55 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Vernon,
>
>> I would agree. ipmitool is broken. It should have a
>> network-start-configure mechanism that would set the set-complete bit.
>> The you could send any number of its network configuration parameters.
>> Then it should have a network-finish-configure command that would clear
>> the set-complete bit.
>
> Or, even simpler: allow multiple parameter changes on one invocation:
>
>  ipmitool [...] lan set 1 ipsrc static ipaddr 192.168.0.2 netmask 255.255.255.0
>
> [which changes all parameters under one transition of the set-complete
> flag]
>
> Then, there's no need to modify existing users' behaviour, and no
> concern about forgetting to apply.
>
> Regards,
>
>
> Jeremy
