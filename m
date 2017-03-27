Return-Path: <benh@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vs9TX4sV4zDqBv
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 21:37:52 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2RAY3Js096055
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 06:37:50 -0400
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29dher6hs8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 06:37:50 -0400
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <benh@au1.ibm.com>;
 Mon, 27 Mar 2017 20:37:47 +1000
Received: from d23relay08.au.ibm.com (202.81.31.227)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 27 Mar 2017 20:37:45 +1000
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2RAbbMI48234510
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 21:37:45 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v2RAb9Uk030884
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 21:37:09 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v2RAb9ZL030416; Mon, 27 Mar 2017 21:37:09 +1100
Received: from pasglop (unknown [9.192.199.243])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 27B5FA01A5;
 Mon, 27 Mar 2017 21:36:48 +1100 (AEDT)
Subject: Re: [PATCH linux dev-4.10 6/6] mtd: spi-nor: aspeed: optimize read
 mode
From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Reply-To: benh@au1.ibm.com
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 openbmc@lists.ozlabs.org
Date: Mon, 27 Mar 2017 21:36:46 +1100
In-Reply-To: <1490366683-23401-7-git-send-email-clg@kaod.org>
References: <1490366683-23401-1-git-send-email-clg@kaod.org>
 <1490366683-23401-7-git-send-email-clg@kaod.org>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-1.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
x-cbid: 17032710-0012-0000-0000-00000221B6FE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17032710-0013-0000-0000-000007367230
Message-Id: <1490611006.3177.74.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-27_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703270094
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
X-List-Received-Date: Mon, 27 Mar 2017 10:37:53 -0000

On Fri, 2017-03-24 at 15:44 +0100, Cédric Le Goater wrote:
> Only for SPI controllers as U-Boot should have done it already for
> the
> FMC controller using DMAs.
> 
> The algo first reads a golden buffer at low speed and then performs
> reads with different clocks and delay cycles settings to find the
> fastest configuration for the chip.
> 
> Based on the pflash tool.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> 
>  TODO: may be add a chicken switch ? 

A module parameter (which can also be passed as a kernel command line
arg) to disable it, yes.

Cheers,
Ben.
