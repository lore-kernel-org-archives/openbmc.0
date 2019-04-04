Return-Path: <benjaminfair@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::144; helo=mail-it1-x144.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="I939hF22"; 
 dkim-atps=neutral
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Zrgv59bzzDqPm
 for <openbmc@lists.ozlabs.org>; Fri,  5 Apr 2019 05:14:33 +1100 (AEDT)
Received: by mail-it1-x144.google.com with SMTP id u65so5266511itc.2
 for <openbmc@lists.ozlabs.org>; Thu, 04 Apr 2019 11:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jrzaH3AFrCMxGy3AoMYn/DdcKy7hCJb7BxYU/pUyAR8=;
 b=I939hF22vqsqSPahI4Zbs92jQYaEOpqfbNeWkt1+WIFLPKtFz0cweepxvEPrk87nRE
 y8+5vnGD6MX10rotI1pssfwer9dJbGuJ+p7ujg/SRiwXYfjjHJyF/nPGjmi84OZvxrmK
 JRhmbNa2TWMTSYnK2kP64EDnRe0SDiOK9R5keppfJlk3tKMRgH0wFIFLyl2oTljyJckC
 JsJ8yLNvfGO6bVeaDPEliMwuD7S6FmmewgbHSeZKxa+68QJAKSwEdy+woFbZE2ozjh6g
 I3pZlWXotsW8kfAgqIbiE9NQpnLcavduSlelGqC+jecqrUO3wwzbEgbas3/0pxgucfVV
 3jOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jrzaH3AFrCMxGy3AoMYn/DdcKy7hCJb7BxYU/pUyAR8=;
 b=Tk6quZChP98I96XaSshUKX1VyqOtWkY7WWRrdmROuOyoCACxeOhGp8YOG8ch8jHR4/
 g19yFkRQZmMzcYEEOH+LsxC32H7M8KRQSgowQ0qpdBETskUCTXhsPPQNwS3NXCXSFbXG
 W5EQ/FRip6tCNkccsjOVjcdYV+CVMmVddC79Tf708P1bn5G5CHWRf3sFwT/0wIWZwGK/
 +iKSE6zuTHD/jFFnlLIRb9Vp+Sq1i9PWDawazYQaz8+fx++G1jTqM8AGCZHYZrM16v/9
 OUa2cR+VDH89SVQUZ2a66m9WXVSPS1m2HuL4l/6wN0XCdBXC2iz8xzkfe7jUPpYdqfzP
 CjBQ==
X-Gm-Message-State: APjAAAWg4IvoEX4dWPNvIZMoTJluZLIJX3TuM+DvMxKH1vOTfUj4ce8g
 pcKoBpoduPRDUBs7tp7sTEndLYBWWNrddaCka9f/BQ==
X-Google-Smtp-Source: APXvYqy0YuDveiavcAbz4tkDOFHrewYQ/Os5kCZ8MnrM5csLsOrK7l5xyNI3Xkqrlw8B/2brNt+ed5NdAv0Pg5rqAuU=
X-Received: by 2002:a02:938f:: with SMTP id z15mr5827329jah.108.1554401669729; 
 Thu, 04 Apr 2019 11:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <264283F7338E734E863366C752FEABBC417FE18A@CNMAILEX01.lenovo.com>
In-Reply-To: <264283F7338E734E863366C752FEABBC417FE18A@CNMAILEX01.lenovo.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Thu, 4 Apr 2019 11:13:53 -0700
Message-ID: <CADKL2t7yjnSj85uiC=7hv8skG4b3=3AGzBrDQHJ4NCgDoY1Wsg@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: dts: aspeed: Add lenovo hr630 BMC machine
To: Andrew MS1 Peng <pengms1@lenovo.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, 
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "llinux-aspeed@lists.ozlabs.org" <llinux-aspeed@lists.ozlabs.org>,
 Lisa YJ19 Liu <liuyj19@lenovo.com>, 
 Duke KH Du <dukh@lenovo.com>, Yonghui YH21 Liu <liuyh21@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2019 18:14:36 -0000

On Thu, Apr 4, 2019 at 1:05 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote:
>
> The Hr630 platform use ASPEED ast2500 based BMC, add the device tree for this initial commit.

Hi Andrew,

Thanks for sending this patch!

Unfortunately, this format makes it difficult to review, so please resend it in
plaintext rather than as an attachment. I recommend using 'git send-email' to
do that.

There are explanations of the Linux development process in
Documentation/process within the Linux source tree, including a guide for
submitting patches and hints for configuring your email client.

Benjamin
