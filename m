Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SMdYI+ZP"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Nzq8emW8"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qdj52vXVzDqgK
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 11:43:52 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A704921221;
 Mon, 21 May 2018 21:43:47 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Mon, 21 May 2018 21:43:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=DK3MpbSTkWOceumyfOjrCxoSloyNpyUe19psnHDw/pk=; b=SMdYI+ZP
 Lj/ntALPONDTGeU05xYzPiO0TgpEwr8nTO6KSQGRl7R2QMgicqIyOqhuuqAP5gbR
 KrOw7JX0d5GcNNd8Sa2uqIcLuLRW9bNoGobDcKfxTsnmNOR6CyWO8aJ5k3lckvQ2
 ntsJ+VPDRt98IpP+YPhoDJ1NkeS63GWJvdUA3a+VkkoeML7h+P4g/8cUzgy9JFId
 0tRmZqXSZYcwr02BhANuf/IGgQeIUA2cIn0pAJsIp/j+BeW9NcXRbca42hc6MKe0
 TnZGEkCiE47yOtqeqwy0QWomK475iFNeTk52YEJ283In3YkCVu9UqfEVOCO6I/Br
 tC+9mBgaEXawyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=DK3MpbSTkWOceumyfOjrCxoSloyNp
 yUe19psnHDw/pk=; b=Nzq8emW8QdwulJQDSx8jai8EQomt5/O4xQU5CP+D4+8Um
 1eRbxyazzGYx52nX914W72ahxeCNj+9ozdIYTEdUW7+Gki9IQfRri2Tq+5qOMxUz
 uiNMAdmex6QIbblijj2LWTgFd4f6QDh5IVnK/4ESq6J0jlaagGwUq7siaSF0Ngff
 B1Mc88De9VurafRvJ2oHiSmeaKNrsXAxaAovYv5G8lyMOq3/RRh2y8TTzA3ZWL81
 zJQBHFPWmVOvSFcKTZulfm4u079JR+M7Vcmew9+S7GVLqwXZTmZ7C0g0IqJg6Qeu
 14I8mN7Upe6qpVTswnTX2FT0SIGJyBQalXBdEJyfQ==
X-ME-Proxy: <xmx:03UDW2Nwze6V9i2brVVrXvQG1sQlGcODdT4925CB3t6nawWz0J653g>
X-ME-Proxy: <xmx:03UDW95JfJ-mMhMRi_2lZRjRseg07VCV1l4R675sbMUKZfLm9oLDxA>
X-ME-Proxy: <xmx:03UDW_PSiMzggF5rH_8IdqEE_2q4hcHsQkVBP8r8xqBfCKSuzXPDtA>
X-ME-Proxy: <xmx:03UDWznWYBHlgQxIb0FiGj_MjBZuLjY9E4NIHolH8XSGKfgtzn8yfA>
X-ME-Proxy: <xmx:03UDW-RjEANXhCTdpqCojhZATtlEKtGcio62qjRMMfsEWZ5CvxNbbA>
X-ME-Proxy: <xmx:03UDW1oWj0ZIBS2iZ6mxW4rdZ7LXeFgWFH3ZaV4nRmVhRNVFODQUcQ>
X-ME-Sender: <xms:03UDWwlapLgPhHpE2aLcLJhv5EWLB6oNkqaLUYQqF3kBOFZbJ99KiQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 624B441A0; Mon, 21 May 2018 21:43:47 -0400 (EDT)
Message-Id: <1526953427.458876.1380098832.53C3F9C7@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: bradleyb@fuzziesquirrel.com, Andrew Geissler <geissonator@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-a224ff37
Subject: obmc-gerrit: A tool for automagically adding reviewers to your patches
Date: Tue, 22 May 2018 11:13:47 +0930
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
X-List-Received-Date: Tue, 22 May 2018 01:43:55 -0000

Hello,

I've created a helper script that automatically adds reviewers to your patches when you push them to Gerrit:

https://github.com/openbmc/openbmc-tools/tree/master/amboar/obmc-scripts/maintainers

Why do you care? I'm hoping that it reduces the time it takes for your patches to get attention *and* relieves you from the tedium of adding the reviewers yourself.

The script is a wrapper for `git push` that also parses the MAINTAINERS file in the root of the repository. I recently sent a flood of patches adding a MAINTAINERS file to each repo maintained by the OpenBMC organisation, so obmc-gerrit should be generally useful in the very near future.

I'm always open to feedback, so make sure to reply here or ping me on IRC if you have opinions.

Cheers,

Andrew
