Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sMzbC4RchzDrnn
 for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2016 14:44:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=GeJIt0I6; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id 49so1100788uat.0
 for <openbmc@lists.ozlabs.org>; Sun, 28 Aug 2016 21:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=x1LHXVC+SUR+Qy2YGqY8nQEgg9RE3QnIx+U7O5MB0qQ=;
 b=GeJIt0I6JAqGigThGPdln3mlL7PkTV+gmD3lO/TqN4McONB18O2uSexKofnOUpIkdk
 lZ4DAck2ErZAwbUB+VKmI7bSKcLvKeO9UEs/ns1IVjHAWtxcu5igsa2C5qfixKVSEQNr
 cCfTj6I4nA4Ldf+tLzoAURw6AFHF1G+O9as0qwwykoU6ecOqk0yFFWP/Be9BOVJveTaA
 oWKEPTMHDS+X2LaniuD7LwAsHlR2YdxNvmjIueNZq2aewLMROTPgCAxSPPGOrW+nH2TD
 jRgGrYC/Rp7lcqgf6xWy6yWhAoxfgJJF9MZxIiQSn+KXKk71+P1ZGxPy1wW7F+w+s89u
 10fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=x1LHXVC+SUR+Qy2YGqY8nQEgg9RE3QnIx+U7O5MB0qQ=;
 b=RiXd8WZv0JERKuzhEJ6MITepDyHRQuuKA1svBayMypM8iPReNptSomU6nbgUkbpK4K
 JFPLiYY9+mPlJTkhpAEYRYIkzXNF/pgX9dLk/439Ptl4+A5TL07uzWFHVC91A479YCux
 yjTkGTKq6xXpu1s+Vk4xNiCepvSOIR7Sg2xT/WbeERAmzxkyt2wb5xfFExmqtPSQpBgF
 J2xIbPENyiZzl+bi1j3LYmTHaRj84dABkVWn9rwQ4gjkGFEXJlM5l7EtPGjMQYP9URmX
 SnLojK6AbNXVWrOhIis43yyJ7LoTFuei/UoOvgA6aCRr0z5UmFCOoWrJ31cOzjtXP763
 3gKg==
X-Gm-Message-State: AE9vXwMTUibo/h+VvzSZ8pBEuhd1aJsbJbWqH5mRFvsNyzTnxE0XdQ7u36ExUWCj1/k29vYvREOX4BZd4fqL1Q==
X-Received: by 10.176.0.20 with SMTP id 20mr3761940uai.43.1472445893394; Sun,
 28 Aug 2016 21:44:53 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Sun, 28 Aug 2016 21:44:32 -0700 (PDT)
In-Reply-To: <a9f038e2-6208-2d40-32f0-27f5434bfbe3@linux.vnet.ibm.com>
References: <a9f038e2-6208-2d40-32f0-27f5434bfbe3@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Aug 2016 14:14:32 +0930
X-Google-Sender-Auth: ME3tOzrd5Mbweu-ybU624wIbvjs
Message-ID: <CACPK8XdQ1ef6gLqjgL-YvkzBoxpedjoiY_-TzvZF+4sJ9R-p2Q@mail.gmail.com>
Subject: Re: Charts from OpenBMC MRW Talk
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Aug 2016 04:44:57 -0000

Hello Matt,

On Fri, Aug 26, 2016 at 1:21 AM, Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
> Here are the charts from the Machine Readable Workbook talk I gave on 8/25.

Thanks for sending these along. I was unable to attend you call as it
was at 1:00am, and I was skiing in the Australian alps. Are there any
notes from the presentation that you have to share?

I gave the slides a read. Some questions I had:

Serverwiz. I cloned the repository and tried to build with ant. It
failed due to some hardcoded Windows paths. I opened a ticket here:
https://github.com/open-power/serverwiz/issues/20

XML Patching. Under what circumstances would you patch the XML when
you have the entire thing available to edit?

Current status. You have some upcoming goals there. I would be
interested in seeing "generation of device tree" pushed much higher up
the list. I think device tree is an alternative representation of the
MRW. Because of that it would be an easy target for your prototyping,
and would allow us to see how it works in practice for a well
understood use case.

Another use case is generating the Python that describes the
platform's GPIOs (skeleton/configs/*.py). This has been a source of
recent bugs, so making sure the MRW matches the Python would help
shake out some more issues.

Cheers,

Joel
