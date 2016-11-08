Return-Path: <clg@kaod.org>
X-Greylist: delayed 314 seconds by postgrey-1.36 at bilbo;
 Tue, 08 Nov 2016 21:04:22 AEDT
Received: from 12.mo5.mail-out.ovh.net (12.mo5.mail-out.ovh.net [46.105.39.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tClK229qXzDt1d
 for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2016 21:04:22 +1100 (AEDT)
Received: from player688.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 8F2D73FD30
 for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2016 10:59:01 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player688.ha.ovh.net (Postfix) with ESMTPSA id 08762200C3;
 Tue,  8 Nov 2016 10:58:56 +0100 (CET)
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
 <66e47401-a567-c100-2a92-ca2ff32023a2@kaod.org>
 <20161107150257.ug6zvs4v656cesep@asimov>
 <CAFd5g45UOpJ8-3o-upx8jxN2hVDxh8Gkw6_+EbjzNKqaxsc-sw@mail.gmail.com>
Cc: Cyril Bur <cyrilbur@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2ef7d34a-abd4-6b8d-ec80-e19f036aa089@kaod.org>
Date: Tue, 8 Nov 2016 10:58:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g45UOpJ8-3o-upx8jxN2hVDxh8Gkw6_+EbjzNKqaxsc-sw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11665448938561112834
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrleeigddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Tue, 08 Nov 2016 10:04:24 -0000

Hello Brendan,

On 11/07/2016 08:29 PM, Brendan Higgins wrote:
> Patrick, you are correct.
> 
> The { Seq, Command, NetFn } set does not necessarily uniquely identify a message. 
> The the OEM/Group extension messages as defined in the IPMI v2.0 Specification 
> Document Revision 1.1, Section 5.1 Network Function Codes, Table 5, under the 
> name OEM/Group defines unique message endpoints by the following set: 
> 
>    { NetFn, Payload{0, 1, 2}, Command }; 
>
> where Payload{0, 1, 2} are the first three bytes of a message payload.

OK. I missed that part. I was referring to : 

  11.1 BT Interface-BMC Request Message Format

    ...
    The Seq field is used in combination with the NetFn and Command fields to 
    form a unique value. I.e. the same Seq value could be used in multiple 
    outstanding requests, as long as the combinations of Seq value, NetFn, 
    and Command were unique among the requests.
    ...
and

  11.3 Using the Seq Field
  11.4 Response Expiration Handling

    ...
    The BMC can define its own internal Seq value or tracking number for
    this purpose, or it could use the Seq, NetFn, and Command values in the
    same manner as SMS.
    ...

> In addition, I am working on an OEM/Group extension that would allow a single 
> transaction to take place across multiple messages, and in particular would 
> allow multiple IPMI requests to be sent, potentially only sending (a) 
> response(s) at the end of the transaction; in particular, this would allow 
> the following:
> 
> Master     | Slave
> Request -> |
> Request -> |
> Request -> |
>            | <- Response
>            | <- Response
> 
> Where Request and Response have the same sequence number. Note: the change 
> I am making would also make the above example valid if there were only one 
> request and two responses.

I am wondering how that fits with the BT Interface Capabilities which can 
recommend retries.

> @Cédric I see two remedies for your patch to allow this:
> 
> 1) Allow users to opt out of the expiry list.

yes that's should not be too hard.

> 2) Update the keep alive list when *either* a new request or a new response 
> is sent with a given sequence number (change the list to be a hashmap of 
> sequence numbers to timeouts).

The BMC driver could also define its own 'Seq' identifier (using the tuple 
above) to do the request/response matching instead of using the 'Seq' byte.

> I will try to get a design doc for discussion describing this extension out 
> hopefully sometime this week; I think that might clear some things up.

OK but we should be having this discussion on :
 
	openipmi-developer@lists.sourceforge.net

where the patches are being discussed. Corey would have some very valuable
input. Could you join that thread ? 

	http://lists.infradead.org/pipermail/linux-arm-kernel/2016-November/465131.html
	
Or I can copy you, it might be easier and then you can start another thread
with your design.

Thanks!

C. 
