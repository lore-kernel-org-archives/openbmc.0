Return-Path: <bjwyman@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xh4bJ1cKMzDqBf
 for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2017 07:26:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LwrSf4i+"; 
 dkim-atps=neutral
Received: by mail-qk0-x244.google.com with SMTP id o63so1508383qkb.5
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 14:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=pMZFrQUSwDrMwvAtzNpQaoRwmtqr5upapW6htQhOZ/s=;
 b=LwrSf4i+Nw38ueBQ8kP0LrlscLT006qChurxGtJpICMMbuNWdyGrYX/EXoabWTBtVi
 7yg8aKRMXsEkEvc9rpM56uN20Mb+7wuedvNnR1Kqg1yxY1TRPhMegfdegN8eG8JTdH6I
 NmFT776fRqx1gVJPXjfPpXfOEASE2X0a9IaOYvniK1llpG692L8NrGsAxYgJMDbACpw/
 P99CgeVM3ph6Zl00t69v8CJoZtKQ5iAN9xgdF9BEy/3zWB4SyLc6qoMaCVoZNkv5lzIl
 6sucQQtDR588B25hMeoWPrlZjVQyoycmFV6gL66QWDqpqh6leTOKharBSW49lHONlx2k
 wd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=pMZFrQUSwDrMwvAtzNpQaoRwmtqr5upapW6htQhOZ/s=;
 b=Ep53ER0THcF4U0qtrGB9hwY63gDVKd9nfeMQwP2FQpc0kF+U83ldxiySJhkwnn68aL
 83M4cOyKySFFEDuX0fBxS60/p1f8kVbj3Xy0nidSmdKuFvZXaEUoG7m6weo8Nbael5jW
 TBnRCAawbe3IfErYX4QjtuKUEqbgAG50AmcpOHjT0ALOuXysRBp6MCPK+SDf74Ti71dY
 gFbidTY3sJ2eE3qT7BAvebgn8guqdscaaVE5BdT9dMDuPVRCnn/URyrxJaWQXFESo9GC
 kUQ39cFQHW5CAg8fAoVhaA/27ShQvDXmxR/brlGdQOknHcUF04TDldWOle7X43w4pVzN
 zqaw==
X-Gm-Message-State: AHPjjUhx1EcfhlA3O30oStd2Vv9I3uovxUhnLk3lDMF8gf7cPzjI+xwT
 LoEyjo8Tn5sX5PyugszaSsSyhhyT5Q==
X-Received: by 10.55.19.28 with SMTP id d28mr2571080qkh.343.1503954816877;
 Mon, 28 Aug 2017 14:13:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.82.232 with HTTP; Mon, 28 Aug 2017 14:13:36 -0700 (PDT)
In-Reply-To: <20170828101952.GE18012@amd>
References: <20170828001711.19662-1-andrew@aj.id.au>
 <20170828001711.19662-2-andrew@aj.id.au>
 <20170828101952.GE18012@amd>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Mon, 28 Aug 2017 16:13:36 -0500
Message-ID: <CAK_vbW2BJjKa0dKoVjbRE++-2VB+3fM0DQ7u3DnwD2Tj-4bY7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: gpio: Add optional
 retain-state-shutdown property
To: Pavel Machek <pavel@ucw.cz>
Cc: Andrew Jeffery <andrew@aj.id.au>, mark.rutland@arm.com,
 devicetree@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, 
 rpurdie@rpsys.net, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
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
X-List-Received-Date: Mon, 28 Aug 2017 21:28:45 -0000

On Mon, Aug 28, 2017 at 5:19 AM, Pavel Machek <pavel@ucw.cz> wrote:
> On Mon 2017-08-28 09:47:10, Andrew Jeffery wrote:
>> On Baseboard Management Controller (BMC) systems it's sometimes
>> necessary for a LED to retain its state across a BMC reset (which is
>> independent of the host system state). Add a devicetree property to
>> describe this behaviour. The property would typically be used in
>> conjunction with 'default-state = "keep"'.
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> Acked-by: Pavel Machek <pavel@ucw.cz>
>
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

Tested-by: Brandon Wyman <bjwyman@gmail.com>
