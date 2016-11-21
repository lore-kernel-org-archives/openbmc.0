Return-Path: <clg@kaod.org>
Received: from 13.mo3.mail-out.ovh.net (13.mo3.mail-out.ovh.net
 [188.165.33.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMphj1r66zDvjG
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 00:04:21 +1100 (AEDT)
Received: from player734.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 3A1A8602E2
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 14:04:18 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id 15F5A280085;
 Mon, 21 Nov 2016 14:04:17 +0100 (CET)
Subject: Re: [PATCH qemu 37/38] slirp: add a fake NCSI backend
To: Joel Stanley <joel@jms.id.au>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-38-git-send-email-clg@kaod.org>
 <CACPK8Xd=9AtdSFDbxaOWXAjYBwOVYN1xDEDNcwyM42uarQXP1A@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bc380425-5094-3621-1943-6054344a5d97@kaod.org>
Date: Mon, 21 Nov 2016 14:04:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xd=9AtdSFDbxaOWXAjYBwOVYN1xDEDNcwyM42uarQXP1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17352932316716174082
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdefgdeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 21 Nov 2016 13:04:21 -0000

On 11/21/2016 08:26 AM, Joel Stanley wrote:
> On Sat, Nov 19, 2016 at 12:52 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> This only reverses the NCSI packets to make the Linux driver happy.
>>
>> The NCSI header file <ncsi-pkt.h> comes from Linux.
> 
> It's changed a tad, can you please grab the latest version from upstream?

sure.

C.

>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  include/net/eth.h   |   1 +
>>  slirp/Makefile.objs |   2 +-
>>  slirp/ncsi-pkt.h    | 394 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  slirp/ncsi.c        |  95 +++++++++++++
>>  slirp/slirp.c       |   4 +
>>  slirp/slirp.h       |   3 +
>>  6 files changed, 498 insertions(+), 1 deletion(-)
>>  create mode 100644 slirp/ncsi-pkt.h
>>  create mode 100644 slirp/ncsi.c
