Return-Path: <a.filippov@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="v4DCfMfk"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4343sL3mPJzDqVY
 for <openbmc@lists.ozlabs.org>; Wed, 28 Nov 2018 00:04:38 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id CE4314196B;
 Tue, 27 Nov 2018 13:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 mime-version:content-transfer-encoding:content-type:content-type
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mta-01; t=1543323872; x=
 1545138273; bh=oHyVONJnmnlNT68K3CeCZkJTtUkC+DdSqPAE6wg53sU=; b=v
 4DCfMfkpRvzQmIAeSTZky67TRz9zj7bCBlPFPS9ehUVgrUGtmiovghfar9BZNptz
 WXxqmkcJ+Ovg3uJGTeOre2Agbsrw7BzcBSWjVkB3EKenMJYXWCC1+QkVgaFR0vVZ
 YtQEPhOWcC1/RLCkJOZfaYEM6CfRltocIbHcq396Vs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id he4xLbrkVBWo; Tue, 27 Nov 2018 16:04:32 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id DC5FF41943;
 Tue, 27 Nov 2018 16:04:32 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (172.17.10.102) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 27 Nov 2018 16:04:32 +0300
Received: from T-EXCH-02.corp.yadro.com ([fe80::45c7:9467:6da:3de3]) by
 T-EXCH-02.corp.yadro.com ([fe80::45c7:9467:6da:3de3%14]) with mapi id
 15.01.0669.032; Tue, 27 Nov 2018 16:04:32 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Nagaraju Goruganti <ngorugan@in.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Proposal to Sync BMC's MAC Address to U-Boot environment
Thread-Topic: Proposal to Sync BMC's MAC Address to U-Boot environment
Thread-Index: AQHUhkAvYKp9BgkxI0a2RqZwLjNq66Vjk77s
Date: Tue, 27 Nov 2018 13:04:32 +0000
Message-ID: <a31fa95d9b47461a98e5477a94098c5b@yadro.com>
References: <OF9015C576.BDD4A20B-ON00258352.003BDFFF-65258352.003C4190@notes.na.collabserv.com>
In-Reply-To: <OF9015C576.BDD4A20B-ON00258352.003BDFFF-65258352.003C4190@notes.na.collabserv.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [172.17.15.155]
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 27 Nov 2018 13:04:39 -0000

Hi there,

On our VESNIN servers it work by the same scenario.
This way gives an excess restart of the systemd-network.service and it look=
s uncomfortable.

For this reason, I wrote an implementation of the aspeed-i2c and VPD-parser=
 for the u-boot-aspeed.=20
It has one bug - i2c does not work at the cold start (after the power cord =
plugged). I will fix it later.

The general idea, why it is not sent to the community yet - the mainline of=
 the u-boot already has the implementation of the aspeed-i2c but has no sup=
port (or maybe not full) of ast-2400 (which we are using). It also in our p=
lans but with lower priority.

If you interested in any of these solutions, I can publish them.

--
Regards,
Alexander Filippov
Software Engineer, YADRO.=20

________________________________________
=EF=D4: openbmc <openbmc-bounces+a.filippov=3Dyadro.com@lists.ozlabs.org> =
=CF=D4 =C9=CD=C5=CE=C9 Nagaraju Goruganti <ngorugan@in.ibm.com>
=EF=D4=D0=D2=C1=D7=CC=C5=CE=CF: 27 =CE=CF=D1=C2=D2=D1 2018 =C7. 13:58:01
=EB=CF=CD=D5: openbmc@lists.ozlabs.org
=F4=C5=CD=C1: Proposal to Sync BMC's MAC Address to U-Boot environment

HI All,

As we want to get rid of python, making this proposal to sync BMC's MAC Add=
ress to U-Boot environment(assuming this is a common requirement across Ope=
nBMC based systems).

Proposal:

Platform specific code :

a) Get MAC Address from platform specific NV storage (BMC VPD on OpenPOWER =
systems) into an inventory object. It is being done by openpower-vpd-parser=
 on the openpower systems .

Common code:

b) A script (invoked by systemd on the way to BMC ready state) fetches BMC =
MAC Address from (platform specific) inventory object. If this MAC Address =
and the one in u-boot environment are different (or if the u-boot one is em=
pty), then the script writes the inventory MAC Address to u-boot using fw_s=
etenv.

c) The script can reside in a phosphor layer.

Existing Python script:

The existing python script(openbmc/skeleton/pyinventorymgr/sync_inventory_i=
tems.py) does the same thing.


We need a opinion from the community members on this proposal.

Best Regards,

Nagaraju G
