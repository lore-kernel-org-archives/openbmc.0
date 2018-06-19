Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="PHs8rQVN"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MB82n3RG"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418wmp5QjnzF0Tn
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jun 2018 15:02:02 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1145321E93;
 Tue, 19 Jun 2018 01:02:00 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Tue, 19 Jun 2018 01:02:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=0kt9mearv7Ub2Iv5I0w+hJKVyCLDi
 QBsCorJCTdF+VQ=; b=PHs8rQVNSoYWAoLYtBDJrSyWAdAm5xO4FofHwytec1awt
 GCsbcmW6DHpzGJgfWrCEnZQHjyc3DTq0XxCqJUWXuULJrHJY7V+y1tXwjEcvGGXn
 GwYcmeRxGlwTVZGRW+ThlFE1OG2/pGxguO2LmDck5+bgjoqNbgLU3Ap2HRcuo8Kd
 G3tm6NTZol3qnIbjeIgM4ATEk+uzGc/8gedKQaRyTHyrR4t2zgoPo/JmVep8pKX0
 qoNtbPPDTpQGaPq01vGTW/NlwJx+dQy0P0BHeN1ihrz1Fh2cTiXQM/0JZBh7++6Q
 DKyNyjTEcgfGKjj/ZZfBvXTe0E3zJvdGELKEJ2sEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0kt9me
 arv7Ub2Iv5I0w+hJKVyCLDiQBsCorJCTdF+VQ=; b=MB82n3RG0m6AmV/QmP7SMY
 LdFwgbZULkCwXn7vndj3Z/0AcF8HKEGdMctWIp7vkPV/hfCigAs9dnSDRn+fbk8E
 QIUvzyA1iXXFz7fsJUrULJ5gQfLvtZbhqffIbeDxn9XeBQP7gq+VQsP7G9oD4b4G
 fHHamvvyNM+kd9P1GGmtyScUg/E7wQKCrEvwAc+Gm6hilQ7wjJVEwECJ5eIMhS3G
 qLEdDWIqv3UDRAswi+i/CsfgGNSCoWhp87oV9rmHY0HQWDex3WeQo6GwpaBEAqap
 Hdy52ParLFDgZxh0S5uzBCo+spaQ4f1aDZlrFsZX0DnKElAOcCt6INnLfhvAWkNA
 ==
X-ME-Proxy: <xmx:R44oW7NUD9-I65a1pIvuiJqt-yeNvnOtJXl6xlEbCL1hMoeVwU3L8w>
 <xmx:R44oWzzww-e6WAZg8ZajOnGcPtBhW-6RtkUoji_by32kPZq5EopcHw>
 <xmx:R44oW0tn1OQcOFAhD5uMdNhgSIIAfOqkiRNYerasfqTcgc2nYMZKQQ>
 <xmx:R44oW86q99TADANjhP4dm2jufNiirYjVN_A7tEo7m9mFPi64goojlw>
 <xmx:R44oWzThu9JkAKL1komb208UNhMj5QDp22jQWekV4I4jr0LprtktPQ>
 <xmx:SI4oW-ps9Si6p0MyOMPRxCAb5COIOjZoJXMNOPnFWMA1imJ4QHrQeA>
X-ME-Sender: <xms:R44oW5KvMLoEfJ4L0OAjsXfDszhHT4dW_B5utHQk-vAa-VFycXNXWw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id BBF5FBA43D; Tue, 19 Jun 2018 01:01:59 -0400 (EDT)
Message-Id: <1529384519.3876096.1412667488.17D5361D@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: james.mihm@gmail.com, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-0d8ea36c
Date: Tue, 19 Jun 2018 14:31:59 +0930
References: <000000000000ebc0ca056ef350df@google.com>
In-Reply-To: <000000000000ebc0ca056ef350df@google.com>
Subject: Re: Poll - Fall 2018 OpenBMC Hackathon 
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
X-List-Received-Date: Tue, 19 Jun 2018 05:02:03 -0000

On Tue, 19 Jun 2018, at 09:26, james.mihm@gmail.com wrote:
> I've invited you to fill out the following form:
> OpenBMC Hackathon
> 
> To fill it out, visit:
> https://docs.google.com/forms/d/e/1FAIpQLSeGn5x4Y-6vgu3_AyY3YsIr_JVU5YCjLXufuXxdT9Qy6sz42Q/viewform?c=0&amp;w=1&amp;usp=mail_form_link
> 
> I&#39;ve invited you to fill out a form:
> 
> Google Forms: Create and analyze surveys.

Maybe we should add 'either' and 'neither' options so people can register their interest appropriately?

Cheers,

Andrew
