Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="IxQpYdFR"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UHYje/pD"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428S4313dtzF397
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 11:28:50 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4124A21EA7;
 Mon, 10 Sep 2018 21:28:48 -0400 (EDT)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Mon, 10 Sep 2018 21:28:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=FVPX6QYaznLpazMPBRCXYPEffj94M
 9w80X0NdhqhTI4=; b=IxQpYdFR+j+Xc7dBN6kN/qKaW/maHnXbYO7KcO6osWbgk
 nFqpoRe2xHKdqQxbA/D7jGayfrHGAB3mSGrc9sMxHJb38wLDsECq5OM9+SOzPr+y
 6jOxNYES3KcJtONihcKboJjAWwgwuyqin5SVJlN6S4Wsuahk5yHDKTdIHMrLYJ6D
 EZQCrdgjmABan1kj9OemM8+OumcDe1UFUuI5tmo1Jb0ksBRqnprgz91EqH9+0tLm
 B8FWSQCMk9LnoVw4LHiHlkdxzXOAX1ixEwOC1jqLydSRj5zA+wnlLbKQ6Drmhk2M
 k7TTPTmWOgqxnfnr4r1i3GZiPYHu1XcBmZQdOX/Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FVPX6Q
 YaznLpazMPBRCXYPEffj94M9w80X0NdhqhTI4=; b=UHYje/pDza/aS7dZfamIgU
 ynaJJgasnbsvMfHMHtaHxv/hqc5+xxeWTrZ25NbzITVn18QYOezW6wtblkz5FYwg
 eD8FN7drOEviu7qIPiNy4Kl+dNKy56AcaDubVVC2fm0286edOd9XfwH0HOtbbl36
 zsJfyJtpHAdqG+vVhCRy3je9CLtLtXUuryllzMZCQbbY6QZcdSKjyzq4raN0i5Yl
 xgKzIIn5kVj7VP3F9+giCHHFwzZ3nAEWhC5TAiVuqMUww7na8AsJRBED6UM7LYkL
 cw0BpA2SnYiQvivYaWEymUqwqV9PNp8SA6kDrCkwXBImdcp+IS8qVM76+gQEeq9A
 ==
X-ME-Proxy: <xmx:TxqXW6Yte_ZBRnnIXbZRLXY8R34bgQpx2EN7NRMZsx0QIszBe_B0ag>
 <xmx:TxqXW_N-JqwFZ6de2tvhq9uyDha7AE4g6tjXddFT6vH3nsSsr7WXzg>
 <xmx:TxqXW2uJ20LueFZ3tuXdsszMdQCTMQEL9l6ZruvQQkD3Lh-YlApCfw>
 <xmx:TxqXW91utfV2ee2A5l1ChOL1tribgegHqq2IqRTYluaDiL7JLhxtCw>
 <xmx:TxqXW8Uc-0wA-Cqy5UquiqAFmmOrLKysx0i1rEC7W4hqkWDVWD99hg>
 <xmx:UBqXWw7Gx6zmYSXdEtkH7uUKfUKFHdXmk4KYMnMb-uDMaOZCSw2ODg>
X-ME-Sender: <xms:TxqXW-JvcgjnoEj64W4qpAdpBd_3hEYwNwD8VSkQfynIYifD9I6v3A>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 214E59E53C; Mon, 10 Sep 2018 21:28:47 -0400 (EDT)
Message-Id: <1536629327.3454887.1503645880.7FE96DC2@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: "Wang, Kuiying" <kuiying.wang@intel.com>,
 Andrew Geissler <geissonator@gmail.com>, Joel Stanley <joel@jms.id.au>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Andrew Geissler <geissonator@yahoo.com>, chunhui.jia@linux.intel.com,
 kunyi731@gmail.com, "Mihm, James" <james.mihm@intel.com>, "Tanous,
 Ed" <ed.tanous@intel.com>, "Feist, James" <james.feist@intel.com>, "Jia,
 Chunhui" <chunhui.jia@intel.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Li,
 Yong B" <yong.b.li@intel.com>, "Yang, Cheng C" <cheng.c.yang@intel.com>,
 "Xu, Qiang" <qiang.xu@intel.com>, "Nguyen, Hai V" <hai.v.nguyen@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-1234af23
Subject: Re: [PATCH linux dev-4.18] ASPEED: dts: Define the gpio-line-names
 property for aspeed-g5
Date: Tue, 11 Sep 2018 10:58:47 +0930
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E77249E0F323@shsmsx102.ccr.corp.intel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E77249E0F1FA@shsmsx102.ccr.corp.intel.com>
 <1536565015.72467.1502515344.359BB453@webmail.messagingengine.com>
 <959CAFA1E282D14FB901BE9A7BF4E77249E0F323@shsmsx102.ccr.corp.intel.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2018 01:28:55 -0000

On Mon, 10 Sep 2018, at 17:26, Wang, Kuiying wrote:
> Hi Andrew J,
> This is just common definition for aspeed-g5.
> There will be different configuration for specified platform just like 
> following:
> https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-intel/+/12178/1/meta-intel/meta-s2600wf/recipes-phosphor/skeleton/obmc-libobmc-intf/gpio_defs.json 

Are you doing a string match on the pin name from the structures returned by ioctls on the gpiochip's chardev? This won't work if someone decides to specify the semantic name of the line in the devicetree like I linked to in my previous reply. Your best bet is to map the pin name from the JSON to the pin index on the gpiochip. Doing it any other way is fragile.

Andrew
