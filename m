Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="nJ1Uya9U"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="D2Lisgjh"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40VKZV6L3VzDqRk
 for <openbmc@lists.ozlabs.org>; Tue, 24 Apr 2018 07:38:10 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 883F921D29;
 Mon, 23 Apr 2018 17:38:07 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Mon, 23 Apr 2018 17:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=Anqv43c5OtkJp6BZdORGxq5ZG7y7i
 96mLvbeDE79Zp4=; b=nJ1Uya9UXHl1DgNcETDEerUI7zZDxBUdv1hEppWpgqTBh
 /bYl3T/kDNBryW6/1u01U410k8n5RC1Ds/joydaxy1uELiXwZRFdpklbfs5KaUED
 DimcS2UDQ5ERssjDY/Kl0qZfKG2jukS/7qndkuUlYr1hUgebDVM7p1tYuLTksoJn
 rFUwYSt4mf9HJcO27xITk2X4q1gfBUM9S0Bb07BdyXpJ1nUnocCAiDlchNklEwYc
 hMgANdcgUvxhyr/1XyYc9rGfWXWhbQZ5ehmM+jla6nJIrPZ/4xMXvYPYrIj1Lq9h
 1cYTr02K+MTgwJs0h77wRkMapOmv57/Cjrr4MWTjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Anqv43
 c5OtkJp6BZdORGxq5ZG7y7i96mLvbeDE79Zp4=; b=D2LisgjhFswML6DzdKGv2y
 XMF7/rzg821o2TjVUj3EBizsu1gDansZIGd2McUXBiA2ye++kJXUuqN1Wy7E492o
 MOS64PhJA4OlYZ16Nq4Z5je4qcvnqMvbXU6rUQ54UCHW8FcaljWgdpMamDguwsHK
 mT9b0Q5C3cGnmF7HTO6JbXDD+yJlpl0dp2qWApwheYm6y0PC01jZF+wW2H4RUbhU
 sQY6fUiyz8Wi9GFOCkp6X+x/iPN4hNOsIIJEV8KFpNnXBg7kyCQVVOUFKPxbRgpQ
 Yu9MW4S488K+9vPwNeOAZRwg4gBN3zJTClyrhEVxWFB7V1AbSgupetz3YJV7BOVg
 ==
X-ME-Sender: <xms:P1LeWkWarnOnlak6rBr_ZhWX7dJKkHolrNvB4kCWfIt4QCtIEflpqQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 30F9E41B6; Mon, 23 Apr 2018 17:38:07 -0400 (EDT)
Message-Id: <1524519487.2645865.1348180848.7C74972E@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Mark Brown <mkbrown32@hotmail.com>, Lei YU <mine260309@gmail.com>
Cc: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-f3006b89
Subject: Re: Storage requirements for OpenBMC VirtualBox/Ubuntu build
Date: Tue, 24 Apr 2018 07:08:07 +0930
In-Reply-To: <BY2PR02MB1330F06CDBE6D6F4D032E829AE890@BY2PR02MB1330.namprd02.prod.outlook.com>
References: <BY2PR02MB133014C176DE4E0F77659D8CAEB20@BY2PR02MB1330.namprd02.prod.outlook.com>
 <CAARXrtmD2-BDutebA2ahwzf+LQ2J-BuAUKHBzudR-LW3Jmwaog@mail.gmail.com>
 <BY2PR02MB1330876176E682C90130B503AEB50@BY2PR02MB1330.namprd02.prod.outlook.com>
 <1524118080.2476417.1343258432.7A83D343@webmail.messagingengine.com>
 <BY2PR02MB133046D3DBACC3E265285909AE8B0@BY2PR02MB1330.namprd02.prod.outlook.com>
 <1524445018.4090665.1346967888.78991B5B@webmail.messagingengine.com>
 <BY2PR02MB1330F06CDBE6D6F4D032E829AE890@BY2PR02MB1330.namprd02.prod.outlook.com>
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
X-List-Received-Date: Mon, 23 Apr 2018 21:38:13 -0000

On Mon, 23 Apr 2018, at 23:50, Mark Brown wrote:
> 
> ________________________________________
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Sunday, April 22, 2018 5:56 PM
> To: Mark Brown; Lei YU
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Storage requirements for OpenBMC VirtualBox/Ubuntu build
> 
> On Sun, 22 Apr 2018, at 06:22, Mark Brown wrote:
> > Still have not generated a clean build yet,
> > in the //Windows 10//Virtualbox//Ubuntu 16.04.4// world.
> >
> > I have enclosed a log of the several Warnings and then the final Error,
> > for someone to point out what might be wrong here.
> > I turned on line numbering in my text editor and it says
> > there are 630 lines in this file, so optimal commentary
> > should be addressed to particular line numbers.
> > Thanks.
> >
> ----------------------------------------------------------------------------------------------------------------------------
> 
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_generate_static
> | 32768+0 records in
> | 32768+0 records out
> | 33554432 bytes (34 MB, 32 MiB) copied, 0.173358 s, 194 MB/s
> | dd: failed to open '/home/mark/openbmc/build/tmp/deploy/images/
> palmetto/u-boot.bin': No such file or directory
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_generate_static (log file is located at /
> home/mark/openbmc/build/tmp/work/palmetto-openbmc-linux-gnueabi/obmc-
> phosphor-image/1.0-r0/temp/log.do_generate_static.23730)
> ERROR: Task (/home/mark/openbmc/meta-phosphor/common/recipes-phosphor/
> images/obmc-phosphor-image.bb:do_generate_static) failed with exit code 
> '1'
> NOTE: Tasks Summary: Attempted 3966 tasks of which 18 didn't need to be 
> rerun and 1 failed.
> 
> So there's a bug in the image preparation, it could be a race condition 
> or something more fundamental. Please open an issue against openbmc/
> openbmc with the log you attached and the other referenced logs  
> (e.g.  /home/mark/openbmc/build/tmp/work/palmetto-openbmc-linux-gnueabi/
> obmc-phosphor-image/1.0-r0/temp/log.do_generate_static.23730). We'll 
> continue the discussion there - it seems you've got the process right 
> and so the issue tracker is a more appropriate place to resolve this 
> than the mailing list.
> 
> Finally if you could link to the issue in a reply here that would close 
> the loop nicely.
> 
> Cheers,
> 
> Andrew
> 
> ------------------------------------------------------------------------------------------------------------------
> 
> What I want to know is whether it is the //Windows 10//Virtualbox//
> Ubuntu_16.04.4//
> configuration which is contributing to these  warnings/error  or  do 
> these warnings/error
> occur when you perform builds on a   dedicated Ubuntu (14.04) system ?

16.04 or 14.04?

But regardless, please open the issue and we can sort it out there. I don't have the answer at hand.

> Also, where are the Aspeed AST2400/AST2500 PDFs for download ?

They are not. They are only available under NDA with ASPEED.

Cheers,

Andrew
