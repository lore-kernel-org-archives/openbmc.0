Return-Path: <tomjose@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMd4s02qCzDt0P
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 16:51:08 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uAL5nP4l014360
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 00:51:06 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0b-001b2d01.pphosted.com with ESMTP id 26usb2bk21-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 00:51:06 -0500
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Sun, 20 Nov 2016 22:51:05 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sun, 20 Nov 2016 22:51:03 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 768153E40030;
 Sun, 20 Nov 2016 22:51:02 -0700 (MST)
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uAL5p2WI56033512; Sun, 20 Nov 2016 22:51:02 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 556FCC603C;
 Sun, 20 Nov 2016 22:51:02 -0700 (MST)
Received: from [9.79.198.149] (unknown [9.79.198.149])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 09393C6042;
 Sun, 20 Nov 2016 22:51:00 -0700 (MST)
Subject: Re: Where did host ipmi go on qemu and EVB?
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <F6147AA0-C0A8-4765-99F6-B5D8D96E2BAD@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: tomjose <tomjose@linux.vnet.ibm.com>
Date: Mon, 21 Nov 2016 11:20:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <F6147AA0-C0A8-4765-99F6-B5D8D96E2BAD@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16112105-8235-0000-0000-000009A64344
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006115; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000189; SDB=6.00783271; UDB=6.00378237; IPR=6.00560890; 
 BA=6.00004895; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013389; XFM=3.00000011;
 UTC=2016-11-21 05:51:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16112105-8236-0000-0000-0000369FD497
Message-Id: <58328B3F.7070203@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-11-21_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1611210105
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
X-List-Received-Date: Mon, 21 Nov 2016 05:51:09 -0000

Hello Brad,

I would like to enable host IPMI on QEMU platform for my testing.

I was not able to figure out the conf file for enabling the host IPMI on 
QEMU.

Can you elicit the steps to do the same?

Regards,
Tom


On Tuesday 08 November 2016 06:45 PM, Brad Bishop wrote:
> A number of people have asked where host IPMI went on the QEMU/EVB platforms.  If this is of interest to you, read on….
>
> Background:
>
> - One of the goals for OpenBMC is meet the needs of a broad range of applications, where applications are servers, switches, routers, raid appliances…etc.
> - Yocto provides a concept of MACHINE_FEATURES, where features somewhat abstract declarations of the hardware features supported by a board.
>
> For a real board, like the OpenPOWER Witherspoon server, the concepts are easy to apply.  Witherspoon is a server, and it has a BT interface on it.  So it isn’t much of a leap conceptually to have this in Witherspoon.conf:
>
> MACHINE_FEATURES += “obmc-host-ipmi-hw”
>
> The EVBs and QEMU models are different.  Most of us (if not everyone) are working on servers, and initially it was easy to just put the same line in those board config files, so we could prototype applications like host-ipmi on those boards.
>
> Thats fine, and you can still do so, but this is no longer the default behavior.  If you want to prototype something on one of these boards, enable the feature in your local.conf, and build images and SDKs with those features enabled.
>
> I opted to do this because I didn’t want to show any favortism towards servers.  For something with general applicability like a Raspberry Pi or a QEMU model my view is:
>
> 1 - A machine feature that really does exist in a QEMU model or on an EVB should still be enabled by default.  For example, it makes sense that a ‘led’ machine feature could exist and be enabled by default on a Raspberry Pi, since a Raspberry Pi, regardless of the application, could have leds hooked up to it.
>
> 2 - Machine features, like a BT interface, that don’t exist in a QEMU model or EVB should not enabled by default.  Despite this, we should strive to make feature implementations work on all the EVBs and QEMU models, as they can be enabled manually via local.conf.
>
> -brad bishop
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
