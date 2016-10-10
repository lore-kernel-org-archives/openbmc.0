Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3st41C2VCwzDrbq
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 02:34:23 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3st41B6vy3z9rvt;
 Tue, 11 Oct 2016 02:34:22 +1100 (AEDT)
Subject: Re: [PATCH linux v2 17/17] drivers/fsi: Add GPIO master functionality
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
References: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475948333-55960-18-git-send-email-christopher.lee.bostic@gmail.com>
 <92b7a5c0-71ae-7af7-8090-45f4375a39d5@ozlabs.org>
 <CAA0LjjW5Zti-9MJinpN8wM3j6DHJ9W5JT9XtuC80MG7WEkZwXw@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <0143e2e4-66ec-5bc4-ae49-2eb2dcbb1e0c@ozlabs.org>
Date: Mon, 10 Oct 2016 23:34:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAA0LjjW5Zti-9MJinpN8wM3j6DHJ9W5JT9XtuC80MG7WEkZwXw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 10 Oct 2016 15:34:23 -0000

Hi Chris,

> OK Will update the dev-tree binding.

OK, but we should sort out the below first:

> Good question about other implementations.  It is possible that they
> could have only clock and data.  I suspect some type of enable should
> be used but it wouldn't be strictly necessary.  What would you suggest
> given the potential for pin differences between platforms?

Make only the clk and data descriptors mandatory, and the others
optional. Enable extra functionality on the master if the other GPIOs
are present & described.

Cheers,


Jeremy
