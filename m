Return-Path: <a.filippov@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="BCQgbiTU"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 434hKg2zZTzDqth
 for <openbmc@lists.ozlabs.org>; Thu, 29 Nov 2018 00:27:50 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id EBE0C41994;
 Wed, 28 Nov 2018 13:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-disposition:content-type
 :content-type:mime-version:references:message-id:subject:subject
 :from:from:date:date:received:received:received; s=mta-01; t=
 1543411666; x=1545226067; bh=28XRrIadGCC7w9JGa7vLitYRMye2oAmHyG0
 TYYphHDE=; b=BCQgbiTUK6VARmHDov8p5e/9ggyKCISom1S700V6benvNcHg7Mk
 Knc7xdok/i3bhrO2vHZZxvl62R2YrvmnG1uWP1kLUpiStOo0RxD2WZRkkPG+CoSG
 WVopJREqe5YBjpVahfMFGorboZrHC1wx4vwjYmu4gqxo9FVZBxP3FF4k=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cQxdTJQF1Dt0; Wed, 28 Nov 2018 16:27:46 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C332F4198B;
 Wed, 28 Nov 2018 16:27:46 +0300 (MSK)
Received: from localhost (172.17.15.155) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 28
 Nov 2018 16:27:46 +0300
Date: Wed, 28 Nov 2018 16:27:46 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
CC: "Alexander A. Filippov" <a.filippov@yadro.com>, <openbmc@lists.ozlabs.org>
Subject: Re: Proposal to Sync BMC's MAC Address to U-Boot environment
Message-ID: <20181128132746.GA6426@bbwork.lan>
References: <OF9015C576.BDD4A20B-ON00258352.003BDFFF-65258352.003C4190@notes.na.collabserv.com>
 <a31fa95d9b47461a98e5477a94098c5b@yadro.com>
 <efff61d5-645d-7d81-4b75-f26bb465e96a@linux.vnet.ibm.com>
 <20181128091959.GA12725@bbwork.lan>
 <5066d994-22c9-d2a5-3723-b654577f5c75@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <5066d994-22c9-d2a5-3723-b654577f5c75@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Originating-IP: [172.17.15.155]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
X-List-Received-Date: Wed, 28 Nov 2018 13:27:52 -0000

On Wed, Nov 28, 2018 at 06:03:37PM +0530, Ratan Gupta wrote:
> 
> On 28/11/18 2:50 PM, Alexander A. Filippov wrote:
> > On Wed, Nov 28, 2018 at 11:05:32AM +0530, Ratan Gupta wrote:
> > > Hi Alexander,
> > > 
> > > We only restart the systemd-networkd during change of macAddress, if the
> > > interface is DHCP Enabled.BMC should get new IP from the DHCP server if the
> > > mac address has got changed. Do you still see a issue?
> > Yes, and because by default is used DHCP and MAC address is randomly generated,
> > it happens always at first boot or after resetting to the manufactured settings.
> Do you mean to say that we shouldn't restart the systemd-networkd even mac
> address is getting changed? I think we should get the new IP as the mac
> address is changed.

Sure, I understand that we can't change MAC address without a restart of 
the network interface.

But I think there are too many these restarts.
It happens when the default config for the network interface was generated, 
then after MAC address was changed...

Time to time I see other restarts depended by some actions in ipmi. 
I'm not sure what is it. It's maybe our internal stuff.

And second thing, why we want to move the changing of the MAC address to 
the u-boot - it's the possibility to receive the valid IP address from DHCP 
at early stages.

> > 
> > > It would be nice if you can publish your idea also.
> > > 
> > https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/16245
> Sure, thx would go through this change.
> > > --
> > > Regards
> > > Ratan Gupta
> > > 
> > --
> > Cheers,
> > Alexander
> > 
> 

--
Cheers,
Alexander
