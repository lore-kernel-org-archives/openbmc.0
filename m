Return-Path: <cyrilbur@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3td5Kb4vMTzDvk9
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 14:48:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JrZgeE2F"; 
 dkim-atps=neutral
Received: by mail-pg0-x244.google.com with SMTP id p66so3023065pga.2
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 19:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RaX8XNHM7lFxOqQjdf7KaQ9V21PSyocKNYC0NG8vkfU=;
 b=JrZgeE2FCPSejSkONDk3VuSG+jvWzKD7T8TxysKGrTc2BCUSQHc0CUGF6RZrS6qveb
 b9HaQSIl4/DCVOXo+ZyQl6OzYatNDsZTSpSibSMUO+w4s3l/XMSMLfWyG9/yKTMo/dFZ
 yAIXozjBtzOAm6xLbtQQNOCz6CmrfbfGPGJuP2dRCwF9vkeew9U5JVlcVLDJJDevEZ6O
 WLak9es//crvcLCZfZMv5uwP3/N3HFIguDb5yq1BIA5Ot4pE7IwNHDPPSORtMrvVwCoG
 7MsODGjzN+zyNrFxxFhL8OsArwY0jswdhNdTmqW84h6PlNvlQA4T6IMp0BPoRk7faxLf
 r3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RaX8XNHM7lFxOqQjdf7KaQ9V21PSyocKNYC0NG8vkfU=;
 b=SujujtBvD0ZXH85q9bQ6FQL/7PzjkF4NvjUAthnylGStq1umT3SpFIXEGW4oOFGC2N
 kSKWJBAO/Ihq472t25grrXXEiR3apK+UEDVfzq1YjBtyxA7Ulj3voQCD7JJYYaoAzJVr
 EZTUizBl6ILlaSEe/bW4ZpHc/12Wg5doTH4hK3u9pjqnk9hX6bhBvNAQQTGIPAb7J9JN
 i0FlOYunmNN15WNhO9dAUhK0i40riPcnvQ9j3Z5GwAfGOfWl0znvNS0KYXhEbAjeVJt+
 /nSQ0tfyZTJi51f1mxV8Q/aK4ISAGPkFjwXOsi3TBrbgVnFikNJLR1LBfezYl3OO5kcs
 TxXA==
X-Gm-Message-State: AKaTC01r87/vDteTbxfMCmTyIvAf3Us26IKoBQPbTXQ2qVfLWPqN2JP9LAzqCWYjOmn2zQ==
X-Received: by 10.84.217.216 with SMTP id d24mr192622769plj.101.1481600929825; 
 Mon, 12 Dec 2016 19:48:49 -0800 (PST)
Received: from cyril.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id e5sm8384521pfd.77.2016.12.12.19.48.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 12 Dec 2016 19:48:49 -0800 (PST)
Message-ID: <1481600925.10426.5.camel@gmail.com>
Subject: Re: [PATCH linux 1/3] ARM: dts: aspeed: Update palmetto device tree
From: Cyril Bur <cyrilbur@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Tue, 13 Dec 2016 14:48:45 +1100
In-Reply-To: <CACPK8XfoPV51WMHiXgFJ6gCyZDr5s+FGP3uDgKxvF6phimafyg@mail.gmail.com>
References: <20161209054323.7320-1-cyrilbur@gmail.com>
 <20161209054323.7320-2-cyrilbur@gmail.com>
 <CACPK8Xc11u=ym0LrRGdN5YrzAiN0Knz68b4q9SdXPVn7+vOBtA@mail.gmail.com>
 <1481598705.10426.3.camel@gmail.com>
 <CACPK8XfoPV51WMHiXgFJ6gCyZDr5s+FGP3uDgKxvF6phimafyg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 13 Dec 2016 03:48:52 -0000

On Tue, 2016-12-13 at 14:29 +1100, Joel Stanley wrote:
> On Tue, Dec 13, 2016 at 2:11 PM, Cyril Bur <cyrilbur@gmail.com>
> wrote:
> > > > --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> > > > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> > > > @@ -17,7 +17,30 @@
> > > >         };
> > > > 
> > > >         memory {
> > > > -               reg = <0x40000000 0x10000000>;
> > > > +               reg = <0x40000000 0x20000000>;
> > > > +       };
> > > 
> > > Can you send this in a separate patch? It should go into the tree
> > > now.
> > > 
> > 
> > Yep, should I send just for palmetto?
> > 
> > Do you have a list of other platforms? I figure all the ast2400
> > based
> > aspeed-bmc-opp-* should get this change, should I include them all
> > in
> > one patch or all individually?
> 
> One patch will do. I checked all of the machines and they all have
> 512MB (minus bits that I assume are reserved for framebuffers, etc.):
> 
> Barreleye: 499020 kB
> Palmetto: 424204 kB
> Firestone: 416020 kB
> Garrison: 416012 kB
> 
> 

Ok great thanks!

Final question, I assume the same thing in a separate patch is good for
the framebuffer, I'd forgotten that the size of VGA memory can be
altered by a hardware strapping reg '0x1E6E2070 Hardware Strapping
Table' bits 3:2 define it. The default is for 16MB, is it safe assume
the platforms will come up with strapping reg in default state?

> Cheers,
> 
> Joel
