Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="H4WoSgJu"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DPzaNTh4"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 444b595BrxzDqH3
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 11:31:57 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D2EA422AC9;
 Wed, 20 Feb 2019 19:31:52 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 20 Feb 2019 19:31:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:cc:subject
 :content-type; s=fm2; bh=Jvg4ipzqQMn6QaVz7Kd2gtdRszIO61DhiC/zlFB
 9TfI=; b=H4WoSgJu9GZpBmP+UlfDQHKTnLh24puAGiAxr4ohjDsruthf2BrUEkv
 fUQ0D7smawwvjgDDItEcHcvxBkSt5gVQ7dZ/qIHawDf3Wdecs3kBD6iOswPj/m0J
 I8EcSLPqM+JU5NpWuSg7r62Uq4ZnL+9AdBsnYSRK0xj2jqgnn++hg2DZy87GjyI5
 iA2SrLAb4HyVOfndgTxGJqiodaiyuYD78KMB3cF8oRAeLp64ffbtsoNIrHluoEtv
 a1Twk6ZLNZsVbOWkxA5hS1PTKXzhDHKMcaEZ/YXfTOkHL/ZH6W/ppCpR37czAnfw
 Q0LDdFWHFHgEHf9ve/WSayUEKSzQWCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Jvg4ipzqQMn6QaVz7
 Kd2gtdRszIO61DhiC/zlFB9TfI=; b=DPzaNTh4pdbP8+qySEYBG+4BG9zZq7i30
 Ov4glrCpPVVYhDROh8PjHHMOd8rV4haLsbSvbjv5d+gIQMSod2m3yiYQumuWKtvG
 PqefjeYSN+hHgUtQ/qvH17kPPDXAvbp9DE5nl900g+Tz704uspZnyNgEHWuWDnkn
 zIOXRERDv/NNUH+skbd+LWb/TC9a3XBJ9MDr7WQayMe3ySXFlnAVdEvyeNWEEjWb
 lQQs1NUi1nnku9Qrs8XDeZrLdKo182+Bt+8SnTh+k2V+5rRqOHsReLwZcEM4aGvp
 +yw8EvEBwgzIfM0O9ga66NkRvVlaWpvSodfCr1m+d4jQ8ZYOUWnzw==
X-ME-Sender: <xms:ePFtXMBEM9_HpQaqGG6yNlGb1taf96IEk3o2mIIojDLagi9mmEE_lQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdejgddvudculddtuddrgedtledrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepghhithhhuhgsrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
 fiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ePFtXJ_X4fj0jbjvLxfC5niNgWTmppqHGin4RRIVd89o5MHk-VTa3Q>
 <xmx:ePFtXOTOZtjyZE8_r-mNrYW5Jm1FDQzp_aUCxxLAiZOwjh8zd4Qk6w>
 <xmx:ePFtXP4deUzB_Aiw3VTMBS4TjOwHieHFkUrGMned8uwdSnXAuZmkvw>
 <xmx:ePFtXNTRzOwLPk7Le5flVvy1ZD6y4xZCyU1dcZvqf4zaLDQEQQqY6g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 199927C1EB; Wed, 20 Feb 2019 19:31:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 52947553
Message-Id: <2984da37-960f-4fb9-a587-5466a4fb4cbe@www.fastmail.com>
In-Reply-To: <CAE33tLHidcVg74E2WVTZ-0i1pH4TfOQPVzB0n02ek3GyDeY-Zw@mail.gmail.com>
References: <CAE33tLGC==CvoJLBV+jUnp=RiFph7wxa0q2o6ZfhrqaNMZtBCQ@mail.gmail.com>
 <1550097803.1007491.1657535928.051F6319@webmail.messagingengine.com>
 <CAE33tLG24aYDx0a7pbNCs8KU=ANT161JvT9c_iPpCQ44Lc5Fbg@mail.gmail.com>
 <1550186888.4139421.1658270160.5405B961@webmail.messagingengine.com>
 <CAE33tLHdxOpH8NsPv6xRLdymAisBsy0smwySkc=V=E6nz28fKQ@mail.gmail.com>
 <1550457918.2790490.1659886984.2F457972@webmail.messagingengine.com>
 <CAE33tLH4_f1tYAektG2GLUh47EFEYybwgcTKi1KP3UV3QuZPtQ@mail.gmail.com>
 <e44dbb70-8630-4bc0-9809-f24b6e9a3815@www.fastmail.com>
 <CAE33tLEdEsdZ+0NXvAuVeWP3145MvL5w=VZQp-_obQPBLSpDGw@mail.gmail.com>
 <7be5b88e-5a17-4f6f-b0dc-9120945a821c@www.fastmail.com>
 <CAE33tLHidcVg74E2WVTZ-0i1pH4TfOQPVzB0n02ek3GyDeY-Zw@mail.gmail.com>
