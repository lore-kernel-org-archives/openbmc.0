Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x231.google.com (mail-yw0-x231.google.com
 [IPv6:2607:f8b0:4002:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wsCJm1DrQzDq5W
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 13:00:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="b9tpYC6i"; 
 dkim-atps=neutral
Received: by mail-yw0-x231.google.com with SMTP id 63so47389252ywr.0
 for <openbmc@lists.ozlabs.org>; Mon, 19 Jun 2017 20:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=UYBGFsAjHj1kfoBy/HMTdSAcjum9e+7tVAqnCk6LLH4=;
 b=b9tpYC6iDsz0F4bIXTVd1dBSGDVGxVay887bv8f5mxuKGd7C40DbbZ1Jud3M+Wen7B
 WnDlBV3MWOXg2BAKD+oMJSCm8xYy13LXvpaM+gbkP4dIiOKrF0/ZhnWy7Ch/5kPYDx57
 dcB0ZIf5K6Bjv6eYuGhhOxW+6egJgk6xh6O3IY6pVdb4U/1ZC9hq044NZU10nHdX5E/o
 o9swBKjK5YIAzC8vFW/LOxyXJ2asHMsjbA6pFdUVihu7z+JFQTWJoUpekWfx6WZKT6C5
 66CVkM9PO90bdEgSNJcxKLsuWwwAUyGHbrHh3A9bqdG/O5QkPL0eOxFRGij2KpgtgWzq
 6KhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=UYBGFsAjHj1kfoBy/HMTdSAcjum9e+7tVAqnCk6LLH4=;
 b=aQb2CK+xymROXDFz8YQgHqRK+uGPWUxfMvo0Av0x7yqUTQJQUbjg/PlT1udP1yxeF5
 RlZnLXsqW5CwCIRSWFLwMb4lPOvIEz0TJxtQchQ/UvAG2XRSA4/ye6zwoXVHT5TReSUd
 Y66WTPfxBGGfSDmThgEE4JAy/5W0KaeicwvBdj1T8ov3/FsjWro6x6Q+Udlzf3+LEiLn
 J3L5geGfCtDvoCZDhQ/BBPPCxloAnsAW1ZTdJgPM1//1UlqcgHfZsJ0Z1paMzGdRtVpF
 fnjYN/TAhkwhig63pzqfvjJJPJUj6I9dAC2p4XmjWfaPsPANdGbtDYXj5AeVXmGc2irU
 Vulg==
X-Gm-Message-State: AKS2vOw6hwwF919C//eyZ5NLnxH9V7/0EsddwiLhYcczFWdYXDN4683H
 NT7uB5x7AXgIwJM/bEUP5qfu2Tu1CfXA
X-Received: by 10.13.225.79 with SMTP id k76mr20030563ywe.178.1497927637715;
 Mon, 19 Jun 2017 20:00:37 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Mon, 19 Jun 2017 20:00:17 -0700 (PDT)
In-Reply-To: <OFA5A59E2D.D08E083C-ON8625813E.00649282-8625813E.0072EF32@notes.na.collabserv.com>
References: <OFA5A59E2D.D08E083C-ON8625813E.00649282-8625813E.0072EF32@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 20 Jun 2017 12:30:17 +0930
X-Google-Sender-Auth: jQOEHpyJ-nghF6IDge29V43QlYU
Message-ID: <CACPK8Xf-1TBsN-Xpju1WOrSYvmjwdghQD-x5eFX1jvSyNw-Uug@mail.gmail.com>
Subject: Re: OpenBMC world wide call for topics
To: Chris Austen <austenc@us.ibm.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 20 Jun 2017 03:00:40 -0000

On Wed, Jun 14, 2017 at 6:25 AM, Chris Austen <austenc@us.ibm.com> wrote:
> Greetings,
> during the recent OpenPOWER Developers Congress it became apparent that
> there was a need; beyond the mailing list, to have a discussion about what
> is going on in the OpenBMC Project and how to improve communication. I
> committed to creating an event and to reach out to our ever growing
> community for topics. Is there something that you would like to hear about
> or understand more? Are you looking for places to volunteer or show off a
> technology using OpenBMC? The tentative plan is to hold an over-the-phone
> discussion during the week of July 10-15th. The exact date and time really
> depend on the time zones I get feedback from. So what would you like to hear
> about?

I'm in UTC+9.5.

I would be happy to give a 3 minute run down on the OpenBMC kernel efforts.

Cheers,

Joel
