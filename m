Return-Path: <robherring2@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
 [209.85.218.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xjwV36TcRzDqXj
 for <openbmc@lists.ozlabs.org>; Fri,  1 Sep 2017 07:28:43 +1000 (AEST)
Received: by mail-oi0-f67.google.com with SMTP id x184so743980oia.3
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 14:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=J5QWe30LxQCpmz1l3L+pjoviXetPvzdlDu7/C1vADCM=;
 b=BzbO/bViSRkfR0u23Khjyp/j5O1jbjXKd4Qv0w2+mn+mLndOFX/wp6Wxz/klk/gKsA
 U5qGA+Knt7uCIuHkbmZbJX2H+u/RfY6QoOaDpWDOQx5IE2GG1cwu061LNvZAWJ9f8yNc
 1+xWihgGHqLSPXjVWp5IxmWZpttM59Y2Yl1aeGAi7uAmkFUgY1Fzp+xsWYQ469chbeqH
 cdpCs+uGHkc1mavNg5JBspWsiuVJNdsbZht2o7dko1iwTD80MWaBCfZBTOUqeyMjKhLh
 j5O4wMKnbbHDzyZwZyuotKBywo39x/FVLgzaL7z43pZDgnih3kuh7wa1junHPLUawolN
 aWGw==
X-Gm-Message-State: AHYfb5gz4lCw67FZ9KTnxMh54A1/mZ/TM2ZWPwKG/AJCuhJEn/H7qmAa
 QUkRnu3D2FQ7zQ==
X-Google-Smtp-Source: ADKCNb6n3/a73eEzOpoC7QFvgmTZlj9S4PE/AIL0ZU0XQNtNwPJTyFHrAuiBBXSsm/Q498aBXlURCg==
X-Received: by 10.202.252.21 with SMTP id a21mr6880075oii.166.1504214921522;
 Thu, 31 Aug 2017 14:28:41 -0700 (PDT)
Received: from localhost (216-188-254-6.dyn.grandenetworks.net.
 [216.188.254.6])
 by smtp.gmail.com with ESMTPSA id j9sm982412oiy.36.2017.08.31.14.28.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 31 Aug 2017 14:28:40 -0700 (PDT)
Date: Thu, 31 Aug 2017 16:28:40 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-leds@vger.kernel.org, rpurdie@rpsys.net,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, mark.rutland@arm.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: gpio: Add optional
 retain-state-shutdown property
Message-ID: <20170831212840.ecr2p4nra52xvzrz@rob-hp-laptop>
References: <20170828001711.19662-1-andrew@aj.id.au>
 <20170828001711.19662-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170828001711.19662-2-andrew@aj.id.au>
User-Agent: NeoMutt/20170113 (1.7.2)
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
X-List-Received-Date: Thu, 31 Aug 2017 21:28:44 -0000

On Mon, Aug 28, 2017 at 09:47:10AM +0930, Andrew Jeffery wrote:
> On Baseboard Management Controller (BMC) systems it's sometimes
> necessary for a LED to retain its state across a BMC reset (which is
> independent of the host system state). Add a devicetree property to
> describe this behaviour. The property would typically be used in
> conjunction with 'default-state = "keep"'.

A bit quick on the applying of this...

I don't understand how this works. The BMC usecase is interesting but 
that's fairly irrelevant to the binding. How do you know the GPIO state 
thru a reset? You're doing a core reset, but not reseting the GPIO 
controller?

When you use 'default-state = "keep"' but not this property? Seems like 
the same thing to me. Presumably the bootloader would just distinguish 
between a warm and cold reset to decide whether to re-init the state.

Finally, if we do have this property, why is it GPIO specific. You could 
just as easily have a LED controller IC and want to do the same thing.

Rob