Date: Wed, 20 Feb 2019 19:31:51 -0500
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "AKASH G J" <akashgj91@gmail.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Unable to read or write from system SPI flash memory.
Content-Type: text/plain
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
X-List-Received-Date: Thu, 21 Feb 2019 00:32:01 -0000

Hi Akash,

There's a bit to unpack here.

On Wed, 20 Feb 2019, at 15:02, AKASH G J wrote:
> Andrew, Sorry for the inconvenience.
> 
> For flashing the kernel image, I used the command
> 
> $ *pflash -e -a 0 -f -p fitImage.bin
> *
> *
> *
> and for flashing root file system
> *
> *
> *$ *pflash -e -a *8388608* -f -p obmc.rootfs.cpio.lzma.u-boot**
> **
> **
> ** **After power-off I used the command** *bootm 0x30000000 0x30800000* 
> **in u-boot prompt.
> 

What is the error output of the command? Can you copy/paste it?

Also, can you paste the output of `md.l 0x30000000` and the output of
`hexdump -C fitImage.bin | head` ? 

But I have to ask, *why* are you flashing OpenBMC artifacts to memory on SPI1?

I don't know if this helps, but here's a description of the ASPEEDAST2500 flash
architecture:

1. The BMC has 3 flash controllers attached to the AHB:
  a. 0x1e620000 - "Firmware SPI Memory Controller" (FMC): BMC firmware controller
  b. 0x1e630000 - "SPI Flash Controller 1" (SPI1): Host firmware controller 1
  c. 0x1e631000 - "SPI Flash Controller 2" (SPI2): Host firmware controller 2

2. Each of the three flash controllers has multiple chip-select lines
  a. FMC: Up to 3 chip select lines
  b. SPI1: Up to 2 chip select lines
  c. SPI2: Up to 2 chip select lines

3. The AHB has a memory mapping for the chips of each flash controller, with each
region being subdivided to cater to the chip selects. These sub-ranges are
configurable in each flash controller. The controller mappings and their default
sub-ranges are:

  a. 0x00000000 - 0x0fffffff: FMC
  b. 0x20000000 - 0x2fffffff: FMC
    1. 0x20000000 - 0x27ffffff: CS0
    2. 0x28000000 - 0x29ffffff: CS1
    3. 0x2a000000 - 0x2bffffff: CS2
  c. 0x30000000 - 0x37ffffff: SPI1
    1. 0x30000000 - 0x31ffffff: CS0
    2. 0x32000000 - 0x37ffffff: CS1
  d. 0x38000000 - 0x3fffffff: SPI2
    1. 0x38000000 - 0x39ffffff: CS0
    2. 0x3a000000 - 0x3fffffff: CS1

So there are a couple of answers that I can think of to my question about
why you might be flashing OpenBMC artefacts to a chip behind SPI1:

1. You just want to test a new build without disturbing the BMC flash image
2. You want BMC flash redundancy

For 1, there are many ways you can go about testing images without
trying to do something awkward like flash the artefacts to a chip behind
SPI1:

a. Use QEMU: https://github.com/openbmc/docs/blob/master/cheatsheet.md#using-qemu
  1. We have a fork at https://github.com/openbmc/qemu
  2. Most of the patches are upstream, so you can just e.g.
     `sudo apt install qemu-system-arm` on Debian based systems
b. If you're wanting to test kernel changes on hardware, then I recommend
     setting yourself up so you can netboot kernels on the BMC
c. If you're wanting to test userspace changes, then you can just
    drop the binary into an already running userspace

For 2, you need to be populating CS1 of the FMC; this has the benefit
(perhaps?) of the AST2500's auto-failover mechanism where if the
hardware gets a watchdog event on boot it automagically flips CS0 and
CS1 on the FMC (along with the memory mappings) so you fall-back to
booting from the second chip.

Hope that helps?

Andrew
