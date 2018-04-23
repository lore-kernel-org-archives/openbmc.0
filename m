Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="kmaWxAfa"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RQxudY83"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Tp2T0kyyzF1sZ
 for <openbmc@lists.ozlabs.org>; Mon, 23 Apr 2018 10:57:03 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8FC28217B2;
 Sun, 22 Apr 2018 20:56:58 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Sun, 22 Apr 2018 20:56:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=6uXSax0ivo3FSnxgFLTrHAqVG2QNz
 0LzSPC44GS5zZI=; b=kmaWxAfaf0TFJqW1cxRfZiF3vPJorA2FjVWipzcqljUnN
 La7i/8C+eGLRc3eGDRnDH81trv05IDops0KN6fXHbuOP66NFA6UzflNOjKjEJMU+
 eyufWCt9BCVkbm4tJHTV16mH6CIWaHS67lN73JB3jJs7S/C57NYUNvu3Cxm8ehKo
 qxh/dJuUNS181wM/WDiOwWR3VvGN7nezwOqsd7QtWMlBvN30hu85PiNwQYuKnQt6
 mqnmP0CifJnMz8ER3om1rPLpgG0ST47YRtm+KH/igb/kJmZjC0u11MuT/tKuc69c
 u4s3NvYM0m1JGl7w4aF4z6thVRhZr2yerU2i4s3Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6uXSax
 0ivo3FSnxgFLTrHAqVG2QNz0LzSPC44GS5zZI=; b=RQxudY839hh46Naefl9APr
 dhqYyN7+bK2ZQK2Zo/CSlX3Jq4SiYnnhgpj8io3rV2v/mSimdP5gnFU5GeMtYLtI
 a7DaVz/B+Ixxi2BqvqXVU0yYXbQc+4brslG+SOcvsi207ol9bdgufa5V2HIBBVya
 gQ1Oj8+Ptk+SS7urrX6qXOIWexqbChFKuoFn1wkZ1vXTz5x3XxnqNUqt3qajue3l
 na8ae4BQURpCVWD5haUbT/JWMuvwZVJ/HhFJ6tk8eDxkDrSOU3RNpce1HnoYBG7z
 GmDvlQFU96xMAYT+fG9gJWUoc00Mf5xkuLh4Idhw4Nw72gYKfl20iXS/NavWnOrQ
 ==
X-ME-Sender: <xms:Wi_dWst7IRzMrDl-3MNbQfVOnBKWlUZvDarCxhOq5Hc7UlNQ8-rJ7w>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 391AABA780; Sun, 22 Apr 2018 20:56:58 -0400 (EDT)
Message-Id: <1524445018.4090665.1346967888.78991B5B@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Mark Brown <mkbrown32@hotmail.com>, Lei YU <mine260309@gmail.com>
Cc: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-f3006b89
In-Reply-To: <BY2PR02MB133046D3DBACC3E265285909AE8B0@BY2PR02MB1330.namprd02.prod.outlook.com>
Date: Mon, 23 Apr 2018 10:26:58 +0930
Subject: Re: Storage requirements for OpenBMC VirtualBox/Ubuntu build
References: <BY2PR02MB133014C176DE4E0F77659D8CAEB20@BY2PR02MB1330.namprd02.prod.outlook.com>
 <CAARXrtmD2-BDutebA2ahwzf+LQ2J-BuAUKHBzudR-LW3Jmwaog@mail.gmail.com>
 <BY2PR02MB1330876176E682C90130B503AEB50@BY2PR02MB1330.namprd02.prod.outlook.com>
 <1524118080.2476417.1343258432.7A83D343@webmail.messagingengine.com>
 <BY2PR02MB133046D3DBACC3E265285909AE8B0@BY2PR02MB1330.namprd02.prod.outlook.com>
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
X-List-Received-Date: Mon, 23 Apr 2018 00:57:07 -0000

On Sun, 22 Apr 2018, at 06:22, Mark Brown wrote:
> Still have not generated a clean build yet,
> in the //Windows 10//Virtualbox//Ubuntu 16.04.4// world.
> 
> I have enclosed a log of the several Warnings and then the final Error,
> for someone to point out what might be wrong here.
> I turned on line numbering in my text editor and it says 
> there are 630 lines in this file, so optimal commentary
> should be addressed to particular line numbers.
> Thanks.
> 

| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_generate_static
| 32768+0 records in
| 32768+0 records out
| 33554432 bytes (34 MB, 32 MiB) copied, 0.173358 s, 194 MB/s
| dd: failed to open '/home/mark/openbmc/build/tmp/deploy/images/palmetto/u-boot.bin': No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_generate_static (log file is located at /home/mark/openbmc/build/tmp/work/palmetto-openbmc-linux-gnueabi/obmc-phosphor-image/1.0-r0/temp/log.do_generate_static.23730)
ERROR: Task (/home/mark/openbmc/meta-phosphor/common/recipes-phosphor/images/obmc-phosphor-image.bb:do_generate_static) failed with exit code '1'
NOTE: Tasks Summary: Attempted 3966 tasks of which 18 didn't need to be rerun and 1 failed.

So there's a bug in the image preparation, it could be a race condition or something more fundamental. Please open an issue against openbmc/openbmc with the log you attached and the other referenced logs  (e.g.  /home/mark/openbmc/build/tmp/work/palmetto-openbmc-linux-gnueabi/obmc-phosphor-image/1.0-r0/temp/log.do_generate_static.23730). We'll continue the discussion there - it seems you've got the process right and so the issue tracker is a more appropriate place to resolve this than the mailing list.

Finally if you could link to the issue in a reply here that would close the loop nicely.

Cheers,

Andrew
