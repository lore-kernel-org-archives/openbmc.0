Return-Path: <miltonm@us.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=miltonm@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Y3b42PchzDqHF
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 07:19:11 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x31KIqdT057076
 for <openbmc@lists.ozlabs.org>; Mon, 1 Apr 2019 16:19:09 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.67])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rkq85fyg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 16:19:09 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Mon, 1 Apr 2019 20:19:08 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 1 Apr 2019 20:18:39 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2019040120183920-1179743 ;
 Mon, 1 Apr 2019 20:18:39 +0000 
In-Reply-To: <958a300d-e767-2589-f074-183ba761c129@linux.intel.com>
Subject: Re: [PATCH dev-5.0 v2 1/5] media: platform: Aspeed: Remove use of
 reset line
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Eddie James <eajames@linux.vnet.ibm.com>, Eddie James
 <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Date: Mon, 1 Apr 2019 20:18:39 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <958a300d-e767-2589-f074-183ba761c129@linux.intel.com>,
 <1553894143-559-1-git-send-email-eajames@linux.ibm.com>
 <1553894143-559-2-git-send-email-eajames@linux.ibm.com>
 <41569937-f8bc-b391-8b19-c931a11e20d8@linux.intel.com>
 <ee4ae2fb-624d-d1d1-ef9f-b35de3c4f458@linux.vnet.ibm.com>
X-Mailer: IBM iNotes ($HaikuForm 1041) | IBM Domino Build
 SCN1812108_20180501T0841_FP35 March 19, 2019 at 07:18
X-LLNOutbound: False
X-Disclaimed: 28343
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19040120-0327-0000-0000-00000A7CADBB
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.211982
X-IBM-SpamModules-Versions: BY=3.00010856; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000283; SDB=6.01182927; UDB=6.00619260; IPR=6.00963669; 
 BA=6.00006272; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00026248; XFM=3.00000015;
 UTC=2019-04-01 20:19:04
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-04-01 14:45:41 - 6.00009755
x-cbparentid: 19040120-0328-0000-0000-00001183D056
Message-Id: <OF1EF804AF.11BB4314-ON002583CF.006F9212-002583CF.006F921C@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-01_06:, , signatures=0
X-Proofpoint-Spam-Reason: safe
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
X-List-Received-Date: Mon, 01 Apr 2019 20:19:12 -0000

Around 04/01/2019 12:26PM in some timezone, Jae Hyun Yoo wrote:
>On 4/1/2019 8:11 AM, Eddie James wrote:
>>=20
>> On 3/29/19 6:54 PM, Jae Hyun Yoo wrote:
>>>>   static void aspeed=5Fvideo=5Foff(struct aspeed=5Fvideo *video)
>>>>   {
>>>> -    aspeed=5Fvideo=5Freset(video);
>>>> +    /* Disable interrupts */
>>>> +    aspeed=5Fvideo=5Fwrite(video, VE=5FINTERRUPT=5FCTRL, 0);
>>>>         /* Turn off the relevant clocks */
>>>>       clk=5Fdisable=5Funprepare(video->vclk);
>>>> @@ -508,7 +497,13 @@ static void aspeed=5Fvideo=5Fon(struct
>aspeed=5Fvideo=20
>>>> *video)
>>>>       clk=5Fprepare=5Fenable(video->eclk);
>>>>       clk=5Fprepare=5Fenable(video->vclk);
>>>>   -    aspeed=5Fvideo=5Freset(video);
>>>> +    /*
>>>> +     * Delay (and don't sleep in case in interrupt context) to
>let the
>>>> +     * clocks stabilize. Without this, mode detection sometimes
>fails.
>>>> +     * Possibly the registers don't update too soon after clocks
>are
>>>> +     * enabled.
>>>> +     */
>>>> +    udelay(100);
>>>>   }
>>>
>>> aspeed=5Fvideo=5Foff() will be called from interrupt context too. Are
>you
>>> sure that this 100us delay is needed at here? If it's actually
>needed,
>>> would it be batter to use devm=5Frequest=5Fthreaded=5Firq() instead of
>>> devm=5Frequest=5Firq() in aspeed=5Fvideo=5Finit() function?
>>=20

More importantly, the prepare part of prepare=5Fenable is sleepable=20
and must be called from a thread context, so threaded irq is likely=20
required if this needs to be called.

>> Well this isn't new to this patchset, it delayed 100us before in >> aspe=
ed=5Fvideo=5Freset.
>>=20
>> I am quite sure it's needed.
>
>This is previous code of aspeed=5Fvideo=5Freset():
>static void aspeed=5Fvideo=5Freset(struct aspeed=5Fvideo *video)
>{
>	/* Reset the engine */
>	reset=5Fcontrol=5Fassert(video->rst);
>
>	/* Don't usleep here; function may be called in interrupt context */
>	udelay(100);
>	reset=5Fcontrol=5Fdeassert(video->rst);
>}
>
>The delay was added between assert and deassert to shape the reset
>signal up, but the delay in this patch set is after the deasserting
>of
>reset signal. Now in this patch set, you are going to use reset
>control
>using the way that clk-aspeed module provides. The module already has
>a 10msec delay in aspeed=5Fclk=5Fenable() for making the reset pulse so
>you don't need to add an additional delay at here.
>
>Practically, I tested this patch after removing the 100usec delay and
>checked that this driver works well.
>
>> Since the ast2500 has only one logical processor, I'm not sure a=20
>> threaded irq would function any differently.
>
>Yes, good point. Differently from other Aspeed driver modules, it
>calls
>clk=5Fprepare=5Fenable() in interrupt context which will cause at least
>10msecs of busy waiting thru aspeed=5Fclk=5Fenable() in isr. In UP
>kernel,
>this will disturb handling of most of all other interrupts so it's
>the
>reason why I suggested threaded irq instead.
>
>Try this change in aspeed=5Fvideo=5Finit():
>rc =3D devm=5Frequest=5Fthreaded=5Firq(dev, irq, NULL, aspeed=5Fvideo=5Fir=
q,
>			       IRQF=5FONESHOT | IRQF=5FSHARED, DEVICE=5FNAME,
>			       video);

milton
