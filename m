Return-Path: <clg@kaod.org>
Received: from 9.mo1.mail-out.ovh.net (9.mo1.mail-out.ovh.net [178.32.108.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tC1B60vdmzDsyY
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 16:25:50 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 9BC1417AC9
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 06:25:45 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id 446753C006A;
 Mon,  7 Nov 2016 06:25:42 +0100 (CET)
Subject: Re: [PATCH linux dev-4.7 7/8] ipmi: maintain a request expiry list
To: Brendan Higgins <brendanhiggins@google.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
 <1477465067-19034-8-git-send-email-clg@kaod.org>
 <1478132769.728.3.camel@gmail.com> <20161103182300.wt2lyseogigfxqfn@asimov>
 <53954820-3eaf-56c6-0a4c-9347ff4dc358@kaod.org>
 <20161104015543.GD17105@heinlein.lan>
 <c1423337-705b-5d24-4205-c9ce8c32f1f4@kaod.org>
 <CAFd5g45PHWivKg17TRofahmtpZiTP8eWpBVrds=XB1EBh1t7QA@mail.gmail.com>
Cc: Cyril Bur <cyrilbur@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <66e47401-a567-c100-2a92-ca2ff32023a2@kaod.org>
Date: Mon, 7 Nov 2016 06:25:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g45PHWivKg17TRofahmtpZiTP8eWpBVrds=XB1EBh1t7QA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 1177972779648912130
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrleefgddvgeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Mon, 07 Nov 2016 05:25:50 -0000

Hello,

On 11/04/2016 07:22 PM, Brendan Higgins wrote:
> Thanks for roping me in,
> 
> Patrick summed up my intention perfectly. IPMI messages will be structured 
> the same and use compatible fields, but would allow for different flow control. 
> In particular, the goal is to allow multiple requests and responses under a 
> single sequence number.

So if the combinations of { Seq, Command, NetFn } values are unique, we 
should be fine. The expiry list patch needs to be more precise when doing 
matching though.

Thanks,

C. 
