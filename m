Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="kfPwX/ao"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="AD/5HBoS"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RT7750TjzF20x
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 16:08:03 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 31CEC21AD0;
 Thu, 19 Apr 2018 02:08:00 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Thu, 19 Apr 2018 02:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=nnJWm3waM5Ubanm1GyQZJLq3yhmVf
 VZe3LR0c76CcuQ=; b=kfPwX/aozydCb2rJVirJVq7yNt7BM+KM4CaG/5KiUzLkY
 dUXnYrW/Q6xLn/Vn1WBWNMQeEpN7Xa5CQlMglad9MW2angNngqMZoy4sYI+baRSO
 2cxffmWP91NG7eeUcsq6aCg3FLdWzs/y+jCXVyyOp3Y0mLRrz5EuMXXKvonY3V9t
 X2OWsfxPjDZ40QbOCOOHrLi1KWAyBCtDaNheX411stAsa9hLYa6SazidIAK6Oxw1
 TaHksM+vRWIiyHKk96pupAuanbAW239nOxJUJ/mROaLVF42DWkxsYLuQ8tOq9/do
 6EEnmBGfFCp+CNL6hEXSZfm2WtvB2EeJthFoGL3GA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=nnJWm3
 waM5Ubanm1GyQZJLq3yhmVfVZe3LR0c76CcuQ=; b=AD/5HBoSP0UPMXLuzQcYVJ
 fnGWpkc93pQSyfvHuwipDwpX3i/U7po+B7Zr4fpQgKD2LCNVpJ1aG5oos/6mq3H8
 ATHz/fWzmQ/sttHerbYPQRqyK1koK+E36OIjcpFk+l2tkzMO3XartWa6x189GyKz
 l5ir6JY+D/whapIJd2eoowfHLs0hSqyrdPmpp/9qQS7JwTl+I4OB3q6Fdf/i1bsK
 1SFk/WujyJhA4xtNifIacOAUXArUWBq7PSpzwC0iDJpiKH5Oy7TbZapAfE/MZNGu
 xmHuRw+0XI7p3dohs3XhYkBy3isjtxBzQAHlLWLGtYnCLCRx7QRsZI4bwCvlPSsQ
 ==
X-ME-Sender: <xms:QDLYWvdNo2YX5jTQeJkTTvboV3LlnmN5tBVEGDsAg_04jUC70lpv_Q>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 90A9B4256; Thu, 19 Apr 2018 02:08:00 -0400 (EDT)
Message-Id: <1524118080.2476417.1343258432.7A83D343@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Mark Brown <mkbrown32@hotmail.com>, Lei YU <mine260309@gmail.com>
Cc: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-f3006b89
References: <BY2PR02MB133014C176DE4E0F77659D8CAEB20@BY2PR02MB1330.namprd02.prod.outlook.com>
 <CAARXrtmD2-BDutebA2ahwzf+LQ2J-BuAUKHBzudR-LW3Jmwaog@mail.gmail.com>
 <BY2PR02MB1330876176E682C90130B503AEB50@BY2PR02MB1330.namprd02.prod.outlook.com>
Subject: Re: Storage requirements for OpenBMC VirtualBox/Ubuntu build
In-Reply-To: <BY2PR02MB1330876176E682C90130B503AEB50@BY2PR02MB1330.namprd02.prod.outlook.com>
Date: Thu, 19 Apr 2018 15:38:00 +0930
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
X-List-Received-Date: Thu, 19 Apr 2018 06:08:04 -0000

On Thu, 19 Apr 2018, at 14:54, Mark Brown wrote:
> In my Ubuntu 16.04.4, I used Vboxmanage to increase to 40GB (33GB sda1), 
> which was not enough,
> so I doubled it to 80GB (73GB sda1) and 
> then it ran through approximately 3,000 of the 4,000 tasks,
> then had an Error "/bin/sh"..."not found"..."quilt".
> whereis shows that "quilt" is installed, so this makes no sense.
> I am running Ubuntu 16.04.4, not 14.04 .
> Any ideas ?
> 

I accidentally broke the u-boot recipe recently whilst resolving other bugs[1], but the break has been fixed[2]. Try updating your local branch and building again.

Hope that helps,

Andrew

[1] https://gerrit.openbmc-project.xyz/#/c/9954/
[2] https://gerrit.openbmc-project.xyz/#/c/10117/
