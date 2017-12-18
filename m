Return-Path: <davem@davemloft.net>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=davemloft.net
 (client-ip=184.105.139.130; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [184.105.139.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z0s8Y4885zDsRt
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 06:50:35 +1100 (AEDT)
Received: from localhost (unknown [38.140.131.194])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 5DEFC13EA4177;
 Mon, 18 Dec 2017 11:50:30 -0800 (PST)
Date: Mon, 18 Dec 2017 14:50:29 -0500 (EST)
Message-Id: <20171218.145029.1566604436298914194.davem@davemloft.net>
To: sam@mendozajonas.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH net-next] net/ncsi: Don't take any action on HNCDSC AEN
From: David Miller <davem@davemloft.net>
In-Reply-To: <20171215051640.10926-1-sam@mendozajonas.com>
References: <20171215051640.10926-1-sam@mendozajonas.com>
X-Mailer: Mew version 6.7 on Emacs 25.3 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 18 Dec 2017 11:50:30 -0800 (PST)
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
X-List-Received-Date: Mon, 18 Dec 2017 19:50:40 -0000

From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Fri, 15 Dec 2017 16:16:40 +1100

> The current HNCDSC handler takes the status flag from the AEN packet and
> will update or change the current channel based on this flag and the
> current channel status.
> 
> However the flag from the HNCDSC packet merely represents the host link
> state. While the state of the host interface is potentially interesting
> information it should not affect the state of the NCSI link. Indeed the
> NCSI specification makes no mention of any recommended action related to
> the host network controller driver state.
> 
> Update the HNCDSC handler to record the host network driver status but
> take no other action.
> 
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

Applied, thanks.
