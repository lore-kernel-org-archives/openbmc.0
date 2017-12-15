Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yyg1M3mB6zDrhL
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 17:06:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="Zt20ABcc"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3yyg1K65Tgz9rxm;
 Fri, 15 Dec 2017 17:06:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1513318006; bh=BXuJz4jf5d7e2YiMhDyXCuHxB0weYY/aUI5SdPlYEWw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Zt20ABccL4fdLgYuIS2ul+FCZONb0eVxKanojBk3cYI1YKEzrIFKkwXL3kfW2x2ls
 3Td8Tm8dRvTQ8umDhk3W7ddjVqUGvyp68HTDcKofI8JGhyJ6Tm6X0+wZEWp+6XGo+E
 iyVPj4La92Ma3dzZg5TFzGluBCbi6ydEUxtz3ELuoHGCKpH/N6IwJZBRSaaLfqp6Ll
 NCu6DXwQVnzzQr+wPBdDaMjN6wY6/93tZjEif32DaXq7/21jZQPoHwjuuXGZ3DbTtZ
 feQ64ZpXQpVyQQBi1SeWJ9TxmYYW6py57TNcUuCuQjXrpv+srZ85IIl9+C+nYYUD2G
 zwm7CJVNNl6eQ==
Subject: Re: [PATCH net-next] net/ncsi: Don't take any action on HNCDSC AEN
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, netdev@vger.kernel.org
Cc: openbmc@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org, Brian J King <bjking1@us.ibm.com>
References: <20171215051640.10926-1-sam@mendozajonas.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <fe1916de-5eb0-6084-c528-822d06c652e0@ozlabs.org>
Date: Fri, 15 Dec 2017 14:06:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171215051640.10926-1-sam@mendozajonas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Dec 2017 06:06:48 -0000

Hi Sam,

> The current HNCDSC handler takes the status flag from the AEN packet and
> will update or change the current channel based on this flag and the
> current channel status.
> 
> However the flag from the HNCDSC packet merely represents the host link
> state. While the state of the host interface is potentially interesting
> information it should not affect the state of the NCSI link. Indeed the
> NCSI specification makes no mention of any recommended action related to
> the host network controller driver state.

Yep, sounds good to me. If the link status does change, we should see an
separate AEN for that event.

Acked-by: Jeremy Kerr <jk@ozlabs.org>

However: we're looking at some behaviour of Broadcom NICs at the moment,
where the phy will be reset on link change events. We'd want to make
sure that we're not just seeing the HNCDSC events for that too. I'd
suggest we also get an Ack from Brian (CCed) to make sure we're not
breaking that case.

Cheers,


Jeremy
